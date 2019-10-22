package com.hotel.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

@TableName("hotel_tb_room")
@Setter
@Getter
@ToString
@Accessors(chain=true)
public class HotelRoomStatus extends BasePojo{
	private static final long serialVersionUID = 
			8267367510458781535L;
	@TableId(type = IdType.AUTO)
	private Integer id;
	private String roomName;
	private String roomNumber;
	private String roomFloor;
	private Long roomPrice;
	private Long roomTimeprice;
	private Long roomDeposit;
	private String roomImg;
	private Integer roomStatus;
	
	
	
}
