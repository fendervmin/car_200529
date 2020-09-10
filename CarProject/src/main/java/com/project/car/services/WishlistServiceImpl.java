package com.project.car.services;

import org.springframework.stereotype.Service;

import com.project.car.vo.wishlistVO;

@Service
public interface WishlistServiceImpl {
	
	public void inputwish(wishlistVO wishlist);
	
	public boolean checkwish(wishlistVO wishlist);
	
}
