package com.project.car.services;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.car.vo.MemberVO;

public interface UserService {
	MemberVO getUserOne(String common, String col);

	int userJoin(MemberVO member);
	
	String searchId(String member_Name, String member_Email);
	
	void mailSendWithPassword(String member_UserId, String member_Name, String member_Email, HttpServletRequest request);

	boolean searchPwd(MemberVO member, HttpServletRequest request);

	MemberVO login(MemberVO member);

	int signUp(MemberVO member);

	int selectUserId(String userId);

	int checkEmail(MemberVO member);

	int checkNickName(MemberVO member);

	void modifyUser(MemberVO member);

	void updatePwd(MemberVO member);

	void removeUser(String loginId);
	
	List<MemberVO> getAllUser();
	
	List<MemberVO> currentMember();
	
	List<MemberVO> notcurrentMember();

}