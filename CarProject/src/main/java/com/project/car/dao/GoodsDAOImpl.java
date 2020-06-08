package com.project.car.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.car.vo.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	private static String namespace="car";

	@Override
	public List<GoodsVO> list(int brand_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

}
