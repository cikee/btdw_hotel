package com.hotel.pojo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class HotelUser extends BasePojo{
	private static final long serialVersionUID = 
			5925269883279621161L;
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
