package com.project.car.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.car.services.AnswerService;
import com.project.car.services.BoardService;
import com.project.car.services.UserService;
import com.project.car.vo.AnswerVO;
import com.project.car.vo.BoardVO;
import com.project.car.vo.MemberVO;
import com.project.car.vo.PageMaker;
import com.project.car.vo.Pagination;
import com.project.car.vo.RecommVO;

@Controller
@RequestMapping("board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService service;

	@Inject
	AnswerService a_service;

	@Inject
	UserService u_service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "writeView.do", method = RequestMethod.GET)
	public String getWriteView(BoardVO boardVO, Model model, HttpServletRequest req, HttpSession session)
			throws Exception {
		String index = req.getParameter("index");
		int a = Integer.parseInt(index);

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (a > 0) {
			model.addAttribute("boardVO", service.post(a));
			model.addAttribute("nickName", loginUser);
		} else {
			model.addAttribute("num", a);
		}
		return "board/writeView";// writeView get타입 메소드에서 BoardVO타입의 boardVO키값을
									// model에 저장?알려줘야함
	}

	@RequestMapping(value = "writeBoard.do", method = RequestMethod.GET) // 게시판
																			// 삭제
																			// 기능
																			// 및
																			// 기본
																			// 리스트
																			// 띄우기
	public String getWriteBoard(@RequestParam(required = false) String index, Model model, Pagination pg,
			HttpSession session) throws Exception {// 값을 매핑해줄 model객체를 생성
		logger.info("Get writeBoard??" + index);
		logger.info("현재 페이지 = " + pg.getRowStart());

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser != null) {// 비로그인시 오류 페이지 뜨는 거 방지용
			logger.info("id = " + loginUser.getMember_Id() + " level= " + loginUser.getMember_level());

			if (loginUser.getMember_level().equals("1")) {
				service.bestMember(loginUser.getMember_Id());
			}
			model.addAttribute("countPost", service.countMemPost(loginUser.getMember_Id()));
			model.addAttribute("loginUser", loginUser);

		}

		if (index != null) {// 가져온 인덱스(현재 페이지 상태)가 null이면 메인 페이지 값(삭제해야할 게시글
							// 번호)을 가지고 있으면 삭제
			int num = Integer.parseInt(index);
			/*
			 * service.recommDelete(num);
			 */
			service.delete(num);

		}

		model.addAttribute("list", service.list(pg));// 게시판 내용을 저장하고 있는 list객체를
														// 불러와서 "list"이름으로
														// model에 넣어줌

		System.out.println(pg.toString());

		PageMaker pm = new PageMaker();
		pm.setPage(pg);
		pm.setTotalCount(service.listCount());
		model.addAttribute("Maker", pm);
		return "board/writeBoard";// writeBoard페이지로 이동
	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "writeBoard.do", method = RequestMethod.POST)
	public String postWriteBoard(BoardVO boardVO, Model model, Pagination pg, MultipartFile file,HttpSession session) throws Exception {// 값을
																													// 매핑해줄
																													// model객체를
																													// 생성
		try {
			/*
			 * String imgUploadPath = uploadPath + File.separator + "imgUpload";
			 * String ymdPath = UploadFileUtils.calcPath(imgUploadPath); String
			 * fileName = null;
			 * 
			 * if(file != null) { fileName =
			 * UploadFileUtils.fileUpload(imgUploadPath,
			 * file.getOriginalFilename(), file.getBytes(), ymdPath); } else {
			 * fileName = uploadPath + File.separator + "images" +
			 * File.separator + "none.png"; }
			 * 
			 * boardVO.setBoardImg(File.separator + "imgUpload" + ymdPath +
			 * File.separator + fileName);
			 * boardVO.setBoardThumbImg(File.separator + "imgUpload" + ymdPath +
			 * File.separator + "s" + File.separator + "s_" + fileName);
			 */
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

			if (loginUser != null) {// 비로그인시 오류 페이지 뜨는 거 방지용
				logger.info("id = " + loginUser.getMember_Id() + " level= " + loginUser.getMember_level());

				if (loginUser.getMember_level().equals("1")) {
					service.bestMember(loginUser.getMember_Id());
				}
				model.addAttribute("countPost", service.countMemPost(loginUser.getMember_Id()));
				model.addAttribute("loginUser", loginUser);

			}

			if (boardVO != null) {
				if (boardVO.getP_check() == null) {

					boardVO.setP_check("0");

				}
				service.write(boardVO);
				System.out.println("체크여부?" + boardVO.getP_check());

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			PageMaker pm = new PageMaker();
			pm.setPage(pg);
			pm.setTotalCount(service.listCount());
			System.out.println(pm.toString() + "pm냠");
			model.addAttribute("Maker", pm);

			model.addAttribute("list", service.list(pg));
			return "board/writeBoard";
		}
	}

	// 값을 매핑해줄 model객체생성
	// get에서 parameter값(post_id) 준걸 받아오기 위해 파라미터에 String값 post넣어줌
	@RequestMapping(value = "writeDetail.do", method = RequestMethod.GET) // GET방식으로
																			// writeDetail주소를
																			// 받아오면
																			// 메소드
																			// 실행
	public String getWriteDetail(String index, Model model, HttpSession session) throws Exception {
		logger.info("Get writeDetail" + Integer.parseInt(index));
		int p_id = Integer.parseInt(index);
		service.count(p_id);

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser != null) {// 비로그인시 오류 페이지 뜨는 거 방지용
			logger.info("id = " + loginUser.getMember_Id());
			model.addAttribute("loginUser", loginUser);

			RecommVO recomm = new RecommVO();
			recomm.setPost_id(p_id);
			recomm.setMember_id(loginUser.getMember_Id());

			model.addAttribute("recommand", service.recommCheck(recomm));

		}
/*
		model.addAttribute("user_Board", u_service.getBoardUser(service.post(p_id).getMember_id()));
*/		model.addAttribute("detail", service.post(p_id));// list에서 index값과 매핑되는
															// 게시판 정보를 불러와서
															// detail이름으로 model에
															// 넣어줌
		model.addAttribute("answer", new AnswerVO());
		model.addAttribute("reply", a_service.replyList(p_id));
		return "board/writeDetail";// writeDetail페이지로 이동

	}

	@RequestMapping(value = "writeDetail.do", method = RequestMethod.POST) // GET방식으로
																			// writeDetail주소를
																			// 받아오면
																			// 메소드
																			// 실행
	public String postWriteDetail(BoardVO boardVO, Model model) throws Exception {
		int post_id = boardVO.getP_id();
		logger.info("Post writeDetail: 게시판 내용 update" + post_id + boardVO.toString());

		service.modify(boardVO);

		model.addAttribute("detail", service.post(post_id));
		model.addAttribute("user_Board", u_service.getBoardUser(service.post(post_id).getMember_id()));
		model.addAttribute("answer", new AnswerVO());
		return "board/writeDetail";// writeDetail페이지로 이동
	}

	@RequestMapping(value = "answerWrite.do", method = RequestMethod.GET)
	public String getAnswerWrite(HttpServletRequest req, AnswerVO answer, Model model, HttpSession session)
			throws Exception {
		logger.info("answerWrite");
		int a_id = Integer.parseInt(req.getParameter("a_id"));
		logger.info("answerWrite" + a_id);

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser != null) {// 비로그인시 오류 페이지 뜨는 거 방지용
			logger.info("id = " + loginUser.getMember_Id());
			model.addAttribute("loginUser", loginUser);
		}

		a_service.delete(a_id);

		int post_id = Integer.parseInt(req.getParameter("id"));
		model.addAttribute("detail", service.post(post_id));
		/*
		 * model.addAttribute("userNow",u_service.getBoardUserList(a_service.
		 * replyList(post_id)));
		 */model.addAttribute("answer", new AnswerVO());
		model.addAttribute("PId", post_id);
		model.addAttribute("reply", a_service.replyList(post_id));
		return "board/writeDetail";
	}

	@RequestMapping(value = "answerWrite.do", method = RequestMethod.POST)
	public String postAnswerWrite(@ModelAttribute("answer") AnswerVO answer, Model model) throws Exception {
		System.out.println(answer.getP_id());
		System.out.println(answer.getA_content());
		int post_id = answer.getP_id();
		// int post_id = Integer.parseInt(req.getAttribute("id"));

		a_service.replyInsert(answer);

		model.addAttribute("reply", a_service.replyList(post_id));
		model.addAttribute("detail", service.post(post_id));
		return "board/writeDetail";
	}

	@RequestMapping(value = "recommCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public void getRecommCheck(@RequestParam("postId") String p_id, @RequestParam("userId") String m_id,
			@RequestParam("flag") String flag) throws Exception {// 숫자 하나 받아서
																	// if로 비교 해서
		System.out.println("나 실행 돼 p_id :" + p_id + "m_id :" + m_id + "flag :" + flag);
		int check = Integer.parseInt(flag);
		RecommVO recomm = new RecommVO();
		recomm.setMember_id(Integer.parseInt(m_id));
		recomm.setPost_id(Integer.parseInt(p_id));
		if (check == 1) {
			recomm.setRecomm("Y");
			System.out.println("추천 했냐? : " + recomm.getRecomm());
		} else if (check == 0) {
			recomm.setRecomm("N");
			System.out.println("추천 했냐? : " + recomm.getRecomm());
		}
		if (service.recommCheck(recomm) == null) {
			service.recommand(recomm);
		} else {
			service.recommUdate(recomm);
			System.out.println("업데이트 성공");
		}

	}

	@RequestMapping(value="writeReview.do", method=RequestMethod.GET)
	public String getWriteReview(@RequestParam(required = false)String index,Model model,Pagination pg,HttpSession session) throws Exception{
		MemberVO loginUser =(MemberVO)session.getAttribute("loginUser");
		System.out.println("writeReview");
		if(loginUser != null){//비로그인시 오류 페이지 뜨는 거 방지용 
			logger.info("id = "+loginUser.getMember_Id()+" level= "+loginUser.getMember_level());
			
			if(loginUser.getMember_level().equals("1")){
				service.bestMember(loginUser.getMember_Id());
			}
			model.addAttribute("countPost",service.countMemPost(loginUser.getMember_Id()));
			model.addAttribute("loginUser", loginUser);
			
			
		}
		
		if(index!=null){//가져온 인덱스(현재 페이지 상태)가 null이면 메인 페이지 값(삭제해야할 게시글 번호)을 가지고 있으면 삭제
			int num = Integer.parseInt(index);
/*
			service.recommDelete(num);*/
			service.delete(num);
		}
			System.out.println(service.secretBoard(pg).get(0)+"되니?");
			model.addAttribute("list",service.secretBoard(pg));
			System.out.println(pg.toString());

			PageMaker pm = new PageMaker();
			pm.setPage(pg);
			pm.setTotalCount(service.listCount());

			model.addAttribute("Maker", pm);

		return "board/writeReview";
		}
	/*
	@RequestMapping(value="recommCount.do" ,method=RequestMethod.POST)
	@ResponseBody
	public void getRecommCount(@RequestParam("postId")String p_id,@RequestParam("userId")String m_id) throws Exception{//숫자 하나 받아서 if로 비교 해서
		System.out.println("나두  실행 돼 p_id :" +p_id+" m_id:"+m_id);
		int post_id = Integer.parseInt(p_id);
		int member_id = Integer.parseInt(m_id);
		RecommVO recomm = new RecommVO();
		recomm.setMember_id(member_id);
		recomm.setPost_id(post_id);
		service.rcount(recomm);
		
	}*/
/*	@RequestMapping(value="levelCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public void postLevelCheck(@RequestParam("m_id")String m_id) throws Exception{
		int member_id = Integer.parseInt(m_id);
		System.out.println("레벨체크중");
		service.bestMember(member_id);
	}
*/
	
	
	}


