package com.project.car.services;

import java.util.List;

import com.project.car.vo.ReserveVO;

public interface ReserveService {

	int insertReserve(ReserveVO reserve);

	List<ReserveVO> selectReserveList(String member_UserId);

}
