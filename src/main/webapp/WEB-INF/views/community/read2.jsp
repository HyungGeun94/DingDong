<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <meta charset="UTF-8">
    <title>Welcome!</title>
    <%@ include file="../include/head.jsp" %>
</head>
<style>




</style>
<body>



${good}

${member}

${member.id}
------확인>>>>><br>

<div class="frame">

    <!-- header -->


    <!--  nav -->
    <%@ include file="../include/nav.jsp" %>

    <!-- container -->
    <div class="container">






        <!-- 여기부터   -->
        <form>


            보드 번호
            <input type="text" name="title" value="${communityVO.boardNum}" readonly> </br>

            제목 <input type="text" name="title" value="${communityVO.title}" readonly> </br>
            <span class="button gray medium"> <a href="#" onclick="clip(); return false;">URL 주소 복사 </a></span><br>
            <!-- <textarea cols="100" rows="10" name="content" readonly>${communityVO.content} </textarea><br> -->
            본문내용
            <div id="content">
            <p>${communityVO.content }</p>
            </div>

            닉네임<input type="text" name="nickname" value="${communityVO.nickname}" readonly> <br>
            아이디<input type="text" name="id" value="${communityVO.id}" readonly> <br>

            등록일자<input type="text" name="regDate" value="${communityVO.regDate}" readonly>
            <c:if  test="${communityVO.edit==1 }"> (수정됨)</c:if><br>
            조회수<input type="text" name="views" value="${communityVO.views}" readonly>   <br>
            댓글수<input type="text" name="reply" value="${communityVO.reply}" readonly>   <br>

            좋아요<input type="text" name="good" id="good" value="${communityVO.good}" readonly>   <br>
            싫어요<input type="text" name="bad"  id="bad" value="${communityVO.bad}" readonly>   <br>

            url<input type="text" name="url" value="localhost:8080${contextPath}/community/read?boardNum=${communityVO.boardNum}" readonly>   <br>
            카테고리<input type="text" name="category" value="${communityVO.category}" readonly>   <br>



        </form>

        <button id="copyButton">내용 복사</button>
        <button id="goodBtn" >좋아요 ${communityVO.good} </button>
        <button id="badBtn">싫어요 ${communityVO.bad}</button>



        <script>
            document.getElementById("copyButton").addEventListener("click", function() {
                var content = document.getElementById("content").innerText;
                copyToClipboard(content);
                alert("내용이 클립보드에 복사되었습니다.");
            });

            function copyToClipboard(text) {
                var textarea = document.createElement("textarea");
                textarea.value = text;
                document.body.appendChild(textarea);
                textarea.select();
                document.execCommand("copy");
                document.body.removeChild(textarea);
            }
        </script>

        <c:choose>


        <c:when test="${member eq null}">

            <script>
                $('#goodBtn').on('click', function () {
                    alert("추천은 로그인 후에 가능해요.");
                });

                $('#badBtn').on('click', function () {
                    alert("추천은 로그인 후에 가능해요.");
                });

            </script>

        </c:when>

            <c:otherwise>


        <script>
            let goodval = "${good}";
            let badval = "${bad}"
            let boardNum = "${communityVO.boardNum}";
            let id = "${member.id}";
            let isLiked = ${good > 0 ? 'true' : 'false'};
            let disLiked = ${bad > 0 ? 'true' : 'false'};
            let goodNum = "${communityVO.good}";
            let badNum = "${communityVO.bad}";


            if(isLiked){
                $('#goodBtn').html("좋아요 취소" +goodNum);
            } else{
                $('#goodBtn').html("좋아요" +goodNum);

            }

            if(disLiked) {
                $('#badBtn').html("싫어요 취소" +badNum)
            } else{
                $('#badBtn').html("싫어요" +badNum)

            }







            start();



