package com.project.car.dao;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.car.vo.BoardVO;
import com.project.car.vo.Pagination;
import com.project.car.vo.RecommVO;



@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;//sqlSession 빈객체 등록
	
	@Override
	//게시판의 정보를 받아오기위해 BoardVO타입 파라미터 넣어주기
	public void write(BoardVO boardVO) throws Exception{
		//boardVO에서 게시판의 정보를 받아와 보드매퍼에 인서트문에 넣어줌
		sqlSession.insert("mappers.boardMapper.insert",boardVO);
		System.out.println(boardVO.toString()+"?FWERGF");
		
		}
	
	@Override
	public List<BoardVO> list(Pagination pg) throws Exception{
		List<BoardVO> list = sqlSession.selectList("mappers.boardMapper.listPage",pg);//mappersql경로중요
		//pg 로딩 성공적
		return list;//list 객체를  return
	}
	@Override
	public int listCount() throws Exception{
		return sqlSession.selectOne("mappers.boardMapper.listCount");
	}
	@Override
	public void modify(BoardVO boardVO) throws Exception{
		sqlSession.update("mappers.boardMapper.update",boardVO);
	}
	
	@Override
	public BoardVO post(int p_id) throws Exception{
		System.out.println(p_id);
		BoardVO board = sqlSession.selectOne("mappers.boardMapper.post",p_id);
		
		return board;
	}
	@Override
	public void delete(int p_id) throws Exception{
		sqlSession.insert("mappers.answerMapper.simulDelete", p_id);
		sqlSession.insert("mappers.boardMapper.delete",p_id);

	}
	@Override
	public int count(int p_id) throws Exception{
		return sqlSession.insert("mappers.boardMapper.view",p_id);
	}
	@Override
	public void recommand(RecommVO recomm) throws Exception{
		sqlSession.insert("mappers.boardMapper.recommInsert",recomm);
	}
	@Override
	public int rcount(RecommVO recomm) throws Exception{
		return sqlSession.insert("mappers.boardMapper.rcount",recomm);
	}
	@Override
	public RecommVO recommCheck(RecommVO recomm) throws Exception{
		
		RecommVO rec = sqlSession.selectOne("mappers.boardMapper.recommCheck",recomm);
		return rec;
	}
	@Override
	public void recommUdate(RecommVO recomm) throws Exception{
		sqlSession.update("mappers.boardMapper.recommUpdate",recomm);
	}
	
}
