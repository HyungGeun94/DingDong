package kr.co.dingdong.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

//		Controller에서 캡챠에서 받아오는 정보인식?
@Controller
@RequestMapping("/pro")
public class Recaptcha {
    @ResponseBody
    @RequestMapping(value = "/VerifyRecaptcha", method = RequestMethod.POST)
    public int VerifyRecaptcha(HttpServletRequest request) {
        // 시크릿 키를 캡챠를 받아올수 있는 Class에 보내서 그곳에서 값을 출력한다
        VerifyRecaptcha.setSecretKey("시크릿키");
        String gRecaptchaResponse = request.getParameter("recaptcha");
        try {
            if(VerifyRecaptcha.verify(gRecaptchaResponse))
                return 0; // 성공
            else return 1; // 실패
        } catch (Exception e) {
            e.printStackTrace();
            return -1; //에러
        }
    }
}