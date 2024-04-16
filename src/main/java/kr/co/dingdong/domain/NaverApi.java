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

public class NaverApi {
	
	private Long id;
	
	private final Logger log = LoggerFactory.getLogger(NaverApi.class);

//	앱키 ( == REST API)
//	2차 활성화 해뒀으면 secret 키도 넣어야됨  귀찮아서 뺐음
	private String naverApiKey = "6f2bLBR28K9LHe94s9_i";
	private String naverSecretKey = "PgCj0x3FX4";
	
//	redirect URL
	private String naverRedirectUri = "http://localhost:8080/dingdong/oauth/naver";
	
	
//	accessToken 얻어오는 메서드
	public String getAccessToken(String code) {
	    String accessToken = "";
	    String refreshToken = "";
	    
//	    request URL
	    String reqUrl = "https://nid.naver.com/oauth2.0/token";

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
	        sb.append("&client_id=").append(naverApiKey);
	        sb.append("&client_secret=").append(naverSecretKey);
	        sb.append("&redirect_uri=").append(naverRedirectUri);
	        sb.append("&code=").append(code);

	        bw.write(sb.toString());
	        bw.flush();

	        int responseCode = conn.getResponseCode();
	        log.info("[NaverApi.getAccessToken] responseCode = {}", responseCode);

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
	    String reqUrl = "https://openapi.naver.com/v1/nid/me";
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

	        JsonObject NaverAccount = element.getAsJsonObject().get("response").getAsJsonObject();

	        log.info("NaverAccount = {}", NaverAccount);
	        
	        
	        String id = NaverAccount.getAsJsonObject().get("id").getAsString();
	        String nickname = NaverAccount.getAsJsonObject().get("nickname").getAsString();
	        String profile_image = NaverAccount.getAsJsonObject().get("profile_image").getAsString();
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

	
	public void naverLogout(String accessToken) {
	    String reqUrl = "https://nid.naver.com/oauth2.0/token";

	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        
	        //필수 헤더
	        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	        conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.

	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        StringBuilder sb = new StringBuilder();
	        
	        //필수 값
	        sb.append("grant_type=delete");
	        sb.append("&client_id=").append(naverApiKey);
	        sb.append("&client_secret=").append(naverSecretKey);
	        sb.append("&access_token=").append(accessToken);
	        sb.append("&service_provider=NAVER");

	        bw.write(sb.toString());
	        bw.flush();
	        

	        int responseCode = conn.getResponseCode();
	        log.info("[NaverApi.naverLogout] responseCode : {}",  responseCode);

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
	        log.info("naver logout - responseBody = {}", result);

	    }catch (Exception e){
	        e.printStackTrace();
	    }
	}
	
	
}
