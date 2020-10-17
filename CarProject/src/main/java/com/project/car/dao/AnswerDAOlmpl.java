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
	@Override
	public void delete(int a_id) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete("mappers.answerMapper.replyDelete",a_id);
	}
	@Override
	public AnswerVO aSelect(int a_id) throws Exception{
		return sqlsession.selectOne("mappers.answerMapper.userAnswer",a_id);
	}

	@Override
	public void allDelete(int p_id) throws Exception {
		sqlsession.delete("mappers.answerMapper.simulDelete",p_id);
	}
}
