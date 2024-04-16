<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<br>
<br>
	
	<div align="center" style="max-width:35%">
		
		<div class="rounded-circle" id="image-box" style="width: 100px; height: 100px; overflow:hidden; margin:0 auto">
			<img style="width:100%; height: 100%; object-fit: cover" id="profile-img" src="${contextPath}/resources/images/profile/${info.profile}" alt="프로필 사진">
		</div>
		
		<br>
			<div style="font-size:20pt; font-weight: bold;">${info.nickname }</div>
			<div style="font-size:12pt">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pin-angle" viewBox="0 0 16 16">
				  <path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a6 6 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707s.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a6 6 0 0 1 1.013.16l3.134-3.133a3 3 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146m.122 2.112v-.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a5 5 0 0 0-.288-.076 5 5 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a5 5 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034q.172.002.343-.04L9.927 2.028q-.042.172-.04.343a1.8 1.8 0 0 0 .062.46z"/>
				</svg>
				  활동 점수 ${info.point }점
			 	</div>
			
		<br>
	
	</div>

<nav style="width:60%">
<hr>
<ul class="nav nav-pills nav-fill">
  
  <li class="nav-item">
    <a class="nav-link link-btn" href="#" id="board">작성 게시글</a>
  </li>
  <li class="nav-item">
    <a class="nav-link link-btn" href="#" id="reply">작성 댓글</a>
  </li>
  <li class="nav-item">
    <a class="nav-link link-btn" href="#" id="reply">스크랩</a>
  </li>
</ul>
<hr>
</nav>



