package com.project.car.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.car.services.UserService;
import com.project.car.vo.MemberVO;

@Controller
@RequestMapping("user/*")
public class UserController {
	@Autowired
	private UserService uService;

	// 로그인 기능을 수행하는 메소드
	@RequestMapping(value="login.do")
	public ModelAndView login(@ModelAttribute MemberVO member, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberVO user = uService.login(member);
		
		if(user != null) {
			session.setAttribute("loginUser", user);
			session.setMaxInactiveInterval(6000);
			// 페이지 바꿔야됨
			mav.setViewName("user/signUp");
		}else {
			
			mav.addObject("loginFail", "아이디 또는 비밀번호가 다릅니다.");
			mav.setViewName("user/login");
		}
		
		return mav;
	}
	
	// 로그인 페이지로 가는 메소드
	@RequestMapping(value="loginPage.do")
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/login");
		return mav;
	}
	
	// 회원가입 페이지로 가는 메소드
	@RequestMapping(value="signUpPage.do")
	public ModelAndView signUpPage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/signUp");
		return mav;
	}
	
	// 회원가입을 수행하는 메소드
	@RequestMapping(value="signUp.do")
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView();
		
		// 기능 구현할것 
		// jsp에서 값을 받아와서 해당 정보를 토대로 db 저장 
		
		
		// 저장한 후에 페이지는 로그인페이지로 
		mav.setViewName("redirect:/user/loginPage.do");
		
		return mav;
	}
	
	@RequestMapping(value="userSearch.do")
	public ModelAndView userSearch() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/userSearch");
		return mav;
	}
	
	@RequestMapping(value="searchPwd.do")
	public ModelAndView searchPwd(ModelAndView mv, @ModelAttribute MemberVO member) {
		// member : 비밀번호 찾기 에서 입력한 회원정보  이름, 이메일, 아이디 
		boolean result = uService.searchPwd(member);
		
		if(result) {
			// 성공했을때 뷰(JSP) 화면이 들어감
			mv.setViewName("");
		}else {
			// 실패했을때 뷰
			mv.setViewName("");
		}
		
		return mv;
	}
	
}
