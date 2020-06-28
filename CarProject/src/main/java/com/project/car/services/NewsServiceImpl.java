package com.project.car.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.car.dao.newsDAO;
import com.project.car.vo.NewsVO;

@Component
public class NewsServiceImpl implements NewsService{

	@Autowired
	public newsDAO newsDAO;
	
	
	@Override
	public List<NewsVO> getnews (NewsVO news) {
		return newsDAO.getnews(news);
	}
	@Override
	public int newsCount(){
		return newsDAO.newsCount();
	}

}
