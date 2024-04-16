<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="../include/head.jsp" %>

<!-- summernote  -->
<link rel="stylesheet" href="${contextPath }/resources/summernote/summernote-lite.css">


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


			<main style="margin:100px">
			
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
				
				
				
				
				<form method="post" action="${contextPath }/admin/notice/insert">
					<input class="form-control" placeholder="제목" style="width:100%" name="title" required/>
					<br>
					<textarea id="summernote" name="content" required></textarea>
					<br>
					<button class="btn btn-primary">작성</button>
				</form>
				
				
				
				<br>
				<br>
				
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

<!--  summernote -->
<script src="${contextPath }/resources/summernote/summernote-lite.js"></script>
<script src="${contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>
<script>

$(document).ready(function() {
	
//	summernote 에디터 설정 
	$('#summernote').summernote({
		  height: 400,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '내용을 입력하세요.',	//placeholder 설정
//		 이미지 리사이즈 금지 
		  disableResizeEditor : true,
//		  콜백 함수
//		  omImageUpload 이미지가 업로드 되었을 때 실행되는 함수
		  callbacks : {
			 onImageUpload: function (files, editor, welEditable){
				 
				 	// 여러개의 이미지를 업로드할 경우 
				    for (var i = files.length - 1; i >= 0; i--) {
                        var fileName = files[i].name
                        // 이미지 alt 속성 삽일을 위한 설정
                        // alert 창 띄워서 이미지 alt 속성 입력받음 
                        /* 
                        var caption = prompt('이미지 설명 :', fileName)
                        if (caption == '') {
                            caption = '이미지'
                        }
                         */
                         
                         
                        uploadSummernoteImageFile(files[i], this, fileName)
                    }// end of for
			 }// end of  onImageUpload
		 }// end of callbacks 
		 
	
	}); // summernote
	
	
	// 이미지 업로드 함수 ajax 활용
    function uploadSummernoteImageFile(file, el, caption) {
        data = new FormData()
        data.append('file', file)
        $.ajax({
            data: data,
            type: 'POST',
            url: 'uploadSummernoteImageFile',
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            dataType : 'json',
            success: function (data) {
            	console.log(data);
            	console.log(data.url);
            	console.log(data.responseCode);
            	/* 
            	setTimeout(	function() { 
            		$("#summernote").summernote(
            	'insertImage', data.url
                )}, 6000);
             	*/
            	
                $("#summernote").summernote(
                    'insertImage', data.url
                 );
            },
        })
    }
	
	
	
	
	
}); // document.ready




</script>

</body>
</html>


