package com.oujiong.service.order.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class MytestCarInout implements Serializable {
	//进出ID
	private Integer inoutid;
	//业务Id
	private String bid;
	//小区ID
	private String communityid;
	//车牌号
	private String carnum;
	//状态，100300 进场状态 100400 支付完成 100500 离场状态 100600 支付超时重新支付
	private String state;
	//进场时间
	private Date intime;
	//离场时间
	private Date outtime;
	//创建时间
	private Date createtime;
	private String statuscd;
}
