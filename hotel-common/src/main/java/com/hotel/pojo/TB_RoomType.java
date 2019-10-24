package com.hotel.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

@Getter
@Setter
@ToString
@TableName("hotel_tb_roomType")
@Accessors(chain=true)
public class TB_RoomType implements Serializable{

	private static final long serialVersionUID = 7443964196036730122L;
	@TableId(type = IdType.AUTO)
	private Integer id;
	private String roomTypename;
	private Double roomPrice;
	private Double roomDeposit;  //押金
	private Double roomHourprice; //钟点房价
	private Double roomTimeout;	//钟点超时价
	private String roomRemark;	//备注
	private String roomImgaddr;
	private Integer hotelStoreid;
}
