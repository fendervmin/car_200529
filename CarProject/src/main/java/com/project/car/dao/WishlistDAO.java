package com.project.car.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.car.vo.wishlistVO;

public class WishlistDAO {
	
	@Autowired
	public SqlSession sqlSession;

	public void inputwish (wishlistVO wishlist) {
		sqlSession.insert("mapper.wishlistMapper.inputwish",wishlist);
	}
}
