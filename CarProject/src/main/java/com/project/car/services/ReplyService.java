package com.project.car.services;

import java.util.List;

import com.project.car.vo.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> readReply(int car_id) throws Exception;
	public void writeReply(ReplyVO replyVO) throws Exception;
}
