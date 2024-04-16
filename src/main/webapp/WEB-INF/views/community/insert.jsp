<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

    <link rel="stylesheet" href="${contextPath }/resources/summernote/summernote-lite.css">

    <meta charset="UTF-8">

    <%@ include file="../include/head.jsp" %>



</head>
<body>

<div class="frame">

    <!-- header -->


    <!--  nav -->
    <%@ include file="../include/nav.jsp" %>
	
	<div class="middle">	
		<!-- Left side column. -->
  		<div class="leftform">
		</div>
    <!-- container -->
    <div class="communitymarginform">
        <!-- 여기부터   -->
		<form method="post" action="${contextPath}/community/insert" style="margin-top: 40px;">
			<div style="display: flex; ">
				<h2 style="font-size: 30px">작성하기</h2>
				<img style="width: 28px; height: 28px; margin-top: 5px; margin-left: 5px;" src="${contextPath }/resources/bootstrap/image/pen.png">
			</div>
			<div class="inserteachform">
				<span style="color: #374151; font-size: 14px;">토픽</span>
			    <select name="category" style="width: 788px; padding: 8px 40px 8px 8px; margin: 4px 0px 0px; border-radius: 0.375rem; border: 1px solid #ced4da; box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);">
			        <option value=0 selected>커뮤니티</option>
			        <option value=1 name="q&a" disabled>Q&A</option>
			        <option value=2 name="used" disabled>중고거래</option>
			        <option value=3 name="uncomfortable" disabled>불편사항</option>
			    </select>
		    </div>
			
			<div class="inserteachform">
				<span style="color: #374151; font-size: 14px;">제목</span>
			    <input class="form-control" placeholder="제목을 입력해주세요." style="width: 784px; margin: 4px 0px 0px; padding: 8px 40px 8px 12px; box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);" name="title" required/>
		    </div>
			
			<div class="inserteachform">
				<span style="color: #374151; font-size: 14px;">공개 범위</span>
			    <select name="membership" style="width: 788px; padding: 8px 40px 8px 8px; margin: 4px 0px 0px; border-radius: 0.375rem; border: 1px solid #ced4da; box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);">
			        <option value=0>전체공개</option>
			        <option value=1>회원에게만 공개</option>
			    </select>
			</div>
			
			<div style="margin-top: 25px;">
				<span style="color: #374151; font-size: 14px;">본문</span>
				<div style="margin-top: 4px;">
		    	<textarea id="summernote" name="content" required></textarea>
		    	</div>
			</div>
			
		    <input type="hidden" name="nickname" value="${member.nickname}"> <br>
		    <input type="hidden" name="id" value="${member.id}">   <br>
			
			<div style="display: flex; justify-content: flex-end; column-gap: 0.75rem; margin-bottom: 60px;">
				<button style="border: none; background-color: #fff; padding: 8px 16px; font-size: 14px; width: 48px; border: 1px solid #ced4da; box-shadow: 0 1px 2px 0 rgba(0,0,0,.05); border-radius: 0.375rem;" onclick="location.href='#'">취소</button>
		    	<button class="btn btn-primary" style="padding: 8px 27px; border-radius: 0.375rem; font-size: 14px;">등록</button>
			</div>
			
		</form>
        <!--  여기까지 지우고 구현하세용 -->

    </div>


	<!-- Right side column. -->
  	<%@ include file="../include/right.jsp" %>	
	</div>
</div>

<!-- footer -->
		<%@ include file="../include/footer.jsp" %>


<script>
    $(document).ready(function() {

//	summernote 에디터 설정
        $('#summernote').summernote({
        	width: 838,
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true,
            lang: "ko-KR",
            placeholder: '내용을 입력하세요.',
//		 에디터 리사이즈 금지
            disableResizeEditor : true,
//		  콜백 함수
//		  omImageUpload 이미지가 업로드 되었을 때 실행되는 함수
            callbacks : {
                onImageUpload: function (files, editor, welEditable){

                    // 여러개의 이미지 업로드
                    for (var i = files.length - 1; i >= 0; i--) {
                        var fileName = files[i].name

                        uploadSummernoteImageFile(files[i], this, fileName)
                    }// for
                }// onImageUpload
            }// callbacks


        }); // summernote
    });


    // 이미지 업로드 ajax
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
                $("#summernote").summernote(
                    'insertImage', data.url
                )
            },
        })
    }

</script>



<script src="${contextPath }/resources/summernote/summernote-lite.js"></script>
<script src="${contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>
</body>
</html>

