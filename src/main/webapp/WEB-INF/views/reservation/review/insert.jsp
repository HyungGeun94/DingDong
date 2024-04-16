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
		
		
		
	<div class="frame">

		<!-- header -->
		

		
		<!-- container -->
		
		
		<div class="container" style="max-width:50%">
		
<br>
<br>


		<h1>리뷰 작성 </h1>
		<div>
			리뷰 작성 부탁드립니다.
		</div>

			<form id="reservation-review-form" action="${contextPath}/reservation/review/insert" method="post">
				
					<br>
					<div class="input-group mb-3">
					 <span class="input-group-text" id="basic-addon1">예약 번호</span>
					  <input type="text" class="form-control" id="reservationNumber" name="reservationNumber" value="${reservation.reservationNumber}" readonly/>
					</div>
					
					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">예약자 ID</span> 
					  <input type="text" class="form-control" name="memberId" value="${reservation.memberId}" readonly/>
					</div>
					
					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">예약자명</span>
					  <input type="text" class="form-control" name="name" placeholder="${reservation.name}" readonly/>
					</div>

					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">별점</span>
					  <input type="text" class="form-control" name="score" required />
					</div>
					
					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">리뷰 내용</span>
					  <input type="text" class="form-control" name="content" required />
					</div>
					
					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">블라인드여부</span>
					click 시 블라인드 처리 됨 <input type="checkbox" name="blind"  id="blindCheck" value="0"	>
					</div>
					
					<div class="input-group mb-3">
					<input type="hidden" class="form-control" name="roomNumber" value="${reservation.roomNumber}" placeholder="룸넘버" readonly/>
					</div>
					
					<div class="input-group mb-3">
					<input type="hidden" class="form-control" name="del" value="0" placeholder="삭제여부" readonly/>
					</div>
				
				</form>
			
				<br>
				
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" id="submitBtn" >완료</button>
				<button type="button" class="btn btn-danger" id="cancelBtn" >취소</button>
		
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

<script>


$(document).ready(function(){
	console.log("안녕");	

// 완료 버튼 -> form action 
$("#submitBtn").click(function() {
	$("#reservation-review-form").submit();	
})

// 취소 버튼 -> 마이페이지 이동
$("#cancelBtn").click(function() {
	$(location).attr("href", "${contextPath}/member/mypage");
})

// 블라인드 여부
$("#blindCheck").click(function(){
	$("#blindCheck").val="1";
})

// 블라인트 여부 check 




})

</script>
</body>
</html>