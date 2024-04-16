<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<head>
<style>

.nav-link {
	width: 232px !important;
	height: 40px;
	padding: 8px 12px;
	color: #6B7280;
	font-size: 16px;
	text-align: left;
	display: flex;
	align-items: center;
	border-radius: 8px !important;
}

.nav-link:hover {
	background-color: #F3F4F6 !important;
	color: #1F2937 !important;
}

.nav-link:focus {
	color: #0090F9;
}

.nav-link:hover .profileicon {
	filter: invert(12%) sepia(58%) saturate(362%) hue-rotate(174deg) brightness(91%) contrast(92%);
}


</style>
</head>

<br>
<nav style="position: sticky">
<ul class="nav nav-pills nav-fill">
  <li class="nav-item">
    <a class="nav-link link-btn" href="${contextPath}/member/mypage">
    	<img class="profileicon" src="${contextPath}/resources/bootstrap/image/profileicon.png" style="width: 24px; height: 24px; margin-right: 6px;">
    	<span>프로필</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link link-btn" href="${contextPath }/member/board/community"><span>작성 게시글</span></a>
  </li>
  <li class="nav-item">
    <a class="nav-link link-btn" href="#"><span>작성 댓글</span></a>
  </li>
    <li class="nav-item">
    <a class="nav-link link-btn" href="${contextPath }/member/reservation"><span>예약 내역</span></a>
  </li>
   <li class="nav-item">
    <a class="nav-link link-btn" href="#"><span>스크랩</span></a>
  </li>
    <li class="nav-item">
    <a class="nav-link link-btn" href="${contextPath }/member/quit"><span>회원 탈퇴</span></a>
  </li>
</ul>
</nav>



