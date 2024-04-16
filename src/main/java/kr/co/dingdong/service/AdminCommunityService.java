package kr.co.dingdong.service;

import java.util.List;

import kr.co.dingdong.domain.CommunityBoard;

public interface AdminCommunityService {
	
	List<CommunityBoard> listAll();
	List<CommunityBoard> delList();
	List<CommunityBoard> blindList();
	List<CommunityBoard> noticeList();
	int insertNotice(CommunityBoard notice);
	int multiDelete(List<Integer> boardNumList);
	

}
