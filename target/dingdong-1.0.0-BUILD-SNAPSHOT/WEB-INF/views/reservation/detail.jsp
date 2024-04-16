<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room detail</title>

<%@ include file="../include/head.jsp"%>

<style>
* {
	padding: 0;
	margin: 0;
	border: none;
}

html,body {
	max-width: 100%;
	height: 100%;
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
	text-align: center;
	padding: 0;
	margin: 0;
}


.frame{
	min-height: 100%;
    position: relative;
    padding-bottom: 60px;
    top: 1px;
	height: 400vh;
}

.card-body {
	padding: 0;
	margin: 14px 0px;
	background-color: #fff;
}

.card-title{
	color: black;
	font-size: 30px;
	font-family: "GodoB";
	font-weight: bolder;
	margin: 0;
}

.card-text{
	color: black;
	font-size: 20px;
	font-family: "GodoB";
	font-weight: bolder;

}
.tab-content{
	width: 1000px;
	height: 1000px;
	float: left;
	position: absolute;
	left: 50px;
}


.content-frame{
	width: 500px;
	height: 800px;
	float: right;
	position: absolute;
	left: 1150px;
	background-color: #FFCC00;
}

.fixed {
  position: sticky;
  width: 100%;
}

.box-title{
	text-align: left;
}

.form-group{
	text-align: left;
	font-size: 14px;
}

#title{
	color: black;
	font-size: 30px;
	font-family: "GodoB";
	font-weight: bolder;
	text-align: center;
}

#title:after {
  	content: "";
    display: block;
    width: 60px;
    border-bottom: 4px solid #bcbcbc;
    margin: 20px auto;

 }
 
 /* img file */
img {
     max-width: 100%;
 }     
    
.jb-a{
	width: 500px;
	margin: 0px auto;
	position: relative
}

.jb-c {
	 width: 500px;
	 height: 350px;
     position: absolute;
     top: 0px;
     left: 0px;
     display: none;
 } 
    
.jb-a:hover .jb-c{
	display: block;
}



.reservation-select{
	width: 500px;
	height: 800px;
	float: right;
	left: 1150px;
}

.table-form{
	border: 2px;
	font-size: 24px;
}

.reservation-form{
	width: 300px;
	height: 300px;
	margin: 100px;
	font-size: 30px;
}
#today{
	width: 300px;
	height: 30px;
	
}
/* 시간 예약받기 start, end */
#time{
	width: 300px;
	height: 30px;

}

.table{
	font-size: 20px;
	font-family: "GodoB";
	font-weight: bold;
	border: 2;

}

.reservation-input{
	width: 300px;
	height: 30px;
 	background-color:#FFCC00; 
 	color:000000;
 	font-size: 20px;
 	text-align: center;
 	border: 4px dashed #bcbcbc;
}

.reservation-input::placeholder{
	color: #663333;
	
}

.tab{
	text-align: left;

}

.btn-outline-secondary{
	width: 70px;
	height: 20px;
	margin: 0;
	padding: 0;
}

</style>

