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
		<h1 class="mt-4">탈퇴 회원</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="#">탈퇴 회원</a></li>
			<li class="breadcrumb-item active">회원</li>
		</ol>
		
		<div class="card mb-4">
			<div class="card-body">
				저거 하단에 Showing 1 to 8 of 8 entries 어떻게 지우냐 나중에 확인해봐라
				<a target="_blank" href="https://datatables.net/">official
					DataTables documentation</a>.
			</div>
		</div>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 탈퇴 회원
			</div>
			
			<div class="card-body">
			
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>닉네임</th>
							
							<th>등급</th>
							<th>신고</th>
							<th>가입 날짜</th>
							
							<th>탈퇴 날짜</th>
							<th>로그인 일자</th>
							<th>수정</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>닉네임</th>
							
							<th>등급</th>
							<th>신고</th>
							<th>가입 날짜</th>
							
							<th>탈퇴 날짜</th>
							<th>로그인 일자</th>
							<th>수정</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="member" items="${memberList }">
							<tr>
								<td>${member.id }</td>
								<td>${member.name }</td>
								<td>${member.nickname }</td>
								
								<td>${member.grade }</td>
								<td>${member.report }</td>
								<td>${member.signupDate}</td>
																
								<td>${member.delDate }</td>
								<td>${member.loginDate }</td>
								<td><button class="btn btn-light">수정</button></td>
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


