<%@page import="java.io.PrintWriter"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Admin Log-in</title>

<%@ include file="admin/include/head.jsp" %>

<style>

*{
    border: none;
}

a {
}

</style>

</head>
<body class="sb-nav-fixed" style="height: 618px;">

    
    <!--  header  -->
        
    <!--  nav -->
    <div">
            
            <!--  left nav -->
            
            
            <!--  container -->
            <div>
           
            	<!--  content here -->
            
            	<main style="margin:200px;">
		            <div style="width:40%; margin:40px auto;">
		            		<div align="center">
						            <div onclick="location.href ='${contextPath}/'" style="cursor:pointer; width: 100%; height: 48px;">
									<img alt="" src="" style="width: 66.2px; height: 48px; margin: 0px 190px;">
								</div>
									<br>
								<h2 class="logintitle">관리자 로그인</h2>
								<p class="logincontent">DingDong은 소프트웨어 개발자를 위한 지식공유 플랫폼입니다.</p>
							</div>
							<br>
					        <br>
					        <form method="post" action="${contextPath }/adminLoginAction" id="login-form">
					            <input style="height:50px; margin-bottom:10px" class="form-control" type="text" name="id" placeholder="아이디">
					            <input style="height:50px" class="form-control" type="password" name="password" placeholder="비밀번호"><br>
					            
					            <div align="right">
					            <a href="#">아이디 찾기 </a> | <a href="#"> 비밀번호 찾기</a><br>
					            </div>
					            <br>
					            <button style="width:100%; height:50px" class="btn btn-primary" type="submit">Login</button>
					        </form>
					        <br>
					        회원이 아니신가요? <a href="#">회원 가입</a>
					 </div>
            
            	</main>
            	<!--  content end -->
            	
            	
            	
            	
                
               
                
                
            </div>
    </div>
             <!--  footer -->
                <%@ include file="admin/include/footer.jsp" %>

<%@include file="admin/include/script.jsp" %>
</body>
</html>