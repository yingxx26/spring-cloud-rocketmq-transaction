package com.oujiong.service.order.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.oujiong.service.order.mapper.MytestCarInoutMapper;
import com.oujiong.service.order.mapper.MytestPayFeeMapper;
import com.oujiong.service.order.model.MytestCarInout;
import com.oujiong.service.order.model.MytestPayFee;
import com.oujiong.service.order.service.CarService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

/**
 * @author xub
 * @Description: 商品模块实现类
 * @date 2019/7/16 下午10:05
 */
@Slf4j
@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private MytestCarInoutMapper mytestCarInoutMapper;

    @Autowired
    private MytestPayFeeMapper mytestPayFeeMapper;


    public MytestPayFee getPayFee(String carNum) {
        QueryWrapper query = new QueryWrapper<>();
        query.eq("car_num", carNum);
        MytestPayFee mytestPayFee = mytestPayFeeMapper.selectOne(query);
        return mytestPayFee;
    }

    public MytestCarInout saveCarInout(MytestCarInout mytestCarInout) {

        int insert = mytestCarInoutMapper.insert(mytestCarInout);
        return mytestCarInout;
    }


    public MytestCarInout getCarInout(String carNum, String bId) {
        QueryWrapper query = new QueryWrapper<>();
        query.eq("car_num", carNum);
        query.eq("b_id", bId);
        MytestCarInout mytestCarInout = mytestCarInoutMapper.selectOne(query);
        return mytestCarInout;
    }

    public int updateCarInout(MytestCarInout mytestCarInout) {

        QueryWrapper query = new QueryWrapper<>();
        query.eq("car_num", mytestCarInout.getCar_num());
        query.eq("b_id", mytestCarInout.getB_id());

        MytestCarInout entity = new MytestCarInout();
        entity.setStatus_cd("已开闸");
        int update1 = mytestCarInoutMapper.update(entity, query);
        return update1;
    }

    public int updateCarInoutBack(MytestCarInout mytestCarInout) {

        QueryWrapper query = new QueryWrapper<>();
        query.eq("car_num", mytestCarInout.getCar_num());
        query.eq("b_id", mytestCarInout.getB_id());

        MytestCarInout entity = new MytestCarInout();
        entity.setStatus_cd("回滚");
        int update1 = mytestCarInoutMapper.update(entity, query);
        return update1;
    }

    @Transactional
    public void updateOrder(MytestCarInout mytestCarInout, MytestPayFee mytestPayFee) {

        QueryWrapper query = new QueryWrapper<>();
        query.eq("carNum", mytestCarInout.getCar_num());
        query.eq("bId", mytestPayFee.getB_id());


        MytestPayFee entity = new MytestPayFee();
        entity.setEnd_time(mytestCarInout.getOut_time());
        entity.setState("支付完成");
        entity.setAmount(mytestPayFee.getAmount());
        int update1 = mytestPayFeeMapper.update(entity, query);

        this.updateCarInout(mytestCarInout);
    }
}
