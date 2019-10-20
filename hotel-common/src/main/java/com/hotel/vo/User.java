package com.hotel.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class User implements Serializable{

	private static final long serialVersionUID = 3663398164993214649L;
	String userName;
	String userPwd;
}
