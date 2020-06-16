package com.project.car.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("news/*")
public class NewsController {

	// 뉴스메인 페이지로 가는 메소드
	@RequestMapping(value = "newsmainPage.do")
	public ModelAndView newsmainPage() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("news/newsmain");
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