</head>
<body>
		<!--  nav -->
			<div>
				<nav>
					<%@ include file="../include/nav.jsp"%>
				</nav>
				<div>
					<div class="card-body">
					    <h5 class="card-title">${studyRoomDTO.name}지점</h5>
					  </div>
					  <div class="card-footer text-body-secondary">
					    <p class="card-text">${roomDTO.name}룸</p>
		   		<!-- 룸 넘버 -->
				   		<input type="hidden" class="form-control" name="roomNumber" value="${roomDTO.roomNumber}" readonly/>
				<!-- 멤버 아이디 -->
				   		<input type="hidden" class="hidden-id" value="${member.id}">
				<!-- 예약리스트 -->
					<c:forEach items="${reservationList}" var="reservationA">
						<input type="hidden" value="${reservationA.reservationNumber }">
					</c:forEach>
				
				
					  </div>
				</div>
				<!--  reservation nav-bar-->
				<div>
					<%@ include file="./include/detail_nav.jsp" %>
				</div>
			</div>	
	<div class="frame">
		<!-- header -->
		<div>
		<div>
			<!-- 예약하기 form -->		
	
			<div class="content-frame">
					<div class="reservation-select">
						<div class="box-body">
						  <div class="reservation-form">
						  	<form action="${contextPath}/reservation/form" method="get">
								<tabel class="table">
									<tr>
										<td> 예약날짜 <input class="reservation-input" type="date" name="reservationDate" id="today1" required/></td>
									</tr><tr>
										<td> 시작시간 <input class="reservation-input" type="datetime-local" name="start" placeholder="이용 시작 시간" required/></td>
									</tr><tr>
										<td> 끝시간 <input class="reservation-input" type="datetime-local" name="end" placeholder="이용 마감 시간" required/></td>
									</tr><tr>
										<td>이용인원 <input class="reservation-input" type="text" id="numberOnly" name="party" placeholder="이용 인원을 입력해주세요" required/></td>
									</tr><tr>
										오늘날짜 <input style='background-color:#FFCC00' type="date" name="date" id="today2" readonly  />
						 				<!-- 단가 --><input type="hidden" name="roomCost" value="${roomDTO.cost}"/>
										<!-- 스터디룸 --><input type="hidden" name="studyroom" value="${roomDTO.studyroom}"/>
										<!-- 룸넘버 --><input type="hidden" name="roomNumber" value="${roomDTO.roomNumber}"/>
										<td><input class="btn btn-success" type="submit" value="예약하기"></td>						  	
									</tr>
								</tabel>
						  	</form>
								<hr>
							  <div>
								  <table class="table">
								  		<tr>
								  			<td>최소 예약 ${roomDTO.min}시간</td>
								  		</tr>
								  		<tr>
								  			<td>최대 예약 ${roomDTO.max}시간</td>
								  		</tr>
										<tr>
											<td>영업시간: 9 to 9</td>
										</tr>
										<tr>
											<td>휴무일: 없음</td>
										</tr>
								  </table>
							  </div>
						  </div><!-- end of class="reservation-form" -->
						</div>	
					</div>		
				</div>		
			</div>		
			<!-- content-detail -->
			<div class="content-detail">	
			<div class="tab-content" id="nav-tabContent">
			<!-- image -->		
					<div class="jb-a">
						<image src="${contextPath}/resources/images/room/r_1.jpg" alt="" class="jb-b"/>
						<image src="${contextPath}/resources/images/room/r_2.jpg" alt="" class="jb-c"/>
					</div>
					<br>
					<br>
			<!-- spaceIntroduction -->
		  		<div class="tab-1" id="spaceIntroduction" role="tabpanel" aria-labelledby="spaceIntroduction-tab" tabindex="0">
						<div class="content-wrapper">
							<div class="content">
								<table class="table">
									<tr>
									<p id="title"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-balloon-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2 2 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224zM4.352 3.356a4 4 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5s-.226.496-.498.542c-.95.162-1.749.78-2.173 1.617a.6.6 0 0 1-.52.341c-.346 0-.599-.329-.457-.644"/>
									</svg>공간소개</p>
										<p class="font-monospace"> We are the one! </p>
										<p class="fw-bold"> 안녕하세요 </p>
										<p class="fw-bold"> 반갑습니다 </p>
										<p class="fw-bold">편안하고 조용한 분위기의 단독 모임 공간.</p>
										<p class="fw-bold">스터디룸에서 필요한 일상을 함께합니다.</p>
										<p class="fw-bold">추가 문의사항은 Front로 연락바랍니다.</p>
									</tr>
									<tr>
										<td> 첫 방문고객은 환한 웃음으로 화답해드립니다 </td>
									</tr>
									
								</table>
							</div>
						</div>	
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				<!-- facilitiesInformation  -->
						<div class="tab" id="facilitiesInformation" role="tabpanel" aria-labelledby="facilitiesInformation-tab" tabindex="0">
						<div class="content-wrapper">
						<div class="content">
							<table class="table">
								<tr>
								<p id="title"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-balloon-fill" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2 2 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224zM4.352 3.356a4 4 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5s-.226.496-.498.542c-.95.162-1.749.78-2.173 1.617a.6.6 0 0 1-.52.341c-.346 0-.599-.329-.457-.644"/>
								</svg>시설안내</p>
									<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
									  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
									</svg>초고속 인터넷 지원 무려 GIGA WI-FI </td>
								</tr><tr>
									<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
									  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
									</svg>노트북, 컴퓨터, 복합기 무료 사용가능 </td>
								</tr><tr>
									<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
									  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
									</svg>촬영용 삼각대, 링라이트 조명, 스텐드마이크등 방송장비 대여 가능 </td>
								</tr>
								</tr><tr>
									<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
									  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
									</svg>간단한 음식 식음가능</td>
								</tr><tr>
									<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
									  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
									</svg>간단한 커피 및 차 제공</td>
								</tr><tr>
									<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
									  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
									</svg>냉온정수기/냉장고/공기청정기/냉난방기/전자레인지/커피포트 구비</td>
								</tr><tr>
									<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
									  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
									</svg>대형 스마트TV HDMI케이블 + 화이트보드</td>
								</tr>	
							</table>
						</div>
					</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				<!-- caution -->
					<div class="tab" id="caution" role="tabpanel" aria-labelledby="caution-tab" tabindex="0">
					<div class="content-wrapper">
						<div class="content">
							<table class="table">
								<p id="title"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-balloon-fill" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2 2 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224zM4.352 3.356a4 4 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5s-.226.496-.498.542c-.95.162-1.749.78-2.173 1.617a.6.6 0 0 1-.52.341c-.346 0-.599-.329-.457-.644"/>
									</svg>유의사항</p>
									<tr>
										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-ban" viewBox="0 0 16 16">
										  <path d="M15 8a6.97 6.97 0 0 0-1.71-4.584l-9.874 9.875A7 7 0 0 0 15 8M2.71 12.584l9.874-9.875a7 7 0 0 0-9.874 9.874ZM16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0"/>
										</svg> 시설이용시 과도한 소음 자제 </td>
									</tr><tr>
										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-slash" viewBox="0 0 16 16">
										  <path d="M5.164 14H15c-.299-.199-.557-.553-.78-1-.9-1.8-1.22-5.12-1.22-6q0-.396-.06-.776l-.938.938c.02.708.157 2.154.457 3.58.161.767.377 1.566.663 2.258H6.164zm5.581-9.91a4 4 0 0 0-1.948-1.01L8 2.917l-.797.161A4 4 0 0 0 4 7c0 .628-.134 2.197-.459 3.742q-.075.358-.166.718l-1.653 1.653q.03-.055.059-.113C2.679 11.2 3 7.88 3 7c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0c.942.19 1.788.645 2.457 1.284zM10 15a2 2 0 1 1-4 0zm-9.375.625a.53.53 0 0 0 .75.75l14.75-14.75a.53.53 0 0 0-.75-.75z"/>
										</svg> 핸드폰은 무음모드 부탁 </td>
									</tr><tr>
										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
						 				 <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z"/>
										  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0"/>
										</svg> 입실, 퇴실시간 정확히 </td>
									</tr><tr>
										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-camera-video" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M0 5a2 2 0 0 1 2-2h7.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 4.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 13H2a2 2 0 0 1-2-2zm11.5 5.175 3.5 1.556V4.269l-3.5 1.556zM2 4a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h7.5a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1z"/>
										</svg> 안전을 위한 CCTV 24시간 상시녹화중 </td>
									</tr><tr>
										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-toggle-on" viewBox="0 0 16 16">
										  <path d="M5 3a5 5 0 0 0 0 10h6a5 5 0 0 0 0-10zm6 9a4 4 0 1 1 0-8 4 4 0 0 1 0 8"/>
										</svg> 최소 2시간 이상 이용가능</td>
									</tr><tr>
										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
										  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
										  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5"/>
										</svg> 최소 2인 이상 6인 미만 이용가능</td>
									</tr><tr>
										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-arms-up" viewBox="0 0 16 16">
										  <path d="M8 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3"/>
										  <path d="m5.93 6.704-.846 8.451a.768.768 0 0 0 1.523.203l.81-4.865a.59.59 0 0 1 1.165 0l.81 4.865a.768.768 0 0 0 1.523-.203l-.845-8.451A1.5 1.5 0 0 1 10.5 5.5L13 2.284a.796.796 0 0 0-1.239-.998L9.634 3.84a.7.7 0 0 1-.33.235c-.23.074-.665.176-1.304.176-.64 0-1.074-.102-1.305-.176a.7.7 0 0 1-.329-.235L4.239 1.286a.796.796 0 0 0-1.24.998l2.5 3.216c.317.316.475.758.43 1.204Z"/>
										</svg> 모든 시설 무료 이용가능</td>
									</tr><tr>
										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
										  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
										</svg> 모든 공간 금연(전자담배 포함)</td>
									</tr><tr>
										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-easel2" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M8 0a.5.5 0 0 1 .447.276L8.81 1h4.69A1.5 1.5 0 0 1 15 2.5V11h.5a.5.5 0 0 1 0 1h-2.86l.845 3.379a.5.5 0 0 1-.97.242L12.11 14H3.89l-.405 1.621a.5.5 0 0 1-.97-.242L3.36 12H.5a.5.5 0 0 1 0-1H1V2.5A1.5 1.5 0 0 1 2.5 1h4.691l.362-.724A.5.5 0 0 1 8 0M2 11h12V2.5a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0-.5.5zm9.61 1H4.39l-.25 1h7.72z"/>
										</svg> 퇴실 시 사용한 물품 정리정돈(기물 파손시 변상)</td>
									</tr><tr>
										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
										  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
										</svg>예약시간 미만 이용시 환불불가(전날, 당일 환불 불가)</td>
									</tr>
							</table>
						</div>
					</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				<!-- returnPolicy -->
					<div class="tab" id="returnPolicy" role="tabpanel" aria-labelledby="returnPolicy-tab" tabindex="0">
						<div class="content-wrapper">
						<div class="content">
							<table class="table">
								<p id="title"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-balloon-fill" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2 2 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224zM4.352 3.356a4 4 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5s-.226.496-.498.542c-.95.162-1.749.78-2.173 1.617a.6.6 0 0 1-.52.341c-.346 0-.599-.329-.457-.644"/>
								</svg>환불정책</p>
									<div class="h4 pb-2 mb-4 text-danger border-bottom border-danger">
									  이외 사항은 호스트에게 직접 문의 바랍니다.
										<tr>
											<ul class="list-group list-group-flush" style='text-align: left'>
											  <li class="list-group-item">이용 4일전 <B>총 금액100% 환불</B></li>
											  <li class="list-group-item">이용 3일전 <B>총 금액70% 환불</B></li>
											  <li class="list-group-item">이용 2일전 <B>총 금액50% 환불</B></li>
											  <li class="list-group-item">이용 전날 <B style="color:red">환불 불가</B></li>
											  <li class="list-group-item">이용 당일 <B style="color:red">환불 불가</B></li>
											</ul>
										</tr>
									</div>
								</table>
							</div>
							</div>
						</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					
		<!-- 1:1 문의 ajax  -->
				<div class="tab" id="inquiry" role="tabpanel" aria-labelledby="inquiry-tab" tabindex="0">
					<p id="title"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-balloon-fill" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2 2 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224zM4.352 3.356a4 4 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5s-.226.496-.498.542c-.95.162-1.749.78-2.173 1.617a.6.6 0 0 1-.52.341c-.346 0-.599-.329-.457-.644"/>
					</svg>1:1문의</p>
				</div>		
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			
				
		<!-- 리뷰 ajax -->
				 <div class="tab" id="review" role="tabpanel" aria-labelledby="review-tab" tabindex="0">
					<p id="title"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-balloon-fill" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2 2 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224zM4.352 3.356a4 4 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5s-.226.496-.498.542c-.95.162-1.749.78-2.173 1.617a.6.6 0 0 1-.52.341c-.346 0-.599-.329-.457-.644"/>
					</svg>리뷰</p>
					<div id="reviewList"></div>
					
				</div>
				
		<!-- 지도API 가능? -->		
				<!-- <div class="tab" id="disabled" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">
				</div> -->
			</div><!-- class="tab-content" -->
			</div><!-- class="content-detail" -->
			
 	</div><!-- end of class=content-detail -->
 	</div><!-- end of class=frame -->
 	
 	
 	
 	
 	<!-- 최상단 이동 -->
	<div onclick="window.scrollTo(0,0);">TOP</div>
	
	
	
	
	
	
	</div>
