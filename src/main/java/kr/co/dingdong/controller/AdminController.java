package kr.co.dingdong.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.dingdong.domain.Admin;
import kr.co.dingdong.domain.AdminLoginDTO;
import kr.co.dingdong.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	 
	
	@GetMapping("admin")
	public String index() {
		
		return "admin/index";
	}
	
	@GetMapping("adminLogin")
	public void login() {
		
	}
	
	@PostMapping("adminLoginAction")
	public String loginAction(AdminLoginDTO adminLoginDTO, Model model, HttpSession session) {
		
		Admin admin = adminService.login(adminLoginDTO);
		
		log.info("[Login admin] " + admin);
		
		if(admin != null) {
			session.setAttribute("admin", admin);
			return "admin/index";
		}
		
		return "admin/login";
		
	}
	
	
	@GetMapping("adminLogout")
	public void logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
//		세션 삭제 
		session.invalidate();
		
//		스크립트 출력 
		PrintWriter w = response.getWriter();
		
//		한글 깨짐 -> utf-8 설정 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		w.println("<script>");
		w.println("alert('로그아웃되었습니다.')");
		w.println("location.href='/dingdong/'");
		w.println("</script>");
		
	}
	

	

}
