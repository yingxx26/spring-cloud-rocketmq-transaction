package com.oujiong.service.order.controller;

import com.alibaba.fastjson.JSONObject;
import com.oujiong.service.order.model.MytestCarInout;
import com.oujiong.service.order.model.MytestPayFee;
import com.oujiong.service.order.mqservice.CarTransactionProducer;
import com.oujiong.service.order.mqservice.TransactionProducer;
import com.oujiong.service.order.service.CarService;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.LocalTransactionState;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.client.producer.SendStatus;
import org.apache.rocketmq.client.producer.TransactionSendResult;
import org.apache.rocketmq.common.message.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;


/**
 * @author xub
 * @Description: 订单服务相关接口
 * @date 2019/7/12 下午6:01
 */
@Slf4j
@RestController
@RequestMapping("api/v1/car")
public class CarController {


    @Autowired
    private CarTransactionProducer cartransactionProducer;
    @Autowired
    private CarService carService;


    /**
     * 开门接口
     *
     * @param
     * @param carNum 车ID
     */
    @RequestMapping("open")
    public Object open(String carNum) throws MQClientException {

        //查询订单
        MytestPayFee payFee = carService.getPayFee(carNum);
        //计算费用（可否放后面）
        Date start_time = payFee.getStarttime();
        Date end_time = new Date();
        //取出时间，计算费用
        BigDecimal carCost = new BigDecimal("10");
        //保存开闸记录初始状态，返回记录id
        MytestCarInout mytestCarInout = new MytestCarInout();
        mytestCarInout.setCarnum(carNum);
        mytestCarInout.setBid(payFee.getBid());
        mytestCarInout.setOuttime(end_time);
        mytestCarInout.setStatuscd("待开闸");

        MytestCarInout mytestCarInoutDB = carService.saveCarInout(mytestCarInout);
        Integer inout_id = mytestCarInoutDB.getInoutid();
        String bId = payFee.getBid();
        //发送消息
        boolean issuccess = getSendResult(carNum, start_time, end_time, inout_id, bId, carCost);

        if (issuccess) {
            return "成功";
        }
        return "失败";
    }

    private boolean getSendResult(String carNum, Date start_time, Date end_time, Integer inout_id, String bId, BigDecimal carCost) throws MQClientException {
        //通过uuid 当key
        String uuid = UUID.randomUUID().toString().replace("_", "");

        //封装消息
        JSONObject msgJson = new JSONObject();
        msgJson.put("carNum", carNum);
        msgJson.put("startTime", start_time);
        msgJson.put("endTime", end_time);
        msgJson.put("inoutId", inout_id);
        msgJson.put("bId", bId);
        msgJson.put("carCost", carCost);
        String jsonString = msgJson.toJSONString();

        //封装消息实体
        Message message = new Message("car_topic", null, uuid, jsonString.getBytes());

        //发送消息 用 sendMessageInTransaction  第一个参数可以理解成消费方需要的参数 第二个参数可以理解成消费方不需要 本地事务需要的参数
        TransactionSendResult sendResult = null;
        try {
            sendResult = cartransactionProducer.getProducer().sendMessageInTransaction(message, msgJson);
        } catch (MQClientException e) {
            e.printStackTrace();
            return false;
        }
        if (sendResult.getLocalTransactionState() == LocalTransactionState.ROLLBACK_MESSAGE) {
            return false;
        } else if (sendResult.getLocalTransactionState() == LocalTransactionState.COMMIT_MESSAGE) {
            return true;
        } else {
            return false;
        }
    }

}

