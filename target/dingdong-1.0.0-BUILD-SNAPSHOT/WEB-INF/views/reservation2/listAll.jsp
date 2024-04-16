<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>예약하기</title>

</head>

<!-- head -->
<%@include file="../include/head.jsp" %>

<body>
    
     <!-- nav-->
        <%@include file="../include/nav.jsp" %>
    
    
    <div class="frame" align="center">
   
       
        
    
        <!-- Section-->
        <section class="py-5">
        
        <!-- 새별: 순서는 branchList - listAll - detail - form(결제 ajax) - success(결제 성공 시) 입니다. -->
          <div class="container px-4 px-lg-5 mt-5">
         	 <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
	        	<c:forEach var="room" items="${roomList}">
	        
	  			 <div style="width: 20%; display: inline-block; margin: 50px">
								<div class="image-box" style="width: 100%; height: 20%; overflow:hidden; margin:0 auto">
									<img class="image-thumbnail" style="width:100%; height: 100%; object-fit: cover" src="${contextPath}/resources/images/room/${room.fileName}" alt="${room.name}">
								</div>
								
								<br>
								<h3><strong>${room.name}</strong></h3><br>
								<strong>${room.cost}원</strong> /시간<br>
								<hr>
								${room.content}
								<br>
								<br>
								
								<form action="${contextPath }/reservation2/detail" method="post">
								<input type="hidden" name="studyroom" value="${studyroom}"/>
								<input type="hidden" name="roomNumber" value="${room.roomNumber}"/>
									<button class="btn btn-light" type="submit">선택
									</button>
										
								</form>
							</div>
	        
	        
	        	</c:forEach>
        
		        </div>
		    </div>
		</section>
	
        
	</div>


	<!-- Footer-->
		<%@include file="../include/footer.jsp" %>
</body>
</html>
