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
		<h1 class="mt-4">전체 회원</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="#">전체 회원</a></li>
			<li class="breadcrumb-item active">회원</li>
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
				<i class="fas fa-table me-1"></i> 회원
			</div>
			
			<div class="card-body">
			
			<form action="${contextPath }/admin/member/multiSuspend" method="post">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>선택</th>
							<th>아이디</th>
							<th>이름</th>
							<th>닉네임</th>
							
							<th>등급</th>
							<th>신고</th>
							<th>가입 날짜</th>
							
							<th>휴면</th>
							<th>로그인 일자</th>
							
							<th>정지</th>
							<th>탈퇴</th>
							<th>탈퇴 날짜</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>선택</th>
							<th>아이디</th>
							<th>이름</th>
							<th>닉네임</th>
							
							<th>등급</th>
							<th>신고</th>
							<th>가입 날짜</th>

							<th>휴면</th>
							<th>로그인 일자</th>
							
							<th>정지</th>
							<th>탈퇴</th>
							<th>탈퇴 날짜</th>
							
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="member" items="${memberList }">
							<tr>
								<td><input type="checkbox" name="id" value="${member.id}"/></td>
								<td><a href="#">${member.id }</a></td>
								<td>${member.name }</td>
								<td>${member.nickname }</td>
								
								<td>${member.grade }</td>
								<td>${member.report }</td>
								<td>${member.signupDate}</td>

								<td>${member.rest }</td>
								<td>${member.loginDate }</td>
								
								<td>${member.suspend}</td>
								<td>${member.del}</td>
								<td>${member.delDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<button class="btn btn-danger" type="submit">정지</button>
				</form>
				
				
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


