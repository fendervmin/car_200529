package com.project.car.services;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.car.dao.BoardDAO;
import com.project.car.vo.AnswerVO;
import com.project.car.vo.BoardVO;
import com.project.car.vo.Pagination;

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
	
	
}
