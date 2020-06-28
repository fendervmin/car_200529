package com.project.car.dao;

import java.util.List;

import com.project.car.vo.GoodsVO;

public interface GoodsDAO {
	
	public List<GoodsVO> list(int brand_id) throws Exception;

	public GoodsVO detail(int car_id) throws Exception;
	
	public GoodsVO color(int car_id) throws Exception;
	
	public List<GoodsVO> search(String keyword) throws Exception;
}
