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
	
	public void delNews(int news_Id) {
		sqlSession.delete("mappers.newsMapper.delNews", news_Id);
	}
	
	public void insNews(NewsVO news) {
		sqlSession.insert("mappers.newsMapper.insNews", news);
	}
	
	public void updateNews(NewsVO news) {
		sqlSession.update("mappers.newsMapper.updateNews", news);
	}
	
	public NewsVO getOneNews(int news_Id) {
		return sqlSession.selectOne("mappers.newsMapper.getOneNews", news_Id);
	}

}
