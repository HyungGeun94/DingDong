package kr.co.dingdong.repository;

import kr.co.dingdong.domain.Admin;
import kr.co.dingdong.domain.AdminLoginDTO;

public interface AdminRepository {
	
	Admin login(AdminLoginDTO adminLoginDTO);

}
