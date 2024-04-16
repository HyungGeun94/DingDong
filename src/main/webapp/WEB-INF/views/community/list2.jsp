<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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
			


		<div>
			<!-- 여기부터   -->
			<table>
				<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				</thead>
			</table>

			<c:forEach items="${boardList}" var="list">

				<tr>
					<td>${list.boardNum}</td>
					<td><a href="${contextPath}/community/read?boardNum=${list.boardNum}">${list.title}</a></td>
					<td>${list.nickname}</td>
					<td>${list.regDate}</td>
					<td>${list.views}</td>
					<br>
				</tr>

			</c:forEach>

			<div>
					<select name="searchType">
						<option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
						<option value="content" <c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
						<option value="title_content" <c:if test="${searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
						<option value="id" <c:if test="${searchType eq 'id'}">selected</c:if>>아이디</option>
					</select>
				<input type="text" name="keyword" value="${keyword}"/>
				<button type="button" id="searchBtn" >검색</button>
			</div>

			<script>
				document.getElementById("searchBtn").onclick = function () {
					let searchType = document.getElementsByName("searchType")[0].value;
					let keyword = document.getElementsByName("keyword")[0].value;

					location.href="${contextPath}/community?num=1"+"&searchType="+searchType+"&keyword="+keyword;

				}

			</script>


			<div class="container">

				<c:choose>
					<c:when test="${member ne null }">
						<a href="${contextPath}/community/insert">글 쓰기</a>
					</c:when>
					<c:otherwise>
						<a href="${contextPath}/login">글 쓰기</a>
					</c:otherwise>
				</c:choose>
			</div>

			<div>
				<c:if test="${page.prev}">
					<span>[<a href="${contextPath}/community?num=${page.startPageNum-1}${page.searchTypeKeyword}">이전</a>]</span>
				</c:if>

				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				<span>
					<c:if test="${select != num}">

						<a href="${contextPath}/community?num=${num}${page.searchTypeKeyword}">${num}</a>



					</c:if>
					<c:if test="${select == num}">
						<b>${num}</b>

					</c:if>
				</span>
				</c:forEach>

				<c:if test="${page.next}">
					<span>[<a href="${contextPath}/community?num=${page.endPageNum+1}${page.searchTypeKeyword}">다음</a>]</span>
				</c:if>



			</div>




<%--			<c:forEach begin="1" end="${pageNum}" var="num">--%>
<%--				<span>--%>
<%--					<a href = "${contextPath}/community?num=${num}">${num}</a>--%>
<%--				</span>--%>


<%--			</c:forEach>--%>
			
		
		
		
		</div>
		
		
		
	</div>
	
	<!-- footer -->
		<%@ include file="../include/footer.jsp" %>

</body>
</html>