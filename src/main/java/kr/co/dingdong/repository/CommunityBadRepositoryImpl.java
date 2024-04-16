package kr.co.dingdong.repository;


import kr.co.dingdong.domain.CommunityBadDTO;
import kr.co.dingdong.domain.CommunityGoodDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityBadRepositoryImpl implements CommunityBadRepository{


    @Autowired
    SqlSession sqlSession;


    private static final String namespace="kr.co.dingdong.communityBadMapper";

    @Override
    public int badCheck(CommunityBadDTO communityBadDTO) {
        return sqlSession.selectOne(namespace+".badcheck",communityBadDTO);
    }


    @Override
    public int dislikeUp(CommunityBadDTO communityBadDTO) {
        return sqlSession.insert(namespace+".dislikeUp",communityBadDTO);
    }



    @Override
    public int dislikeDown(CommunityBadDTO communityBadDTO) {
        return sqlSession.delete(namespace+".dislikeDown",communityBadDTO);
    }



}
