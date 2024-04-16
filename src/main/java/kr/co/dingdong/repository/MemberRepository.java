package kr.co.dingdong.repository;

import java.util.List;

import kr.co.dingdong.domain.CommunityVO;
import kr.co.dingdong.domain.LoginVO;
import kr.co.dingdong.domain.Member;

public interface MemberRepository {
	
	Member login(LoginVO loginVO);
	Member selectOne(String id);
	int insert(Member member);
	int update(Member member);
	int updateProfile(Member member);
	int quit(Member member);
	int loginDateUpdate(String id);
	Member findByEmail(String email);
	Member findByIdx(int idx);
	
	List<CommunityVO> myCommunityBoard(String id);
	List<CommunityVO> otherCommunityBoard(int idx);
	
	int report(String reportee);



}
