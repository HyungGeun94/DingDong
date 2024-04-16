package kr.co.dingdong.repository;

import java.util.List;

import kr.co.dingdong.domain.RoomDTO;
import kr.co.dingdong.domain.RoomSelectDTO;

public interface RoomRepository {

	public abstract List<RoomDTO>listAll(int studyroom); 	//룸 전체목록 
	public abstract int insert(RoomDTO roomDTO); 			//룸 추가
	public abstract int update(RoomDTO roomDTO);			//룸 수정 
	public abstract int delete(int roomNumber);				//룸 삭제
	public abstract RoomDTO detail(int roomNumber);			//룸 선택조회
	public abstract List<RoomSelectDTO>roomList(int studyroom); //룸 리스트
}
