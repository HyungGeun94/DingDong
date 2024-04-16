package kr.co.dingdong.controller;

import kr.co.dingdong.Time;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dingdong.domain.CommunityVO;
import kr.co.dingdong.domain.KakaoApi;
import kr.co.dingdong.domain.LoginVO;
import kr.co.dingdong.domain.Member;
import kr.co.dingdong.domain.NaverApi;
import kr.co.dingdong.service.CommunityService;
import kr.co.dingdong.service.MemberService;

@Controller
public class HomeController {
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	private final KakaoApi kakaoApi = new KakaoApi();
	private final NaverApi naverApi = new NaverApi();
	

	@GetMapping("/")
	public String index(Model model) {
		

		List<CommunityVO> listAll = communityService.listAll();
		Time.calculateTimeDifference(listAll);
		model.addAttribute("listAll", listAll);

		List<CommunityVO> listAllByviews = communityService.listAllByviews();
		Time.calculateTimeDifference(listAllByviews);
		model.addAttribute("listAllByviews", listAllByviews);

		List<CommunityVO> listAllBygood = communityService.listAllBygood();
		Time.calculateTimeDifference(listAllBygood);
		model.addAttribute("listAllBygood", listAllBygood);

		List<CommunityVO> listAllBynotice = communityService.listAllBynotice();
		for(CommunityVO communityVO : listAllBynotice) {
			if(communityVO.getProfile() == null) {
				communityVO.setProfile("admin_default_profile.jpg");
			}
		}
		Time.calculateTimeDifference(listAllBynotice);
		model.addAttribute("listAllBynotice", listAllBynotice);

		List<CommunityVO> scrapjjim = communityService.scrapjjim();
		model.addAttribute("scrapjjim", scrapjjim);



		log.info("[index]");
		return "index";
	}
	
	
	@GetMapping("login")
	public void login() {
	}
	
	
	@GetMapping("logout")
	public void logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {

		log.info("logout");
		Member member = (Member)session.getAttribute("member");
		
		String token = (String)session.getAttribute("token");
		log.info("[logout] token {} ", token);
		
//		String token = "";
//		Cookie[] cookies = request.getCookies();
//		for(Cookie cookie : cookies) {
//			log.info("cookie token {} ", cookie.getName());
//			log.info("cookie token {} ", cookie.getValue());
//			if(cookie.getName().equals("token")) {
//				token = cookie.getValue();
//			}
//		}
		
		if(member.getEtc() != null) {
			switch(member.getEtc()){
				case "kakao" : kakaoApi.kakaoLogout(token);
				break;
				case "naver" : naverApi.naverLogout(token);
				break;
			}
			
		}
		
//		세션 삭제 
		session.invalidate();
		
//		스크립트 출력 
		PrintWriter w = response.getWriter();
		
//		한글 깨짐 -> utf-8 설정 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		w.println("<script>");
		w.println("alert('로그아웃되었습니다.')");
		w.println("location.href='/dingdong/'");
		w.println("</script>");
		
	}

		
	
