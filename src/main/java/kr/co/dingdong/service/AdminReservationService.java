package kr.co.dingdong.service;

import java.util.List;

import kr.co.dingdong.domain.Reservation;

public interface AdminReservationService {
	
	List<Reservation> listAll();
	List<Reservation> delList();
	int multiCancel(List<String> reservationNumberList);

}
