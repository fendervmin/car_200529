package com.project.car.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.car.services.GoodsService;
import com.project.car.vo.GoodsVO;
import com.project.car.vo.MemberVO;
import com.project.car.vo.wishlistVO;

@Controller
@RequestMapping("goods/*")
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Inject
	GoodsService service;
	
	@RequestMapping(value="brandList.do", method=RequestMethod.GET)
	public String getBrandList(Model model) throws Exception{
		logger.info("Get brandlist");
		return "goods/brandList";
	}
	
	@RequestMapping(value="goodsAdd.do", method=RequestMethod.GET)
	public String getGoodsAdd(Model model) throws Exception{
		logger.info("Get goodsAdd");
		return "goods/goodsAdd";
	}
	
	@RequestMapping(value="goodsSales.do", method=RequestMethod.GET)
	public String getGoodsSales(Model model) throws Exception{
		logger.info("Get goodsSales");
		return "goods/goodsSales";
	}
	
	@RequestMapping(value="goodsAll.do", method=RequestMethod.GET)
	public String getGoodsAll(GoodsVO goodsVO,Model model) throws Exception{
		logger.info("Get goodsAll");
		List<GoodsVO> all = service.all(goodsVO);
		model.addAttribute("all", all);
		return "goods/goodsAll";
	}
	
	
	@RequestMapping(value="goodsDetail.do", method=RequestMethod.GET)
	public String getgoodsDetail(@RequestParam("c") int car_id,Model model) throws Exception{
		logger.info("Get goodsDetail");
		System.out.println("car_id : " + car_id);
		GoodsVO detail = service.detail(car_id);

		model.addAttribute("detail", detail);
		GoodsVO color = service.color(car_id);
		model.addAttribute("color", color);		
		return "goods/goodsDetail";
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
		 
		 @RequestMapping(value="goodsSearch.do",method = RequestMethod.GET)
		 public String getGoodsSearch(String keyword,Model model,GoodsVO goods) throws Exception{
			 logger.info("get search"+keyword);
			 List<GoodsVO> searchResult = service.search(keyword);
			 model.addAttribute("searchList",searchResult);
			 logger.info(searchResult.get(0)+"_)_)_");
			 return "goods/goodsSearch";
		 }
		 
		// 상품등록
		@RequestMapping(value="goodsAdd.do",method = RequestMethod.POST)
		public ModelAndView goodsAdd(@ModelAttribute GoodsVO goodsVO) throws Exception {
			ModelAndView mav = new ModelAndView();
			service.goodsAdd(goodsVO);
			mav.setViewName("home");
			return mav;
		}
			
		// 상품 삭제
		@RequestMapping(value = "delete.do")
		public String goodsDelete(@ModelAttribute GoodsVO goodsVO,@RequestParam("c") int car_id,Model model) throws Exception {
		 logger.info("post goods delete");
		 
		 GoodsVO detail = service.detail(car_id);
		 model.addAttribute("detail", detail);
		 goodsVO.setCar_ID(car_id);
		 service.goodsDelete(car_id);
		 model.addAttribute("car_id", car_id);
		 return "goods/brandList";
		}
		
		@RequestMapping(value="goodsModify.do", method=RequestMethod.GET)
		public String getgoodsModify(@RequestParam("c") int car_id,Model model) throws Exception{
			logger.info("Get goodsModify");
			System.out.println("car_id : " + car_id);
			GoodsVO detail = service.detail(car_id);

			model.addAttribute("detail", detail);
			GoodsVO color = service.color(car_id);
			model.addAttribute("color", color);		
			return "goods/brandList";
		}
		
		/*// 상품 수정
		@RequestMapping(value="modify.do")
		public String goodsModify(@RequestParam("c") int car_id, Model model) throws Exception {
			GoodsVO goodsVO = service.detail(car_id);
			model.addAttribute("detail", goodsVO);

			return "goods/brandList";
		}*/
}
