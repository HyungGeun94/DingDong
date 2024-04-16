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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.domain.ReservationReviewDTO;
import kr.co.dingdong.service.MemberService;
import kr.co.dingdong.service.ReservationReviewService;
import kr.co.dingdong.service.ReservationService;

@Controller
public class ReservationReviewController {

	public static final Logger logger = LoggerFactory.getLogger(ReservationReviewController.class);
	
	
	@Autowired
	ReservationReviewService reservationReviewService;
	@Autowired
	ReservationService reservationService;
	@Autowired
	MemberService memberService;
		
	
	//리뷰 전체목록
	@ResponseBody
	@PostMapping(value="/reservation/reviewList")
	public List<ReservationReviewDTO>reviewList	(@RequestParam("roomNumber")int roomNumber){
		
		return (List<ReservationReviewDTO>) reservationReviewService.reviewList(roomNumber);
		
	}
	
	
	
	
	
	//리뷰 작성하기
	@GetMapping("reservation/review/insert")
	public String insert(Model model
			, @RequestParam("reservationNumber")String reservationNumber) {
		
		Reservation reservation = reservationService.detail(reservationNumber);
		model.addAttribute("reservation", reservation);
		
		return "reservation/review/insert";
	}
	
	
	@PostMapping("reservation/review/insert")
	public String insert(Model model
			, ReservationReviewDTO reservationReviewDTO) {
		
		int r = reservationReviewService.insert(reservationReviewDTO);
		
		
		if(r > 0) {
			logger.info("review insert success");
			logger.info("r =" + r);
			logger.info("reservation/detail run~run~");
			return "redirect:/reservation/detail?roomNumber=" + reservationReviewDTO.getRoomNumber();
		}else {
			logger.info("review insert fail");
			return "member/mypage";
		}
		
		
	}
	
	
	
	
	
	
	
	
}
