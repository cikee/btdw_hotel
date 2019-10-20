package com.hotel.dubboService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.Daoservice.HotellunchDao;
import com.hotel.mapper.HotellunchMapper;
import com.hotel.vo.LunchOrderInfo;


@Service //dubbo
public class HotellunchDaoServiceImpl implements HotellunchDao{

	@Autowired
	private HotellunchMapper hotellunchMapper;
	
	@Override
	public List<LunchOrderInfo> findLunchOrders(String username, Integer startIndex, Integer pageSize) {
		List<LunchOrderInfo> findLunchOrders = hotellunchMapper.findLunchOrders(username, startIndex, pageSize);
		return findLunchOrders;
	}

	@Override
	public int getlunchRowCount(String username) {
		int getlunchRowCount = hotellunchMapper.getlunchRowCount(username);
		return getlunchRowCount;
	}

	@Override
	public int deletelunchOrders(String... ids) {
		int deletelunchOrders = hotellunchMapper.deletelunchOrders(ids);
		return deletelunchOrders;
	}

}
