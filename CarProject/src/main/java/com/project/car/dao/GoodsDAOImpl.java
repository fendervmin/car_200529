package com.project.car.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.car.vo.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace="goods";

	
	@Override
	public List<GoodsVO> list(int brand_id) throws Exception {
		// TODO Auto-generated method stub
		GoodsVO g = new GoodsVO();
		g.setBrand_Id(brand_id);
		List<GoodsVO> list = sql.selectList("goods.list",brand_id);
		return list;
	}
	
	@Override
	public GoodsVO detail(int car_id) throws Exception {
		// TODO Auto-generated method stub
		GoodsVO g = new GoodsVO();
		g.setCar_ID(car_id);
		System.out.println(car_id);
		GoodsVO detail = sql.selectOne("goods.detail",car_id);
		return detail;
	}
	
	
	
	

}
