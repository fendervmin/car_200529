package com.project.car.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.car.vo.AnswerVO;

@Repository
public class AnswerDAOlmpl implements AnswerDAO {
	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<AnswerVO> replyList(int p_id) throws Exception{
		List<AnswerVO> a_list = sqlsession.selectList("mappers.answerMapper.replyList", p_id);
		return a_list;
	}
	@Override
	public void replyInsert(AnswerVO answer) throws Exception{
		sqlsession.insert("mappers.answerMapper.replyInsert", answer);
	}

}
