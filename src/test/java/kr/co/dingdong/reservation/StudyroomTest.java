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

import kr.co.dingdong.domain.Studyroom;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class StudyroomTest {
	
	private static final Logger log = LoggerFactory.getLogger(StudyroomTest.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void studyroomListAllTest() {
		List<Studyroom> studyroomList = sqlSession.selectList("kr.co.dingdong.mappers.studyroomMapper.listAll");
	}

}
