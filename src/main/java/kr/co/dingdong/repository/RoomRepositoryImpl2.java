package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.Room;

@Repository
public class RoomRepositoryImpl2 implements RoomRepository2 {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dingdong.mappers.roomMapper2.";

	@Override
	public List<Room> listAll(int studyroomNumber) {
		return sqlSession.selectList(NAMESPACE + "listAll", studyroomNumber);
	}

	@Override
	public Room selectOne(Room room) {
		return sqlSession.selectOne(NAMESPACE + "selectOne", room);
	}

}
