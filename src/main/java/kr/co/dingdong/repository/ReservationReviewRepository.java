package kr.co.dingdong.repository;

import java.util.List;

import kr.co.dingdong.domain.ReservationReviewDTO;

public interface ReservationReviewRepository {

	//전제목록
		List<ReservationReviewDTO>reviewList(int roomNumber);
	//선택목록
		ReservationReviewDTO detail(int reviewNumber);
	//추가하기
		int insert(ReservationReviewDTO reservationReviewDTO);
	//삭제하기
		int delete(int reviewNumber);
		
		
		
}
