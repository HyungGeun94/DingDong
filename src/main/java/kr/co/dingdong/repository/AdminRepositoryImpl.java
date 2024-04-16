package kr.co.dingdong.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dingdong.domain.Admin;
import kr.co.dingdong.domain.AdminLoginDTO;

@Repository
public class AdminRepositoryImpl implements AdminRepository {

	@Autowired
	private SqlSession sqlSession;

	
	private final String NAMESPACE = "kr.co.dingdong.mappers.adminMapper.";
	
	@Override
	public Admin login(AdminLoginDTO adminLoginDTO) {
		return sqlSession.selectOne(NAMESPACE + "login", adminLoginDTO);
	}

}
