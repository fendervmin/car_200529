package com.project.car.services

import java.util.List
import javax.inject.Inject
import org.springframework.stereotype.Service
import com.project.car.dao.BoardDAO
import com.project.car.vo.AnswerVO
import com.project.car.vo.BoardVO
import com.project.car.vo.Pagination

@Service class BoardServiceImpl implements BoardService {
	@Inject BoardDAO dao

	override void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO)
	}

	override List<BoardVO> list(Pagination pg) throws Exception {
		return dao.list(pg)
	}

	override void modify(BoardVO boardVO) throws Exception {
		dao.modify(boardVO)
	}

	override BoardVO post(int p_id) throws Exception {
		return dao.post(p_id)
	}

	override void delete(int p_id) throws Exception {
		dao.delete(p_id)
	}

	override int listCount() throws Exception {
		return dao.listCount()
	}

	override int count(int p_id) throws Exception {
		return dao.count(p_id)
	}
}
