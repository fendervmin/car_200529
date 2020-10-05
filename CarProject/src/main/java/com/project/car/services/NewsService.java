package com.project.car.services;

import java.util.List;

import com.project.car.model.News;
import com.project.car.vo.NewsVO;

public interface NewsService {
	
	List<NewsVO> getnews(NewsVO news);
	
	public int newsCount();
	
	public void delNews(int news_Id);
	
	/*public String saveUploadFile(MultipartFile news_Upload);*/
	
	public void insNews(NewsVO newsvo);
	
	public List<News> searchNews(String keyword, int display, int start);
	
	public void updateNews(int news_Id);
	
	public List<NewsVO> getOneNews(int news_Id);
	
}
