package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.Member;
import kr.co.dingdong.repository.AdminMemberRepository;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberRepository adminMemberRepository;
	
	@Override
	public List<Member> listAll() {
		return adminMemberRepository.listAll();
	}

	@Override
	public List<Member> delList() {
		return adminMemberRepository.delList();
	}

	@Override
	public int multiSuspend(List<String> suspendMemberList) {
		return adminMemberRepository.multiSuspend(suspendMemberList);
	}

	

}
