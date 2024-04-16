<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomUpdate</title>
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
				<b>룸 수정 화면입니다.</b><br>
				<div>
				<table>
				<form form="role" method="post">
						<tr>
							<td>지점 번호 <input type="text" name="studyroom" placeholder="${studyRoomDTO.studyroom}" readonly/>
						</td></tr>
						<tr>
							<td>지점 이름 <input type="text" name="studyroomName" placeholder="${studyRoomDTO.name}" readonly/>
						</td></tr>
						<tr>
							<td>룸 번호 <input type="text" name="roomNumber" placeholder="${roomDTO.roomNumber}" readonly/>
						</td></tr>
						<tr>
							<td>룸 이름 <input type="text" name="name" value="${roomDTO.name}"/>
						</td></tr>
						<tr>
							<td>예약 최소시간 <input type="text" name="min" value="${roomDTO.min}"/>
						</td></tr>	
						<tr>
							<td>예약 최대시간 <input type="text" name="max" value="${roomDTO.max}"/>
						</td></tr>	
						<tr>
							<td>룸 설명 <input type="text" name="content" value="${roomDTO.content}"/>
						</td></tr>	
						<tr>
							<td>룸 단가 <input type="text" name="cost" value="${roomDTO.cost}"/>
						</td></tr>	
						<tr>
							<td>삭제여부 <input type="text" name="del" value="${roomDTO.del}" placeholder="삭제여부 0[유지], 1[삭제]"/>
						</td></tr>				
						<tr>
							<td>룸 이미지 <input type="text" name="fileName" value=${roomDTO.fileName}>
						</td></tr>
						<tr>
							<td><input type="submit" value="수정하기">
							<input type="reset" value="원래대로"></td>
						</tr>
				</form>
					</table>	
				</div>
			</div>	
	<!-- footer -->
 		<%@ include file="../include/footer.jsp" %>		

</body>
</html>


<div class="modal-body">
				      	
				      