package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.CommunityBoard;

@Repository
public class AdminCommunityRepositoryImpl implements AdminCommunityRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dingdong.mappers.adminCommunityMapper.";

	@Override
	public List<CommunityBoard> listAll() {
		return sqlSession.selectList(NAMESPACE + "listAll");
	}

	@Override
	public List<CommunityBoard> delList() {
		return sqlSession.selectList(NAMESPACE + "delList");
	}

	@Override
	public List<CommunityBoard> blindList() {
		return sqlSession.selectList(NAMESPACE + "blindList");
	}

	@Override
	public List<CommunityBoard> noticeList() {
		return sqlSession.selectList(NAMESPACE + "noticeList");
	}

	@Override
	public int insertNotice(CommunityBoard notice) {
		return sqlSession.insert(NAMESPACE + "insertNotice", notice);
	}

	@Override
	public int multiDelete(List<Integer> boardNumList) {
		return sqlSession.update(NAMESPACE + "multiDelete", boardNumList);
	}


	
	

}
