<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약완료</title>
<%@ include file="../include/head.jsp"%>
<style>
* {
	padding: 0;
	margin: 0 auto;
	border: none;
}

html,body {
	height: 100%;
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
	text-align: center;
	
}


.frame{
	min-height: 100%;
    position: relative;
    padding-bottom: 60px;
    top: 1px;
    left: 1%;
    right: 1%;
	height: 200vh;
	width: 100%;
	height: 100%;
}

.content-frame{
	width: 100%;
	height: 100%;

}

.tab-content{
	width: 1000px;
	height: 1000px;
	margin: 0 auto;
}
</style>
</head>
<body>
<div class="frame">
	<!-- header -->
	<div class="content-frame">
		<!--  nav -->
			<nav>
				<div class="fixed"><%@ include file="../include/nav.jsp"%>
			</nav>
			
			<div>
			<b>예약 완료.</b><br>
				<div>
				<table class=table>
					<br>
					<tr>
						 <td>예약번호: ${reservation.reservationNumber}</td>
					</tr><tr>	
						<td>예약자명: ${reservation.name}</td>
					</tr><tr>	
						<td>연락처: ${reservation.phone}</td>
					</tr><tr>	
						<td>예약날짜: ${reservation.reservationDate}</td>
					</tr><tr>	
						<td>시작시간: ${reservation.start}</td>
					</tr><tr>	
						<td>마감시간: ${reservation.end}</td>
					</tr><tr>	
						<td>결제금액: ${reservation.cost}원</td>
					</tr>
				</table>	
			</div>
				<a href="${contextPath }/member/mypage">예약확인하기</a>
		</div>	
	<!-- footer -->
 		<%@ include file="../include/footer.jsp" %>		
</body>
</html>