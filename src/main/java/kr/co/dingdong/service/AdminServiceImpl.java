package kr.co.dingdong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.Admin;
import kr.co.dingdong.domain.AdminLoginDTO;
import kr.co.dingdong.repository.AdminRepository;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminRepository adminRepository;

	@Override
	public Admin login(AdminLoginDTO adminLoginDTO) {
		return adminRepository.login(adminLoginDTO);
	}
	
	

}
