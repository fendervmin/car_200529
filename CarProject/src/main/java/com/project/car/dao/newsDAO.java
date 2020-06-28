package com.project.car.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.car.vo.MemberVO;
import com.project.car.vo.NewsVO;

@Repository("newsDAO")
public class newsDAO {
	
	@Autowired
	public SqlSession sqlSession;

	public List<NewsVO> getnews(NewsVO news) {
		return sqlSession.selectList("mappers.newsMapper.getNews", news);
	}
	public int newsCount(){
		return sqlSession.selectOne("mappers.newsMapper.count");
	}

}
