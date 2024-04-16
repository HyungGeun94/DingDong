package kr.co.dingdong.service;

import kr.co.dingdong.domain.Admin;
import kr.co.dingdong.domain.AdminLoginDTO;

public interface AdminService {
	
	Admin login(AdminLoginDTO adminLoginDTO);

}
