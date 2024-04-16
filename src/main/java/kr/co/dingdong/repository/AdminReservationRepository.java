package kr.co.dingdong.repository;

import java.util.List;

import kr.co.dingdong.domain.Reservation;

public interface AdminReservationRepository {
	List<Reservation> listAll();
	List<Reservation> delList();
	int multiCancel(List<String> reservationNumberList);


}
