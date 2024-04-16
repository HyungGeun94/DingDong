package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.Room;
import kr.co.dingdong.repository.RoomRepository2;

@Service
public class RoomServiceImpl2 implements RoomService2{
	
	@Autowired
	private RoomRepository2 reservationRepository;

	@Override
	public List<Room> listAll(int studyroomNumber) {
		return reservationRepository.listAll(studyroomNumber);
	}

	@Override
	public Room selectOne(Room room) {
		return reservationRepository.selectOne(room);
	}

}
