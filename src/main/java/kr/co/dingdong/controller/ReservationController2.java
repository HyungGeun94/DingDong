package kr.co.dingdong.controller;

import java.util.List;

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

import com.google.gson.JsonObject;

import kr.co.dingdong.domain.Member;
import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.domain.ReservedTime;
import kr.co.dingdong.domain.Room;
import kr.co.dingdong.domain.Studyroom;
import kr.co.dingdong.repository.MemberRepository;
import kr.co.dingdong.service.MemberService;
import kr.co.dingdong.service.ReservationService2;
import kr.co.dingdong.service.RoomService2;
import kr.co.dingdong.service.StudyroomService2;

@Controller
public class ReservationController2 {
	
	private static final Logger log = LoggerFactory.getLogger(ReservationController2.class);
	
	@Autowired
	private StudyroomService2 studyroomService;
	
	@Autowired
	private RoomService2 roomService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReservationService2 reservationService;
	
//	지점 리스트
	@GetMapping("reservation2/branchList")
	public String reservation(Model model) {
		List<Studyroom> studyroomList = studyroomService.listAll();
		model.addAttribute("studyroomList", studyroomList);
		return "reservation2/branchList";
	}
	
	
//	모든 룸 리스트
	@GetMapping("reservation2/listAll")
	public String reservation(Model model, @RequestParam("studyroom")int studyroom) {
		
		List<Room> roomList = roomService.listAll(studyroom);
		
		log.info("[studyroom] " + studyroom);
		
		model.addAttribute("roomList", roomList);
		model.addAttribute("studyroom", studyroom);
		
		return "/reservation2/listAll";
	}
	

//	룸 상세
	@PostMapping("reservation2/detail")
	public String detail(Room selectRoom, Model model) {
		
		log.info("[detail selectRoom] " + selectRoom);
		
		Room room = roomService.selectOne(selectRoom);
		model.addAttribute("room", room);
		
		log.info("[detail room] " + room);
		
		
		return "reservation2/detail";
	}
	

	
//	룸 예약 폼
	@PostMapping("reservation2/form")
	public String form(Reservation reservation, HttpSession session, Model model) {
		
		String id =((Member)session.getAttribute("member")).getId();
		Member member = memberService.selectOne(id);
		
		Room room = roomService.selectOne(new Room(reservation.getRoomNumber(), reservation.getStudyroomNumber()));
		
		log.info("[form room] " + room);
		log.info("[form reservation] " + reservation);
		
		model.addAttribute("room", room);
		
		reservation.setMemberId(member.getId());
		reservation.setName(member.getName());
		reservation.setPhone(member.getPhone());
		reservation.setEmail(member.getEmail());
		
		model.addAttribute("reservation", reservation);
		
		
		return "reservation2/form";
	}
	
	
//	룸 예약 폼2
	@GetMapping("reservation2/form2")
	public String form2(Reservation reservation, HttpSession session, Model model) {
		
		String id =((Member)session.getAttribute("member")).getId();
		Member member = memberService.selectOne(id);
		
		Room room = roomService.selectOne(new Room(reservation.getStudyroomNumber(), reservation.getRoomNumber()));
		model.addAttribute("room", room);
		
		reservation.setMemberId(member.getId());
		reservation.setName(member.getName());
		reservation.setPhone(member.getPhone());
		reservation.setEmail(member.getEmail());
		
		model.addAttribute("reservation", reservation);
		
		
		return "reservation2/checkout";
	}
	
	
	
//	ajax
//	예약 
	@ResponseBody
	@PostMapping("reservation2/insert")
	public Integer insert(Reservation reservation) {
		
		int result = reservationService.insert(reservation);
		log.info("[reservation] " + reservation);
		
		if(result > 0) {
			return 0;
		}
		
		return 1;
	}
	
//	예약 성공 페이지
	@GetMapping("reservation2/success")
	public void success(@RequestParam("number")String number, Model model) {
		
		Reservation reservation = reservationService.selectOne(number);
		
		model.addAttribute("reservation", reservation);
	}
	
	@ResponseBody
	@GetMapping("reservation2/reservedTime")
	public List<ReservedTime> reservedTime(@RequestParam String date){
		
		List<ReservedTime> reservedTime = reservationService.reservedTime(date);
		
		return reservedTime;
	}
	
	

	

}
