package com.oujiong.service.produce.mqseivice;

import com.alibaba.fastjson.JSONObject;
import com.oujiong.service.produce.service.ProduceService;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.message.MessageExt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Map;


/**
 * @author xub
 * @Description: 消费端跟之前普通消费没区别
 * 因为分布式事务主要是通过 生产端控制 消息的发送
 * @date 2019/7/15 下午12:43
 */
@Slf4j
@Component
public class CarConsumer {

    private DefaultMQPushConsumer consumer;

    private String consumerGroup = "car_consumer_group";

    public CarConsumer(@Autowired ProduceService produceService) throws MQClientException {
        //设置消费组
        consumer = new DefaultMQPushConsumer(consumerGroup);
        // 添加服务器地址
        consumer.setNamesrvAddr("127.0.0.1:9876");
        // 添加订阅号
        consumer.subscribe("car_topic", "*");
        // 监听消息
        consumer.registerMessageListener((MessageListenerConcurrently) (msgs, context) -> {
            MessageExt msg = msgs.get(0);
            String message = new String(msgs.get(0).getBody());
            JSONObject jsonObject = JSONObject.parseObject(message);
            String bId = jsonObject.getString("bId");
            String carNum = jsonObject.getString("carNum");
            String carCost = jsonObject.getString("carCost");
            String key = msg.getKeys();
            log.info("车牌号={},费用={}",carNum,carCost);
            try {
                //produceService.updateStore(productId, total, key);
                return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
            } catch (Exception e) {
                log.info("消费失败，进行重试，重试到一定次数 那么将该条记录记录到数据库中，进行如果处理");
                e.printStackTrace();
                return ConsumeConcurrentlyStatus.RECONSUME_LATER;
            }
        });

        consumer.start();
        System.out.println("consumer start ...");
    }

}