	@PostMapping("/loginAction")
	public void loginAction(LoginVO loginVO, HttpSession session, HttpServletResponse response) throws IOException {
		
		Member member = null;
		member = memberService.login(loginVO);
		log.info("[member] " + member);
		
//		스크립트 출력 
		PrintWriter w = response.getWriter();
		
//		한글 깨짐 -> utf-8 설정 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if(member != null) {
			if(member.getProfile() == null) {
				member.setProfile("default_profile.jpg");
			}
			log.info("[로그인 성공!]");
			memberService.loginDateUpdate(member.getId());
 			session.setAttribute("member", member);
			w.println("<script>");
			w.println("location.href='/dingdong/'");
			w.println("</script>");
		}else {
			w.println("<script>");
			w.println("alert('아이디나 비밀번호가 올바르지 않습니다.')");
			w.println("location.href='/dingdong/login'");
			w.println("</script>");
		}
		
	}
	
	
	@GetMapping("signup")
	public void signup() {
		
	}
	
	@ResponseBody
	@PostMapping("idDuplicateCheck")
	public Integer idDuplicateCheck(@RequestParam("inputId")String id) {
		
		Member member = memberService.selectOne(id);
		
		if(member != null) {
			return 1;
		}else {
			return 0;
		}
		
	}
	
	@PostMapping("signupAction")
	public void signupAction(Member member, @RequestParam("emailId")String emailId, @RequestParam("emailDomain")String emailDomain, HttpServletResponse response) throws IOException {
		
//		input에서 따로 받은 이메일 합치기
//		프론트 단에서 그냥 email로 넘겨주면 삭제해도 됨
		member.setEmail(emailId + emailDomain);
		
//		닉네임 앞뒤 공백, 중간 공백 제거
		member.setNickname(member.getNickname().trim().replaceAll(" ", ""));
		
//		비밀번호 앞뒤 공백,중간 공백 제거
		member.setPassword(member.getPassword().trim().replaceAll(" ", ""));
		
		log.info("[member] " + member);
		log.info("[email] " + member.getEmail());
		
//		스크립트 출력 
		PrintWriter w = response.getWriter();
		
//		한글 깨짐 -> utf-8 설정 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int result = memberService.insert(member);
		
		if(result != 0) {
			w.println("<script>");
			w.println("if(confirm('가입되었습니다! 로그인하시겠습니까?')){");
			w.println("location.href='/dingdong/login'");
			w.println("}");
			w.println("else{");
			w.println("location.href='/dingdong/'");
			w.println("}");
			w.println("</script>");
		}else {
			w.println("<script>");
			w.println("alert('가입에 실패하였습니다.')");
			w.println("location.href='/dingdong/login'");
			w.println("</script>");
		}
		
	}
	
	
	
	
	
	@GetMapping("findId")
	public void findId() {
		
	}
	
	@ResponseBody
	@PostMapping("isExistEmail")
	public Integer isExistEmail(@RequestParam("email")String email) {
		
		Member member = memberService.findByEmail(email);
		
//		존재하지 않는 이메일이면 0
		if(member == null) {
			return 0;
		}
		
		return 1;
	}
	
	
	
	@ResponseBody
	@PostMapping("findId/sendEmail")
	public Integer sendEmail(@RequestParam String email, HttpServletResponse response) throws IOException {
		
		Member member = memberService.findByEmail(email);
		
		if(member == null) {
			return 0;
		}else {
			String id = member.getId();
			
//			SimpleMailMessage smm = new SimpleMailMessage();
//			smm.setFrom("firstdingdong@naver.com");
//			smm.setTo(email);
//			smm.setSubject("스프링에서 보내는 메일");
//			smm.setText("안녕하세요. 딩동에서 보내는 메일입니다. 아이디는 " + id + "입니다.");
//			mailSender.send(smm);
			
			
			MimeMessagePreparator preparatory = mimeMessage -> {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");
				
				String htmls = "<!DOCTYPE html>";
				htmls += "<html lang='ko'>";
				htmls += "<div><table style='margin: 0 auto; background-color: #f7f8f8' width='100%' cellspacing='0' cellpadding='0'>\n"
						+ "    <tbody><tr><td height='10'></td></tr>\n"
						+ "    <tr><td style='padding: 0 10px'>\n"
						+ "        <table style='          max-width: 720px;          background-color: #fff;          table-layout: fixed;          margin: 0 auto;          word-break: break-all;          word-wrap: break-word;        ' width='100%' cellspacing='0' cellpadding='0'>\n"
						+ "          <tbody><tr style='background-color: #bdefff'><td width='5.6%'></td><td>\n"
						+ "              <a href='#' target='_blank' rel='noreferrer noopener'>\n"
						+ "                <div style='padding: 30px 0 28px 0'>\n"
						+ "                  <img src='#' width='158' height='22' style='display: block' loading='lazy'>\n"
						+ "                </div>\n"
						+ "              </a>\n"
						+ "            </td><td width='5.6%'></td></tr>\n"
						+ "          <tr><td width='5.6%'></td><td>\n"
						+ "              <div style='margin: 30px 0 0 0'>\n"
						+ "                <p style='margin: 0 0 20px 0; font-size: 16px; line-height: 28px; font-weight: bold; color: #000'>\n"
						+ "                  아이디 찾기\n"
						+ "                </p>\n"
						+ "  \n"
						+ "                \n"
						+ "  \n"
						+ "  <p style='margin: 15px 0 0 0; font-size: 14px; line-height: 22px; font-weight: normal; color: #111'>\n"
						+ "    가입된 정보는 아래와 같습니다.\n"
						+ "  </p>\n"
						+ "  <div style='margin: 30px 0; padding: 25px 20px; border: 1px solid #e2e4ee; border-left: 0; border-right: 0'>\n"
						+ "    <p style='margin: 0 0 8px 0; font-size: 14px; line-height: 26px; font-weight: bold; color: #000'>가입정보</p>\n"
						+ "    <table>\n"
						+ "      <tbody><tr><td style='padding: 0 30px 0 0; vertical-align: top'>\n"
						+ "          <p style='margin: 0; font-size: 14px; line-height: 28px; font-weight: normal; color: #666'>아이디</p>\n"
						+ "        </td><td style='vertical-align: top'>\n"
						+ "          <p style='margin: 0; font-size: 14px; line-height: 28px; font-weight: bold; color: #111'>"
						+ id
						+ "</p>\n"
						+ "        </td></tr>\n"
						+ "      <tr><td style='padding: 0 30px 0 0; vertical-align: top'>\n"
						+ "          <p style='margin: 0; font-size: 14px; line-height: 28px; font-weight: normal; color: #666'>가입일시</p>\n"
						+ "        </td><td style='vertical-align: top'>\n"
						+ "          <p style='margin: 0; font-size: 14px; line-height: 28px; font-weight: bold; color: #111'>"
						+ member.getSignupDate()
						+ "</p>\n"
						+ "        </td></tr>\n"
						+ "        <tr><td style='padding: 0 30px 0 0; vertical-align: top'>\n"
						+ "          <p style='margin: 0; font-size: 14px; line-height: 28px; font-weight: normal; color: #666'>이메일</p>\n"
						+ "        </td><td style='vertical-align: top'>\n"
						+ "          <p style='margin: 0; font-size: 14px; line-height: 28px; font-weight: bold; color: #111'>"
						+ member.getEmail()
						+ "</p>\n"
						+ "        </td></tr>\n"
						+ "    </tbody></table>\n"
						+ "  </div>\n"
						+ "\n"
						+ "\n"
						+ "  <button style='width:100%; height:60px; border: none; border-radius: 10px; background-color: #bdefff'>로그인 하러 가기</button>\n"
						+ "  \n"
						+ "  \n"
						+ "  \n"
						+ "              </div>\n"
						+ "            </td><td width='5.6%'></td></tr>\n"
						+ "          <tr><td width='5.6%'></td><td>\n"
						+ "              <div style='margin: 60px 0 30px 0'>\n"
						+ "                <div style='margin: 0 0 30px 0; border-top: 1px solid #f0f0f0'></div>\n"
						+ "                <p style='margin: 0 0 3px 0; font-size: 13px; line-height: 20px; font-weight: normal; color: #888'>\n"
						+ "                  본 메일은 발신전용입니다. 궁금한 사항을 문의하시려면\n"
						+ "                  <a href='#' target='_blank' rel='noreferrer noopener' style='color: #888; text-decoration: none'>딩동 홈페이지</a>를 이용해 주세요.\n"
						+ "                </p>\n"
						+ "                <p style='margin: 0 0 30px 0; font-size: 13px; line-height: 20px; font-weight: normal; color: #888'>\n"
						+ "                  여기에 정보 입력 여기에 정보 입력 여기에 정보 입력 여기에 정보 입력 여기에 정보 입력 여기에 정보 입력\n"
						+ "                  <br>\n"
						+ "                  여기에 정보 입력 여기에 정보 입력 여기에 정보 입력 여기에 정보 입력 여기에 정보 입력\n"
						+ "                  <br>\n"
						+ "                  주소 : 수원시 브론즈빌 | (주)딩동 | 팩스 : 031-1234-5678\n"
						+ "                </p>\n"
						+ "                <p style='margin: 0 0 3px 0; font-size: 13px; line-height: 20px; font-weight: normal; color: #888'>\n"
						+ "                  ⓒ Dingdong Corp.\n"
						+ "                </p>\n"
						+ "              </div>\n"
						+ "            </td><td width='5.6%'></td></tr>\n"
						+ "        </tbody></table>\n"
						+ "      </td></tr>\n"
						+ "    <tr><td height='10'></td></tr>\n"
						+ "  </tbody></table>\n"
						+ "  \n"
						+ "  \n"
						+ "  \n"
						+ "  \n"
						+ "  </div></html>";
				
				helper.setSubject("[DINGDONG] 아이디 찾기");
				helper.setFrom("firstdingdong@naver.com");
				helper.setText(htmls, true);
				helper.setTo(email);
				
			};
			
			mailSender.send(preparatory);
			
			
		}
		
		return 1;
		
	}
	
	
