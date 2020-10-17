package com.project.car.services;

import java.util.List;

import com.project.car.vo.AnswerVO;
import com.project.car.vo.GoodsVO;


public interface AnswerService {
	public List<AnswerVO> replyList(int p_id) throws Exception;
	public void replyInsert(AnswerVO answer) throws Exception;
	public void delete(int a_id) throws Exception;
	public AnswerVO aSelect(int a_id) throws Exception;
	public void allDelete(int p_id) throws Exception;
}
