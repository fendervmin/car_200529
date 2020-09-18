package com.project.car.services;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.project.car.dao.newsDAO;
import com.project.car.vo.NewsVO;

@Component
public class NewsServiceImpl implements NewsService{
	
	@Value("${path.upload}")
	private String path_upload;

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
	
	@Override
	public void delNews(int news_Id) {
		newsDAO.delNews(news_Id);
	}

	@Override
	public String saveUploadFile(MultipartFile news_Upload) {
		String file_name = System.currentTimeMillis() + "_" + news_Upload.getOriginalFilename();
		
		try {
			news_Upload.transferTo(new File(path_upload + "/" + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}

	@Override
	public void insNews(NewsVO newsvo) {
		
		MultipartFile news_Upload = newsvo.getNews_Upload();
		
		if(news_Upload.getSize() > 0) {
			String file_name = saveUploadFile(news_Upload);
			newsvo.setNews_file(file_name);
		}
		
		newsDAO.insNews(newsvo);
		
	}
	
	

}
