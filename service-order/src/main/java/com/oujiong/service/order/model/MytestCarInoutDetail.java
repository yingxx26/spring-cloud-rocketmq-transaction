package com.oujiong.service.order.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class MytestCarInoutDetail implements Serializable {
	//详情ID
	private String detailId;
	//进出ID
	private Integer inoutId;
	//业务Id
	private String bId;
	//小区ID
	private String communityId;
	//设备ID
	private String machineId;
	//设备编码
	private String machineCode;
	//3306 进场 3307 出场
	private String carInout;
	//车牌号
	private String carNum;
	//创建时间
	private Date createTime;
	//数据状态，详细参考c_status表，S 保存，0, 在用 1失效
	private String statusCd;
}
