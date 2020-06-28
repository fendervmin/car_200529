package com.project.car.dao;

import java.util.List;

import com.project.car.vo.AnswerVO;

public interface AnswerDAO {
	public List<AnswerVO> replyList(int p_id) throws Exception;
	public void replyInsert(AnswerVO answer) throws Exception;
	public void delete(int a_id) throws Exception;
}
