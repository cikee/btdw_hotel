package com.hotel.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class HotelFoodOrder extends BasePojo{
private int id;
private String OrderId;
private String userPhone;
private String UserUsername;
private String  foodId;
private String OrderFoodName;
private Double price;
private Date orderTime;
}
