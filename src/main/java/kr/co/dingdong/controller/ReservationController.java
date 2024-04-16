package kr.co.dingdong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dingdong.domain.Member;
import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.domain.RoomDTO;
import kr.co.dingdong.domain.StudyRoomDTO;
import kr.co.dingdong.service.MemberService;
import kr.co.dingdong.service.ReservationService;
import kr.co.dingdong.service.RoomService;
import kr.co.dingdong.service.StudyRoomService;

@Controller
public class ReservationController {

	public static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
		
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private StudyRoomService studyRoomService; 
	@Autowired
	private RoomService roomService;
	@Autowired
	private MemberService memberService;
	
	
	
	//예약목록
	@GetMapping("reservation/insert")
	public void detail(Model model
			,@RequestParam("reservationNumber")String reservationNumber
			,HttpSession session) {

		Reservation reservation = reservationService.detail(reservationNumber);
		model.addAttribute("reservation", reservation);
		logger.info("reservation = " + reservationNumber);
		
		//멤버 정보
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("member", member);
		logger.info("member= " + member);
	}
	
	
	//추가하기
	@GetMapping("reservation/form")
	public String insert(Model model
			, HttpSession session
			,@RequestParam("studyroom")int studyroom
			,@RequestParam("roomNumber")int roomNumber) {
		
		//Member session 전달
		Member member = (Member)session.getAttribute("member");
		model.addAttribute("member", member);
		logger.info("member =" + member);
		
		//studyRoomDTO 전달
		StudyRoomDTO studyRoomDTO = studyRoomService.detail(studyroom);
		model.addAttribute("studyRoomDTO", studyRoomDTO);
		logger.info("studyRoomDTO =" + studyRoomDTO);
		
		//roomDTO 전달
		RoomDTO roomDTO = roomService.detail(roomNumber);
		model.addAttribute("roomDTO", roomDTO);
		logger.info("roomDTO = " + roomDTO);
		
		//멤버 정보
		model.addAttribute("member", member);
		logger.info("member= " + member);
		
		logger.info("reservation form");
		
		return "reservation/form";
	}

	
	@PostMapping("reservation/form")
	public String insert(Model model
			, Reservation reservation
			,HttpSession session) {
		

		int r = reservationService.insert(reservation);
		
		
		if(r > 0) {
			logger.info("reservation success");
			logger.info("r=" + r);
			return "redirect:/reservation/insert?reservationNumber=" + reservation.getReservationNumber();
		
		}else {
			logger.info("reservation fail");
			return "reservation/branchList";
		}
		
	}
	
	
}
