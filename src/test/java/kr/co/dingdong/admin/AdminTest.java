package kr.co.dingdong.admin;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dingdong.domain.Admin;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class AdminTest {
	
	private final Logger log = LoggerFactory.getLogger(AdminTest.class);
	
	@Autowired
	SqlSession sqlSession;
//	
//	@Test
//	public void login() {
//		Admin admin = new Admin();
//		admin.setId("root");
//		admin.setPassword("root");
//		
//		admin = sqlSession.selectOne("kr.co.dingdong.mappers.adminMapper.login", admin);
//		log.info("[admin] " + admin);
//	}
	
	@Test
	public void multiDelete() {
		List<Integer> list = new ArrayList<>();
		list.add(25);
		list.add(14);
		sqlSession.update("kr.co.dingdong.mappers.adminCommunityMapper.multiDelete", list);
	}
	
	@Test
	public void multiCancel() {
		List<String> list = new ArrayList<>();
		list.add("IMP_001");
		list.add("IMP86");
		sqlSession.update("kr.co.dingdong.mappers.reservationMapper.multiCancel", list);
	}

}
