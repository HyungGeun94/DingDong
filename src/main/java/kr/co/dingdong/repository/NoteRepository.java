package kr.co.dingdong.repository;

import java.util.List;

import kr.co.dingdong.domain.Note;

public interface NoteRepository {
	
	int insert(Note note);
	int countNotRead(String receiver);
	
	List<Note> listAll(String receiver);

}
