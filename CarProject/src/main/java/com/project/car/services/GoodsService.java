package com.project.car.services;

import java.util.List;

import com.project.car.vo.GoodsVO;

public interface GoodsService {
	
	public List<GoodsVO> list(int brand_id) throws Exception;
	
	public GoodsVO detail(int car_id) throws Exception;
}
