package kr.co.dingdong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import kr.co.dingdong.domain.Alarm;
import kr.co.dingdong.domain.CommunityReplyVO;
import kr.co.dingdong.domain.CommunityVO;
import kr.co.dingdong.domain.Member;
import kr.co.dingdong.service.AlarmService;
import kr.co.dingdong.service.CommunityReplyService;

@Controller
//@RequestMapping("/community")
public class CommunityReplyController {

	@Autowired
	private CommunityReplyService communityReplyService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityReplyController.class);
	
	@Autowired
	private AlarmService alarmService;
	
	
	@ResponseBody
	@PostMapping("community/reply")
	public Integer addReply(CommunityReplyVO communityReplyVO, HttpSession session) {
		logger.info("content " + communityReplyVO.getContent());
		logger.info("boardNum " + communityReplyVO.getBoardNum());
		logger.info("reply " + communityReplyVO.getReplyNum());
		
		CommunityReplyVO reply = new CommunityReplyVO();
		String id = ((Member)session.getAttribute("member")).getId();
		
		// 알람 추가 ---------------------------------
		
		// 알람 보내려면 받는 사람 id 있어야해서 댓글이 부모 댓글 쓴 사람의 member 인덱스 가지고 있어야 할듯... 
		// 같은 사람이면 알람 보내지 않음
		Alarm alarm = new Alarm("hello", communityReplyVO.getId(), "reply", "comminuty");
		alarmService.insert(alarm);
		
		//------------------------------------------
		
		reply.setId(id);
		reply.setContent(communityReplyVO.getContent());
		reply.setBoardNum(communityReplyVO.getBoardNum());
		reply.setReplyNum(communityReplyVO.getReplyNum());
		reply.setReplyOrderNum(communityReplyVO.getReplyOrderNum());
		reply.setNickname(((Member)session.getAttribute("member")).getNickname());
		
		logger.info("reply " + reply);
		logger.warn("replyOderNum = {}", reply.getReplyOrderNum());
		
		communityReplyService.addReply(reply);
		communityReplyService.replyup(communityReplyVO.getBoardNum());
		
		return 0;
	}

	
	
	
	@ResponseBody
	@GetMapping("community/reply")
	public Map<String, List<CommunityReplyVO>> getAllreply(@RequestParam int boardNum) {
		
		List<CommunityReplyVO> replyList = communityReplyService.getAllReply(boardNum);
		List<CommunityReplyVO> rereplyList = communityReplyService.getAllrereply(boardNum);
		
		Map<String, List<CommunityReplyVO>> list = new HashMap<>();
		
		list.put("replyList", replyList);
		list.put("rereplyList", rereplyList);
		
		logger.info("Allreply " + replyList);
		logger.info("Allrereply " + rereplyList);
		
		return list;
	}

}
