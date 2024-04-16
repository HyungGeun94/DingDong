package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.Studyroom;
import kr.co.dingdong.repository.StudyroomRepository2;

@Service
public class StudyroomServiceImpl2 implements StudyroomService2 {
	
	@Autowired
	private StudyroomRepository2 studyroomRepository;

	@Override
	public List<Studyroom> listAll() {
		return studyroomRepository.listAll();
	}
	
	

}
