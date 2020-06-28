package com.project.car.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.car.services.ReserveService;
import com.project.car.services.UserService;
import com.project.car.vo.MemberVO;
import com.project.car.vo.ReserveVO;

@Controller
@RequestMapping("user/*")
public class UserController {
	@Autowired
	private UserService uService;
	
	@Autowired
	private ReserveService rService;

	// 로그인 기능을 수행하는 메소드
	@RequestMapping(value="login.do")
	public ModelAndView login(@ModelAttribute MemberVO member, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberVO user = uService.login(member);
		
		if(user != null) {
			session.setAttribute("loginUser", user);
			session.setMaxInactiveInterval(6000);
			mav.setViewName("home");
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
	
	// 로그아웃 기능 메소드
	@RequestMapping(value="logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		session.invalidate();
		
		mav.setViewName("redirect:/");
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
	public void signUp(@ModelAttribute MemberVO member, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(member.getMember_UserId());
		
		member.setMember_Email(member.getMember_Email() + "@" + member.getDomain());
		
		int result = uService.signUp(member);
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		if(result > 0 ) {
			// 회원가입 성공
			response.getWriter().write("1");
		}else {
			// 회원가입 실패
			response.getWriter().write("2");
		}
	}
	
	// 마이페이지로 가는 메소드
	@RequestMapping(value="mypagePage.do")
	public ModelAndView myPagePage(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		List<ReserveVO> reserveList = rService.selectReserveList(loginUser.getMember_UserId());
		
		mav.addObject("reserveList", reserveList);
		mav.setViewName("user/myPage");
		return mav;
	}
	
	// 마이페이지 기능을 수행하는 메소드
	@RequestMapping(value="myPage.do")
	public ModelAndView myPage(@ModelAttribute MemberVO member) {
		ModelAndView mav = new ModelAndView();
		
		return null;
		
	}
	
	@RequestMapping(value="updateUserPage.do")
	public ModelAndView updateUserPage(ModelAndView mv) {
		mv.setViewName("user/modify");
		return mv;
	}
	
	@RequestMapping(value="modify.do")
	@ResponseBody
	public String modifyUser(@ModelAttribute MemberVO member, HttpServletResponse response, HttpSession session, HttpServletRequest request) throws IOException {
		session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String loginID = loginUser.getMember_UserId();
		
		member.setMember_UserId(loginID);
		
		int emailCount = uService.checkEmail(member);
		int nickNameCount = uService.checkNickName(member);
		
		if(emailCount > 0 ) {
			return "1";
		}else if(nickNameCount > 0) {
			return "2";
		}else {
			loginUser.setMember_Email(member.getMember_Email());
			loginUser.setMember_Name(member.getMember_Name());
			loginUser.setMember_Nicname(member.getMember_Nicname());
			
			session.setAttribute("loginUser", loginUser);
			uService.modifyUser(member);
			return "0";
		}
		
	}
	
	@RequestMapping(value="updatePwd.do")
	public ModelAndView updatePwd(@ModelAttribute MemberVO member, HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String loginID = loginUser.getMember_UserId();
		
		member.setMember_UserId(loginID);
		
		uService.updatePwd(member);
		mv.setViewName("redirect:/user/mypagePage.do");
		
		return mv;
	}
	
	// 아이디 체크
	@RequestMapping("checkUserId.do")
	@ResponseBody
	public String checkUserId(@RequestParam("member_UserId") String userId) {
		int result = uService.selectUserId(userId);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value="userSearchPage.do")
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
	
	@RequestMapping(value="removeUser.do")
	public ModelAndView removeUser(ModelAndView mv, HttpSession session, HttpServletRequest request) {
		session =  request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String loginId = loginUser.getMember_UserId();
		
		uService.removeUser(loginId);
		session.invalidate();
		
		mv.setViewName("redirect:/");
		return mv;
	}
}
	
