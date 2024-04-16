package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.Alarm;

@Repository
public class AlarmRepositoryImpl implements AlarmRepository{
	

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dingdong.mappers.alarmMapper.";

	@Override
	public int insert(Alarm alarm) {
		return sqlSession.insert(NAMESPACE + "insert", alarm);
	}

	@Override
	public List<Alarm> listById(String id) {
		return sqlSession.selectList(NAMESPACE + "listById", id);
	}

	@Override
	public int countNotRead(String id) {
		return sqlSession.selectOne(NAMESPACE + "countNotRead", id);
	}

	@Override
	public Alarm findByIdx(int idx) {
		return sqlSession.selectOne(NAMESPACE + "findByIdx", idx);
	}

	@Override
	public int read(int idx) {
		return sqlSession.update(NAMESPACE + "read", idx);
	}

}
