package kr.co.dingdong.community;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dingdong.domain.CommunityBoard;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardTest {
	
	private static Logger log = LoggerFactory.getLogger(BoardTest.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void listAll() {
		List<CommunityBoard> list = sqlSession.selectList("kr.co.dingdong.mappers.adminCommunityMapper.listAll");
		log.info("[list] " + list);
		
		
	}
	
	@Test
	public void notice() {
		List<CommunityBoard> noticeList = sqlSession.selectList("kr.co.dingdong.mappers.adminCommunityMapper.noticeList");
		log.info("[notice] " + noticeList);
	}

}
