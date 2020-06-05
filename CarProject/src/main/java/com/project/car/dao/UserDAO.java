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
