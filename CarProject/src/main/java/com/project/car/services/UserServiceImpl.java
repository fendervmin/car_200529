package com.project.car.services;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.car.dao.UserDAO;
import com.project.car.vo.MemberVO;@Service("uService")

public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private MailSendService mailsender;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public MemberVO getUserOne(String common,String col) {
		return userDAO.getUserOne(common,col);
	}

	@Override
	public int userJoin(MemberVO member) {
		return userDAO.userJoin(member);
	}
	
	public String searchId(String member_Name, String member_Email) {
		String result="";
		
		try {
			result = userDAO.searchId(member_Name, member_Email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	// 회원검증이 끝난후 비밀번호 초기화 후에 메일을 보내는 메소드
	@Override
	public void mailSendWithPassword(String member_Name, String member_UserId, String member_Email, HttpServletRequest request) {
		// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
				String key = mailsender.getKey(false, 6);
				userDAO.updatePassword(member_UserId, key);
				
				
				MimeMessage mail = mailSender.createMimeMessage();
				String htmlStr = "<h2>안녕하세요 '"+ member_Name +"' 님</h2><br><br>" 
						+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
						+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
						+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
				try {
					mail.setSubject("임시 비밀번호가 발급되었습니다", "utf-8");
					mail.setText(htmlStr, "utf-8", "html");
					mail.addRecipient(RecipientType.TO, new InternetAddress(member_Email));
					mailSender.send(mail);
				} catch (MessagingException e) { 
					e.printStackTrace();
				}


	}

	@Override
	public boolean searchPwd(MemberVO member, HttpServletRequest request) {
		// 기능구현
		// name, email, 아이디로 비교 
		boolean result = false;
		boolean check = userDAO.checkUser(member);
		
		if(check) {
			// 입력한 회원정보가 일치
			mailSendWithPassword(member.getMember_Name(), member.getMember_UserId(), member.getMember_Email(),request);
			result = true;
		}
		
		return result;
	}

	@Override
	public MemberVO login(MemberVO member) {
		return userDAO.login(member);
	}

	@Override
	public int signUp(MemberVO member) {
		return userDAO.signUp(member);
	}

	@Override
	public int selectUserId(String userId) {
		return userDAO.selectUserId(userId);
	}

	@Override
	public int checkEmail(MemberVO member) {
		return userDAO.checkEmail(member);
	}

	@Override
	public int checkNickName(MemberVO member) {
		return userDAO.checkNickName(member);
	}

	@Override
	public void modifyUser(MemberVO member) {
		userDAO.modifyUser(member);
	}

	@Override
	public void updatePwd(MemberVO member) {
		userDAO.updatePwd(member);
	}

	@Override
	public void removeUser(String loginId) {
		userDAO.removeUser(loginId);
	}
}