package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.Reservation;

@Repository
public class AdminReservationRepositoryImpl implements AdminReservationRepository{
	
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dingdong.mappers.adminReservationMapper.";
	
	@Override
	public List<Reservation> listAll() {
		return sqlSession.selectList(NAMESPACE + "listAll");
	}

	@Override
	public List<Reservation> delList() {
		return sqlSession.selectList(NAMESPACE + "delList");
	}

	@Override
	public int multiCancel(List<String> reservationNumberList) {
		return sqlSession.update(NAMESPACE + "multiCancel", reservationNumberList);
	}

}
