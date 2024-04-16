package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.RoomDTO;
import kr.co.dingdong.domain.RoomSelectDTO;

@Repository
public class RoomRepositoryImpl implements RoomRepository {

	public static final String namespace = "kr.co.dingdong.mappers.roomMapper";
	
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public List<RoomDTO> listAll(int studyroom) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listAll", studyroom);
	}

	@Override
	public int insert(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".insert", roomDTO);
	}

	@Override
	public int update(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".update", roomDTO);
	}

	@Override
	public int delete(int roomNumber) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".delete", roomNumber);
	}

	@Override
	public RoomDTO detail(int roomNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".detail", roomNumber);
	}

	@Override
	public List<RoomSelectDTO> roomList(int studyroom) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".roomList", studyroom);
	}

	

	
	
	
}
