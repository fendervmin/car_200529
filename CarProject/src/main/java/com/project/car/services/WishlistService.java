package com.project.car.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.car.dao.WishlistDAO;
import com.project.car.vo.GoodsVO;
import com.project.car.vo.wishlistVO;

@Service	
public class WishlistService implements WishlistServiceImpl {
	
	@Autowired
	private WishlistDAO wishlistDAO;
	
	@Override
	public void inputwish(wishlistVO wishlist) {
		wishlistDAO.inputwish(wishlist);
	}
	
	@Override
	public boolean checkwish(wishlistVO wishlist) {
		
		boolean result = false;
		boolean check = wishlistDAO.checkwish(wishlist);
		
		if(check) {
			result = true;
		}
		
		return result;
	}
	
	@Override
	public List<GoodsVO> selectAllwish(int member_Id) {
		return wishlistDAO.selectAllwish(member_Id);
	}
}
