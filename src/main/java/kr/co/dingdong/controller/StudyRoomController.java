package kr.co.dingdong.controller;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dingdong.domain.LoginVO;
import kr.co.dingdong.domain.Member;
import kr.co.dingdong.domain.StudyRoomDTO;
import kr.co.dingdong.service.MemberService;
import kr.co.dingdong.service.StudyRoomService;

@Controller
public class StudyRoomController {

		public static final Logger logger = LoggerFactory.getLogger(StudyRoomController.class);
	
	@Autowired
	private StudyRoomService studyRoomService;
	@Autowired
	private MemberService memberService;
	
	//전체목록
	@GetMapping("reservation/branchList")
	public String listAll(Model model
			, HttpSession session) {
		
		Member member = (Member)session.getAttribute("member");
		if(member == null) {
			logger.info("no member");
			return "login";
		
		}else { 
			logger.info("member=" + member);
			model.addAttribute("branchList", studyRoomService.listAll());
			logger.info("branchList" + studyRoomService.listAll());
			
			return "reservation/branchList";
		
		}
		
	}
	
	/*//선택목록
	@GetMapping("reservation/roomList")
	public String detail(Model model
			, @RequestParam("studyroom")int studyroom) {
		
		StudyRoomDTO studyRoomDTO = studyRoomService.detail(studyroom);
		model.addAttribute("studyRoomDTO", studyRoomDTO); // view에서 a링크로 값보내면 Controller가 받아서 다시 model에 넣고 return 해줘야 view에 감.
		logger.info("studyRoomDTO = " + studyRoomDTO);
		return "reservation/roomList";
	}
	*/
	/*@ResponseBody
	@PostMapping(value="reservation/roomList")
	public StudyRoomDTO detail(@RequestParam("studyroom")int studyroom) {
		
		return studyRoomService.detail(studyroom);
		
	}
	*/
	
	
	//추가하기
	@GetMapping("reservation/studyRoomInsert")
	public void insert() {
		
		logger.info("studyRoomInsertForm");
	}
	
	
	@PostMapping("reservation/studyRoomInsert")
	public String insert(StudyRoomDTO studyRoomDTO) {
		
		int r = studyRoomService.insert(studyRoomDTO);
		logger.info("r=" + r);
		
		if(r > 0) {
			logger.info("insert success");
			return "redirect:/reservation/branchList";
		}else {
			logger.info("del");
			logger.info("insert fail");
			return "reservation/studyRoomInsert";
		}
		
	}
	
	
	//수정하기
	@GetMapping("reservation/studyRoomUpdate")
	public void update(Model model
			,@RequestParam("studyroom")int studyroom) {

		StudyRoomDTO studyRoomDTO =  studyRoomService.detail(studyroom);
		model.addAttribute("studyRoomDTO", studyRoomDTO);
		logger.info("studyRoomUpdateForm");

	}
	
	
	@PostMapping("reservation/studyRoomUpdate")
	public String update(StudyRoomDTO studyRoomDTO) {
		
		int r = studyRoomService.update(studyRoomDTO);
		
		if(r > 0) {
			logger.info("update success");
			return "redirect:/reservation/branchList";
		}else {
			logger.info("update fail");
			return "reservation/studyRoomUpdate";
		}
	}
	
	//삭제하기(del=1)
	// update에서 바꿀 수 있음.
}
