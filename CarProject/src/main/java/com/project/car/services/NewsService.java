package com.project.car.services;

import java.util.List;

import com.project.car.vo.NewsVO;

public interface NewsService {
	
	List<NewsVO> getnews(NewsVO news);
	
	List<NewsVO> getnewsCount (NewsVO news);;
}
