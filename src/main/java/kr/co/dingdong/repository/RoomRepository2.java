package kr.co.dingdong.repository;

import java.util.List;

import kr.co.dingdong.domain.Room;

public interface RoomRepository2 {
	
	List<Room> listAll(int studyroomNumber);
	Room selectOne(Room room);

}
