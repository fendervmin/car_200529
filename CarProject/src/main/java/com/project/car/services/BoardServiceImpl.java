package com.project.car.services;

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
		boardVO.setTitle(title);
		dao.write(boardVO);
	}
	

}
