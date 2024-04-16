package kr.co.dingdong.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.repository.AdminReservationRepository;

@Service
public class AdminReservationServiceImpl implements AdminReservationService{
	
	@Autowired
	private AdminReservationRepository adminReservationRepository;

	@Override
	public List<Reservation> listAll() {
		return adminReservationRepository.listAll();
	}

	@Override
	public List<Reservation> delList() {
		return adminReservationRepository.delList();
	}

	@Override
	public int multiCancel(List<String> reservationNumberList) {
		return adminReservationRepository.multiCancel(reservationNumberList);
	}
	
	
	
	
	
	

}
