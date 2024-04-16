package kr.co.dingdong.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.CommunityReplyVO;

@Repository
public interface CommunityReplyRespository {
    void addReply(CommunityReplyVO communityReplyVO);
    List<CommunityReplyVO> getAllReply(int boardNum);
    List<CommunityReplyVO> getAllrereply(int boardNum);
    void replyup(int reply);
}
