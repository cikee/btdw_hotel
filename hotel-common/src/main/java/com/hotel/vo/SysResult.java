package com.hotel.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class SysResult {
	private Integer status; //200成功,201为失败
	private String msg; //服务器返回客户端的消息
	private Object data; //服务器返回客户端数据
	
	public static SysResult success() {
		return new SysResult(200,null,null);
	}
	public static SysResult success(Object obj) {
		return new SysResult(200,null,obj);
	}
	public static SysResult success(String msg,Object object) {
		return new SysResult(200,msg,object);
	}
	public static SysResult fail() {
		return new SysResult(201,null,null);
	}
	public static SysResult fail(String msg) {
		return new SysResult(201,msg,null);
	}
}
