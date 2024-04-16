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
		<h1 class="mt-4">블라인드 게시글</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="#">커뮤니티</a></li>
			<li class="breadcrumb-item active">블라인드 게시글</li>
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
				<i class="fas fa-table me-1"></i> 게시글
			</div>
			
			<div class="card-body">
			
				<table id="datatablesSimple">
					<thead>
						<tr>
						
							<th>카테고리</th>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>아이디</th>
							
							<th>회원 전용</th>
							<th>작성 날짜</th>
							<th>조회수</th>
							<th>좋아요</th>
							<th>싫어요</th>
							
							<th>신고</th>
							<th>스크랩</th>
							
							<th>수정</th>
							<th>삭제</th>
							
							
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>카테고리</th>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>아이디</th>
							
							<th>회원 전용</th>
							<th>작성 날짜</th>
							<th>조회수</th>
							<th>좋아요</th>
							<th>싫어요</th>
							
							<th>신고</th>
							<th>스크랩</th>
							
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="communityBoard" items="${blindList}">
							<tr>
								<td>${communityBoard.category }</td>
								<td>${communityBoard.boardNum }</td>
								<td>${communityBoard.title }</td>
								<td>${communityBoard.nickname }</td>
								<td>${communityBoard.id }</td>
								
								<td>${communityBoard.membership }</td>
								<td>${communityBoard.regDate }</td>
								<td>${communityBoard.views }</td>
								<td>${communityBoard.good }</td>
								<td>${communityBoard.bad }</td>
								
								<td>${communityBoard.report }</td>
								<td>${communityBoard.jjim }</td>
								<td>${communityBoard.edit }</td>
								<td>${communityBoard.del }</td>
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


