package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.Studyroom;

@Repository
public class StudyroomRepositoryImpl2 implements StudyroomRepository2{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dingdong.mappers.studyroomMapper2.";

	@Override
	public List<Studyroom> listAll() {
		return sqlSession.selectList(NAMESPACE + "listAll");
	}
	
	

}
