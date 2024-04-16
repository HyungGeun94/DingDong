package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.domain.ReservedTime;
import kr.co.dingdong.repository.ReservationRepository2;

@Service
public class ReservationServiceImpl2 implements ReservationService2 {
	
	@Autowired
	private ReservationRepository2 reservationRepository;

	@Override
	public int insert(Reservation reservation) {
		return reservationRepository.insert(reservation);
	}

	@Override
	public Reservation selectOne(String reservationNumber) {
		return reservationRepository.selectOne(reservationNumber);
	}

	@Override
	public List<Reservation> findById(String memberId) {
		return reservationRepository.findById(memberId);
	}

	@Override
	public int update(Reservation reservation) {
		return reservationRepository.update(reservation);
	}

	@Override
	public int cancel(String reservationNumber) {
		return reservationRepository.cancel(reservationNumber);
	}

	@Override
	public List<ReservedTime> reservedTime(String date) {
		return reservationRepository.reservedTime(date);
	}
	

}
