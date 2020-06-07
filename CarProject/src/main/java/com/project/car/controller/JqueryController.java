
package com.project.car.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.car.services.UserService;
import com.project.car.vo.MemberVO;

@Controller
@RequestMapping("jquery/*")
public class JqueryController {
	
	@Autowired
	private UserService uService;
	
	@RequestMapping("jquery/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "/user/login";
	}
	
	@RequestMapping(value="jquery/login",method = RequestMethod.POST)
	@ResponseBody
	public int login(MemberVO member,HttpSession session) {
		int result = 0; 
		String col = null;
		
		col = "member_UserId";
		MemberVO userIdCheck = uService.getUserOne(member.getMember_UserId(),col);
		if(userIdCheck == null) {
			result = 2;
		}else {
		
		if(member.getMember_UserId().equals(userIdCheck.getMember_UserId())) {
			//ID OK
			if(member.getMember_Pwd().equals(userIdCheck.getMember_Pwd())) {
				//PW OK 
				session.setAttribute("loginUser", userIdCheck);

				result = 3;
			}else {
				result = 2;
			}
			
		}else {
			//ID not OK
			result = 2;
		}
		}
		
		return result;
	}
	
	@RequestMapping(value="jquery/signUp",method = RequestMethod.POST)
	@ResponseBody
	public int signUp(MemberVO member) {
		int result = 0; 
		String col = null;
		
		col = "member_UserId";
		MemberVO userIdCheck = uService.getUserOne(member.getMember_UserId(),col);
		if(userIdCheck != null) {
		result = 2; 
		}
		
		col = "member_Nicname";
		MemberVO userNicknameCheck = uService.getUserOne(member.getMember_Nicname(),col);
		if(userNicknameCheck != null) { result = 3; }	
		
		if(result < 2) {
		result = uService.userJoin(member);	
		}
		
		
		return result;
	}
	
	/*@RequestMapping(value="jquery/userSearch", method = RequestMethod.POST)
	@ResponseBody
	public int userSearch(MemberVO member) {
		int result = 0;
		String col = null;
		
		col = "member_UserId";
		
		
	}*/
}
