package com.project.car.services;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.car.dao.BoardDAO;
import com.project.car.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public void write(BoardVO boardVO) throws Exception{
		dao.write(boardVO);
	}
	@Override
	public List<BoardVO> list() throws Exception{
		return dao.list();
	}
	@Override
	public void modify(BoardVO boardVO) throws Exception{
		dao.modify(boardVO);
	}

}
