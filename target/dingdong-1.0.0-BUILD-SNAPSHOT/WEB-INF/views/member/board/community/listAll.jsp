<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="../../../include/head.jsp" %>
<title>my board</title>

<!--  admin stylesheet -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />

</head>
<body>
<!--  nav -->
<%@ include file="../../../include/nav.jsp" %>
<div class="middle" style="margin-top: 2.5rem; margin-left: auto; margin-right: auto;">
<!--  mypage Nav -->
		<div class="leftform" style="width: 256px !important;border-right: 1px solid #dee2e6;" >
         	<%@ include file="../../include/mypageNav.jsp" %>
      	</div>     
            
<div class="frame">



	<!-- container -->
		<div class="container">
		

	<div class="container-fluid px-4" >
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 게시글
			</div>
			
			<div class="card-body">
			
				<table id="datatablesSimple" style="border:1px">
					<thead>
						<tr>
						
							<th>번호</th>
							<th>카테고리</th>
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
							
							<th>삭제</th>
							
							
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
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
							
							<th>삭제</th>
						</tr>
					</tfoot>
					
					
					<tbody>
						<c:forEach var="communityBoard" items="${myCommunityBoard}">
							<tr>
								<td>${communityBoard.boardNum }</td>
								<td>${communityBoard.category }</td>
								<td><p style="text-overflow: ellipsis; width: 100px; white-space: nowrap; /* 줄바꿈 방지 */ overflow: hidden; /* 넘치는 부분 감춤 */" ><a href="${contextPath }/community/read?boardNum=${communityBoard.boardNum}">${communityBoard.title }</a></p></td>
								<td>${communityBoard.nickname }</td>
								<td>${communityBoard.id }</td>
								
								<td>${communityBoard.membership }</td>
								<td>${communityBoard.regDate }</td>
								<td>${communityBoard.views }</td>
								<td>${communityBoard.good }</td>
								<td>${communityBoard.bad }</td>
								
								<td>${communityBoard.report }</td>
								<td>${communityBoard.jjim }</td>
								<c:choose>
									<c:when test="${communityBoard.del eq 1 }">
										<td style="background-color: lightpink;">${communityBoard.del }</td>
									</c:when>
									<c:otherwise>
										<td>${communityBoard.del }</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					
				
			</div>
			
			
		</div>
	</div>

</div>


</div>
</div>
<!--  footer -->
<%@ include file="../../../include/footer.jsp" %>
             
<!--  admin bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/admin/assets/demo/chart-area-demo.js"></script>
<script src="${contextPath}/resources/admin/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/admin/js/datatables-simple-demo.js"></script>
                

</body>
</html>


