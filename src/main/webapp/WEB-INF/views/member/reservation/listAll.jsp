<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>


<%@ include file="../../include/head.jsp" %>

<!--  admin stylesheet -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />

</head>

<body>
<!--  nav -->
<%@ include file="../../include/nav.jsp" %>


<!--  mypage Nav -->
<%@ include file="../include/mypageNav.jsp" %>
		
		
		
	<div class="frame">

		<!-- header -->
		
		
		
		

		
		<!-- container -->
		<div class="container">
		
		
		<div class="container-fluid px-4">
		<h1 class="mt-4">내 예약</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="${contextPath }/member/mypage">마이페이지</a></li>
			<li class="breadcrumb-item active">예약</li>
		</ol>
		
		<div class="card mb-4">
			<div class="card-body">
				여기는 공지사항입니다.
				<a target="_blank" href="https://datatables.net/">official
					DataTables documentation</a>.
			</div>
		</div>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 예약
			</div>
			
			<div class="card-body">
			
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>예약 번호</th>
							<th>예약 일시</th>
							<th>예약자명</th>
							<th>연락처</th>
							
							<th>날짜</th>
							<th>시작 시간</th>
							<th>퇴실 시간</th>
							
							<th>인원</th>
							<th>금액</th>
							<th>결제 방식</th>
							<th>수정</th>
							<th>리뷰</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>예약 번호</th>
							<th>예약 일시</th>
							<th>예약자명</th>
							<th>연락처</th>
							
							<th>날짜</th>
							<th>시작 시간</th>
							<th>퇴실 시간</th>
							
							<th>인원</th>
							<th>금액</th>
							<th>결제 방식</th>
							<th>수정</th>
							<th>리뷰</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="reservation" items="${reservationList }">
							<tr>
								<td><a href="${contextPath}/member/reservation/detail?reservationNumber=${reservation.reservationNumber}">${reservation.reservationNumber}</a></td>
								<td>${reservation.date }</td>
								<td>${reservation.name }</td>
								<td>${reservation.phone }</td>
								
								<td>${reservation.reservationDate }</td>
								<td>${reservation.start}</td>
								<td>${reservation.end}</td>
								
								<td>${reservation.party }</td>
								<td>${reservation.cost }</td>
								<td>${reservation.payWith}</td>
								<td><button class="btn btn-light" onclick="location.href='${contextPath}/member/reservation/detail?reservationNumber=${reservation.reservationNumber }'">수정</button></td>
								<td><button class="btn btn-light" onclick="location.href='${contextPath}/reservation/review/insert?reservationNumber=${reservation.reservationNumber }'">리뷰</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
			</div>
			
			
		</div>
	</div>
		
		
		
		
		</div>
		 
	
		
		
		
	</div>
	
	<!-- footer -->
	<%@ include file="../../include/footer.jsp" %>
	

<!--  admin bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/admin/assets/demo/chart-area-demo.js"></script>
<script src="${contextPath}/resources/admin/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/admin/js/datatables-simple-demo.js"></script>

</body>
</html>