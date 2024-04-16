package kr.co.dingdong.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dingdong.domain.Member;
import kr.co.dingdong.domain.Reservation;
import kr.co.dingdong.service.MemberService;
import kr.co.dingdong.service.ReservationService2;

@Controller
public class MemberReservationController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberReservationController.class);
	
	@Autowired
	private ReservationService2 reservationService;
	
	@Autowired
	private MemberService memberService;
	
//	마이페이지 예약 내역
	@GetMapping("member/reservation")
	public String listAll(HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("member");
		List<Reservation> reservationList = reservationService.findById(member.getId());
		
		model.addAttribute("reservationList", reservationList);
		
		return "member/reservation/listAll";
	}
	
	
	@GetMapping("member/reservation/detail")
	public void detail(@RequestParam("reservationNumber")String reservationNumber, Model model) {
		Reservation reservation = reservationService.selectOne(reservationNumber);
		
		log.info("[reservation] " + reservation);
		
		
		model.addAttribute("reservation", reservation);
		
	}
	
	@PostMapping("member/reservation/update")
	public void update(Reservation reservation, @RequestParam("password")String password, HttpSession session, HttpServletResponse response) throws IOException {
		
		String id = ((Member)session.getAttribute("member")).getId();
		Member member = memberService.selectOne(id);
		
//		이름 공백 제거
		reservation.setName(reservation.getName().trim().replaceAll(" ", ""));
		
//		스크립트 출력 
		PrintWriter w = response.getWriter();
		
//		한글 깨짐 -> utf-8 설정 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		if(!(password.equals(member.getPassword()))) {
			w.println("<script>");
			w.println("alert('비밀번호가 올바르지 않습니다.')");
			w.println("location.href='/dingdong/member/reservation/detail?reservationNumber=" + reservation.getReservationNumber() + "'");
			w.println("</script>");
			
			return;
		}
		
		int result = reservationService.update(reservation);
		
		w.println("<script>");
		if(result > 0) {
			w.println("alert('변경이 완료되었습니다.')");
		}else {
			w.println("alert('변경 실패하였습니다.')");
		}
		w.println("location.href='/dingdong/member/reservation/detail?reservationNumber=" + reservation.getReservationNumber() + "'");
		w.println("</script>");
		
	}
	
//	ajax
//	카카오페이 취소
	@ResponseBody
	@PostMapping("member/reservation/cancel")
	public String cancel(@RequestParam String merchant_uid, @RequestParam int cancel_amount) throws IOException {
		
		String api_key = "2044035635457883";
		String api_secret_key = "sRN9Mg6MI3ORRGi1mMMCm6EJfS2wPQUjphikv2kXDzwv5XIRGTSLEYeisAjZVYx8O8WSIZh7MUjQqImQ";
		String access_token = getToken(api_key, api_secret_key);
		
		URL url = new URL("https://api.iamport.kr/payments/cancel");
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		
		// 요청 방식을 POST로 설정
        conn.setRequestMethod("POST");
 
        // 요청의 Content-Type, Accept, Authorization 헤더 설정
        conn.setRequestProperty("Content-type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("Authorization", access_token);
 
        // 해당 연결을 출력 스트림(요청)으로 사용\
        conn.setDoOutput(true);
        
        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("merchant_uid", merchant_uid);
        json.addProperty("cancel_amount", cancel_amount);
 
        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString());
        bw.flush();
        bw.close();
 
        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        br.close();
        conn.disconnect();
        
     
        log.info("결제 취소 완료 : 주문 번호 {}", merchant_uid);
        
//    	reservationNumber로 찾은 reservation del=1로 변경
		int result = reservationService.cancel(merchant_uid);
        
        JsonObject done = new JsonObject();
        done.addProperty("code", "success");
        done.addProperty("merchant_uid", merchant_uid);
        
        return done.toString();
	}
	
	
	public String getToken(String apiKey, String secretKey) throws IOException {
        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
 
        // 요청 방식을 POST로 설정
        conn.setRequestMethod("POST");
 
        // 요청의 Content-Type과 Accept 헤더 설정
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
 
        // 해당 연결을 출력 스트림(요청)으로 사용
        conn.setDoOutput(true);
 
        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("imp_key", apiKey);
        json.addProperty("imp_secret", secretKey);
 
        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString()); // json 객체를 문자열 형태로 HTTP 요청 본문에 추가
        bw.flush(); // BufferedWriter 비우기
        bw.close(); // BufferedWriter 종료
 
        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        Gson gson = new Gson(); // 응답 데이터를 자바 객체로 변환
        String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
        String accessToken = gson.fromJson(response, Map.class).get("access_token").toString();
        br.close(); // BufferedReader 종료
 
        conn.disconnect(); // 연결 종료
 
        log.info("Iamport 엑세스 토큰 발급 성공 : {}", accessToken);
        return accessToken;
    }
	
	@GetMapping("member/reservation/cancelSuccess")
	public void cancelSuccess(@RequestParam String reservationNumber, Model model) {
		
		
		
		//	reservationNumber 정보 출력, 취소됐음을 알리는 view 반환
		Reservation reservation = reservationService.selectOne(reservationNumber);
		model.addAttribute("reservation", reservation);
		
	}
	

}
