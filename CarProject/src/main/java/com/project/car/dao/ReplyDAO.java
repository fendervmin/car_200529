package com.project.car.dao;

import java.util.List;

import com.project.car.vo.ReplyVO;

public interface ReplyDAO {
	
	// 댓글 조회
	public List<ReplyVO> readReply(int car_id) throws Exception;
	// 댓글 작성
	public void writeReply(ReplyVO replyVO) throws Exception;
}
