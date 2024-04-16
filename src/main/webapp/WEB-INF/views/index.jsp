<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Welcome!</title>
<%@ include file ="include/head.jsp" %>
</head>
    
<body>
<!--nav -->
<%@ include file="include/nav.jsp" %>
        
        
        
        <div class="middle">
        
        <!-- Left side column. -->
  			<%@ include file="include/left.jsp" %>
        <!-- Main Header -->
 			<%@ include file="include/main.jsp" %>
        <!-- Right side column. -->
  			<%@ include file="include/right.jsp" %>	
        </div>
        
        
        
        <!-- Page Content-->
        
        
        
        
        
        <!-- Footer-->
    	<%@ include file ="include/footer.jsp" %>
    </body>
</html>
