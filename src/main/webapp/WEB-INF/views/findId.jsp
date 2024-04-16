<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<%@ include file="include/head.jsp" %>
</head>
<body>
	<div class="frame">

		<!-- header -->
		
		
		<!--  nav -->
		<%@ include file="include/nav.jsp" %>
		
		
		
		
		<!-- container -->
		<div class="container" align="center" style="max-width:50%;">
		
		
		<h1>아이디 찾기</h1>
		
		<div id="email-alert" style="display:none"> 등록된 이메일이 아닙니다.</div>
		
			<input class="form-control" id="email" name="email" placeholder="가입 시 사용한 이메일을 입력하세요."/>
			<button class="btn btn-primary" id="submitBtn" onclick="mailSend()">전송</button>
		
	
		</div>
		 
		
		
	
		
		
		
	</div>
	
	<!-- footer -->
	<%@ include file="include/footer.jsp" %>
	
<script>


/* 
새별: 등록된 이메일이 맞는지 확인하는 ajax입니다.
입력 시 등록된 이메일인지 아닌지 초록(존재))/핑크(존재하지않음)로 구분  

var emailCheck = false;

function findEmail(){
	var email = $("#email").val();
	
	console.log(email);
	
 	var url = "/dingdong/isExistEmail";
 	var paramData = {
 			'email' : email
 	};
	
	$.ajax({
		url : url,
		data : paramData,
		dataType : 'json',
		type : 'POST',
		success : function(result) {
			
			//	존재하지 않는 이메일이면
			if(result === 0){
				$('#email').css("background-color", "lightpink");
				$('#email-alert').css("display", "block");
			}else{	//	존재 하면
				$('#email').css("background-color", "lightgreen");
				$('#email-alert').css("display", "none");
				emailCheck = true;
			}
			
			submitBtnControll();
		},
		error : function(result) {
			// 여기에 통신 실패 로직 구현
		}
})
} */


/* function submitBtnControll(){
	if(emailCheck){
		document.getElementById("submitBtn").removeAttribute('disabled');
	}else{
		document.getElementById("submitBtn").setAttribute('disabled', 'disable');
	}
} */


// 새별: 아이디 찾기 이메일 발송
function mailSend(){
	var email = $("#email").val();
	console.log(email);
	
	$.ajax({
		
		data : { email : email },
		dataType : 'JSON',
		url : '/dingdong/findId/sendEmail',
		type : 'POST',
		success : function(data){
			console.log('통신 성공!' + data);
			if(data === 0){
				alert('등록되지 않은 이메일입니다.');
				history.back();
			}else{
			 	alert('메일이 전송되었습니다.');
			 	location.href='/dingdong/login';
			}
		}
		
	})
}// function mailSend()


</script>
</body>
</html>