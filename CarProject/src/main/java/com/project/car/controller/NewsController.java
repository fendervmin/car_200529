package com.project.car.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView newsmainPage() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("news/newsmain");
		return mav;
	}
	
	@RequestMapping(value = "newsmain.do")
	public ModelAndView newsmain(@ModelAttribute NewsVO news, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		NewsVO getnewsList = NewsService.getnews(news);
		
		session.setAttribute("newsList", getnewsList);
	
		return mav;
	}

	// 뉴스메인 페이지로 가는 메소드
	@RequestMapping(value = "hotnewsPage.do")
	public ModelAndView hotnewsPage() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("news/hotnews");
		return mav;
	}

}
