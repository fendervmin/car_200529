package com.project.car.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.car.services.GoodsService;
import com.project.car.vo.GoodsVO;


@Controller
@RequestMapping("reserve/*")
public class ReserveController {
	
	@Inject
	GoodsService Gservice;
	
	    // 예약하기 페이지로 이동
		@RequestMapping(value = "reservemainPage.do")
		public ModelAndView reservemainPage(@RequestParam("b") int brand_id, Model model) throws Exception {
			ModelAndView mav = new ModelAndView();
			
			List <GoodsVO> goods_list = Gservice.list(brand_id); 
			model.addAttribute("list", goods_list);
			
			model.addAttribute("brand", goods_list.get(0).getBrand_Name());
			  
			mav.setViewName("reserve/reservemain");
			return mav;
		}

}
