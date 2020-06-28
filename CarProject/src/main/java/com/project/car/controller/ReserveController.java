package com.project.car.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.car.services.GoodsService;
import com.project.car.services.ReserveService;
import com.project.car.vo.GoodsVO;
import com.project.car.vo.MemberVO;
import com.project.car.vo.ReserveVO;


@Controller
@RequestMapping("reserve/*")
public class ReserveController {
	
	@Inject
	GoodsService Gservice;
	
	@Autowired
	private ReserveService rService;
	
	    // 예약하기 페이지로 이동
		@RequestMapping(value = "reservemainPage.do")
		public ModelAndView reservemainPage(@RequestParam("b") int brand_id, Model model) throws Exception {
			ModelAndView mav = new ModelAndView();
			
			List <GoodsVO> goods_list = Gservice.list(brand_id); 
			model.addAttribute("list", goods_list);
			
			model.addAttribute("brand_id", brand_id);
			model.addAttribute("brand", goods_list.get(0).getBrand_Name());
			  
			mav.setViewName("reserve/reservemain");
			return mav;
		}
		
		//예약하기
		@RequestMapping(value ="reserve.do")
		public ModelAndView reserve(ModelAndView mv, HttpSession session, HttpServletRequest request) {
			session = request.getSession();
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			String jijum = request.getParameter("selectJijum");
			String time = request.getParameter("time_select");
			String reserveDate = request.getParameter("date_select");
			int brandId = Integer.parseInt(request.getParameter("brand_id"));
			
			String reserveDay = reserveDate + " " + time;
			ReserveVO reserve = new ReserveVO(loginUser.getMember_UserId(), brandId, jijum, reserveDay);
			
			int result = rService.insertReserve(reserve);
			
			if(result > 0) {
				mv.setViewName("redirect:/user/mypagePage.do");
			}
			
			return mv;
		}

}
