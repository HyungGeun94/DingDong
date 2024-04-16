<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
		<%@ include file="../include/nav.jsp" %>
		
		
		

		
		<!-- container -->
		<div class="container" align="center">
		
		<div align="center" style="margin:100px">
		
		<h2 style="font-size: 24px">회원 탈퇴</h2>
		
		
			<br>
			<form action="${contextPath }/member/quitAction" method="post" id="member-quit-form">
				<textarea class="form-control" name="delReason" style="width:50%; height:100px" placeholder="탈퇴 사유를 100자 이내로 자유롭게 입력해주세요." maxlength=100></textarea>
				<br>
				
				
				
					<!--  비밀번호 확인 모달창 -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  					<div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
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
							        <button type="button" class="btn btn-danger" id="quitBtn">탈퇴</button>
							      </div>
							    </div>
						  </div>
						</div>
					<!--  비밀번호 모달 끝 -->
						
				
			</form>
			
			
			<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" id="quit-modal">탈퇴하기</button>
		
		</div>
		
	
		
		
	
	
	
		</div>
		 
		
		
	
		
		
		
	</div>
	
	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>
<script>


// 새별: 비밀번호 모달 창을 띄웁니다
document.getElementById("quit-modal").addEventListener("click", function(){
	if(confirm('정말로 탈퇴하시겠습니까? 탈퇴 시 복구할 수 없습니다.')){
		if(${member.etc eq "kakao" || member.etc eq "naver"}){
			console.log("소셜 로그인 회원");
			$("#member-quit-form").submit();	
		}
		
		//비밀번호 확인 모달
		var exampleModal = document.getElementById('exampleModal');

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

		});
	}else{
		
	}
});// document.getElementById("quit-modal")
		

// 새별: 비밀번호 확인 버튼 내 탈퇴 버튼 -> form action 
$("#quitBtn").click(function() {
	$("#member-quit-form").submit();	
});

</script>
</body>
</html>