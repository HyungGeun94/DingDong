package kr.co.dingdong.service;

import java.util.List;

import kr.co.dingdong.domain.Reservation;

public interface ReservationService {

	List<Reservation>listAll();					//전체목록
	int insert(Reservation reservation);		//추가하기
	int update(Reservation reservation);		//수정하기
	int delete(String reservationNumber);			//삭제하기
	Reservation detail(String reservationNumber);	//선택목록
}
