package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.repository.ReservationRepository;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationRepository reservationRepository;
	
	@Override
	public List<Reservation> listAll() {
		// TODO Auto-generated method stub
		return reservationRepository.listAll();
	}

	@Override
	public Reservation detail(String reservationNumber) {
		// TODO Auto-generated method stub
		return reservationRepository.detail(reservationNumber);
	}
	
	@Override
	public int insert(Reservation reservation) {
		// TODO Auto-generated method stub
		return reservationRepository.insert(reservation);
	}

	@Override
	public int update(Reservation reservation) {
		// TODO Auto-generated method stub
		return reservationRepository.update(reservation);
	}

	@Override
	public int delete(String reservationNumber) {
		// TODO Auto-generated method stub
		return reservationRepository.delete(reservationNumber);
	}


}
