package com.project.car.services;

import java.util.List;

import com.project.car.vo.GoodsVO;
import com.project.car.vo.MemberVO;

public interface GoodsService {
	
	public List<GoodsVO> list(int brand_id) throws Exception;
	
	public GoodsVO detail(int car_id) throws Exception;
	
	public GoodsVO color(int car_id) throws Exception;
	
	public List<GoodsVO> all(GoodsVO goodsVO) throws Exception;
	
	public List<GoodsVO> search(String keyword) throws Exception;
	
	public void goodsAdd(GoodsVO goodsVO) throws Exception;
	
	public void goodsDelete(GoodsVO goodsVO) throws Exception;
}
