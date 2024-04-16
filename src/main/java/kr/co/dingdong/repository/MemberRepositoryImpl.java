package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.CommunityVO;
import kr.co.dingdong.domain.LoginVO;
import kr.co.dingdong.domain.Member;

@Repository
public class MemberRepositoryImpl implements MemberRepository{

	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dingdong.mappers.memberMapper.";

	@Override
	public Member login(LoginVO loginVO) {
		return sqlSession.selectOne(NAMESPACE + "login", loginVO);
	}

	@Override
	public int loginDateUpdate(String id) {
		return sqlSession.update(NAMESPACE + "login_date_update", id);
	}

	@Override
	public Member selectOne(String id) {
		return sqlSession.selectOne(NAMESPACE + "selectOne", id);
	}

	@Override
	public int insert(Member member) {
		return sqlSession.insert(NAMESPACE + "insert", member);
	}

	@Override
	public int update(Member member) {
		return sqlSession.update(NAMESPACE + "update", member);
	}

	@Override
	public int quit(Member member) {
		return sqlSession.update(NAMESPACE + "quit", member);
	}


	@Override
	public Member findByEmail(String email) {
		return sqlSession.selectOne(NAMESPACE + "findByEmail", email);
	}

	@Override
	public int updateProfile(Member member) {
		return sqlSession.update(NAMESPACE + "updateProfile", member);
	}

	@Override
	public List<CommunityVO> myCommunityBoard(String id) {
		return sqlSession.selectList(NAMESPACE + "myCommunityBoard", id);
	}

	@Override
	public Member findByIdx(int idx) {
		return sqlSession.selectOne(NAMESPACE + "findByIdx", idx);
	}

	@Override
	public List<CommunityVO> otherCommunityBoard(int idx) {
		return sqlSession.selectList(NAMESPACE + "otherCommunityBoard", idx);
	}
	
	@Override
	public int report(String reportee) {
		return sqlSession.update(NAMESPACE+"report",reportee);
	}

	
	
	
	
}
