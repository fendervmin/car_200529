package com.project.car.services;

import java.util.List;

import com.project.car.vo.AnswerVO;
import com.project.car.vo.BoardVO;
import com.project.car.vo.Pagination;
import com.project.car.vo.RecommVO;

public interface BoardService {
	
	public void write(BoardVO boardVO) throws Exception;
	
	public List<BoardVO> list(Pagination pg) throws Exception;
	
	public void modify(BoardVO boardVO) throws Exception;
	
	public BoardVO post(int p_id) throws Exception;
	
	public void delete(int p_id) throws Exception;
	
	public int listCount() throws Exception;
	
	public int count(int p_id) throws Exception;
	
	public int rcount(RecommVO recomm) throws Exception;
	
	public void recommand(RecommVO recomm) throws Exception;
	
	public RecommVO recommCheck(RecommVO recomm) throws Exception;
	
	public void recommUdate(RecommVO recomm) throws Exception;
	public void recommDelete(int p_id) throws Exception;
	public void bestMember(int m_id) throws Exception;
	public BoardVO mainBoard() throws Exception;

	public int countMemPost(int m_id) throws Exception;
	public List<BoardVO> secretBoard(Pagination pg) throws Exception;
}
