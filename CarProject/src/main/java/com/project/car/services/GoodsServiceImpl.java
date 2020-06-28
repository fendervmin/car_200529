package com.project.car.services;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.car.dao.GoodsDAO;
import com.project.car.vo.GoodsVO;
@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Inject
	private GoodsDAO dao;

	@Override
	public List<GoodsVO> list(int brand_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(brand_id);
	}
	
	public GoodsVO detail(int car_id) throws Exception {
		return dao.detail(car_id);
	}
	
	public GoodsVO color(int car_id) throws Exception {
		return dao.color(car_id);
	}
	@Override
	public List<GoodsVO> all(GoodsVO goodsVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.all(goodsVO);
	}
	
	@Override
	public List<GoodsVO> search(String keyword) throws Exception{
		return dao.search(keyword);
	}
}
