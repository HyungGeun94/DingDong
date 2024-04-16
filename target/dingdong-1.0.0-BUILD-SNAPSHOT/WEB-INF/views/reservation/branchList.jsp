<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>branch listAll</title>
</head>
<%@ include file="../include/head.jsp"%>


<style>
* {
	padding: 0;
	margin: 0;
	border: none;
}

body {
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
	text-align: center;
}

.table-group-divider{
	max-width: 50%;
	vertical-align:  center;
}

/* 카드 전체*/
.card-img-top{
	width: 100px;
	height: 100px;
}

/*카드 이미지*/
.card-img-top{
	width: 250px;
	height: 350px;

}

.card {
	width: 250px;
	flex: none;
}
</style>

</head>
<body>
	<div class="frame">

		<header>
			<!-- header -->
		</header>

		<!--  nav -->
		<nav>
			<%@ include file="../include/nav.jsp"%>
		</nav>
		<caption ><h2> 오늘도 즐거운 하루 보내길 </h2></caption>
 		<table class="table" style="width: 850px;">
    <thead>
        <tr>
            <th colspan="3">지점선택</th>
            <td><input type="hidden" class="hidden-id" value="${member.id}"></td>
        </tr>
    </thead>
    <tbody class="table-group-divider">
        <c:forEach items="${branchList}" var="studyRoomDTO" varStatus="status">
	        <th scope="row">
			 	<td><B>${studyRoomDTO.studyroom}</B></td>
            <c:if test="${status.index % 3 == 0}">
            </c:if>
	        </th>
            <td style="width: 250px;">
                <div class="card">
                    <img src="${contextPath}/resources/images/studyroom/br_1.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h2 class="card-title">${studyRoomDTO.name}</h2>
                        <p class="card-text">${studyRoomDTO.content}</p>
                        <a href="${contextPath}/reservation/roomList?studyroom=${studyRoomDTO.studyroom}" class="btn btn-primary">예약하기</a> 
                        <button type="button" class="btn btn-outline-light" onclick="location.href='${contextPath}/reservation/studyRoomUpdate?studyroom=${studyRoomDTO.studyroom}'">수정하기</button>
                    </div>
                </div>
            </td>
            <c:if test="${status.index % 3 == 2 or status.last}">
                </tr>
            </c:if>
        </c:forEach>
    </tbody>
</table>		
 	</div>
 	<div>
		<button type="button" class="btn btn-warning" onclick="location.href='${contextPath}/reservation/studyRoomInsert'">추가하기</button>
 	</div>
 	
 <%@ include file="../include/footer.jsp" %>
 
<script>

	$(document).ready(function(){
		console.log("hey");
	
		//root 속성에만 버튼 활성화
		// hidden-id 클래스를 가진 요소에서 아이디 가져오기
	    //수정하기
		var id = $(".hidden-id").val();
	    console.log("아이디:", id);
	
	    // 가져온 아이디가 "root"인 경우 버튼 활성화
	    if(id == "root") {
	        $(".btn.btn-outline-light").prop('disabled', false); // 활성화
	        $(".btn.btn-warning").prop('disabled', false); // 활성화
	        console.log("버튼을 활성화합니다.");
	    } else {
	        $(".btn.btn-outline-light").prop('disabled', true); // 비활성화
	        $(".btn.btn-warning").prop('disabled', true); // 비활성화
	        console.log("버튼을 비활성화합니다.");
	    };
	    
	    
				
				
	});

</script>
</body>
</html>