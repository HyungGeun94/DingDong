package kr.co.dingdong.repository;

import java.util.List;

import kr.co.dingdong.domain.CommunityBoard;

public interface AdminCommunityRepository {
	
	List<CommunityBoard> listAll();
	List<CommunityBoard> delList();
	List<CommunityBoard> blindList();
	List<CommunityBoard> noticeList();
	int insertNotice(CommunityBoard notice);
	int multiDelete(List<Integer> boardNumList);
	

}
