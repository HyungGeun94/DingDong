package kr.co.dingdong.service;

import java.util.List;

import kr.co.dingdong.domain.Note;

public interface NoteService {

	int insert(Note note);
	int countNotRead(String receiver);
	
	List<Note> listAll(String receiver);
}
