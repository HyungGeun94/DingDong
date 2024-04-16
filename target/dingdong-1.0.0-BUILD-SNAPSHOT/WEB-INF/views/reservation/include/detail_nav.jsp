<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.nav{
	width: 100%;
	position: sticky;
	top: 0px;
}

.nav-tabs{
	width: 100%;
	font-size: 14px;
	text-teansform: uppercase;
	display: flex;
	magin: 0 0px;
	padding: 10;
}

.nav-link{
	width: 100%;
	color: black;
	text-align: center;
	margin: 0 auto;
	padding: 15px;
}

.nav-link:hover{
	background-color:purple;

}

.nav-link:active{
	background-color:yellow;
	box-shadow: 0 0 0 3px black;
}

.nav-link:focus{
	background-color:red;

}

.reservation {
	width: 100%;
}

</style>
	<div class="nav">
		<div class="reservation">
		  <div class="nav-tabs" id="nav-tab" role="tablist" style="background-color: #fff;">
		    <button class="nav-link" id="spaceIntroduction-tab" data-bs-toggle="tab" data-bs-target="#spaceIntroduction" type="button" role="tab" aria-controls="spaceIntroduction" aria-selected="true">공간소개</button>
		    <button class="nav-link" id="facilitiesInformation-tab" data-bs-toggle="tab" data-bs-target="#facilitiesInformation" type="button" role="tab" aria-controls="facilitiesInformation" aria-selected="false">시설안내</button>
		    <button class="nav-link" id="caution-tab" data-bs-toggle="tab" data-bs-target="#caution" type="button" role="tab" aria-controls="caution" aria-selected="false">유의사항</button>
		    <button class="nav-link" id="returnPolicy-tab" data-bs-toggle="tab" data-bs-target="#returnPolicy" type="button" role="tab" aria-controls="returnPolicy" aria-selected="false">환불정책</button>
		    <button class="nav-link" id="inquiry-tab" data-bs-toggle="tab" data-bs-target="#inquiry" type="button" role="tab" aria-controls="inquiry" aria-selected="false">1:1문의</button>
		    <button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review" type="button" role="tab" aria-controls="review" aria-selected="false">리뷰</button>
		    <!-- <button class="nav-link" id="disabled-tab" data-bs-toggle="tab" data-bs-target="#disabled" type="button" role="tab" aria-controls="disabled" aria-selected="false" disabled>Disabled</button> -->
		  </div>
		</div>
	</div>
</html>