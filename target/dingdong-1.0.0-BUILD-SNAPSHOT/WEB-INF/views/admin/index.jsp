<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="include/head.jsp" %>
<title>Admin</title>
</head>
<body class="sb-nav-fixed">
    
    <!--  header  -->
    <%@ include file="include/header.jsp"%>
        
    <!--  nav -->
    <div id="layoutSidenav">
            
            <!--  left nav -->
            <%@include file="include/left_nav.jsp" %>
            
            
            <!--  container -->
            <div id="layoutSidenav_content">
            
           
            	<!--  content here -->
            
            
            	<br>
            	<br>
            	<br>
            	<div align="center"> 
            	<h1>관리자 페이지 index</h1>
            	</div>
            	<!--  content end -->
            	
            	
            	
            	
                
                <!--  footer -->
                <%@ include file="include/footer.jsp" %>
                
                
            </div>
    </div>
        
        
<%@include file="include/script.jsp" %>
</body>
</html>
