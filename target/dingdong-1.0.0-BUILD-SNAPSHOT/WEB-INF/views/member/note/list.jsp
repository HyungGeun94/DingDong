<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<%@ include file="../../include/head.jsp" %>
</head>
<body>
	<div class="frame">

		<!-- header -->
		
		
		<!--  nav -->
		<%@ include file="../../include/nav.jsp" %>
		

		
		<!-- container -->
		<div class="container" align="center">
		
		
			<div style="margin : 200px">
			<button class="btn listbannerfont2" style="text-align:center; background-color: blue; color: white" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" id="quit-modal">작성</button> 
			
			<br>
			<br>
			<h3>쪽지</h3>
			<c:if test="${fn:length(noteList) == 0} ">
					등록된 쪽지가 없습니다.
			</c:if>
			
			<c:forEach var='note' items='${noteList }'>
			
			<hr>
			
			<c:choose>
				
				<c:when test="${note.read eq 0 }">
					<a href="${contextPath}/member/note/read?idx=${note.idx}" style="text-decoration-line : none">
						<div style="color:black">
							${note.sender} | ${note.date } | ${note.content }
						</div>
					</a>
				</c:when>
				<c:otherwise>
					<a href="${contextPath}/member/note/read?idx=${note.idx}" style="text-decoration-line : none">
						<div style='opacity: 0.2; color:black;'>
							${note.sender} | ${note.date } | ${note.content }
						</div>
					</a>
				</c:otherwise>
			</c:choose>
			
				
			
			</c:forEach>
			<hr>
		
		
		</div>
		
	
	
	
		</div>
		 
		
		
	
		
		
		
	</div>
	
	<!-- footer -->
	<%@ include file="../../include/footer.jsp" %>

</body>
</html>