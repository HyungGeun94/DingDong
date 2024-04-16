package kr.co.dingdong.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dingdong.domain.Member;
import kr.co.dingdong.service.AdminMemberService;
import kr.co.dingdong.service.MemberService;

@Controller
public class AdminMemberController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	private AdminMemberService adminMemberService;
	
//	전체 회원 조회
	@GetMapping("admin/member/listAll")
	public String listAll(Model model) {
		
		List<Member> memberList = adminMemberService.listAll();
		model.addAttribute("memberList", memberList);
		
		return "admin/member/listAll";
	}
	
//	탈퇴 회원 조회
	@GetMapping("admin/member/del")
	public String delList(Model model) {
		
		List<Member> memberList = adminMemberService.delList();
		model.addAttribute("memberList", memberList);
		return "admin/member/del";
	}
	
	@PostMapping("admin/member/multiSuspend")
	public String multiSuspend(@RequestParam("id") List<String> suspendMemberList) {
		log.info("[suspendMemberList] {}", suspendMemberList);
		
		adminMemberService.multiSuspend(suspendMemberList);
		
		return "redirect:/admin/member/listAll";
		
	}
	

}
