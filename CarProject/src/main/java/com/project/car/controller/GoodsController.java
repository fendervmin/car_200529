package com.project.car.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("goods/*")
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class); 
	
	// 상품 리스트
	@RequestMapping(value = "brandList", method = RequestMethod.GET)
	public String getCarList() throws Exception {
	 logger.info("get goods");
	 
	 return "goods/brandList";
	}
}
