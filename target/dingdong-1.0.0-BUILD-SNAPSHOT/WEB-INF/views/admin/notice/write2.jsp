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
            
            
            <div id="layoutSidenav_content" style="margin:100px">


			<main>
			
				<!--  form 방식 -->
				<%-- <form action="${contextPath }/admin/notice/uploadAction" method="post" enctype="multipart/form-data">
				
					제목 <input class="form-control" type="text"/>
					<br>
					내용 <textarea class="form-control" style="heigth:500px"></textarea>
					<br>
					<input type="file" name="uploadFile" multiple><br>
					<br>
					<button class="btn btn-primary" type="submit">작성</button>
				
				</form> --%>
				
				
				<div class="uploadDIv">
					<input type="file" name="uploadFile" multiple/>
				</div>
				<br>
				<button class="btn btn-primary" id="uploadBtn">업로드</button>
			</main>





<!--  footer -->
<%@ include file="../include/footer.jsp" %>
                
                
            </div>
    </div>
        
        
<%@include file="../include/script.jsp" %>

<script>

$(document).ready(function(){
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 524880; // 5MB
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("5MB 이상의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("exe, sh, zip, alz는 업로드할 수 없습니다.");
			return false;
		}
		
		return true;
		
	}
	
	
	
	$("#uploadBtn").on("click", function(e){
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		console.log(files);
		
		for(var i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		
		var url = "/dingdong/admin/notice/uploadAction";
		
		$.ajax({
			url : url,
			processData : false,
			contentType : false,
			data : formData,
			type : 'post',
			success : function(result){
				alert('Uploaded');
			}
		})
		
	})
})
</script>
</body>
</html>


