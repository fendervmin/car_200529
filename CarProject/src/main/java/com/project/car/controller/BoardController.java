package com.project.car.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.car.services.BoardService;
import com.project.car.vo.BoardVO;

@Controller
@RequestMapping("board/*")
public class BoardController {

	private static final Logger logger=LoggerFactory.getLogger(BoardController.class);
	@Inject
	BoardService service;
	
	@RequestMapping(value="writeView",method=RequestMethod.GET)
	public void getWriteView() throws Exception {
		logger.info("get writeView");
	}
	
	@RequestMapping(value="writeView", method=RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		service.write(boardVO);
		return "redirect:/home";
	}
	
}
