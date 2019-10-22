package com.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.service.OrderService;
import com.hotel.exception.ServiceException;
import com.hotel.mapper.HotelOrderMapper;
import com.hotel.mapper.HotellunchMapper;
import com.hotel.mapper.hotelmoneymapper;
import com.hotel.vo.LunchOrderInfo;
import com.hotel.vo.OrderInfo;
import com.hotel.vo.PageObject;

@Service //dubbo
public class OrderServiceImpl implements OrderService{

	@Autowired
	private HotelOrderMapper hotelOrderMapper;

	@Autowired
	private HotellunchMapper hotellunchMapper;
	@Override
	public PageObject<OrderInfo> findPageObjects(String username, Integer pageCurrent) {
		//1.验证当前页码值是否合法
		if(pageCurrent==null||pageCurrent<1)
			throw new IllegalArgumentException("当前页码值不正确");
		//2.基于用户名查询总记录数并进行校验
		int rowCount=hotelOrderMapper.getRowCount(username);
		if(rowCount==0)
			throw new ServiceException("记录不存在");
		//3.查询当前页记录
		Integer pageSize=3;
		Integer startIndex=(pageCurrent-1)*pageSize;
		List<OrderInfo> records=
				hotelOrderMapper.findPages(username,
						startIndex, pageSize);
		//4.封装查询结果并返回
		return new PageObject<>(
				rowCount, records,pageCurrent, pageSize);
	}
	@Override
	public int deleteObjects(String... ids) {
		//1.参数校验
		if(ids==null||ids.length==0)
			throw new IllegalArgumentException("必须先选中");
		//2.执行删除
		int rows=hotelOrderMapper.deleteOrders(ids);
		//3.判定结果
		if(rows==0)
			throw new ServiceException("记录可能已经不存在");

		return rows;
	}
	@Override
	public PageObject<LunchOrderInfo> findLunchOrders(String username, Integer pageCurrent) {
		//1.验证当前页码值是否合法
		if(pageCurrent==null||pageCurrent<1)
			throw new IllegalArgumentException("当前页码值不正确");
		//2.基于用户名查询总记录数并进行校验
		int rowCount=hotellunchMapper.getlunchRowCount(username);
		if(rowCount==0)
			throw new ServiceException("记录不存在");
		//3.查询当前页记录
		Integer pageSize=3;
		Integer startIndex=(pageCurrent-1)*pageSize;
		List<LunchOrderInfo> records=
				hotellunchMapper.findLunchOrders(username, startIndex, pageSize);
		//4.封装查询结果并返回
		PageObject<LunchOrderInfo> pObj = new PageObject<>(rowCount, records, pageCurrent, pageSize);
		return pObj;
	}
	@Override
	public int deletelunchObjects(String... ids) {
		//1.参数校验
		if(ids==null||ids.length==0)
			throw new IllegalArgumentException("必须先选中");
		//2.执行删除
		int rows=hotellunchMapper.deletelunchOrders(ids);
		//3.判定结果
		if(rows==0)
			throw new ServiceException("记录可能已经不存在");

		return rows;
	}
	/*查询收入 $dada*/
	@Autowired
	private hotelmoneymapper hotelmoneymapper;
	@Override
	public List<OrderInfo> findMoney() {
		List<OrderInfo> list = hotelmoneymapper.selectList(null);
		return list;
	}

}
