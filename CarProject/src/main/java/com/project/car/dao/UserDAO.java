package com.project.car.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.car.model.Search;
import com.project.car.vo.MemberVO;

@Repository("userDAO")
public class UserDAO {
	
	@Autowired
	public SqlSession sqlSession;

	public MemberVO getUserOne(String common, String col) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(col.equals("member_UserId")) {
			map.put("member_UserId",common);
		}else if(col.equals("member_Nicname")) {
			map.put("member_Nicname",common);
		}
		return sqlSession.selectOne("mappers.userMapper.getUserOne",map);
	}
	
	public MemberVO getBoardUser(int member_Id){
		 return sqlSession.selectOne("mappers.userMapper.boardUser", member_Id);
	}
	public List<MemberVO> getBoardUserList(int member_Id){
		List<MemberVO> boardMember = sqlSession.selectList("mappers.userMapper.boardUser", member_Id);
		return boardMember;
	}

	// 이 구조 쓸거야 민지야알겠지? 울지말고..
	public int userJoin(MemberVO member) {
		return sqlSession.insert("mappers.userMapper.userJoin",member);
	}
	
	// 유저 인증키 생성 메서드
	public int GetKey(String member_UserId, String member_Key) {
		return sqlSession.update("mappers.userMapper.GetKey", member_Key);
	}
	
	// 유저 인증키 Y로 바꿔주는 메서드
	public int alter_userKey(String member_UserId, String member_Key) {
		return sqlSession.update("mappers.userMapper.alter_userKey", member_Key);
	}
	
	
	// 에러주의 사유:몰라묻지마..ㅜ그냥 틀린거같애
	public String searchId(String member_Name,String member_Email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_Name", member_Name);
		map.put("member_Email", member_Email);
		return sqlSession.selectOne("mappers.userMapper.searchId", map);
	}
	
	
	public boolean checkUser(MemberVO member) {
		MemberVO resultUser = sqlSession.selectOne("mappers.userMapper.checkUser", member);
		
		boolean result = false;
		if(resultUser != null) {
			result = true;
		}
		
		return result;
	}

	public void updatePassword(String member_UserId, String key) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("member_UserId", member_UserId);
		map.put("key", key);
		sqlSession.update("mappers.userMapper.updatePassword", map);
		
	}


	public MemberVO login(MemberVO member) {
		return sqlSession.selectOne("mappers.userMapper.login", member);
	}


	public int signUp(MemberVO member) {
		return sqlSession.insert("mappers.userMapper.signUp", member);
	}



	public int selectUserId(String userId) {
		return sqlSession.selectOne("mappers.userMapper.selectUserId", userId);
	}



	public int checkEmail(MemberVO member) {
		return sqlSession.selectOne("mappers.userMapper.checkEmail", member);
	}



	public int checkNickName(MemberVO member) {
		return sqlSession.selectOne("mappers.userMapper.checkNickName", member);
	}



	public void modifyUser(MemberVO member) {
		sqlSession.update("mappers.userMapper.modifyUser", member);
	}



	public void updatePwd(MemberVO member) {
		sqlSession.update("mappers.userMapper.updatePwd", member);
	}



	public void removeUser(String loginId) {
		sqlSession.update("mappers.userMapper.removeUser", loginId);
	}
	
	public List<MemberVO> getAllUser() {
		return sqlSession.selectList("mappers.userMapper.getAllUser");
	}
	
	public List<MemberVO> currentMember() {
		return sqlSession.selectList("mappers.userMapper.currentMember");
	}
	
	public List<MemberVO> notcurrentMember() {
		return sqlSession.selectList("mappers.userMapper.notcurrentMember");
	}
	
	public List<MemberVO> getUserSearch(Search search) {
		return sqlSession.selectList("mappers.userMapper.getUserSearch", search);
	}
	
	public int getUserSearchCnt(Search search) {
		return sqlSession.selectOne("mappers.userMapper.getUserSearchCnt",search);
	}
	


}