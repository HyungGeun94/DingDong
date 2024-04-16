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

    <!-- container -->
    <div class="container">

        <!-- 여기부터   -->



<c:choose>
    <c:when test="${member.id ne communityVO.id }">

        <script>
        $(document).ready(function () {
        alert("당신 글이 아니야 ~~ 권한이 없습니다");
        history.back();
        });//end of $(document).ready()
        </script>
    </c:when>

    <c:otherwise>




        <form role="form" method="post" action="${contextPath}/community/update">

            <input type="text" name="title" value="${communityVO.title}" required>


            <select name="category">
                <option value=0 selected>커뮤니티게시판</option>
                <option value=1 name="q&a" disabled>Q&A</option>
                <option value=2 name="used" disabled>중고거래</option>
                <option value=3 name="uncomfortable" disabled>불편사항</option>
            </select>

            <br>

            <select name="membership">
                <option value=0>전체공개</option>
                <option value=1>회원에게만 공개</option>
            </select>


            <textarea id="summernote" name="content" required></textarea>

            <input type="hidden" id="boardNum" name="boardNum" value="${communityVO.boardNum}">
            <input type="hidden" name="nickname" value="${member.nickname}"> <br>
            <input type="hidden" name="id" value="${member.id}">   <br>



            <button type="submit">수정</button>
            <button id="cancel_btn" >취소</button>





        </form>

        <script>
            var formObj = $("form[role='form']");

            $("#cancel_btn").click(function (){
                formObj.attr("action","${contextPath}/community/read?boardNum=" +$("#boardNum").val() );
                formObj.attr("method","get");
                formObj.submit();
            });
        </script>



            </c:otherwise>
    </c:choose>


        <!--  여기까지 지우고 구현하세용 -->




    </div>



</div>



<script>
    $(document).ready(function() {

//	summernote 에디터 설정
        $('#summernote').summernote({
            height: 1000,
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

        $("#summernote").summernote('code',  '${communityVO.content}');
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

