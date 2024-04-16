package kr.co.dingdong.service;

import java.util.List;

import kr.co.dingdong.domain.CommunityVO;
import kr.co.dingdong.domain.LoginVO;
import kr.co.dingdong.domain.Member;

public interface MemberService {
	
	Member login(LoginVO loginVO);
	int loginDateUpdate(String id);
	
	Member selectOne(String id);
	int insert(Member member);
	int update(Member member);
	int updateProfile(Member member);
	int quit(Member member);
	
	
	Member findByEmail(String email);
	Member findByIdx(int idx);
	
	List<CommunityVO> myCommunityBoard(String id);
	List<CommunityVO> otherCommunityBoard(int idx);
	
	int report(String reportee);

	

}
