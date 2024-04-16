package kr.co.dingdong.repository;

import kr.co.dingdong.domain.CommunityBadDTO;
import kr.co.dingdong.domain.CommunityGoodDTO;

public interface CommunityBadRepository {

    public int badCheck(CommunityBadDTO communityBadDTO);



    public int dislikeUp(CommunityBadDTO communityBadDTO);

    public int dislikeDown(CommunityBadDTO communityBadDTO);



}
