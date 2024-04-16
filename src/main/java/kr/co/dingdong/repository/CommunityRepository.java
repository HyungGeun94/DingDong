package kr.co.dingdong.repository;

import kr.co.dingdong.domain.CommunityVO;
import kr.co.dingdong.domain.JjimDTO;
import kr.co.dingdong.domain.ReportDTO;

import java.util.List;

public interface CommunityRepository {

    public void insert(CommunityVO communityVO) throws Exception;

    public CommunityVO read(int board_num) throws Exception;

    public int update(CommunityVO communityVO) throws Exception;

    public int delete(int board_num) throws Exception;

    public int views(int board_num) throws Exception;

    public int count(String searchType,String keyword) throws Exception;

    public int goodPlus(int goodPlus);

    public int goodDown(int goodDown);

    public void badPlus(int badPlus);

    public int badDown(int badDown);

    public int jjimCheck(JjimDTO jjimDTO);

    public int jjimUp(JjimDTO jjimDTO);

    public int jjimCountUp(int countup);

    public int jjimCountDown(int countdown);

    public int jjimDown(JjimDTO jjimDTO);

    public List<CommunityVO> jjimList(int memberIdx);

    public int report(ReportDTO reportDTO);

    public int reportupdate(int board);

    public CommunityVO noticeRead(int board_num) throws Exception;
    
    public int reportcheck(ReportDTO reportDTO);

    public  List<CommunityVO> scrapjjim();
















    public List<CommunityVO> list(int displayPost,int postNum,String searchType,String keyword) throws Exception;

    public List<CommunityVO> listAll();

    public List<CommunityVO> listAllByviews();

    public List<CommunityVO> listAllBygood();

    public List<CommunityVO> listAllBynotice();



}
