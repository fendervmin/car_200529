package com.project.car.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.car.vo.wishlistVO;

@Repository
public class WishlistDAO {
	
	@Autowired
	public SqlSession sqlSession;

	public void inputwish (wishlistVO wishlist) {
		sqlSession.insert("mapper.wishlistMapper.inputwish",wishlist);
	}
	
	public boolean checkwish (wishlistVO wishlist) {
		wishlistVO resultwish = sqlSession.selectOne("mapper.wishlistMapper.selectCheckwish", wishlist);
		
		boolean result = false;
		if(resultwish !=null) {
			result = true;
		}
		
		return result;
	}
}