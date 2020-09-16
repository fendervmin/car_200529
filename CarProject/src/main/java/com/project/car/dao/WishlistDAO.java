package com.project.car.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.car.vo.GoodsVO;
import com.project.car.vo.wishlistVO;

@Repository
public class WishlistDAO {
	
	@Autowired
	public SqlSession sqlSession;

	public void inputwish (wishlistVO wishlist) {
		sqlSession.insert("mappers.wishlistMapper.inputwish",wishlist);
	}
	
	public boolean checkwish (wishlistVO wishlist) {
		wishlistVO resultwish = sqlSession.selectOne("mappers.wishlistMapper.selectCheckwish", wishlist);
		
		boolean result = false;
		if(resultwish !=null) {
			result = true;
		}
		
		return result;
	}
	
	public List<GoodsVO> selectAllwish (int member_Id) {
		return sqlSession.selectList("mappers.wishlistMapper.selectAllwish", member_Id);
	}
	
	public void delwish (wishlistVO wishlist) {
		sqlSession.delete("mappers.wishlistMapper.delwish", wishlist);
	}
}
