package com.project.car.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("user/*")
public class UserController {

	@RequestMapping(value="user/login",method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();//원래 모델앤뷰객체로 보냄->받을 때 모델앤뷰객체로 받음 바로 리턴~
		return mav;
	}
	
	@RequestMapping(value="user/signUp",method = RequestMethod.GET)
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping(value="user/userSearch", method = RequestMethod.GET)
	public ModelAndView userSearch() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
