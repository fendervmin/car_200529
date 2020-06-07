package com.project.car.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.car.vo.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<GoodsVO> listGoods() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.goodsList");
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