//		카카오 로그인 누르면 ${contextPath}/oauth/kakao?code= ...
//		이렇게 코드가 Get으로 전달됨
//		코드로 accessToken을 얻을 수 있음
	    @GetMapping("oauth/kakao")
	    public String kakaoOauth(@RequestParam String code, Model model) {
	    	
	    	String accessToken = kakaoApi.getAccessToken(code);
	    	
	    	// 3. 사용자 정보 받기
	        Map<String, Object> userInfo = kakaoApi.getUserInfo(accessToken);

	        String nickname = (String)userInfo.get("nickname");
	        String profile = (String)userInfo.get("profile_image");
	        String id = (String)userInfo.get("id");

	       	log.info("nickname {} ", nickname);
	        log.info("accessToken {}", accessToken);
	        
	        model.addAttribute("id", id);
	        model.addAttribute("nickname", nickname);
	        model.addAttribute("profile", profile);
	        model.addAttribute("accessToken", accessToken);	        

	        return "redirect:/oauth/kakao/result";
	    }
	    
	    
	    @GetMapping("oauth/kakao/result")
	    public String kakaoResult(@RequestParam(required = false) String id, @RequestParam String nickname, @RequestParam String profile, @RequestParam String accessToken, HttpSession session) {

	    	log.info("id {}", id);
	    	log.info("accessToken {}", accessToken);
	    	log.info("nickname {} ", nickname);
	    	
//	    	가입된 회원인지 확인
	    	Member member = memberService.selectOne(id);
	    	
	    	log.info("[oauth/kakao/result] member {}", member);

//	    	가입되지 않았으면
	    	if(member == null) {
	    		member = new Member();
	    		member.setId(id);
	        	member.setNickname(nickname);
		    	member.setProfile(profile);
		    	member.setEtc("kakao");
		    	
	    		memberService.insert(member);
	    		session.setAttribute("member", memberService.selectOne(id));
	    		return "redirect:/";
	    	}
	    	

//	    	가입 됐으면 닉네임, 프로필 업데이트
//	    	카카오 로그인 회원은 비밀번호, 이름, 이메일이 null
	    	member.setNickname(nickname);
	    	member.setProfile(profile);
	    	member.setEtc("kakao");

	    	
	    	memberService.update(member);
	    	session.setAttribute("member", member);
	    	session.setAttribute("token", accessToken);
	    	return "redirect:/";
	    }
	    
	    
	    
