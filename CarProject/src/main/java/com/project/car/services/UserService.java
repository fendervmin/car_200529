package com.project.car.services;


import com.project.car.vo.MemberVO;

public interface UserService {
	MemberVO getUserOne(String common, String col);

	int userJoin(MemberVO member);
}
