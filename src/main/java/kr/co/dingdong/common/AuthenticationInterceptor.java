package kr.co.dingdong.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthenticationInterceptor implements HandlerInterceptor{
	
//	컨트롤러에 가기 전 요청을 가로채는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

//		세션을 가져온다. 
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") == null) {
			System.out.println("member is null");
//			로그인으로 가세요
			response.sendRedirect(request.getContextPath() + "/login");
			
//			세션에 멤버 없으면(로그인 되어있지 않으면) 지나가지 마세요~ 
			return false;
		}
		
//		지나가도 돼용~ 
		return true;
	}
	
	
	
//	예외가 발생하지 않으면 호출되는 메서드 (예외가 터지지 않았을 때만 실행됨) 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}

	
	
//	예외 발생 여부에 상관 없이 Controller가 작업이 끝나면 호출되는 메서드 (예외가 터지든 말든 실행됨) 
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
