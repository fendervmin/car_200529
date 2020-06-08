package com.project.car.services;

import java.util.List;

import com.project.car.vo.GoodsVO;

public interface GoodsService {
	
	List<GoodsVO> listGoods();
	GoodsVO detailGoods(int CAR_ID);
	void updateGoods(GoodsVO vo);
	void deleteGoods(int CAR_ID);
	void insertGoods(GoodsVO vo);
	String fileInfo(int CAR_ID);
}
