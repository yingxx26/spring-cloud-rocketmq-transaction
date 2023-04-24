package com.oujiong.service.order.model;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class MytestPayFee implements Serializable {
    //费用ID
    private Integer feeid;
    //业务Id
    private String bid;
    //费用类型，物业费，停车费
    private String feetypecd;
    private String carnum;
    //小区ID
    private String communityid;
    //付款方ID
    private String payerobjid;
    //收款方ID
    private String incomeobjid;
    //开始时间
    private Date starttime;
    //结束时间
    private Date endtime;
    //总金额，如物业费，停车费等没有总金额的，填写为-1.00
    private BigDecimal amount;

    //创建用户ID
    private String userid;
    //创建时间
    private Date createtime;
    //数据状态，添加ADD，修改MOD 删除DEL
    private String operate;
    //费用标识 1003006 为周期性费用 2006012 为一次性费用
    private String feeflag;
    //状态 2007001收费未开始 2008001 收费中状态 2009001 收费结束
    private String state;
    //费用项ID
    private String configid;
    //付费对象类型 3333 房屋 6666 是车位
    private String payerobjtype;
    //批次ID
    private String batchid;
}
