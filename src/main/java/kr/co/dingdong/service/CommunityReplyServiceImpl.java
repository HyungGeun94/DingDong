package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.CommunityReplyVO;
import kr.co.dingdong.repository.CommunityReplyRespository;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService {

    @Autowired
    private CommunityReplyRespository communityReplyRespository;

	@Override
	public void addReply(CommunityReplyVO communityreplyVO) {
		// TODO Auto-generated method stub
		communityReplyRespository.addReply(communityreplyVO);
	}

	@Override
	public List<CommunityReplyVO> getAllReply(int boardNum) {
		return communityReplyRespository.getAllReply(boardNum);
	}

	@Override
	public List<CommunityReplyVO> getAllrereply(int boardNum) {
		return communityReplyRespository.getAllrereply(boardNum);
	}
	
	@Override
    public void replyup(int reply) {
        communityReplyRespository.replyup(reply);
    }
	
}
