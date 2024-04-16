package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.Reservation;

@Repository
public class ReservationRepositoryImpl implements ReservationRepository{
	
	private static final String namespace = "kr.co.dingdong.mappers.reservationMapper1";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Reservation> listAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listAll");
	}

	@Override
	public Reservation detail(String reservationNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".detail", reservationNumber);
	}
	
	@Override
	public int insert(Reservation reservation) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".insert", reservation);
	}

	@Override
	public int update(Reservation reservation) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".update", reservation);
	}

	@Override
	public int delete(String reservationNumber) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".delete",	reservationNumber);
	}


}
