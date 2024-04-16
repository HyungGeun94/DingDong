<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="../include/head.jsp" %>
<title>Admin</title>
</head>
<body class="sb-nav-fixed">
    
    <!--  header  -->
    <%@ include file="../include/header.jsp"%>
        
    <!--  nav -->
    <div id="layoutSidenav">
            
            <!--  left nav -->
            <%@include file="../include/left_nav.jsp" %>
            
            

            <div id="layoutSidenav_content">
			
			<main  style="margin:100px">
				
				<h1>${communityBoard.title }</h1>
				<p>작성자 ${communityBoard.nickname } | 조회수 ${communityBoard.views } | 좋아요 ${communityBoard.good } | 싫어요 ${communityBoard.bad }</p>

				<hr>

				<div>
					<br>
					<br>
					${communityBoard.content }
					<br>
					<br>
				</div>
				
				<hr>
				
				<div>
					<br>
					<br>
					<h3>여기에 댓글</h3>
					<br>
				
				</div>
				
			</main>



                
                
<!--  footer -->
<%@ include file="../include/footer.jsp" %>
            </div>
    </div>

<%@include file="../include/script.jsp" %>

</body>
</html>


