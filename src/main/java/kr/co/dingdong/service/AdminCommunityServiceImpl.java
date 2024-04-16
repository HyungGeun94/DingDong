package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.CommunityBoard;
import kr.co.dingdong.repository.AdminCommunityRepository;

@Service
public class AdminCommunityServiceImpl implements AdminCommunityService{
	
	@Autowired
	private AdminCommunityRepository communityRepository;

	@Override
	public List<CommunityBoard> listAll() {
		return communityRepository.listAll();
	}

	@Override
	public List<CommunityBoard> delList() {
		return communityRepository.delList();
	}

	@Override
	public List<CommunityBoard> blindList() {
		return communityRepository.blindList();
	}

	@Override
	public List<CommunityBoard> noticeList() {
		return communityRepository.noticeList();
	}

	@Override
	public int insertNotice(CommunityBoard notice) {
		return communityRepository.insertNotice(notice);
	}

	@Override
	public int multiDelete(List<Integer> boardNumList) {
		return communityRepository.multiDelete(boardNumList);
	}
	
	

}
