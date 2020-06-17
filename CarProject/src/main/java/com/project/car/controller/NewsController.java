package com.project.car.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.car.services.NewsService;
import com.project.car.vo.NewsVO;

@Controller
@RequestMapping("news/*")
public class NewsController {
	
	@Autowired
	private NewsService NewsService;

	// 뉴스메인 페이지로 가는 메소드
	@RequestMapping(value = "newsmainPage.do")
	public ModelAndView newsmainPage(Model model, NewsVO news) {
		ModelAndView mav = new ModelAndView();
		
		List<NewsVO> getNews = NewsService.getnews(news);
		model.addAttribute("getNews", getNews);
		
		mav.setViewName("news/newsmain");
		return mav;
	}
	

	// 주요뉴스 페이지로 가는 메소드
	@RequestMapping(value = "hotnewsPage.do")
	public ModelAndView hotnewsPage(Model model, NewsVO news) {
		ModelAndView mav = new ModelAndView();

		List<NewsVO> getnewsCount = NewsService.getnewsCount(news);
		model.addAttribute("getnewsCount", getnewsCount);
		
		mav.setViewName("news/hotnews");
		return mav;
	}

}
