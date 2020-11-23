package com.project.car.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.car.vo.ReplyVO;
@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace="reply";
	
	@Override
	public List<ReplyVO> readReply(int car_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("reply.readReply",car_id);
	}
	
	@Override
	public void writeReply(ReplyVO replyVO) throws Exception{
		sql.insert("reply.writeReply", replyVO);
	}

}
