<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<%@ include file="include/head.jsp"%>
<style>

.adminLogin{
	font-size: 13px;
   cursor: pointer;
   margin: 0px 4px 0px 0px;
   color: #0090F9;
   line-height: 20px;
}

</style>

</head>


<body>

		
		<!-- header -->

		

		<!-- container -->
		<div class="loginpage">
			<div class="loginform">
				<div onclick="location.href ='${contextPath}/'" style="cursor:pointer; width: 100%; height: 48px;">
					<img alt="" src="${contextPath }/resources/bootstrap/image/dingdong.png" style="width: 66.2px; height: 66px; margin: 0px 190px;">
				</div>
				<h2 class="logintitle">DingDong에 오신것을 환영합니다.</h2>
				<p class="logincontent">DingDong은 소프트웨어 개발자를 위한 지식공유 플랫폼입니다.</p>
				<div class="personalinfo">
					<div class="snslogin">
						<span style="font-weight: 500; font-size: 14px;">SNS 로그인</span>
						<div class="sns">
							<div class="githublogin" OnClick="location.href ='/#'">
								<img src="${contextPath }/resources/bootstrap/image/github.svg" class="github">
							</div>
							<div class="googlelogin" OnClick="location.href ='/#'">
								<img src="${contextPath }/resources/bootstrap/image/google.svg" class="google">
							</div>
							<div class="facebooklogin" OnClick="location.href ='/#'">
								<img src="${contextPath }/resources/bootstrap/image/facebook.svg" class="facebook">
							</div>
							<div class="naverlogin" OnClick="location.href ='https://nid.naver.com/oauth2.0/authorize?client_id=6f2bLBR28K9LHe94s9_i&state=STATE_STRING&redirect_uri=http://localhost:8080/dingdong/oauth/naver&response_type=code'">
								<img src="${contextPath }/resources/bootstrap/image/naver.svg" class="naver">
							</div>
							<div class="kakaologin" onclick="location.href ='https://kauth.kakao.com/oauth/authorize?client_id=02dbaa97c87035feee18dd2668dd61a6&redirect_uri=http://localhost:8080/dingdong/oauth/kakao&response_type=code'">
								<img src="${contextPath }/resources/bootstrap/image/kakao.png" class="kakao">
							</div>
						</div>
					</div>
					<div class="loginline">
						<div class="loginlinect">
							<span class="loginannouncement">DingDong 아이디로 로그인</span>
						</div>
					</div>
					<div class="originallogin">
						<div class="loginidpassword">
						
						
						<form action="${contextPath}/loginAction" method="post">
						
								<div class="loginidform">
									<label style="font-size: 14px; color: #374151; font-weight: 500;">아이디</label>
									<input class="loginid" name="id">
								</div>
								<div class="loginpasswordform">
									<label style="font-size: 14px; color: #374151; font-weight: 500;">비밀번호</label>
									<input class="loginpassword" name="password">
								</div>
							</div>
							
							
							
							
							
							<div class="findaccount">
								<div class="adminLogin" onclick="location.href='${contextPath}/adminLogin'">
									관리자 로그인
								</div>
								<div style="display: flex;">
									<div class="findid" OnClick="location.href ='${contextPath}/findId'">아이디 찾기</div>
									<span style="line-height: 20px; font-size: 13px;">│</span>
									<div class="findpass" OnClick="location.href ='#'">비밀번호 찾기</div>
								</div>
							</div>
							<div class="loginbtnform">
								<button type="submit" class="loginbutton">로그인</button>
							</div>
						
						</form>
						
						
						<p class="pathjoinmember">
							<span style="color: #111827; font-size: 14px;">아직 회원이 아니신가요?</span>
							<a class="pathmember" href="${contextPath }/signup">회원가입</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		
		
	
	
	
	
	

	<!-- footer -->
	<%@ include file="include/footer.jsp"%>

</body>
</html>