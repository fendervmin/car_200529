package com.project.car.services;

import java.util.List;

import javax.inject.Inject;

import com.project.car.dao.GoodsDAO;
import com.project.car.vo.GoodsVO;

public class GoodsServiceImpl implements GoodsService {
	
	@Inject
	GoodsDAO goodsDao;
	
	@Override
	public List<GoodsVO> listGoods() {
		// TODO Auto-generated method stub
		return goodsDao.listGoods();
	}

	@Override
	public GoodsVO detailGoods(int car_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateGoods(GoodsVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteGoods(int CAR_ID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertGoods(GoodsVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String fileInfo(int CAR_ID) {
		// TODO Auto-generated method stub
		return null;
	}

}