function start() {


    $('#goodBtn').click(function () {


        // 좋아요 상태에 따라 동작 결정
        if (isLiked) {
            // 좋아요 취소 요청을 서버에 보냄
            $.ajax({
                type: 'post',
                url: "${contextPath}/community/likeDown",
                dataType: "json",
                data: "boardNum=" + "${communityVO.boardNum}" + "&id=" + "${member.id}",
                success: function (data) {
                    // 좋아요 상태 변경
                    isLiked = false;
                    // 버튼 텍스트 변경
                    $("#goodBtn").html("좋아요 "+data);
                },
                error: function (data) {
                    alert(data + "위쪽");
                }
            });
        } else if(!isLiked && !disLiked){
            // 좋아요 요청을 서버에 보냄
            $.ajax({
                type: 'post',
                url: "${contextPath}/community/likeUp",
                dataType: "json",
                data: "boardNum=" + "${communityVO.boardNum}" + "&id=" + "${member.id}",
                success: function (data) {
                    // 좋아요 상태 변경
                    isLiked = true;
                    // 버튼 텍스트 변경
                    $("#goodBtn").html("좋아요 취소"+data);
                },
                error: function (data) {
                    alert(data + "아래쪽");
                }
            });
        }
    });

    $('#badBtn').click(function() {
        if(disLiked){

            $.ajax({
                type: 'post',
                url: "${contextPath}/community/dislikeDown",
                dataType: "json",
                data: "boardNum=" + boardNum + "&id=" + id,
                success: function(data) {
                    disLiked = false;
                    $("#badBtn").html("싫어요"+data);
                },
                error: function(data) {
                    alert("read//dislikeDown.jsp에러야");
                }
            });


        }
        else if(!disLiked && !isLiked){
            $.ajax({
                type: 'post',
                url: "${contextPath}/community/dislikeUp",
                dataType: "json",
                data: "boardNum=" + boardNum + "&id=" + id,
                success: function(data) {
                    disLiked= true;
                    $("#badBtn").html("싫어요 취소"+data);
                },
                error: function(data) {
                    alert("read//dislikeUp.jsp에러야");
                }
            });
        }
     });
}
        </script>
            </c:otherwise>

        </c:choose>


        <script type="text/javascript">

            function clip(){

                var url = '';
                var textarea = document.createElement("textarea");
                document.body.appendChild(textarea);
                url = window.document.location.href;
                textarea.value = url;
                textarea.select();
                document.execCommand("copy");
                document.body.removeChild(textarea);
                alert("URL이 복사되었습니다.")



            }








        </script>


        <c:choose>
            <c:when test="${member.id eq communityVO.id}">


                <form role="form">
                    <input type="hidden" id="boardNum" name="boardNum" value="${communityVO.boardNum}">
                    <button id = "modify_btn">수정</button>
                    <button id = "delete_btn">삭제</button>
                </form>


                <script>
                    var formObj = $("form[role='form']");


                    $("#modify_btn").click(function (){
                        var boardNum = $("#boardNum").val();

                        formObj.attr("action","${contextPath}/community/update");
                        formObj.attr("method","get");
                        formObj.submit();
                    });

                    $("#delete_btn").click(function (){

                        var result = confirm("정말로 삭제하시겠습니까?");

                        // 사용자가 확인을 선택한 경우
                        if (result) {
                            // 삭제를 수행하는 AJAX 요청 등의 코드를 추가할 수 있습니다.
                            formObj.attr("action", "${contextPath}/community/delete");
                            formObj.attr("method", "post");
                            formObj.submit();
                        } else {
                            history.back();
                            // 사용자가 취소를 선택한 경우 아무 동작도 수행하지 않습니다.
                        }

                    });

                </script>


            </c:when>


            <c:when test="${member ne null}">


            </c:when>

            <c:otherwise>
                <a href="${contextPath}/login">수정하기</a>
                <a href="${contextPath}/login">삭제하기</a>
            </c:otherwise>
        </c:choose>
        <!--  여기까지 지우고 구현하세용 -->

    </div>



</div>

<!-- footer -->
<%@ include file="../include/footer.jsp" %>

</body>
</html>


