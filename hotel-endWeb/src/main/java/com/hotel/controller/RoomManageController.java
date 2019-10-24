package com.hotel.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.service.RoomManageService;
import com.hotel.pojo.TB_RoomType;
import com.hotel.vo.SysResult;

@Controller
@RequestMapping("/RoomManage/")
public class RoomManageController {
	
	@Reference(check=false)
	private RoomManageService RoomManageService;
	
	//点击导航栏首次访问 (固定了分页值0,4)
	@RequestMapping("roomType_set")
	public String roomTypeSet(Model model) {
		List<TB_RoomType> tB_RoomType=RoomManageService.findRoomType();
		//获取房间总记录数
		int rowCount=RoomManageService.getRowCount();
		//System.out.println(tB_RoomType);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("RoomType", tB_RoomType);
		return "RoomManage/roomTypeSet";
	}
	
	//根据传过来的页码查询数据库进行分页
	@RequestMapping("findPageById")
	public String roomPageType(Integer page,Model model) {
		System.out.println("当前点击的页码为:"+page);
		List<TB_RoomType> tB_RoomType=RoomManageService.findPageById(page);
		System.out.println("当前记录总数"+tB_RoomType.size());
		//查找总记录数存入
		int rowCount=RoomManageService.getRowCount();
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("RoomType", tB_RoomType);
		return "RoomManage/roomTypeSet";
	}
	
	//添加房间类型
	@RequestMapping("insertRoom")
	@ResponseBody
	public SysResult insertRoom(TB_RoomType room_type) {
		RoomManageService.insertRoom(room_type);
		return SysResult.success();
	}
	
	//删除房间
	@RequestMapping("deleteRoom")
	@ResponseBody
	public SysResult deleteRoom(String id) {
		int result=RoomManageService.deleteRoom(id);
		if(result==0) {
			SysResult.fail();
		}
		return SysResult.success();
	}
	
	//更新房间   1.先查询当前房间
	@RequestMapping("findRoom")
	@ResponseBody
	public SysResult findRoom(String id) {
		TB_RoomType tB_RoomType=RoomManageService.findRoom(id);
		return SysResult.success(tB_RoomType);
	}
	
	
	@RequestMapping("updateRoom")
	@ResponseBody
	public SysResult updateRoom(TB_RoomType room_type) {
		RoomManageService.updateRoom(room_type);
		return SysResult.success();
	}

	
/////////////////////下面是房间设置的controller////////////////////////////////////////////////////////////////////
	
	

}
