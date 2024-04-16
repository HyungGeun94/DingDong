<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success!</title>
<%@ include file="../include/head.jsp" %>
</head>
<body>
	<div class="frame">

		<!-- header -->
		
		
		<!--  nav -->
		<nav>
		<%@ include file="../include/nav.jsp" %>
		</nav>
			
		<!-- container -->
		<div class="container">
		
			<div align="center">
			
			<br>
			<br>
			<h1>결제가 완료되었습니다.</h1>
			<br>
			예약 번호: ${reservation.reservationNumber }<br>
			예약 일시: ${reservation.date }<br>
			예약자명: ${reservation.name }<br>
			연락처: ${reservation.phone }<br>
			인원: ${reservation.party}명<br>
			결제 금액: ${reservation.cost }원<br>
			결제 상태: <c:if test="${reservation.state eq 1}">결제 완료</c:if>			
			
			<br>
			
			</div>
		
		
		
		</div>
		
		
		
	</div>
	
	<!-- footer -->
	<footer>
	<%@ include file="../include/footer.jsp" %>
	</footer>

</body>
</html>