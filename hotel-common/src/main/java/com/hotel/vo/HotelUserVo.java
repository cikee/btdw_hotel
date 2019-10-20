package com.hotel.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
@Data
public class HotelUserVo implements Serializable{
	private static final long serialVersionUID = -5193850181327926744L;
    private Integer id;
    private String username;
    private String userphone;
    private Date userdatetime;
    private String useremail;
    private String useridcard;
    
    
    
}
