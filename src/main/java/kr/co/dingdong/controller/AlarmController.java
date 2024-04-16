package kr.co.dingdong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.co.dingdong.domain.Alarm;
import kr.co.dingdong.domain.Member;
import kr.co.dingdong.service.AlarmService;
import kr.co.dingdong.service.MemberService;
import kr.co.dingdong.service.NoteService;

@Controller
public class AlarmController {
	
	private final Logger log = LoggerFactory.getLogger(AlarmController.class);
	
	@Autowired
	private AlarmService alarmService;  
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NoteService noteService;
	
	@ResponseBody
	@PostMapping("member/alarm")
	public Map<String, Integer> getAlarm(@RequestParam String id) {
		
		Map<String, Integer> map = new HashMap<>();
		int countAlarm = alarmService.countNotRead(id);
		int countNote = noteService.countNotRead(id);
		
		map.put("countAlarm", countAlarm);
		map.put("countNote", countNote);
		
		return map;
		
	}
	
	@GetMapping("member/alarm/list")
	public String list(HttpSession session, Model model){
		
		Member member = (Member)session.getAttribute("member");
		String id = member.getId();
		
		List<Alarm> alarmList = alarmService.listById(id);
		model.addAttribute("alarmList", alarmList);
		
		return "member/alarm/list";
	}
	
	
	@GetMapping("member/alarm/read")
	public String read(@RequestParam int idx) {
		
		Alarm alarm = alarmService.findByIdx(idx);
		// 새별: 댓글 단 그 글로 가거나 쪽지가 열려야되는데 어케 구현함?
		// alarm 필드에 url을 저장해서 뱉는 것도 괜찮을 듯(24/03/06)
		alarmService.read(idx);
		
		return "redirect:/member/alarm/list";
	}
	
	
	
	

}
