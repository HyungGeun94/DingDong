package kr.co.dingdong.service;

import java.util.List;

import kr.co.dingdong.domain.Member;

public interface AdminMemberService {
	
	List<Member> listAll();
	List<Member> delList();
	int multiSuspend(List<String> suspendMemberList);
	
}
