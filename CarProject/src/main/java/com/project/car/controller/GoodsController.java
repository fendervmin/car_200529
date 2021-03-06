package com.project.car.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.car.services.GoodsService;
import com.project.car.services.ReplyService;
import com.project.car.vo.AnswerVO;
import com.project.car.vo.GoodsVO;
import com.project.car.vo.MemberVO;
import com.project.car.vo.ReplyVO;

@Controller
@RequestMapping("goods/*")
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Inject
	GoodsService service;
	
	@Inject
	ReplyService rp_service;
	
	@RequestMapping(value="brandList.do", method={RequestMethod.GET,RequestMethod.POST})
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
	public String getgoodsDetail(@RequestParam("c") int car_id,Model model,ReplyVO replyVO) throws Exception{
		logger.info("Get goodsDetail");
		System.out.println("car_id : " + car_id);
		GoodsVO detail = service.detail(car_id);

		model.addAttribute("detail", detail);
		GoodsVO color = service.color(car_id);
		model.addAttribute("color", color);
		
		List<ReplyVO> replyList = rp_service.readReply(car_id);
		model.addAttribute("replyList", replyList);
		System.out.println("testLine===========================");
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
		
		
		@RequestMapping(value="goodsModify.do")
		public void getgoodsModify(@RequestParam("c") int car_id,Model model) throws Exception{
			GoodsVO detail = service.detail(car_id);

			model.addAttribute("detail", detail);
		}
		
		// 상품수정
		@RequestMapping(value="modify.do")
			public String goodsModify(@ModelAttribute GoodsVO goodsVO) throws Exception {
				logger.info("post goods modify");
				
				service.goodsModify(goodsVO);
				
				return "goods/brandList";
		}
		
		@RequestMapping(value="goodsAnswer.do", method=RequestMethod.GET)
		public String getGoodsAnswer(HttpServletRequest req,ReplyVO replyVO,Model model,HttpSession session ) throws Exception{

			MemberVO loginUser =(MemberVO)session.getAttribute("loginUser");
			
			if(loginUser != null){//비로그인시 오류 페이지 뜨는 거 방지용 
				logger.info("id = "+loginUser.getMember_Id());
				model.addAttribute("loginUser", loginUser);
			}
			
			int car_id = Integer.parseInt(req.getParameter("car_id"));
			model.addAttribute("detail", service.detail(car_id));
			model.addAttribute("replyVO",new ReplyVO());
			model.addAttribute("car_id",car_id);
			model.addAttribute("replyList",rp_service.readReply(car_id));
			return "goods/goodsDetail";
		}
		
		@RequestMapping(value="goodsAnswer.do", method=RequestMethod.POST)
		public String postAnswerWrite(ReplyVO replyVO,Model model) throws Exception{

			int car_id = replyVO.getCar_ID();
			rp_service.writeReply(replyVO);

			model.addAttribute("replyList",rp_service.readReply(car_id));
			model.addAttribute("detail", service.detail(car_id));
			return "goods/goodsDetail";
		}
}
