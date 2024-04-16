package kr.co.dingdong.member;


import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberTest {
	
	private static final Logger log = LoggerFactory.getLogger(MemberTest.class);

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	JavaMailSender mailSender;
	
	
//	@Test
//	public void loginTest() {
////		
////		Member member = new Member();
////		member.setId("hello");
////		member.setPassword("12345");
//		
//		LoginVO loginVO = new LoginVO("hello", "12345");
////		
//		Member loginMember = sqlSession.selectOne("kr.co.dingdong.mappers.memberMapper.login", loginVO);
//		log.info("[Login Member] " + loginMember);
//		
//	}
	
//	@Test
//	public void selectOneTest() {
//		
//		Member member = sqlSession.selectOne("kr.co.dingdong.mappers.memberMapper.selectOne", "hello");
//		log.info("[member] " + member);
//	}
//	
//	@Test
//	public void insertTest() {
//		
//		Member member = new Member();
//		member.setName("일반이름");
//		member.setId("user1");
//		member.setPassword("1234567890");
//		member.setEmail("user1@naver.com");
//		member.setNickname("일반");
//		
//		sqlSession.insert("kr.co.dingdong.mappers.memberMapper.insert", member);
//	}
//	
//	@Test
//	public void updateTest() {
//		
//		Member member = sqlSession.selectOne("kr.co.dingdong.mappers.memberMapper.selectOne", "user1");
//		
//		log.info("[member] "+ member);
//		member.setName("수정된이름");
//		member.setEmail("edit@gmail.com");
//		sqlSession.update("kr.co.dingdong.mappers.memberMapper.update", member);
//	}
//	
//	
//	
//	@Test
//	public void delTest() {
//		List<Member> delList = sqlSession.selectList("kr.co.dingdong.mappers.memberMapper.delList");
//		
//	}
//	
//	
//	@Test
//	public void findByEmail() {
//		sqlSession.selectOne("kr.co.dingdong.mappers.memberMapper.findByEmail", "hello@naver.com");
//	}
//	@Test
//	public void findByIdx() {
//		Member member = sqlSession.selectOne("kr.co.dingdong.mappers.memberMapper.findByIdx", 1);
//		log.info("[Member] " + member);
//	}
	@Test
	public void mailSender() {
		
	}
}
