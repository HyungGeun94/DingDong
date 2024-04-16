package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.domain.ReservedTime;

@Repository
public class ReservationRepositoryImpl2 implements ReservationRepository2{

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dingdong.mappers.reservationMapper2.";
	
	@Override
	public int insert(Reservation reservation) {
		return sqlSession.insert(NAMESPACE + "insert", reservation);
	}

	@Override
	public Reservation selectOne(String reservationNumber) {
		return sqlSession.selectOne(NAMESPACE + "selectOne", reservationNumber);
	}

	@Override
	public List<Reservation> findById(String memberId) {
		return sqlSession.selectList(NAMESPACE + "findById", memberId);
	}

	@Override
	public int update(Reservation reservation) {
		return sqlSession.update(NAMESPACE + "update", reservation);
	}

	@Override
	public int cancel(String reservationNumber) {
		return sqlSession.update(NAMESPACE + "cancel", reservationNumber);
	}

	@Override
	public List<ReservedTime> reservedTime(String date) {
		return sqlSession.selectList(NAMESPACE + "reservedTime", date);
	}

	
}
