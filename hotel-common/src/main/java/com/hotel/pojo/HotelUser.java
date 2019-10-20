package com.hotel.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class HotelUser extends BasePojo{

	private Integer id;
	private String userName;
	private String userPwd;
	//用户输入的确认密码
	private String userNewPwd;
	private String userPhone;
	private String userGrade;
	private String userOrderId;
	private String userSalt;
	private String userEmail;
	
	//用户会员卡号:暂不启用
	private String userIdcard;
	private Date dateTime;
}
