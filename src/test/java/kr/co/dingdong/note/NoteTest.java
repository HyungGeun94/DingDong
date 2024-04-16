package kr.co.dingdong.note;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class NoteTest {
	
	final Logger log = LoggerFactory.getLogger(NoteTest.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void countNotRead() {
		int result = sqlSession.selectOne("kr.co.dingdong.mappers.noteMapper.countNoteRead", "hello");
		log.info("[result] {}", result);
	}
	

}
