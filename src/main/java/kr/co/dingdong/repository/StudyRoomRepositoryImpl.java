package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.StudyRoomDTO;

@Repository
public class StudyRoomRepositoryImpl implements StudyRoomRepository{

	public static String namespace = "kr.co.dingdong.mappers.studyroomMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<StudyRoomDTO> listAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listAll");
	}

	@Override
	public int insert(StudyRoomDTO studyRoomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".insert", studyRoomDTO);
	}

	@Override
	public int update(StudyRoomDTO studyRoomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".update", studyRoomDTO);
	}

	@Override
	public int delete(StudyRoomDTO studyRoomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".delete", studyRoomDTO);
	}

	@Override
	public StudyRoomDTO detail(int studyroom) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".detail", studyroom);
	}
	
	
	
	
	
}
