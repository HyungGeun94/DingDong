package kr.co.dingdong.service;

import java.util.List;

import kr.co.dingdong.domain.Room;

public interface RoomService2 {
	
	List<Room> listAll(int studyroomNumber);
	Room selectOne(Room room);

}
