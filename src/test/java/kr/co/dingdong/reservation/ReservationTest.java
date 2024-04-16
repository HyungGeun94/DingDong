package kr.co.dingdong.reservation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dingdong.domain.Reservation;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ReservationTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger log = LoggerFactory.getLogger(ReservationTest.class);
	
	@Test
	public void selectOne() {
		
		Reservation reservation = sqlSession.selectOne("kr.co.dingdong.mappers.reservationMapper.selectOne", "IMP139");
		
	}
	
	@Test
	public void findById() {
		
		List<Reservation> reservationList = sqlSession.selectList("kr.co.dingdong.mappers.reservationMapper.findById", "hello");
	}
	
	@Test
	public void updateTest() {
		Reservation reservation = new Reservation();
		reservation.setReservationNumber("IMP139");
		reservation.setName("수정됨");
		reservation.setPhone("010-1234-5678");
		sqlSession.update("kr.co.dingdong.mappers.reservationMapper.update", reservation);
	}
	
	

}
