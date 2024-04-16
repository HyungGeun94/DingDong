<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
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
		
			<!-- 스터디룸 정보 -->
			<div align="center">
			<br>
			
				<h1>${room.name}</h1>
				<br>
				<div class="image-box" style="width: 40%; height: 20%; overflow:hidden; margin:0 auto">
					<img class="image-thumbnail" style="width:100%; height: 100%; object-fit: cover" src="${contextPath}/resources/images/room/${room.fileName}" alt="${room.name}">
				</div>
				<br>
			
				수용인원 | ${room.min}명 ~ ${room.max}명<br>
				<br>
				${room.content}<br>
			</div>
			
			<br>
			<br>
			<hr>
			<!--  여기에 시설 구현 -->
			<%@include file="include/reservationNav.jsp" %>			
			<br>
			<br>
		
			<!-- 새별: 순서는 branchList - listAll - detail - form(결제 ajax) - success(결제 성공 시) 입니다. -->
			<!-- 날짜 및 시간 선택 -->
			<div align="center">
				<form action="${contextPath}/reservation2/form" method="post">
					<input type="hidden" name="studyroomNumber" value="${room.studyroom}">
					<input type="hidden" name="roomNumber" value="${room.roomNumber}"/>
					<h4>날짜 선택</h4>
						<input type="date" id="date" name="date"/>
					<br>
					<br>
					<h4>시간 선택</h4>
					
					<!--  새별: 시작 시간, 끝 시간이 yyyy-mm-dd hh:mm:ss(24h) 으로 들어와야합니다. -->
					<!--  DB 저장 값은 yyyy-mm-dd hh:mm:ss(24h)이며 결제 시에 시간만 잘라서 사용합니다. -->
					<!--  결제 시 end - start * cost로 최종 가격을 결정합니다. -->
					<!--  cost : ( end.substring(11, 13) - start.substring(11, 13) ) * ${room.cost};  -->
					<input type="datetime-local" name="start" placeholder="시작 시간"><br>
					<input type="datetime-local" name="end" placeholder="끝 시간">
<%--						<input type="text" name="start" class="form-control time" style="width:200px;">--%>
<%--						<input type="text" name="end" class="form-control time" style="width:200px;">--%>

					<br>
					<br>
					<input class="btn btn-primary" type="submit" value="예약하기"/>
				</form>
			</div>
			
			<br>
			<br>
			<hr>
			<br>
			<br>
			
			<div align="center">
			<br>
			<br>
			<br>
			<h2>여기에 리뷰 구현</h2>
			<br>
			<br>
			<br>
			</div>
		
		
		
		</div>
		
		
		
	</div>
	
	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>


<script>

//달력 오늘 날짜 이전으로 선택 금지
window.onload = function() {
	var calendar = document.getElementById("date");

	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	var yyyy = today.getFullYear();

	today = yyyy + '-' + mm + '-' + dd;

	calendar.min = today;
	calendar.value = today;

	console.log(today);

}

</script>
</body>
</html>