package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.CommunityReplyVO;

public interface CommunityReplyService {
    void addReply(CommunityReplyVO communityreplyVO);
    List<CommunityReplyVO> getAllReply(int boardNum);
    List<CommunityReplyVO> getAllrereply(int boardNum);
    void replyup(int reply);
}