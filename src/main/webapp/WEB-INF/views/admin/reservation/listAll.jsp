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
		<h1 class="mt-4">전체 예약</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="#">예약</a></li>
			<li class="breadcrumb-item active">전체 예약</li>
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
							<th>상태</th>
							<th>예약 일시</th>
							<th>예약자명</th>
							<th>연락처</th>
							
							<th>날짜</th>
							<th>시작 시간</th>
							<th>퇴실 시간</th>
							
							<th>인원</th>
							<th>금액</th>
							<th>결제 방식</th>
							<th>취소</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>예약 번호</th>
							<th>상태</th>
							<th>예약 일시</th>
							<th>예약자명</th>
							<th>연락처</th>
							
							<th>날짜</th>
							<th>시작 시간</th>
							<th>퇴실 시간</th>
							
							<th>인원</th>
							<th>금액</th>
							<th>결제 방식</th>
							<th>취소</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="reservation" items="${reservationList }">
							<tr>
							<td>${reservation.reservationNumber}</td>
							<td>
								<c:choose>
									<c:when test="${reservation.del eq 1 }">
										취소							
									</c:when>
									<c:when test="${reservation.state eq 1 }">
										결제
									</c:when>
									<c:otherwise>
										예약
									</c:otherwise>
								</c:choose>
							</td>
								
								<td>${reservation.date }</td>
								<td>${reservation.name }</td>
								<td>${reservation.phone }</td>
								
								<td>${reservation.reservationDate.substring(0,10) }</td>
								<td>${reservation.start}</td>
								<td>${reservation.end}</td>
								
								<td>${reservation.party }</td>
								<td>${reservation.cost }</td>
								<td>${reservation.payWith}</td>
								<td><button class="btn btn-danger" id="cancelBtn" onclick="cancelKakaoPay('${reservation.reservationNumber}', '${reservation.cost }')">취소</button></td>
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

<script>

//아임포트 카카오페이 취소
function cancelKakaoPay(reservationNumber, cost){
		
		if(confirm('취소하시겠습니까?')){
			var url = "/dingdong/member/reservation/cancel";
			
			// 필수값
			// merchant_uid 결제 고유 번호
			// cancel_amount 결제 금액
			// cancel_tax_free_amount 취소 비과세 금액
			
			// 서버단 필수값
			// api_key
			// api_secret_key
			// access_token == api_key, api_secret_key로 https://api.iamport.kr/users/getToken에 접속해서 얻어옴
			// api key는 노출되면 안 되므로 반드시 서버단에서 처리한다.
			var paramData = {
					"merchant_uid" : reservationNumber,
					"cancel_amount" : cost,
					"cancel_tax_free_amount" : cost,
			}
			
			$.ajax({
				url : url,
				data : paramData,
				dataType : 'json',
				type : 'POST',
				success : function(result) {
					alert('취소 완료!');
					console.log(result.code);
					console.log("merchant_uid " + result.merchant_uid);
					window.location.reload();
					// 여기에 통신 성공 로직 구현
					// result가 해당 url에서 보내는 return값
				},
				error : function(result) {
					// 여기에 통신 실패 로직 구현
				}
				
			})
			/* .done(function(result){
				alert('성공!');
			}) */
		}
		
	}


</script>
</body>
</html>