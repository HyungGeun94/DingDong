package kr.co.dingdong.service;

import java.util.List;

import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.domain.ReservedTime;

public interface ReservationService2 {
	
	int insert(Reservation reservation);
	Reservation selectOne(String reservationNumber);
	List<Reservation> findById(String memberId);
	int update(Reservation reservation);
	int cancel(String reservationNumber);
	
	List<ReservedTime> reservedTime(String date);


}
