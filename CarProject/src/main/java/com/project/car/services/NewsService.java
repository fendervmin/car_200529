package com.project.car.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import com.project.car.vo.NewsVO;

public interface NewsService {
	
	List<NewsVO> getnews(NewsVO news);
	
	public int newsCount();
	
	public void delNews(int news_Id);
	
	/*public String saveUploadFile(MultipartFile news_Upload);*/
	
	public void insNews(NewsVO newsvo);
}
