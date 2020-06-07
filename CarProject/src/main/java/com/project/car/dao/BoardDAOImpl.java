package com.project.car.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.car.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {//dao 상속받는
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(BoardVO boardVO) throws Exception{
		//boardVO에서 게시판의 정보를 받아와 보드매퍼에 인서트문에 넣어줌
		sqlSession.insert("boardMapper.insert",boardVO);

		}

}
