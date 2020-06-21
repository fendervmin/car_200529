package com.project.car.services;

import java.util.List;

import com.project.car.vo.AnswerVO;


public interface AnswerService {
	public List<AnswerVO> replyList(int p_id) throws Exception;
	public void replyInsert(AnswerVO answer) throws Exception;
}
