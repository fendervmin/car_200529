package com.project.car.services;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.car.dao.AnswerDAO;
import com.project.car.vo.AnswerVO;

@Service
public class AnswerServicelmpl implements AnswerService{
	
	@Inject
	AnswerDAO dao;
	
	@Override
	public List<AnswerVO> replyList(int p_id) throws Exception{
		return dao.replyList(p_id);
	}
	@Override
	public void replyInsert(AnswerVO answer) throws Exception{
		dao.replyInsert(answer);
	}
}
