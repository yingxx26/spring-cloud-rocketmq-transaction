package com.oujiong.service.order.mqservice;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.oujiong.service.order.model.MytestCarInout;
import com.oujiong.service.order.model.MytestPayFee;
import com.oujiong.service.order.service.CarService;
import com.oujiong.service.order.service.ProduceOrderService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.LocalTransactionState;
import org.apache.rocketmq.client.producer.TransactionListener;
import org.apache.rocketmq.client.producer.TransactionMQProducer;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.common.message.MessageExt;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.*;


/**
 * @author xub
 * @Description: 分布式事务RocketMQ 生产者
 * @date 2019/7/15 下午11:40
 */
@Slf4j
@Component
public class CarTransactionProducer {

    /**
     * 需要自定义事务监听器 用于 事务的二次确认 和 事务回查
     */
    private TransactionListener transactionListener;

    /**
     * 这里的生产者和之前的不一样
     */
    private TransactionMQProducer producer = null;

    /**
     * 官方建议自定义线程 给线程取自定义名称 发现问题更好排查
     */
    private ExecutorService executorService = new ThreadPoolExecutor(2, 5, 100, TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(2000), new ThreadFactory() {
        @Override
        public Thread newThread(Runnable r) {
            Thread thread = new Thread(r);
            thread.setName("client-transaction-msg-check-thread");
            return thread;
        }

    });

    public CarTransactionProducer(@Autowired CarService carService) {
        transactionListener = new TransactionListenerImpl(carService);
        // 初始化 事务生产者
        producer = new TransactionMQProducer("car_topic");
        // 添加服务器地址
        producer.setNamesrvAddr("127.0.0.1:9876");
        // 添加事务监听器
        producer.setTransactionListener(transactionListener);
        // 添加自定义线程池
        producer.setExecutorService(executorService);

        start();
    }

    public TransactionMQProducer getProducer() {
        return this.producer;
    }

    /**
     * 对象在使用之前必须要调用一次，只能初始化一次
     */
    public void start() {
        try {
            this.producer.start();
        } catch (MQClientException e) {
            e.printStackTrace();
        }
    }

    /**
     * 一般在应用上下文，使用上下文监听器，进行关闭
     */
    public void shutdown() {
        this.producer.shutdown();
    }
}

/**
 * @author xub
 * @Description: 自定义事务监听器
 * @date 2019/7/15 下午12:20
 */
@Slf4j
class TransactionListenerImpl implements TransactionListener {

    @Autowired
    private CarService carService;

    public TransactionListenerImpl(CarService carService) {
        this.carService = carService;
    }

    @SneakyThrows
    @Override
    public LocalTransactionState executeLocalTransaction(Message msg, Object arg) {
        String carNum = (String) ((Map) arg).get("carNum");
        Date startTime = (Date) ((Map) arg).get("startTime");
        Date endTime = (Date) ((Map) arg).get("endTime");
        String inoutId = (String) ((Map) arg).get("inoutId");
        String bId = (String) ((Map) arg).get("bId");
        BigDecimal carCost = (BigDecimal) ((Map) arg).get("carCost");
        //开启道闸
        boolean open = true;
        if (!open) {
            throw new Exception("开闸失败");
        }
        MytestCarInout mytestCarInout = new MytestCarInout();
        mytestCarInout.setCar_num(carNum);
        MytestPayFee mytestPayFee = new MytestPayFee();
        mytestPayFee.setB_id(bId);
        mytestPayFee.setAmount(carCost);
        mytestPayFee.setEnd_time(endTime);
        //真正要做的事  更新订单，设置开闸状态为成功
        try {
            carService.updateOrder(mytestCarInout, mytestPayFee);
        } catch (Exception e) {
            e.printStackTrace();
            //设置对应的stockLog为回滚状态
            MytestCarInout mytestCarInoutback = new MytestCarInout();
            mytestCarInoutback.setCar_num(carNum);
            mytestCarInoutback.setB_id(bId);
            carService.updateCarInoutBack(mytestCarInoutback);
            return LocalTransactionState.ROLLBACK_MESSAGE;
        }
        return LocalTransactionState.COMMIT_MESSAGE;
    }

    /**
     * 只有上面接口返回 LocalTransactionState.UNKNOW 才会调用查接口被调用
     *
     * @param msg 消息
     * @return
     */
    @Override
    public LocalTransactionState checkLocalTransaction(MessageExt msg) {

        //根据是否扣减库存成功，来判断要返回COMMIT,ROLLBACK还是继续UNKNOWN
        String jsonString = new String(msg.getBody());
        Map<String, Object> map = JSON.parseObject(jsonString, Map.class);
        String carNum = (String) map.get("carNum");
        String inoutId = (String) map.get("inoutId");
        String bId = (String) map.get("bId");
        MytestCarInout carInout = carService.getCarInout(inoutId, bId);
        if (carInout == null) {
            return LocalTransactionState.UNKNOW;
        }
        if (StringUtils.equals(carInout.getStatus_cd(), "已开闸")) {
            return LocalTransactionState.COMMIT_MESSAGE;
        } else if (StringUtils.equals(carInout.getStatus_cd(), "待开闸")) {
            return LocalTransactionState.UNKNOW;
        }
        return LocalTransactionState.ROLLBACK_MESSAGE;
    }
}
