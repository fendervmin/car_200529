package com.project.car.services;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.car.dao.ReplyDAO;
import com.project.car.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> readReply(int car_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReply(car_id);
	}
	
	@Override
	public void writeReply(ReplyVO replyVO) throws Exception{
		dao.writeReply(replyVO);
	}

}
