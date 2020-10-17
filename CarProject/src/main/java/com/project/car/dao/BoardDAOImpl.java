package com.project.car.dao;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.car.vo.BoardVO;
import com.project.car.vo.MemberVO;
import com.project.car.vo.Pagination;
import com.project.car.vo.RecommVO;



@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;//sqlSession 빈객체 등록
	
	@Override
	//게시판의 정보를 받아오기위해 BoardVO타입 파라미터 넣어주기
	public void write(BoardVO boardVO) throws Exception{
		//boardVO에서 게시판의 정보를 받아와 보드매퍼에 인서트문에 넣어줌
		sqlSession.insert("mappers.boardMapper.insert",boardVO);
		System.out.println(boardVO.toString()+"?FWERGF");
		
		}
	
	@Override
	public List<BoardVO> list(Pagination pg) throws Exception{
		List<BoardVO> list = sqlSession.selectList("mappers.boardMapper.listPage",pg);//mappersql경로중요
		//pg 로딩 성공적
		return list;//list 객체를  return
	}
	@Override
	public int listCount() throws Exception{
		return sqlSession.selectOne("mappers.boardMapper.listCount");
	}
	@Override
	public void modify(BoardVO boardVO) throws Exception{
		sqlSession.update("mappers.boardMapper.update",boardVO);
	}
	
	@Override
	public BoardVO post(int p_id) throws Exception{
		System.out.println(p_id);
		BoardVO board = sqlSession.selectOne("mappers.boardMapper.post",p_id);
		
		return board;
	}
	@Override
	public void delete(int p_id) throws Exception{
		System.out.println("delete문 실행");

		sqlSession.delete("mappers.boardMapper.delete",p_id);
		
		}
	@Override
	public void recommDelete(int p_id) throws Exception {
		sqlSession.delete("mappers.boardMapper.recommDelete",p_id);

		sqlSession.delete("mappers.answerMapper.simulDelete", p_id);
	}
	@Override
	public int count(int p_id) throws Exception{
		return sqlSession.update("mappers.boardMapper.view",p_id);
	}
	@Override
	public void recommand(RecommVO recomm) throws Exception{
		sqlSession.insert("mappers.boardMapper.recommInsert",recomm);
	}
	@Override
	public int rcount(RecommVO recomm) throws Exception{
		return sqlSession.insert("mappers.boardMapper.rcount",recomm);
	}
	@Override
	public RecommVO recommCheck(RecommVO recomm) throws Exception{
		
		RecommVO rec = sqlSession.selectOne("mappers.boardMapper.recommCheck",recomm);
		return rec;
	}
	@Override
	public void recommUdate(RecommVO recomm) throws Exception{
		sqlSession.update("mappers.boardMapper.recommUpdate",recomm);
	}
	@Override
	public void bestMember(int m_id) throws Exception{
		RecommVO recomm = new RecommVO();
		recomm.setMember_id(m_id);
		int rcount = sqlSession.selectOne("mappers.boardMapper.rcount", recomm);
		int pcount =sqlSession.selectOne("mappers.boardMapper.countMember", m_id);
		int acount =sqlSession.selectOne("mappers.answerMapper.countMember2", m_id);
		System.out.println(rcount +" "+pcount+" "+acount);
		if(rcount >=5 && pcount >5 && acount>5){
			MemberVO mem = new MemberVO();
			mem.setMember_Id(m_id);
			mem.setMember_level("2");
			sqlSession.update("mappers.userMapper.updateLevel",mem);
			System.out.println("레벨 업");
		}
		}
	
}
