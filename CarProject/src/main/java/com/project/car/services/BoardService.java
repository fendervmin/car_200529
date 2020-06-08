package com.project.car.services;

import java.util.List;

import com.project.car.vo.BoardVO;

public interface BoardService {
	
	public void write(BoardVO boardVO) throws Exception;
	
	public List<BoardVO> list() throws Exception;

}
