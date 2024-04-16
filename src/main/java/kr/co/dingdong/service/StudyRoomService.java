package kr.co.dingdong.service;

import java.util.List;

import kr.co.dingdong.domain.StudyRoomDTO;

public interface StudyRoomService {


	List<StudyRoomDTO> listAll();			//전체목록
	int insert(StudyRoomDTO studyRoomDTO);	//추가하기
	int update(StudyRoomDTO studyRoomDTO);	//수정하기
	int delete(StudyRoomDTO studyRoomDTO);	//del -> 1 변경
	StudyRoomDTO detail(int studyroom);		//선택목록
}
