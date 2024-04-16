package kr.co.dingdong.service;

import kr.co.dingdong.domain.*;

import java.util.List;

public interface CommunityService {

    public void insert(CommunityVO communityVO) throws Exception;

    public CommunityVO read(int board_num) throws Exception;

    public int update(CommunityVO communityVO) throws Exception;

    public int delete(int board_num) throws Exception;

    public int views(int board_num) throws Exception;


    public int count(String searchType,String keyword) throws Exception;



    public CommunityVO noticeRead(int board_num) throws Exception;


    public List<CommunityVO> list(int displayPost,int postNum,String searchType,String keyword) throws Exception;

    public List<CommunityVO> listAll();

    public List<CommunityVO> listAllByviews();

    public List<CommunityVO> listAllBygood();

    public List<CommunityVO> listAllBynotice();

    public int goodCheck(CommunityGoodDTO communityGoodDTO);

    public int likeUp(CommunityGoodDTO communityGoodDTO);

    public int likeDown(CommunityGoodDTO communityGoodDTO);

    public int goodPlus(int goodPlus);

    public int goodDown(int goodDown);

    public int badCheck(CommunityBadDTO communityBadDTO);

    public void badPlus(int badPlus);

    public void dislikeUp(CommunityBadDTO communityBadDTO);

    public void badDown(int badDown);

    public int dislikeDown(CommunityBadDTO communityBadDTO);
    public int jjimCheck(JjimDTO jjimDTO);

    public int jjimUp(JjimDTO jjimDTO);

    public int jjimCountUp(int countup);

    public int jjimCountDown(int countdown);

    public int jjimDown(JjimDTO jjimDTO);

    public List<CommunityVO> jjimList(int memberIdx);

    public int report(ReportDTO reportDTO);

    public int reportupdate(int board);

    public int reportcheck(ReportDTO reportDTO);

    public  List<CommunityVO> scrapjjim();































}
