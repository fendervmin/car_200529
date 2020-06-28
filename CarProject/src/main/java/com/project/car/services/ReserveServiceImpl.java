package com.project.car.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.car.dao.ReserveDAO;
import com.project.car.vo.ReserveVO;

@Service
public class ReserveServiceImpl  implements ReserveService{
	@Autowired
	private ReserveDAO reserDAO;

	@Override
	public int insertReserve(ReserveVO reserve) {
		return reserDAO.insertReserve(reserve);
	}

	@Override
	public List<ReserveVO> selectReserveList(String member_UserId) {
		return reserDAO.selectReserveList(member_UserId);
	}
	
}
