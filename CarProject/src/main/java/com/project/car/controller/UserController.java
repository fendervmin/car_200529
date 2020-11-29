package com.project.car.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.car.model.Search;
import com.project.car.services.ReserveService;
import com.project.car.services.UserService;
import com.project.car.services.WishlistService;
import com.project.car.vo.GoodsVO;
import com.project.car.vo.MemberVO;
import com.project.car.vo.ReserveVO;
import com.project.car.vo.wishlistVO;

@Controller
@RequestMapping("user/*")
public class UserController {
	
	/*private static final Logger logger = (Logger) LoggerFactory.getLogger(UserController.class);*/
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private ReserveService rService;
	
	@Autowired
	private WishlistService wishlistservice; 
	

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
		System.out.println(reserveList);
		
		mav.addObject("reserveList", reserveList);
		mav.setViewName("user/myPage");
		return mav;
	}
	
	// 마이페이지 기능을 수행하는 메소드
	@RequestMapping(value="myPage.do")
	public ModelAndView myPage(@ModelAttribute MemberVO member) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
		
	}
	
	// 즐겨찾기로 이동하는 메소드
	@RequestMapping(value="likeItPage.do")
	public String likeItPage(Model model, wishlistVO wishlist, HttpSession session, HttpServletRequest request) throws Exception {
		session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		List<GoodsVO> resultList = wishlistservice.selectAllwish(loginUser.getMember_Id());
		List<ReserveVO> reserveList = rService.selectReserveList(loginUser.getMember_UserId());
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("reserveList",reserveList);
		System.out.println(reserveList);
		
		return "user/likeIt";
	}
	
	// 즐겨찾기 기능 수행 메소드
	@RequestMapping(value="likeIt.do")
	public ModelAndView likeIt(@ModelAttribute wishlistVO wishlist, HttpSession session, HttpServletRequest request, 
							   @RequestParam("c") int car_Id, Model model, GoodsVO goodsvo) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		wishlist.setMember_id(loginUser.getMember_Id());
		wishlist.setCar_id(car_Id);
		
		System.out.println("멤버id : " + wishlist.getMember_id());
		System.out.println("카id : " + wishlist.getCar_id());
		
		if(wishlistservice.checkwish(wishlist) == false) {
			wishlistservice.inputwish(wishlist);
			mav.setViewName("user/likeItsuccess");
			
		} else {
			mav.setViewName("user/likeitfail");
		}
		
		return mav;
	}
	
	// 즐겨찾기 삭제 메소드
	@RequestMapping(value="delwish.do")
	public String delwish(@ModelAttribute wishlistVO wishlist, HttpSession session, HttpServletRequest request,
						  @RequestParam("c") int car_Id) throws Exception {
		session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		wishlist.setMember_id(loginUser.getMember_Id());
		wishlist.setCar_id(car_Id);
		
		wishlistservice.delwish(wishlist);
		
		return "redirect:/user/likeItPage.do";
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
	
	@RequestMapping(value="PwdSearch.do")
	public ModelAndView PwdSearch(HttpServletRequest request, ModelAndView mv) {
		// member : 비밀번호 찾기 에서 입력한 회원정보  이름, 이메일, 아이디 
		String member_UserId = request.getParameter("member_UserId2");
		String member_Name = request.getParameter("member_Name2");
		String member_Email = request.getParameter("member_Email2");
		
		System.out.println(member_UserId);
		System.out.println(member_Name);
		System.out.println(member_Email);
		
		uService.mailSendWithPassword(member_UserId, member_Name, member_Email, request);
		mv.addObject("changePwd", "회원님의 이메일로 임시비밀번호를 보냈습니다.");
		mv.setViewName("user/userSearch");
		return mv;
	}
	
	@RequestMapping(value="IdSearch.do")
	@ResponseBody
	public String IdSearch(HttpServletRequest request) {
		String name = request.getParameter("member_Name");
		String email = request.getParameter("member_Email");
		
		String result = uService.searchId(name, email);
		
		if(result != null) {
			return result;
		}else {
			return "fail";
		}
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
	
	@RequestMapping(value="admin.do")
	public String admin(Model model) {
		
		List<MemberVO> getAllUser = uService.getAllUser();
		List<MemberVO> currentMember = uService.currentMember();
		List<MemberVO> notcurrentMember = uService.notcurrentMember();
		
		model.addAttribute("getAllUser", getAllUser);
		model.addAttribute("currentMember", currentMember);
		model.addAttribute("notcurrentMember", notcurrentMember);
		
		return "admin/adminMain";
	}
	
	@RequestMapping(value="getUserSearch.do") 
	public String getUserSearch(Model model
							   ,@RequestParam(required=false, defaultValue="member_UserId") String searchType
							   ,@RequestParam(required=false) String keyword) throws Exception {
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		model.addAttribute("getUserSearch",uService.getUserSearch(search));
		
		System.out.println(uService.getUserSearch(search));
		
		return "admin/adminMain";
	}
}
	
