package com.project.car.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.car.vo.NewsVO;

@Repository("newsDAO")
public class newsDAO {
	
	@Autowired
	public static SqlSession sqlSession;

	public static NewsVO getnews(NewsVO news) {
		return sqlSession.selectOne("mappers.newsMapper.news", news);
	}

}
