package kr.co.dingdong.repository;

import java.util.List;

import kr.co.dingdong.domain.Member;

public interface AdminMemberRepository {
	
	List<Member> listAll();
	List<Member> delList();
	int multiSuspend(List<String> suspendMemberList);

}
