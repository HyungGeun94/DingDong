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

import kr.co.dingdong.domain.Room;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class RoomTest {
	
	private static final Logger log = LoggerFactory.getLogger(RoomTest.class);

	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void listAll() {
		List<Room> list = sqlSession.selectList("kr.co.dingdong.mappers.roomMapper.listAll", 1);
		log.info("[Room List] " + list);
	}
	
//	@Test
//	public void selectOne() {
//		Room room = sqlSession.selectOne("kr.co.dingdong.mappers.reservationMapper.selectOne");
//		log.info("[room] " + room);
//	}

}
