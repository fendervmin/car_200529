package com.project.car.dao;

import java.util.List;

import com.project.car.vo.GoodsVO;

public interface GoodsDAO {
	
	public List<GoodsVO> list(int brand_id) throws Exception;
}
