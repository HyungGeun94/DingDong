package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.RoomDTO;
import kr.co.dingdong.domain.RoomSelectDTO;
import kr.co.dingdong.domain.StudyRoomDTO;
import kr.co.dingdong.repository.RoomRepository;
import kr.co.dingdong.repository.StudyRoomRepository;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomRepository roomRepository;
	@Autowired
	private StudyRoomRepository studyRoomRepository;
	
	
	@Override
	public List<RoomDTO> listAll(int studyroom) {
		
		StudyRoomDTO studyRoomDTO = studyRoomRepository.detail(studyroom);
		return roomRepository.listAll(studyRoomDTO.getStudyroom());
	}

	@Override
	public int insert(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		
		return roomRepository.insert(roomDTO);
	}

	@Override
	public int update(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		return roomRepository.update(roomDTO);
	}

	@Override
	public int delete(int roomNumber) {
		// TODO Auto-generated method stub
		return roomRepository.delete(roomNumber);
	}

	@Override
	public RoomDTO detail(int roomNumber) {
		// TODO Auto-generated method stub
		return roomRepository.detail(roomNumber);
	}

	@Override
	public List<RoomSelectDTO> roomList(int studyroom) {
		// TODO Auto-generated method stub
		StudyRoomDTO studyRoomDTO = studyRoomRepository.detail(studyroom);
		return roomRepository.roomList(studyRoomDTO.getStudyroom());
	}


}
