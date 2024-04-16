package kr.co.dingdong.domain;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class KakaoApi {
	
	private Long id;
	
	private final Logger log = LoggerFactory.getLogger(KakaoApi.class);

//	앱키 ( == REST API)
//	2차 활성화 해뒀으면 secret 키도 넣어야됨  귀찮아서 뺐음
	private String kakaoApiKey = "02dbaa97c87035feee18dd2668dd61a6";
	
//	redirect URL
	private String kakaoRedirectUri = "http://localhost:8080/dingdong/oauth/kakao";
	
	
//	accessToken 얻어오는 메서드
	public String getAccessToken(String code) {
	    String accessToken = "";
	    String refreshToken = "";
	    
//	    request URL
	    String reqUrl = "https://kauth.kakao.com/oauth/token";

	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        //필수 헤더
	        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	        conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.

	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        StringBuilder sb = new StringBuilder();
	        
	        //필수 값
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=").append(kakaoApiKey);
	        sb.append("&redirect_uri=").append(kakaoRedirectUri);
	        sb.append("&code=").append(code);

	        bw.write(sb.toString());
	        bw.flush();

	        int responseCode = conn.getResponseCode();
	        log.info("[KakaoApi.getAccessToken] responseCode = {}", responseCode);

	        BufferedReader br;
//	        200, 300 정상
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

	        String line = "";
	        StringBuilder responseSb = new StringBuilder();
	        while((line = br.readLine()) != null){
	            responseSb.append(line);
	        }
	        String result = responseSb.toString();
	        log.info("responseBody {}", result);

	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        accessToken = element.getAsJsonObject().get("access_token").getAsString();
	        refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

	        br.close();
	        bw.close();
	    }catch (Exception e){
	        e.printStackTrace();
	    }
	    return accessToken;
	
	
	}
	
	
	
	public HashMap<String, Object> getUserInfo(String accessToken) {
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqUrl = "https://kapi.kakao.com/v2/user/me";
	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
//	        Bearer 뒤에 반드시 띄어쓰기 주의
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	        int responseCode = conn.getResponseCode();
	        log.info("[KakaoApi.getUserInfo] responseCode : {}",  responseCode);

	        BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

	        String line = "";
	        StringBuilder responseSb = new StringBuilder();
	        while((line = br.readLine()) != null){
	            responseSb.append(line);
	        }
	        String result = responseSb.toString();
	        log.info("responseBody = {}", result);

	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);

	        String id = element.getAsJsonObject().get("id").getAsString();

	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
	        // String email = kakaoAccount.getAsJsonObject().get("email").getAsString();

	        userInfo.put("id", id);
	        userInfo.put("nickname", nickname);
	        userInfo.put("profile_image", profile_image);
	        // userInfo.put("email", email);

	        br.close();

	    }catch (Exception e){
	        e.printStackTrace();
	    }
	    return userInfo;
	}

	
	
	public void kakaoLogout(String accessToken) {
	    String reqUrl = "https://kapi.kakao.com/v1/user/logout";

	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        int responseCode = conn.getResponseCode();
	        log.info("[KakaoApi.kakaoLogout] responseCode : {}",  responseCode);

	        BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

	        String line = "";
	        StringBuilder responseSb = new StringBuilder();
	        while((line = br.readLine()) != null){
	            responseSb.append(line);
	        }
	        String result = responseSb.toString();
	        log.info("kakao logout - responseBody = {}", result);

	    }catch (Exception e){
	        e.printStackTrace();
	    }
	}
	
	
}
