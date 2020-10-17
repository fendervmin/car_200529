package com.project.car.services;

import java.util.List;

import javax.inject.Inject;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.stereotype.Service;

import com.project.car.dao.BoardDAO;
import com.project.car.vo.AnswerVO;
import com.project.car.vo.BoardVO;
import com.project.car.vo.Pagination;
import com.project.car.vo.RecommVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public void write(BoardVO boardVO) throws Exception{
		dao.write(boardVO);
	}
	@Override
	public List<BoardVO> list(Pagination pg) throws Exception{
		//pg 로딩 성공적
		return dao.list(pg);
		
	}
	@Override
	public void modify(BoardVO boardVO) throws Exception{
		dao.modify(boardVO);
	}
	@Override
	public BoardVO post(int p_id) throws Exception{
		return dao.post(p_id);
	}
	@Override
	public void delete(int p_id) throws Exception{
		dao.delete(p_id);
	}
	@Override
	public int listCount() throws Exception{
		 return dao.listCount();
	}
	@Override
	public int count(int p_id) throws Exception{
		return dao.count(p_id);
	}
	@Override
	public void recommand(RecommVO recomm) throws Exception{
		dao.recommand(recomm);
	}
	@Override
	public RecommVO recommCheck(RecommVO recomm) throws Exception{
		return dao.recommCheck(recomm);
	}
	@Override
	public int rcount(RecommVO recomm) throws Exception{
		return dao.rcount(recomm);
	}
	@Override
	public void recommUdate(RecommVO recomm) throws Exception{
		dao.recommUdate(recomm);
	}
	@Override
	public void recommDelete(int p_id) throws Exception{
		dao.recommDelete(p_id);
	}
	@Override
	public void bestMember(int m_id) throws Exception{
		dao.bestMember(m_id);
	}
}
