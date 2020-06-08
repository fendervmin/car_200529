package com.project.car.services;


import com.project.car.vo.MemberVO;

public interface UserService {
	MemberVO getUserOne(String common, String col);

	int userJoin(MemberVO member);
	
	String get_searchId(String member_Name, String member_Email);
	
	void mailSendWithPassword(String user_name, String user_id, String user_email);

	boolean searchPwd(MemberVO member);

	MemberVO login(MemberVO member);

	int signUp(MemberVO member);

	int selectUserId(String userId);

}