package kr.co.dingdong.repository;

import kr.co.dingdong.domain.CommunityGoodDTO;
import kr.co.dingdong.domain.CommunityVO;

public interface CommunityGoodRepository {

    public int goodCheck(CommunityGoodDTO communityGoodDTO);

    public int likeUp(CommunityGoodDTO communityGoodDTO);

    public int likeDown(CommunityGoodDTO communityGoodDTO);

}
