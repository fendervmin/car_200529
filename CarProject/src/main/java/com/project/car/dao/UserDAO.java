
package com.project.car.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
	public String searchId(@Param("member_Name")String member_Name, @Param("member_Eamil")String member_Email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
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
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("member_UserId", member_UserId);
		map.put("key", key);
		sqlSession.update("mappers.userMapper.updatePassword", map);
		
	}



	public MemberVO login(MemberVO member) {
		return sqlSession.selectOne("mappers.userMapper.login", member);
	}	

}/*
package com.project.car.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.car.vo.MemberVO;

@Repository("uDAO")
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
		return sqlSession.selectOne("getUserOne",map);
	}

	public int userJoin(MemberVO member) {
		return sqlSession.insert("userJoin",member);
	}
}
>>>>>>> branch 'master' of https://github.com/fendervmin/car_200529.git
*/