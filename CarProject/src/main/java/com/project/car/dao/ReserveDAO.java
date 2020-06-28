package com.project.car.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.car.vo.ReserveVO;

@Repository("reserDAO")
public class ReserveDAO {
	@Autowired
	private SqlSession sqlSession;

	public int insertReserve(ReserveVO reserve) {
		return sqlSession.insert("mappers.reserveMapper.insertReserve", reserve);
	}

	public List<ReserveVO> selectReserveList(String member_UserId) {
		return sqlSession.selectList("mappers.reserveMapper.selectReserveList", member_UserId);
	}
}
