package com.hotel.pojo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.experimental.Accessors;

//pojo基类，完成2个任务，2个日期，实现序列化
@Data
@Accessors(chain=true)
public class BasePojo implements Serializable{
	private static final long serialVersionUID = 
			-791782830997086263L;
	private Date created;
	private Date updated;

}
