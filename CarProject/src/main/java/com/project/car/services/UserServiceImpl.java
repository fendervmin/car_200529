package com.project.car.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.car.dao.UserDAO;
import com.project.car.vo.MemberVO;

@Service("uService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO uDAO;

	@Override
	public MemberVO getUserOne(String common,String col) {
		return uDAO.getUserOne(common,col);
	}

	@Override
	public int userJoin(MemberVO member) {
		return uDAO.userJoin(member);
	}

}
