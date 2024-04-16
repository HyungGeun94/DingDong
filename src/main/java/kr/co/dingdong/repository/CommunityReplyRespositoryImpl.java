package kr.co.dingdong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.CommunityReplyVO;

@Repository
public class CommunityReplyRespositoryImpl implements CommunityReplyRespository {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void addReply(CommunityReplyVO communityReplyVO) {
        sqlSession.insert("addReply", communityReplyVO);
    }

    @Override
    public List<CommunityReplyVO> getAllReply(int boardNum) {
        return sqlSession.selectList("getAllreply", boardNum);
    }

	@Override
	public List<CommunityReplyVO> getAllrereply(int boardNum) {
		return sqlSession.selectList("getAllrereply", boardNum);
	}
	
	@Override
    public void replyup(int reply) {
        sqlSession.update("replyup", reply);
    }
}
