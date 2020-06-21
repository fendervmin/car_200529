package com.project.car.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("reserve/*")
public class ReserveController {
	
	    // 예약하기 페이지로 이동
		@RequestMapping(value = "reservemainPage.do")
		public ModelAndView reservemainPage() {
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("reserve/reservemain");
			return mav;
		}

}
