package kr.co.dingdong.repository;


import kr.co.dingdong.domain.CommunityGoodDTO;
import kr.co.dingdong.domain.CommunityVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public class CommunityGoodRepositoryImpl implements CommunityGoodRepository{
    @Autowired
    SqlSession sqlSession;

    private static final String namespace="kr.co.dingdong.communityGoodMapper";


    @Override
    public int goodCheck(CommunityGoodDTO communityGoodDTO) {
        return sqlSession.selectOne(namespace+".goodcheck",communityGoodDTO);
    }

    @Override
    public int likeUp(CommunityGoodDTO communityGoodDTO) {
        return sqlSession.insert(namespace+".likeUp",communityGoodDTO);
    }

    @Override
    public int likeDown(CommunityGoodDTO communityGoodDTO) {
        return sqlSession.delete(namespace+".likeDown",communityGoodDTO);
    }


}
