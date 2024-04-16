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

import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.service.AdminReservationService;
import kr.co.dingdong.service.ReservationService2;

@Controller
public class AdminReservationController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminReservationController.class);
	
	@Autowired
	private AdminReservationService adminReservationService;
	
	@GetMapping("admin/reservation")
	public String listAll(Model model) {
		
		List<Reservation> reservationList = adminReservationService.listAll();
		model.addAttribute("reservationList", reservationList);
		
		return "admin/reservation/listAll";
	}
	
	@GetMapping("admin/reservation/del")
	public void del(Model model) {
		
		List<Reservation> delList = adminReservationService.delList();
		model.addAttribute("delList", delList);
		
		log.info("[delList] " + delList);
		
	}
	
	@PostMapping("admin/reservation/multiCancel")
	public String multiCancel(@RequestParam("reservationNumber")List<String> reservationNumberList) {
		
		int result = adminReservationService.multiCancel(reservationNumberList);
		
		return "redirect:/admin/reservation";
	}
	
	

}
