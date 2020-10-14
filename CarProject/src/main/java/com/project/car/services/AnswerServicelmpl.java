package com.project.car.services;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.car.dao.AnswerDAO;
import com.project.car.vo.AnswerVO;
import com.project.car.vo.GoodsVO;

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
	@Override
	public void delete(int a_id) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(a_id);
	}
	@Override
	public AnswerVO aSelect(int a_id) throws Exception{
		return dao.aSelect(a_id);
	}
	@Override
	public void allDelete(int p_id) throws Exception{
		dao.allDelete(p_id);
	}
}
