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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dingdong.domain.Alarm;
import kr.co.dingdong.domain.Member;
import kr.co.dingdong.domain.Note;
import kr.co.dingdong.service.AlarmService;
import kr.co.dingdong.service.MemberService;
import kr.co.dingdong.service.NoteService;

@Controller
public class NoteController {
	
	private final Logger log = LoggerFactory.getLogger(NoteController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NoteService noteService;
	
	@Autowired
	private AlarmService alarmService;
	
	@ResponseBody
	@PostMapping("member/note/send")
	public Integer send(Note note, HttpSession session) {
		
		Member receiver = memberService.selectOne(note.getReceiver());
		
		if(receiver == null) {
			return 2;
		}
		
		Member sender = (Member)session.getAttribute("member");
		
		note.setSender(sender.getId());
		
//		24/03/06 쪽지를 보낼 때는 알람을 보내지 않는다.
//		Alarm alarm = new Alarm();
//		alarm.setSender(note.getSender());
//		alarm.setReceiver(receiver.getId());
//		alarm.setCategory("note");
//		alarm.setInfo("note");
		
//		alarmService.insert(alarm);
		int result = noteService.insert(note);		
		log.info("[note] {}", note);
		
		
		return result;
	}

	
	@GetMapping("member/note/list")
	public void list(HttpSession session, Model model) {
		
		Member receiver = (Member)session.getAttribute("member");
		List<Note> noteList = noteService.listAll(receiver.getId());
		
		model.addAttribute("noteList", noteList);
		
	}
}
