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


		<h1>예약 상세 내역</h1>
		<div>
			예약 날짜 및 시간은 변경이 불가능합니다. 취소 후 다시 예약 바랍니다.
		</div>

			<form id="reservation-edit-form" action="${contextPath }/member/reservation/update" method="post">
				
					<br>
					<div class="input-group mb-3">
					 <span class="input-group-text" id="basic-addon1">예약 번호</span>
					  <input type="text" class="form-control" id="reservationNumber" name="reservationNumber" value="${reservation.reservationNumber}" readonly/>
					</div>
					
					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">예약자명</span>
					  <input type="text" class="form-control" name="name" value="${reservation.name }" required/>
					</div>

					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">연락처</span>
					  <input type="text" class="form-control" name="phone" value="${reservation.phone }" required/>
					</div>
					
					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">예약 일시</span>
					  <input type="text" class="form-control" value="${reservation.date}" readonly/>
					</div>
					
					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">방문 일시</span>
					<input type="text" class="form-control"  value="${reservation.reservationDate}" readonly/>
					</div>
					
					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">시작 시간</span>
					<input type="text" class="form-control" value="${reservation.start }" readonly/>
					</div>
					
					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">마감 시간</span>
					<input type="text" class="form-control" value="${reservation.end }" readonly/>
					</div>

					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">결제 금액</span>
					<input type="text" class="form-control" id="cost" value="${reservation.cost }" readonly/>
					</div>
					
					
					
					
					<!--  비밀번호 확인 모달창 -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  					<div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">예약 정보 수정</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							          <div class="mb-3">
							            <label for="message-text" class="col-form-label">현재 비밀번호를 입력하세요:</label>
							            <input type="password" name="password" class="form-control" id="message-text"></input>
							          </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							        <button type="button" class="btn btn-primary" id="editBtn">수정</button>
							      </div>
							    </div>
						  </div>
						</div>
						
					<!--  비밀번호 확인 모달창 끝 -->
					
					
					
					
				
				</form>
			
			
				<br>
				
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">수정</button>
				<button type="button" class="btn btn-danger" id="cancelBtn">취소</button>
 				
				
				
				








		
		
		
		
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

// 새별: 비밀번호 확인 모달
var exampleModal = document.getElementById('exampleModal');
var password = document.getElementById('password');

exampleModal.addEventListener('show.bs.modal', function (event) {
	
	 // Button that triggered the modal
	 var button = event.relatedTarget
	 // Extract info from data-bs-* attributes
	 var recipient = button.getAttribute('data-bs-whatever')
	 // If necessary, you could initiate an AJAX request here
	 // and then do the updating in a callback.
	 //
	 // Update the modal's content.
	 var modalTitle = exampleModal.querySelector('.modal-title')
	 var modalBodyInput = exampleModal.querySelector('.modal-body input')

}); // 비밀번호 확인 모달 끝



// 수정 버튼 -> form action 
$("#editBtn").click(function() {
	$("#reservation-edit-form").submit();	
})// $("#editBtn").click


// 새별: 취소 버튼 -> 아임포트 취소
// 현재 카카오페이만 구현되어 있어서 취소 버튼 클릭하면 무조건 카카오페이 취소입니다. 
// reservation.payWith에 결제 방식이 작성되어 있습니다.
// 결제 방식별로 함수 실행되면 좋겠네유 (24/03/06)
$("#cancelBtn").click(function() {
	cancelKakaoPay();
})// $("#cancelBtn").click


// 새별: 아임포트 카카오페이 취소
function cancelKakaoPay(){
		
		if(confirm('취소하시겠습니까?')){
			var reservationNumber = $("#reservationNumber").val();
			var cost = $("#cost").val();
			
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
			
			// 결제 시 입력했던 uid로 취소를 요청해야 통신 가능함.
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
					location.href="/dingdong/member/reservation/cancelSuccess?reservationNumber=" + reservationNumber;
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
		
	}// function cancelKakaoPay()
	

</script>
</body>
</html>