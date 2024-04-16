package kr.co.dingdong.repository;


import kr.co.dingdong.domain.CommunityVO;
import kr.co.dingdong.domain.JjimDTO;
import kr.co.dingdong.domain.ReportDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class CommunityRepositoryImpl implements CommunityRepository{


    @Autowired
    SqlSession sqlSession;

    private static String namespace="kr.co.dingdong.communityMapper";


    @Override
    public List<CommunityVO> jjimList(int memberIdx) {
        return sqlSession.selectList(namespace+".jjimList",memberIdx);
    }

    @Override
    public void insert(CommunityVO communityVO) throws Exception {


         sqlSession.insert(namespace+".insert",communityVO);
    }

    @Override
    public int goodPlus(int goodPlus) {
        return sqlSession.update(namespace+".goodPlus",goodPlus);
    }

    @Override
    public int goodDown(int goodDown) {
        return sqlSession.update(namespace+".goodDown",goodDown);
    }

    @Override
    public void badPlus(int badPlus) {
        sqlSession.update(namespace + ".badPlus", badPlus);

    }

    @Override
    public int badDown(int badDown) {
        return sqlSession.update((namespace + ".badDown"), badDown);

    }

    @Override
    public int jjimUp(JjimDTO jjimDTO) {
        return sqlSession.insert(namespace + ".jjimUp", jjimDTO);
    }

    @Override
    public int jjimCountUp(int countup) {
        return sqlSession.update(namespace+".jjimCountUp",countup);
    }

    @Override
    public int jjimCountDown(int countdown) {
        return sqlSession.update(namespace+".jjimCountDown",countdown);
    }

    @Override
    public int jjimDown(JjimDTO jjimDTO) {
        return sqlSession.delete(namespace+".jjimDelete", jjimDTO);
    }

    @Override
    public int report(ReportDTO reportDTO) {
        return sqlSession.insert(namespace+".report",reportDTO);
    }

    @Override
    public int reportupdate(int board) {
        return sqlSession.update(namespace+".reportupdate",board);
    }





    @Override
	public CommunityVO noticeRead(int board_num) throws Exception {
		return sqlSession.selectOne(namespace + ".noticeRead", board_num);
	}




    @Override
    public CommunityVO read(int board_num) throws Exception {
        return sqlSession.selectOne(namespace+".read",board_num);
    }


    @Override
    public int update(CommunityVO communityVO) throws Exception {
        return sqlSession.update(namespace+".update",communityVO);
    }

    @Override
    public int delete(int board_num) throws Exception {
        return sqlSession.delete(namespace+".delete",board_num);
    }

    @Override
    public int views(int board_num) throws Exception {
        return sqlSession.update(namespace+".views",board_num);
    }

    @Override
    public int count(String searchType,String keyword) throws Exception {

        HashMap<String, Object> data = new HashMap<>();

        data.put("searchType", searchType);
        data.put("keyword", keyword);



        return sqlSession.selectOne(namespace+".count",data);
    }

    @Override
    public List<CommunityVO> list(int displayPost,int postNum,String searchType,String keyword) throws Exception {

        HashMap data = new HashMap();
        data.put("displayPost", displayPost);
        data.put("postNum", postNum);
        data.put("searchType", searchType);
        data.put("keyword", keyword);
        return sqlSession.selectList(namespace+".onePage",data);
    }

	@Override
	public List<CommunityVO> listAll() {
		return sqlSession.selectList(namespace + ".listAll");
	}


    @Override
    public List<CommunityVO> listAllByviews() {
        return sqlSession.selectList(namespace+".listAllByviews");
    }

    @Override
    public List<CommunityVO> listAllBygood() {
        return sqlSession.selectList(namespace+".listAllBygood");
    }

    @Override
    public List<CommunityVO> listAllBynotice() {
        return sqlSession.selectList(namespace+".listAllBynotice");
    }


    public int jjimCheck(JjimDTO jjimDTO) {
        return sqlSession.selectOne(namespace+".jjimCheck",jjimDTO);
    }
    
    @Override
    public int reportcheck(ReportDTO reportDTO) {
        return sqlSession.selectOne(namespace+".reporterCheck",reportDTO);
    }

    @Override
    public List<CommunityVO> scrapjjim() {
        return sqlSession.selectList(namespace+".listAllByjjim");
    }

}
