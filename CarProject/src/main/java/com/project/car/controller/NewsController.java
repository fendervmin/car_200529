package com.project.car.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.car.services.NewsService;
import com.project.car.utils.UploadFileUtils;
import com.project.car.vo.NewsVO;
import com.project.car.vo.PageMaker;
import com.project.car.vo.Pagination;

@Controller
@RequestMapping("news/*")
public class NewsController {
	
	@Autowired
	private NewsService NewsService;
	
	@Resource(name="path_upload")
	private String path_upload;

	// 뉴스메인 페이지로 가는 메소드
	@RequestMapping(value = "newsmainPage.do")
	public ModelAndView newsmainPage(Model model, NewsVO news,Pagination pg) {
		ModelAndView mav = new ModelAndView();
		
		List<NewsVO> getNews = NewsService.getnews(news);
		model.addAttribute("getNews", getNews);
		
		mav.setViewName("news/newsmain");
		
		PageMaker pm = new PageMaker();
		pm.setPage(pg);
		pm.setTotalCount(NewsService.newsCount());
		
		model.addAttribute("Maker",pm);
		return mav;
	}
	
	// 관리자 - 뉴스 삭제 메소드
	@RequestMapping(value = "delNews.do")
	public String delNews(NewsVO news, @RequestParam("n") int news_Id) throws Exception {
		
		System.out.println("삐리링");
		news.setNews_Id(news_Id);
		NewsService.delNews(news_Id);
		
		return "news/admin_delete";
	}
	
	// 관리자 - 뉴스 추가 메소드
	
	@RequestMapping(value="insertnewsPage.do")
	public String insertnewsPage() {
		
		return "news/admin_insert";
	}
	
	@RequestMapping(value="insNews.do")
	public String insNews(@Valid @ModelAttribute NewsVO news, BindingResult result,
						  MultipartFile file) throws Exception {
		
		String imgUploadPath = path_upload + File.separator + "upload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = path_upload + File.separator + "upload" + File.separator + "none.png";
		}

		news.setNews_Img(File.separator + "upload" + ymdPath + File.separator + fileName);
		news.setNews_Thumb(File.separator + "upload" + ymdPath + File.separator + "s_" + fileName);
		
		NewsService.insNews(news);
		
		return "news/admin_insert_success";
	}
	

}
