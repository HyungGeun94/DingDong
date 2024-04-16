package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.ReservationReviewDTO;

@Repository
public class ReservationReviewRepositoryImpl implements ReservationReviewRepository{

	private static String namespace = "kr.co.dingdong.mappers.reservationReviewMapper";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ReservationReviewDTO> reviewList(int roomNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".reviewList", roomNumber);
	}

	@Override
	public ReservationReviewDTO detail(int reviewNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".detail", reviewNumber);
	}

	@Override
	public int insert(ReservationReviewDTO reservationReviewDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".insert", reservationReviewDTO);
	}

	@Override
	public int delete(int reviewNumber) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".delete", reviewNumber);
	}

}
