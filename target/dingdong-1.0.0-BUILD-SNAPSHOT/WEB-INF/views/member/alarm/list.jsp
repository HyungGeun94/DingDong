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
			
			<h3>알림</h3>
			<c:if test="${fn:length(alarmList) == 0} ">
					등록된 알람이 없습니다.
			</c:if>
			
			<c:forEach var='alarm' items='${alarmList }'>
			
			<hr>
			
			<c:choose>
				
				<c:when test="${alarm.read eq 0 }">
				
					<a href="${contextPath}/member/alarm/read?idx=${alarm.idx}" style="text-decoration-line : none">
					<c:choose>
						<c:when test="${alarm.info eq 'note'}">
						<div style="color:black">
							${alarm.sender}님이 쪽지를 보냈습니다.
							| ${alarm.date }
						</div>
						</c:when>
						<c:when test="${alarm.info eq 'reply' }">
							<div style="color:black">
							${alarm.sender}님이 댓글을 달았습니다.
							| ${alarm.date }
							</div>
						</c:when>
						<c:when test="${alarm.info eq 'answer' }">
							<div style="color:black">
							${alarm.sender }님이 답변을 등록했습니다.
							| ${alarm.date }
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					</a>
				</c:when>
				<c:otherwise>
					<a href="#" style="text-decoration-line : none">
					<c:choose>
						<c:when test="${alarm.info eq 'note'}">
						<div style='opacity: 0.2; color:black;'>
							${alarm.sender}님이 쪽지를 보냈습니다.
							| ${alarm.date }
						</div>
						</c:when>
						<c:when test="${alarm.info eq 'reply' }">
						<div style='opacity: 0.2; color:black;'>
							${alarm.sender}님이 댓글을 달았습니다.
							| ${alarm.date }
						</div>
						</c:when>
						<c:when test="${alarm.info eq 'answer' }">
						<div style='opacity: 0.2; color:black;'>
							${alarm.sender }님이 답변을 등록했습니다.
							| ${alarm.date }
						</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
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