//		네이버 로그인 누르면 ${contextPath}/oauth/naver?code= ...
//		이렇게 코드가 Get으로 전달됨
//		코드로 accessToken을 얻을 수 있음
	    @GetMapping("oauth/naver")
	    public String naverOauth(@RequestParam String code, Model model, HttpServletResponse response) {
	    	
	    	String accessToken = naverApi.getAccessToken(code);
	    	
	    	// 3. 사용자 정보 받기
	        Map<String, Object> userInfo = naverApi.getUserInfo(accessToken);

	        String nickname = (String)userInfo.get("nickname");
	        String profile = (String)userInfo.get("profile_image");
	        String id = (String)userInfo.get("id");

	       	log.info("[oauth/naver] nickname {} ", nickname);
	        log.info("[oauth/naver] accessToken {}", accessToken);
	        
	        model.addAttribute("id", id);
	        model.addAttribute("nickname", nickname);
	        model.addAttribute("profile", profile);
	        model.addAttribute("accessToken", accessToken);	   
	        
	    	

	        return "redirect:/oauth/naver/result";
	    }
	    
	    
	    @GetMapping("oauth/naver/result")
	    public String naverResult(@RequestParam(required = false) String id, @RequestParam String nickname, @RequestParam String profile, @RequestParam String accessToken, HttpSession session, HttpServletResponse response) {

	    	log.info("[oauth/naver/result] id {}", id);
	    	log.info("[oauth/naver/result] accessToken {}", accessToken);
	    	log.info("[oauth/naver/result] nickname {} ", nickname);
	    	
//	    	가입된 회원인지 확인
	    	Member member = memberService.selectOne(id);
	    	
//	    	가입되지 않았으면
	    	if(member == null) {
	    		member = new Member();
	    		member.setId(id);
	    		member.setProfile(profile);
	    		member.setNickname(nickname);
	    		member.setEtc("naver");

	    		memberService.insert(member);
	    		session.setAttribute("member", memberService.selectOne(id));
	    		return "redirect:/";
	    	}

//	    	가입 됐으면 닉네임, 프로필 업데이트
//	    	카카오 로그인 회원은 비밀번호, 이름, 이메일이 null
	    	member.setNickname(nickname);
	    	member.setProfile(profile);
	    	member.setEtc("naver");
	    
	    	memberService.update(member);
	    	
	    	
//	    	Cookie token = new Cookie("accessToken", accessToken);
//	    	token.setMaxAge(30*60);
//	    	Cookie usernickname = new Cookie("nickname", nickname);
//	    	usernickname.setMaxAge(30*60);
//	    	
//	    	ResponseCookie cookieSet = ResponseCookie.from("token", accessToken)
//	    			.path("/")
//	    			.sameSite("Lax")
//	    			.httpOnly(true)
//	    			.domain("localhost")
//	    			.build();
//	    	
//	    	response.addHeader("Set-Cookie", cookieSet.toString());
//	    	
//	    	log.info("[oauth/naver/result] cookie-token {}", token.getValue());
//	    	log.info("[oauth/naver/result] cookie-usernickname {}", usernickname.getValue());
//
//	        response.addCookie(token);
//	    	response.addCookie(usernickname);
	    	
	    	session.setAttribute("token", accessToken);
	    	session.setAttribute("member", member);
	    	return "redirect:/";
	    }
	
	
	
	
}
