package com.project.car.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.car.services.BoardService;
import com.project.car.vo.BoardVO;

@Controller
@RequestMapping("board/*")
public class BoardController {

	private static final Logger logger=LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardService service;
	
	//get방식으로 writeView페이지 요청이오면 메소드 실행
	@RequestMapping(value="writeView",method=RequestMethod.GET)
	public String getWriteView(BoardVO boardVO,Model model) throws Exception {
		logger.info("get writeView");
		//요청받은 후 게시판 작성폼에서 받아올 값을 담을 객체를 생성해 model에 담아줌
		model.addAttribute("boardVO", new BoardVO());
		return "board/writeView";//writeView get타입 메소드에서 BoardVO타입의 boardVO키값을 model에 저장?알려줘야함 
	}
	
	
	//아래의 어노테이션을 사용하여 boardVO(커맨드)객체를 파라미터로 지정후 서비스에 넣어주기
	//post방식으로(많은 값을 전달할 때) writeView페이지 요청 받으면 메소드 실행
	@RequestMapping(value="writeView", method=RequestMethod.POST)
	//boardVO라는 키 값으로 model에 mapping해서 게시판 작성 값을 BoardVo타입의 boardVO객체에 저장
	public String postWriteView(@ModelAttribute("boardVO")BoardVO boardVO,Model model) throws Exception{
		logger.info("post 방식의 writeView");
		service.write(boardVO);//객체를 write함수에 넣어줌
		return "board/writeDetail";//writeDetail 주소를 return해서 detail폼으로 넘어갈 수 있게 함
	}
	
	@RequestMapping(value="writeBoard", method=RequestMethod.GET)//GET방식으로 writeBoard주소를 받아오면 메소드 실행
	public String getWriteBoard(Model model) throws Exception{//값을 매핑해줄 model객체를 생성
		logger.info("Get writeBoard");
		model.addAttribute("list",service.list());//게시판 내용을 저장하고 있는 list객체를 불러와서 "list"이름으로 model에 넣어줌
		return "board/writeBoard";//writeBoard페이지로 이동
	}
	@RequestMapping(value="writeDetail", method=RequestMethod.GET)//GET방식으로 writeDetail주소를 받아오면 메소드 실행
	//값을 매핑해줄 model객체생성
	//get에서 parameter값 준걸 받아오기 위해 파라미터에 int값 index넣어줌 
	public String getWriteDetail(int index,Model model) throws Exception{
		logger.info("Get writeBoard");
		//list에서 index값과 매핑되는 게시판 정보를 불러와서 detail이름으로 model에 넣어줌
		model.addAttribute("detail", service.list().get(index));
		return "board/writeDetail";//writeDetail페이지로 이동
	}
	
}