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


<main>
			<div class="container-fluid px-4">
		<h1 class="mt-4">취소 내역</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="#">예약</a></li>
			<li class="breadcrumb-item active">취소</li>
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
				<i class="fas fa-table me-1"></i> 취소
			</div>
			
			<div class="card-body">
			
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>상태</th>
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
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>상태</th>
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
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="reservation" items="${delList }">
							<tr>
								<td>취소</td>
								<td>${reservation.reservationNumber}</td>
								<td>${reservation.date }</td>
								<td>${reservation.name }</td>
								<td>${reservation.phone }</td>
								
								<td>${reservation.reservationDate }</td>
								<td>${reservation.start}</td>
								<td>${reservation.end}</td>
								
								<td>${reservation.party }</td>
								<td>${reservation.cost }</td>
								<td>${reservation.payWith}</td>
								<td><button class="btn btn-light" onclick="location.href='${contextPath}/admin/reservation/detail?reservationNumber=${reservation.reservationNumber }'">수정</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
			</div>
			
			
		</div>
	</div>
		
		
</main>





<!--  footer -->
<%@ include file="../include/footer.jsp" %>
                
                
            </div>
    </div>

<%@include file="../include/script.jsp" %>

</body>
</html>


