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
import org.springframework.web.servlet.ModelAndView;

import com.project.car.services.GoodsService;
import com.project.car.vo.GoodsVO;

@Controller
@RequestMapping("goods/*")
public class GoodsController {
	
	/*private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Inject
	GoodsService service;
	
	// 카테고리별 상품 리스트
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getList(@RequestParam("c") int brand_id, Model model) throws Exception {
	  logger.info("get llist");
	  
	  List<GoodsVO> list = null;
	  list = service.list(brand_id);
	 
	  model.addAttribute("list", list);
	  
	 }*/
	
	
	@RequestMapping(value="brandList.do")
	public ModelAndView brandList() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("goods/brandList");
		return mav;
	}
	
	@RequestMapping(value="goodsList.do")
	public ModelAndView goodsList() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("goods/goodsList");
		return mav;
	}
	
	@RequestMapping(value="goodsDetail.do")
	public ModelAndView goodsDatail() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("goods/goodsDetail");
		return mav;
	}
	
	

}
