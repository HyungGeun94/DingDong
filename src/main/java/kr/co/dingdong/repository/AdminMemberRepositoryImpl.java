package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.Member;

@Repository
public class AdminMemberRepositoryImpl implements AdminMemberRepository{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dingdong.mappers.adminMemberMapper.";

	@Override
	public List<Member> listAll() {
		return sqlSession.selectList(NAMESPACE + "listAll");
	}

	@Override
	public List<Member> delList() {
		return sqlSession.selectList(NAMESPACE + "delList");
	}
	
	@Override
	public int multiSuspend(List<String> memberSuspendList) {
		return sqlSession.update(NAMESPACE + "multiSuspend", memberSuspendList);
	}

}
