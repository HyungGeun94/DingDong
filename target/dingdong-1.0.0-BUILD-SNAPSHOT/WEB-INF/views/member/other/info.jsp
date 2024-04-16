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
</head>

<body>
<!--  nav -->
<%@ include file="../../include/nav.jsp" %>
		
		
	<div class="frame">

		<!-- header -->
		

		
		<!-- container -->
		<div class="container" align="center">
		
			<!--  mypage nav -->
			<%@ include file="../include/otherNav.jsp" %>
			<br>
			
			<!--  새별: 글 누르면 작성 글 리스트가 보이고 댓글을 누르면 작성 댓글 리스트가 보임 -->
			<!--  ajax로 구현하면 좋을듯함 현재 그냥 페이지 들어올 때 list 둘 다 들고와서 뷰에 뿌리기만 함.(24/03/06) -->
			<!--  글 -->
			<div id="boardDiv" style="width:80%">
					
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 게시글
						</div>
						
						<div class="card-body">
						
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>번호</th>
										<th>카테고리</th>
										<th>제목</th>
										<th>작성자</th>
										
										<th>회원 전용</th>
										<th>작성 날짜</th>
										<th>조회수</th>
										<th>좋아요</th>
										<th>싫어요</th>
										
										<th>신고</th>
										<th>스크랩</th>
									
									</tr>
								</thead>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>작성자</th>
									
									<th>회원 전용</th>
									<th>작성 날짜</th>
									<th>조회수</th>
									<th>좋아요</th>
									<th>싫어요</th>
									
									<th>신고</th>
									<th>스크랩</th>
								</tr>
							</tfoot>
					<tbody>
					<c:forEach var="communityBoard" items="${otherCommunityBoard}">
							<tr>
								<td>${communityBoard.boardNum }</td>
								<td>${communityBoard.category }</td>
								<td><p style="text-overflow: ellipsis; width: 100px; white-space: nowrap; /* 줄바꿈 방지 */ overflow: hidden; /* 넘치는 부분 감춤 */" ><a href="${contextPath }/community/read?boardNum=${communityBoard.boardNum}">${communityBoard.title }</a></p></td>
								<td>${communityBoard.nickname }</td>
								<td>${communityBoard.membership }</td>
								<td>${communityBoard.regDate }</td>
								<td>${communityBoard.views }</td>
								<td>${communityBoard.good }</td>
								<td>${communityBoard.bad }</td>
								<td>${communityBoard.report }</td>
								<td>${communityBoard.jjim }</td>
							</tr>
					</c:forEach>
					</tbody>
						</table>
						
					</div>
					
					
				</div>
			</div><!--  board Div -->
			
			
			
			<!--  댓글 -->
			<div id="replyDiv" style="display:none"> 
				<h1>댓글 여기</h1>
			</div><!-- reply Div -->
			
			
			
						
						
			</div> <!-- container -->







		</div> <!--  container -->
		
	
	<!-- footer -->
	<%@ include file="../../include/footer.jsp" %>
	
</div> <!--  frame -->

<!--  <script src="${contextPath }/resources/member/js/mypage.js"></script> -->

<script>




$("#image-box").hover(function() {
	$("#profile-img").css('opacity', '0.5');
}, function(){
	$("#profile-img").css('opacity', '1');
})


//버튼 hover
const button = document.querySelectorAll(".link-btn");

for(let i=0;i<button.length;i++){
	button[i].addEventListener("mouseover", function(){
		button[i].classList.add("active");
	});
}

for(let i=0;i<button.length;i++){
	button[i].addEventListener("mouseout", function(){
		button[i].classList.remove("active");
	});
}


// 댓글 버튼 누르면 댓글 보임
$("#reply").click(function() {
	$("#replyDiv").css("display", "block");
	$("#boardDiv").css("display", "none");
})

// 글 버튼 누르면 글 보임
$("#board").click(function() {
	$("#boardDiv").css("display", "block");
	$("#replyDiv").css("display", "none");
})


</script>

<%@include file="../include/script.jsp" %>

</body>
</html>