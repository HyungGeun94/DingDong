package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.StudyRoomDTO;
import kr.co.dingdong.repository.RoomRepository;
import kr.co.dingdong.repository.StudyRoomRepository;

@Service
public class StudyRoomServiceImpl implements StudyRoomService{

	@Autowired
	private StudyRoomRepository studyRoomRepository;


	@Override
	public List<StudyRoomDTO> listAll() {
		// TODO Auto-generated method stub
		return studyRoomRepository.listAll();
	}

	@Override
	public int insert(StudyRoomDTO studyRoomDTO) {
		// TODO Auto-generated method stub
		return studyRoomRepository.insert(studyRoomDTO);
	}

	@Override
	public int update(StudyRoomDTO studyRoomDTO) {
		// TODO Auto-generated method stub
		return studyRoomRepository.update(studyRoomDTO);
	}

	@Override
	public int delete(StudyRoomDTO studyRoomDTO) {
		// TODO Auto-generated method stub
		return studyRoomRepository.delete(studyRoomDTO);
	}

	@Override
	public StudyRoomDTO detail(int roomNumber) {
		// TODO Auto-generated method stub
		return studyRoomRepository.detail(roomNumber);
	}
	
	
	
}
