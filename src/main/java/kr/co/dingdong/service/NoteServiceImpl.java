package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.Note;
import kr.co.dingdong.repository.NoteRepository;


@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteRepository noteRepository;

	@Override
	public int insert(Note note) {
		return noteRepository.insert(note);
	}

	@Override
	public int countNotRead(String receiver) {
		return noteRepository.countNotRead(receiver);
	}

	@Override
	public List<Note> listAll(String receiver) {
		return noteRepository.listAll(receiver);
	}
	
}
