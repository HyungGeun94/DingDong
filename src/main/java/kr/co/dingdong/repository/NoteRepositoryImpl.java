package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.Note;

@Repository
public class NoteRepositoryImpl implements NoteRepository{
	
	@Autowired
	private SqlSession sqlsession;
	
	private final String NAMESPACE = "kr.co.dingdong.mappers.noteMapper.";

	@Override
	public int insert(Note note) {
		return sqlsession.insert(NAMESPACE + "insert", note);
	}

	@Override
	public int countNotRead(String receiver) {
		return sqlsession.selectOne(NAMESPACE + "countNoteRead", receiver);
	}

	@Override
	public List<Note> listAll(String receiver) {
		return sqlsession.selectList(NAMESPACE + "listAll", receiver);
	}
	
}
