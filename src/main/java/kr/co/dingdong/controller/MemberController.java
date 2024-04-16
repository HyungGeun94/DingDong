package kr.co.dingdong.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

import kr.co.dingdong.Time;
import kr.co.dingdong.domain.CommunityVO;
import kr.co.dingdong.domain.LoginVO;
import kr.co.dingdong.domain.Member;
import kr.co.dingdong.service.CommunityService;
import kr.co.dingdong.service.MemberService;
import kr.co.dingdong.service.ReservationService2;

@Controller
public class MemberController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private ReservationService2 reservationService;
	
	
	@PostMapping("member/report")
	@ResponseBody
	public int report(@RequestParam String reportee){
		int result = memberService.report(reportee);

		return result;

	}
	

	
	@GetMapping("member/mypage")
	public void mypage(Model model, HttpSession session) {
		
		Member sessionMember = (Member)session.getAttribute("member");
		String id = sessionMember.getId();
		Member info = memberService.selectOne(id);
		
		log.info("[info] "+ info);
		
		model.addAttribute("info", info);
		
	}
	
	@PostMapping("member/update")
	public void update(Member member, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestParam("prevPassword")String prevPassword) throws IOException {
		
		Member prevMemberInfo = (Member)session.getAttribute("member");
		prevMemberInfo = memberService.selectOne(prevMemberInfo.getId());
		
//		닉네임 앞뒤 공백, 중간 공백 제거
		member.setNickname(member.getNickname().trim().replaceAll(" ", ""));
		
//		비밀번호 앞뒤 공백,중간 공백 제거
		member.setPassword(member.getPassword().trim().replaceAll(" ", ""));
		
		
		
//		스크립트 출력 
		PrintWriter w = response.getWriter();
		
//		한글 깨짐 -> utf-8 설정 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
//		이전 비밀번호가 올바르지 않으면 튕겨냄
		if(!(prevPassword.equals(prevMemberInfo.getPassword()))) {
			w.println("<script>");
			w.println("alert('비밀번호가 올바르지 않습니다.')");
			w.println("location.href='/dingdong/member/mypage'");
			w.println("</script>");
			
			return;
		}
		
//		업데이트
		log.info("[member] " + member);
		int result = memberService.update(member);
		
//		기존 세션 삭제
		session.invalidate();
		
//		새로운 세션 부여
		HttpSession newSession = request.getSession();
		newSession.setAttribute("member", memberService.selectOne(member.getId()));
		
		
		w.println("<script>");
		if(result > 0) {
			w.println("alert('수정되었습니다.')");
		}else {
			w.println("alert('수정 실패하였습니다.')");
		}
		w.println("location.href='/dingdong/member/mypage'");
		w.println("</script>");
		
	}
	
	
	
	
	
//	프로필 업데이트
	@PostMapping("member/profileUpdateAction")
	public void profileUpdate(MultipartFile uploadFile, HttpSession session) {
		
		log.info("[this is profileUpdateAction!]");
		
//		절대 경로
//		workspace-sts-3.9.18.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/dingdong/resources
		String uploadFolder = session.getServletContext().getRealPath("resources");
		uploadFolder += "/images/profile";
		
		File uploadPath = new File(uploadFolder);
		
		log.info("[uploadPath] "+ uploadPath);
		log.info("[uploadFile] " + uploadFile);
		
		
		String uploadFileName = uploadFile.getOriginalFilename();
		String extension = uploadFileName.substring(uploadFileName.lastIndexOf("."));

//		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
//		랜덤 파일명 
		uploadFileName = UUID.randomUUID() + "";
		
		File saveFile = new File(uploadPath, uploadFileName);
		
		try {
			
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);
//			파일 업로드
			uploadFile.transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			log.info(e.getMessage());
		}
		
		String id = ((Member)session.getAttribute("member")).getId();
		Member member = new Member(id, uploadFileName);
		
//		멤버 수정
		int result = memberService.updateProfile(member);
	}
	
	
	
	@GetMapping("member/quit")
	public void quit() {
		
	}
	
	@PostMapping("member/quitAction")
	public void quitAction(@RequestParam("password")String password, @RequestParam("delReason")String delReason, HttpSession session, HttpServletResponse response) throws IOException {
		
//		스크립트 출력 
		PrintWriter w = response.getWriter();
		
//		한글 깨짐 -> utf-8 설정 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String id = ((Member)session.getAttribute("member")).getId();
		Member member = memberService.selectOne(id);
		
		if(member.getEtc() != null) {
			member.setDelReason(delReason);

//			기존 세션 삭제
			session.invalidate();
			
			int result = memberService.quit(member);
			

			
			if(result > 0) {
				w.println("<script>");
				w.println("alert('탈퇴가 완료되었습니다.')");
				w.println("location.href='/dingdong/'");
				w.println("</script>");
				
				return;
			}
		}
		
		if(!member.getPassword().equals(password)) {
			w.println("<script>");
			w.println("alert('비밀번호가 올바르지 않습니다.')");
			w.println("location.href='/dingdong/member/quit'");
			w.println("</script>");
			
			return;
		}
		
		
		member.setDelReason(delReason);

//		기존 세션 삭제
		session.invalidate();
		
		int result = memberService.quit(member);
		

		
		if(result > 0) {
			w.println("<script>");
			w.println("alert('탈퇴가 완료되었습니다.')");
			w.println("location.href='/dingdong/'");
			w.println("</script>");
			
			return;
		}
		
		
	}
	
	
	@GetMapping("member/board")
	public void board() {
		
	}
	
	@GetMapping("member/board/community")
	public String myCommunityBoard(HttpSession session, Model model) {
		String id = ((Member)session.getAttribute("member")).getId();
		
		List<CommunityVO> myCommunityBoard = memberService.myCommunityBoard(id);
		Time.calculateTimeDifference(myCommunityBoard);
		
		model.addAttribute("myCommunityBoard", myCommunityBoard);
		
		return "member/board/community/listAll";
	}
	
	@GetMapping("member/other/info")
	public void otherInfo(@RequestParam int member, Model model) {
		Member info = memberService.findByIdx(member);
		
		log.info("[member findByIdx] {} ", info);
		List<CommunityVO> otherCommunityList = memberService.otherCommunityBoard(member); 
		Time.calculateTimeDifference(otherCommunityList);
		model.addAttribute("info", info);
		model.addAttribute("otherCommunityBoard", otherCommunityList);
	}
	
	
	

}

