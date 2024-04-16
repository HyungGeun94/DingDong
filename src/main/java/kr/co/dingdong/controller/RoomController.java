package kr.co.dingdong.controller;

import java.util.List;

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

import kr.co.dingdong.domain.Member;
import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.domain.ReservationReviewDTO;
import kr.co.dingdong.domain.RoomDTO;
import kr.co.dingdong.domain.RoomSelectDTO;
import kr.co.dingdong.domain.StudyRoomDTO;
import kr.co.dingdong.service.MemberService;
import kr.co.dingdong.service.ReservationReviewService;
import kr.co.dingdong.service.ReservationService;
import kr.co.dingdong.service.RoomService;
import kr.co.dingdong.service.StudyRoomService;

@Controller
public class RoomController {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private RoomService roomService;
	@Autowired
	private StudyRoomService studyRoomService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReservationService reservationService;	
	@Autowired
	private ReservationReviewService reservationReviewService;
	
	
	// 전체목록 출력
	@GetMapping("reservation/roomList")
	public String listAll(Model model
			, @RequestParam("studyroom")int studyroom
			,HttpSession session) {
		
		//룸 List
		List<RoomSelectDTO>roomList = roomService.roomList(studyroom);
		model.addAttribute("roomList", roomList);
		logger.info("roomList" + roomList);
		
		//스터디룸 정보
		StudyRoomDTO studyRoomDTO = studyRoomService.detail(studyroom);
		model.addAttribute("studyRoomDTO", studyRoomDTO);
		logger.info("studyRoomDTO =" + studyRoomDTO);
		
		//멤버 정보
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("member", member);
		logger.info("member= " + member);
		
		logger.info("room roomList");
		return "/reservation/roomList";
	}
	
	
	
	//선택목록 출력
		@GetMapping("reservation/detail")
		public void detail(Model model
				,@RequestParam("roomNumber")int roomNumber
				,Reservation reservation) {
			//룸
			RoomDTO roomDTO = roomService.detail(roomNumber);
			model.addAttribute("roomDTO", roomDTO);
			logger.info(roomNumber + "번 detail");
			
			//스터디룸
			StudyRoomDTO studyRoomDTO = studyRoomService.detail(roomDTO.getStudyroom());
			model.addAttribute("studyRoomDTO", studyRoomDTO);
			logger.info("studyRoomDTO =" + studyRoomDTO);
			
			//예약정보
			List<Reservation>reservationList = reservationService.listAll();
			model.addAttribute("reservationList", reservationList);
			logger.info("reservationList = " + reservationList);
			
			//리뷰정보
			List<ReservationReviewDTO>reviewList = reservationReviewService.reviewList(roomNumber);
			model.addAttribute("reviewList = ", reviewList);
			logger.info("reviewList = " + reviewList);
		}
	
	
	
	//추가하기
	@GetMapping("reservation/roomInsert")
	public String insert(Model model
			,@RequestParam(value="studyroom")int studyroom
			 ) {
		//룸 List
		List<RoomSelectDTO>roomList = roomService.roomList(studyroom);
		model.addAttribute("roomList", roomList);
		logger.info("roomList="+ roomList);
		
		//지점번호 + 지점이름
		StudyRoomDTO studyRoomDTO = studyRoomService.detail(studyroom);
		model.addAttribute("studyRoomDTO", studyRoomDTO);
		logger.info("studyRoomDTO =" + studyRoomDTO);
	
		
		logger.info("room insertForm");
		return "reservation/roomInsert";
	}
	
	
	@PostMapping("reservation/roomInsert")
	public String insert(RoomDTO roomDTO) {
		
		int r = roomService.insert(roomDTO);
		
		if(r > 0) {
			logger.info("insert success");
			logger.info("roomDTO=" + roomDTO);
			return "redirect:/reservation/roomList?studyroom=" + roomDTO.getStudyroom();
		}else {
			logger.info("insert fail");
			return "reservation/roomInsert";
		}
	}
	
	
	
	//수정하기
	@GetMapping("reservation/roomUpdate")
	public void update(Model model
			,@RequestParam("roomNumber")int roomNumber) {
		
		//룸
		RoomDTO roomDTO = roomService.detail(roomNumber);
		model.addAttribute("roomDTO", roomDTO);
		logger.info("roomDTO = " + roomDTO);
		
		//스터디룸
		StudyRoomDTO studyRoomDTO = studyRoomService.detail(roomDTO.getStudyroom());
		model.addAttribute("studyRoomDTO", studyRoomDTO);
		logger.info("studyRoomDTO =" + studyRoomDTO);
		
		
		logger.info("roomUpdate form~");
		
	}
	
	
	@PostMapping("reservation/roomUpdate")
	public String update(@RequestParam("roomNumber")int roomNumber) {
		
		
		RoomDTO roomDTO = roomService.detail(roomNumber);
		
		int r = roomService.update(roomDTO);
		logger.info("r = " + r);
		
		if(r > 0) {
			logger.info("roomUpdate success");
			logger.info("roomDTO=" + roomDTO);
			return "redirect:/reservation/roomList?studyroom=" + roomDTO.getStudyroom();
		}else {
			logger.info("roomUpdate fail");
			return "redirect:/reservation/roomList?studyroom=" + roomDTO.getStudyroom();
		}
		
		
		
	}
	
	//삭제하기(del -> 1)로 변경
	
	
}
