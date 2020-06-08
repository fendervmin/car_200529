package com.project.car.services;

import java.util.List;

import javax.inject.Inject;

import com.project.car.dao.GoodsDAO;
import com.project.car.vo.GoodsVO;

public class GoodsServiceImpl implements GoodsService {
	
	@Inject
	private GoodsDAO dao;

	@Override
	public List<GoodsVO> list(int brand_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(brand_id);
	}
	

}