<!-- footer -->
	<%@ include file="../include/footer.jsp" %>
<script>
 
$(document).ready(function(){
	console.log("hi");
	
	//공간소개
	$('#spaceIntroduction-tab').click(function(){
		var offset=$('#spaceIntroduction').offset();
    	 $('html').animate({scrollTop : offset.top}, 400);

 		console.log(offset);
	});
	
	//시설안내
	$('#facilitiesInformation-tab').click(function(){
		var offset=$('#facilitiesInformation').offset();
    	 $('html').animate({scrollTop : offset.top}, 400);
		
		console.log(offset);
	});
	
	//유의사항
	$('#caution-tab').click(function(){
		var offset=$('#caution').offset();
    	 $('html').animate({scrollTop : offset.top}, 400);
		
		console.log(offset);
	});
	
	//환불정책
	$('#returnPolicy-tab').click(function(){
		var offset=$('#returnPolicy').offset();
    	 $('html').animate({scrollTop : offset.top}, 400);
		
		console.log(offset);
	});
	
	//1:1문의
	$('#inquiry-tab').click(function(){
		var offset=$('#inquiry').offset();
    	 $('html').animate({scrollTop : offset.top}, 400);
		
		console.log(offset);
	});
	
	//리뷰
	$('#review-tab').click(function(){
		var offset=$('#review').offset();
    	 $('html').animate({scrollTop : offset.top}, 400);
		
		console.log(offset);
	});
	
	
	//추가?
	$('#disabled-tab').click(function(){
		var offset=$('#disabled').offset();
    	 $('html').animate({scrollTop : offset.top}, 400);
		
		console.log(offset);
	});
	

	//date 예약날짜 default
	document.getElementById('today1').valueAsDate = new Date();
	
	//현재날짜 및 시간
	document.getElementById('today2').valueAsDate = new Date();
	//예약 시작
	//document.getElementById('today3').valueAsDate = new Date();
	//예약 마감
	//document.getElementById('today4').valueAsDate = new Date();
	
	
	//예약날짜 입력시 초 이하 단위는 안보여줌.
	//document.getElementById('today3').value= new Date().toISOString().slice(0, -5);
	
	
	//유효성검사 / 예약인원 number로 받기
	$("#numberOnly").on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );})

	//리뷰 목록 불러오기
	//리뷰 목록 불러오는 ajax 함수 작성
	reviewList();
	//리뷰 목록 불러오기: ajax
	function reviewList(){
		var url = "${contextPath}/reservation/reviewList";
		//가야할 주소 정해줘야함
		var paramData = {
					"roomNumber" : "${roomDTO.roomNumber}"
					
		}
		$.ajax({
			url : url, 						//주소: 매핑주소
			data : paramData,				//요청데이터 그냥 보내면 스트링으로 감
			dataType : 'json',				//데이터 타입
			type : 'POST',					//전송방식
			success : function(result) {	//전송하면 founction() 변수명 기입
				// 여기에 통신 성공 로직 구현
				// result가 해당 url에서 보내는 return값
				console.log("성공");
			
				var htmls = "";
				if(result.length < 1){
					htmls = htmls + '<p> </p>';
					htmls += "<h3 style='text-align: center;'> 작성된 리뷰가 없습니다. </h3>";
				}else{
					$(result).each(function(){
						htmls = htmls + '<div class="table" id="reviewNumber' + this.reviewNumber + '">'; //div 글번호 기준 계속 생성. 작은'는 댓글번호 날라와서 id영역 보존해 반복 날라옴
					 	htmls += '<strong style="text-gray-dark">' + this.reviewNumber + ' - ' + '</strong>';
					 	htmls += this.score;
					 	htmls += '<image style= width=20px, height=20px; src="${contextPath}/resources/images/star.jpg">';
					 	htmls += this.memberId;
					 	htmls += '<br>'
					 	htmls += this.content;
					 	htmls += '<button type="button" class="btn btn-outline-secondary" id="deleteCheck">삭제하기</button>'
					 	htmls += '</div>';
					}); //each End
				}
				$("#reviewList").html(htmls); //reviewList에 뿌림
			},
			error : function(data) {
				// 여기에 통신 실패 로직 구현
				console.log("실패" + data);
			}
		});
		
		}//end of list()
		
		
		
		
		
	
	})
	
</script>



</body>
</html>