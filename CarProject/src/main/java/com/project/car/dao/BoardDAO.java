package com.project.car.dao;


import java.util.List;

import com.project.car.vo.BoardVO;

public interface BoardDAO {
	
	public void write(BoardVO boardVO) throws Exception;//interface에서 메소드 정의
	public List<BoardVO> list() throws Exception;
	
}