package com.project.car.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.car.services.GoodsService;
import com.project.car.vo.GoodsVO;

@Controller
@RequestMapping("goods/*")
public class GoodsController {
	/*
	@Inject
	GoodsService goodsService;
	*/
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class); 
	
	// 브랜드 리스트
	@RequestMapping(value = "brandList", method = RequestMethod.GET)
	public String getBrandList() throws Exception {
	 logger.info("get brand list");
	 
	 return "goods/brandList";
	}
	
	/*// 자동차 리슽
	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("/goods/brandDetail");
		mav.addObject("list",goodsService.listGoods());
		return mav;
	}*/
	
	// 상품 리스트
		@RequestMapping(value = "goodsList", method = RequestMethod.GET)
		public String getGoodsList() throws Exception {
		 logger.info("get goods list");
		 return "goods/goodsList";
		}
}
