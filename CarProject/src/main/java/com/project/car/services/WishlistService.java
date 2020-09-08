package com.project.car.services;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.car.dao.WishlistDAO;
import com.project.car.vo.wishlistVO;

public class WishlistService implements WishlistServiceImpl {
	
	@Autowired
	private WishlistDAO wishlistDAO;
	
	@Override
	public void inputwish(wishlistVO wishlist) {
		wishlistDAO.inputwish(wishlist);
	}
	
}
