package com.project.car.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.car.services.AnswerService;
import com.project.car.services.BoardService;
import com.project.car.vo.AnswerVO;
import com.project.car.vo.BoardVO;
import com.project.car.vo.PageMaker;
import com.project.car.vo.Pagination;

@Controller
@RequestMapping("board/*")
public class BoardController {

	private static final Logger logger=LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	AnswerService a_service;
	
	
	@RequestMapping(value="writeView.do",method=RequestMethod.GET)
	public String getWriteView(BoardVO boardVO,Model model,HttpServletRequest req) throws Exception {
		String index = req.getParameter("index");
		int a= Integer.parseInt(index);
		
		if(a>0)	
			model.addAttribute("boardVO", service.post(a));
		else
			model.addAttribute("num",a);
		
		return "board/writeView";//writeView get타입 메소드에서 BoardVO타입의 boardVO키값을 model에 저장?알려줘야함 
	}
	
	

	@RequestMapping(value="writeBoard.do", method=RequestMethod.GET)//게시판 삭제 기능 및 기본 리스트 띄우기
	public String getWriteBoard(@RequestParam(required = false)String index,Model model,Pagination pg) throws Exception{//값을 매핑해줄 model객체를 생성
		logger.info("Get writeBoard??"+index);

		if(index!=null){
			int num = Integer.parseInt(index);
			service.delete(num);
		}
		model.addAttribute("list",service.list(pg));//게시판 내용을 저장하고 있는 list객체를 불러와서 "list"이름으로 model에 넣어줌
		
		System.out.println(pg.toString());
		
		PageMaker pm = new PageMaker();
		pm.setPage(pg);
		pm.setTotalCount(service.listCount());

		model.addAttribute("Maker",pm);
		return "board/writeBoard";//writeBoard페이지로 이동
	}
	
	@SuppressWarnings("finally")
	@RequestMapping(value="writeBoard.do", method=RequestMethod.POST)
	public String postWriteBoard(BoardVO boardVO,Model model,Pagination pg) throws Exception{//값을 매핑해줄 model객체를 생성		
		try{
			if(boardVO!=null)
				service.write(boardVO);
			
			PageMaker pm = new PageMaker();
			pm.setPage(pg);
			pm.setTotalCount(service.listCount());
			System.out.println(pm.toString()+"pm냠");
			model.addAttribute("Maker",pm);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			model.addAttribute("list",service.list(pg));
			return "board/writeBoard";
		}
	}
	
	//값을 매핑해줄 model객체생성
		//get에서 parameter값(post_id) 준걸 받아오기 위해 파라미터에 String값 post넣어줌 
	@RequestMapping(value="writeDetail.do", method=RequestMethod.GET)//GET방식으로 writeDetail주소를 받아오면 메소드 실행
	public String getWriteDetail(String index,AnswerVO answer,Model model) throws Exception{
		logger.info("Get writeDetail"+Integer.parseInt(index));
		int p_id =Integer.parseInt(index);
		
		service.count(p_id);
		model.addAttribute("detail", service.post(p_id));//list에서 index값과 매핑되는 게시판 정보를 불러와서 detail이름으로 model에 넣어줌
		
		model.addAttribute("answer",new AnswerVO());
		model.addAttribute("reply", a_service.replyList(p_id));
		
		return "board/writeDetail";//writeDetail페이지로 이동
		
	}
	@RequestMapping(value="writeDetail.do", method=RequestMethod.POST)//GET방식으로 writeDetail주소를 받아오면 메소드 실행
	public String postWriteDetail(BoardVO boardVO,@ModelAttribute AnswerVO answer, Model model) throws Exception{
		int post_id = boardVO.getP_id();
		logger.info("Post writeDetail: 게시판 내용 update"+post_id+boardVO.toString());
		
			
		
		if(answer.getA_content()!=null)//answer 객체를 파라미터로 가져오지 않을 때 content는 null
			a_service.replyInsert(answer);
		else if(boardVO.getP_id()!= 0)
			service.modify(boardVO);
		
		model.addAttribute("detail", service.post(post_id));
		model.addAttribute("reply",a_service.replyList(post_id));
		
		return "board/writeDetail";//writeDetail페이지로 이동 
	}
	
	
}
