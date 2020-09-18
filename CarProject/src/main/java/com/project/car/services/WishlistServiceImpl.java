package com.project.car.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.car.vo.GoodsVO;
import com.project.car.vo.wishlistVO;

@Service
public interface WishlistServiceImpl {
	
	public void inputwish(wishlistVO wishlist);
	
	public boolean checkwish(wishlistVO wishlist);
	
	public List<GoodsVO> selectAllwish(int member_Id);
	
	public void delwish(wishlistVO wishlist);
	
}
