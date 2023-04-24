package com.oujiong.service.order.service;

import com.oujiong.service.order.mapper.MytestCarInoutMapper;
import com.oujiong.service.order.model.MytestCarInout;
import com.oujiong.service.order.model.MytestPayFee;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author xub
 * @ClassName: ProduceService
 * @Description: 获取商品信息相关接口
 * @date 2019/7/12 下午12:37
 */
public interface CarService {

    MytestPayFee getPayFee(String carNum);

    MytestCarInout saveCarInout(MytestCarInout mytestCarInout);

    int updateCarInout(MytestCarInout mytestCarInout);

    void updateOrder(MytestCarInout mytestCarInout, MytestPayFee mytestPayFee);

    int updateCarInoutBack(MytestCarInout mytestCarInout);

    MytestCarInout getCarInout(String carNum, String bId);
}
