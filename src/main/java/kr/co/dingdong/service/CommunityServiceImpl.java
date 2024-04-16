package kr.co.dingdong.service;


import kr.co.dingdong.domain.*;
import kr.co.dingdong.repository.CommunityBadRepository;
import kr.co.dingdong.repository.CommunityGoodRepository;
import kr.co.dingdong.repository.CommunityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommunityServiceImpl implements CommunityService{


    @Autowired
    CommunityRepository communityRepository;

    @Autowired
    CommunityGoodRepository communityGoodRepository;

    @Autowired
    CommunityBadRepository communityBadRepository;


    @Override
    public List<CommunityVO> jjimList(int memberIdx) {
        return communityRepository.jjimList(memberIdx);
    }

    @Override
    public int goodCheck(CommunityGoodDTO communityGoodDTO) {
        return communityGoodRepository.goodCheck(communityGoodDTO);
    }

    @Override
    public int badCheck(CommunityBadDTO communityBadDTO) {
        return communityBadRepository.badCheck(communityBadDTO);
    }

    @Override
    public int goodPlus(int goodPlus) {
        return communityRepository.goodPlus(goodPlus);
    }

    @Override
    public void badPlus(int badPlus) {
        communityRepository.badPlus(badPlus);
    }

    @Override
    public int goodDown(int goodDown) {
        return communityRepository.goodDown(goodDown);
    }

    @Override
    public void badDown(int badDown) {
        communityRepository.badDown(badDown);
    }


    @Override
    public int likeUp(CommunityGoodDTO communityGoodDTO) {
        return communityGoodRepository.likeUp(communityGoodDTO);
    }

    @Override
    public int likeDown(CommunityGoodDTO communityGoodDTO) {
        return communityGoodRepository.likeDown(communityGoodDTO);
    }
    @Override
    public void dislikeUp(CommunityBadDTO communityBadDTO) {
        communityBadRepository.dislikeUp(communityBadDTO);

    }

    @Override
    public int dislikeDown(CommunityBadDTO communityBadDTO) {
        return communityBadRepository.dislikeDown(communityBadDTO);
    }

    @Override
    public int jjimCheck(JjimDTO jjimDTO) {
        return communityRepository.jjimCheck(jjimDTO);
    }



    @Override
    public int jjimUp(JjimDTO jjimDTO) {
        return communityRepository.jjimUp(jjimDTO);
    }

    @Override
    public int jjimDown(JjimDTO jjimDTO) {
        return communityRepository.jjimDown(jjimDTO);
    }

    @Override
    public int jjimCountDown(int countdown) {
        return communityRepository.jjimCountDown(countdown);
    }

    @Override
    public int jjimCountUp(int countup) {
        return communityRepository.jjimCountUp(countup);
    }

    @Override
    public int report(ReportDTO reportDTO) {
        return communityRepository.report(reportDTO);
    }

    @Override
    public int reportupdate(int board) {
        return communityRepository.reportupdate(board);
    }



    @Override
    public void insert(CommunityVO CommunityVO) throws Exception {
         communityRepository.insert(CommunityVO);
    }

    @Override
    public CommunityVO read(int board_num) throws Exception {
        return communityRepository.read(board_num);
    }

    @Override
    public int update(CommunityVO communityVO) throws Exception {
        return communityRepository.update(communityVO);
    }

    @Override
    public int views(int board_num) throws Exception {
        return communityRepository.views(board_num);
    }

    @Override
    public int delete(int board_num) throws Exception {
        return communityRepository.delete(board_num);
    }

    @Override
    public int count(String searchType,String keyword) throws Exception {
        return communityRepository.count( searchType, keyword);
    }

    @Override
    public List<CommunityVO> list(int displayPost,int postNum,String searchType,String keyword) throws Exception {
        return communityRepository.list(displayPost,postNum, searchType, keyword);
    }

	@Override
	public List<CommunityVO> listAll() {
		return communityRepository.listAll();
	}

    @Override
    public List<CommunityVO> listAllByviews() {
        return communityRepository.listAllByviews();
    }

    @Override
    public List<CommunityVO> listAllBygood() {
        return communityRepository.listAllBygood();
    }

    @Override
    public List<CommunityVO> listAllBynotice() {
        return communityRepository.listAllBynotice();
    }
    
    @Override
	public CommunityVO noticeRead(int board_num) throws Exception {
		return communityRepository.noticeRead(board_num);
	}
    
    public int reportcheck(ReportDTO reportDTO) {
        return communityRepository.reportcheck(reportDTO);
    }

    @Override
    public List<CommunityVO> scrapjjim() {
        return communityRepository.scrapjjim();
    }

}
