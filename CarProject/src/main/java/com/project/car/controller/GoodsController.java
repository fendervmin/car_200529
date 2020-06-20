package com.project.car.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.car.services.GoodsService;
import com.project.car.vo.GoodsVO;

@Controller
@RequestMapping("goods/*")
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Inject
	GoodsService service;
	
	@RequestMapping(value="brandList.do", method=RequestMethod.GET)
	public String getBrandList(Model model) throws Exception{//값을 매핑해줄 model객체를 생성
		logger.info("Get brandlist");
		return "goods/brandList";//writeBoard페이지로 이동
	}
	
	
	@RequestMapping(value="goodsDetail.do", method=RequestMethod.GET)
	public String getgoodsDetail(@RequestParam("c") int car_id,Model model) throws Exception{
		logger.info("Get goodsDetail");
		System.out.println("car_id : " + car_id);
		GoodsVO detail = service.detail(car_id);
		model.addAttribute("detail", detail);
		GoodsVO color = service.color(car_id);
		model.addAttribute("color", color);		
		return "goods/goodsDetail";//writeBoard페이지로 이동
	}
	
	
	// 카테고리별 상품 리스트
		 @RequestMapping(value = "goodsList.do", method = RequestMethod.GET)
		 public String getGoodsList(@RequestParam("b") int brand_id,Model model) throws Exception {
		  logger.info("get list");
		  System.out.println("브랜드"+ brand_id);
		  List <GoodsVO> goods_list = service.list(brand_id); 
		  model.addAttribute("list", goods_list);
		  System.out.println(goods_list.get(0).getBrand_Name());
		  model.addAttribute("brand", goods_list.get(0).getBrand_Name());
		  
		  return "goods/goodsList";
		  
		 }
}
