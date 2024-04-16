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
<style>
p {
	padding: 6px 0px;
	color: #374151;
	font-size: 16px;
	
}

button {
	border: none;
	background-color: #fff;
	padding: 0;
	margin: 0;
}

.likebtn {
   width: 110px;
   height: 70px;
   border: 2px solid #B9BAC4;
   border-right: none;
   border-radius: 20px 0px 0px 20px;
   font-size: 20px;
   font-weight: 600;
   box-shadow: 0 0 3px 2px rgba(0,0,0,.05);
   display: flex;
   align-items: center;
   cursor: pointer;
   position: relative;
}

.likeimg {
	width: 30px;
	height: 30px;
	margin-left: 20px;
	filter: invert(84%) sepia(8%) saturate(239%) hue-rotate(197deg) brightness(90%) contrast(86%);
}

.likenum {
	font-size: 28px;
	margin-left: 14px;
	color: #B9BAC4;
}

.dislikebtn {
   width: 110px;
   height: 70px;
   border: 2px solid #B9BAC4;
   border-radius: 0px 20px 20px 0px;
   font-size: 20px;
   font-weight: 600;
   box-shadow: 1px 1px 3px 1px rgba(0,0,0,.05);
   display: flex;
   align-items: center;
   cursor: pointer;
}

.dislikenum {
	font-size: 28px;
	margin-left: 27px;
	color: #B9BAC4;
}

.dislikeimg {
	width: 30px;
	height: 30px;
	margin-left: 14px;
	filter: invert(84%) sepia(8%) saturate(239%) hue-rotate(197deg) brightness(90%) contrast(86%);
}

.clicked {
	filter: invert(36%) sepia(83%) saturate(572%) hue-rotate(293deg) brightness(96%) contrast(103%);
}

.clicked2 {
	filter: invert(29%) sepia(94%) saturate(2261%) hue-rotate(199deg) brightness(94%) contrast(83%);
}

.clicked3 {
	
}

.paperairform {
   width: 200px;
   margin: 8px 0px 0px;
   display: none;
    position: absolute;
    top: 35px;
    right: 0;
}

.paperairform.show3 {
   display: block;
}

.paperair {
   width: 100%;
   padding: 16px 0px 4px;
   border: none;
   box-shadow:0 10px 15px -3px rgba(0,0,0,.1),0 4px 6px -4px rgba(0,0,0,.1), 0 0 0 1px rgba(0,0,0,0.05);
   background-color: #fff;
   border-radius: 0.375rem;
}

.paperaircancel {
	background-color: #fff;
	font-size: 14px;
	color: #111827;
	border: 1px solid rgb(209 213 219);
	padding: 6px 12px;
	border-radius: 0.375rem;
}

.paperairsend {
	background-color: #0090F9;
	font-size: 14px;
	color: #fff;
	margin-left: 6px;
	padding: 6px 12px;
	border-radius: 0.375rem;
}

.airplaneform {
	border: none;
   	width: 15px;
   	height: 15px;
   	padding: 0;
   	position: relative;
   	display: inline-block;
}

.airplane {
	width: 15px;
	height: 15px;
	cursor: pointer;
	object-fit: cover;
}

</style>
</head>
<body>

<div class="frame">

    <!--  nav -->
    <%@ include file="../include/nav.jsp" %>

    <div class="middle">
		<!-- Left side column. -->
  		<div class="leftform">
  		</div>
    	<!-- container -->
		<div class="datailcontainer">
			<a href="#"><img src="../resources/bootstrap/image/okkyAds3.png" class="mainads"></a>



        <!-- 여기부터   -->
        
        

			<div style="margin: 52px 0px 0px;">
				<div style="width: 100%;">
					<div class="boardpersonalinfoform">
						<div class="boardpersonalinfo">
							<img style="width:40px; height: 40px; object-fit: cover; border-radius: 9999px;" src="${contextPath }/resources/images/profile/${communityVO.profile}">
							<div style="margin-left: 0.5rem;">
								<div style="display: flex;">
			            			<a class="nickname2"  href="#">${communityVO.nickname }</a>
			            			<div class="forbtnbottomfixed2">
			            			<div class="airplaneform"><img class="airplane" src="${contextPath }/resources/bootstrap/image/paper.png"></div>
			            			<div class="paperairform" id="banner">
										<div class="paperair">
											<div style="display: flex;">
												<span style="padding-left: 6px; font-size: 12px; font-weight: 500; line-height: 24px;">받는분</span>
												<span style="font-size: 12px; font-weight: 500; line-height: 24px; margin-right: 4px;">:</span>
												<input style="height: 18px; font-size: 12px;" placeholder="${communityVO.nickname }">
											</div>
											<hr style="margin-bottom: 0;">
											<input style="width: 188px; height: 80px; border: none; outline: none; padding-left: 6px; padding-right: 6px;">
											<div style="display: flex; justify-content: flex-end; height: 32px;">
												<button class="paperaircancel">취소</button>
												<button class="paperairsend">보내기</button>
											</div>
										</div>
									</div>
									</div>
			            		</div>
								<div style="display: flex; align-items: center;">
									<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="like" viewBox="0 0 16 16" style=" float: left;">
				                    	<path d="M11.251.068a.5.5 0 0 1 .227.58L9.677 6.5H13a.5.5 0 0 1 .364.843l-8 8.5a.5.5 0 0 1-.842-.49L6.323 9.5H3a.5.5 0 0 1-.364-.843l8-8.5a.5.5 0 0 1 .615-.09z"/>
				                    </svg>
				                    <span style="height: 20px; float: left;">
										<span style="color: #374151; font-size: 14px; margin: 0px 0px 0px 1px; float: left; ">${communityVO.good}</span>
					                    <span style="color: #374151; font-size: 14px; margin: 0px 0px 0px 4px; float: left;">·</span>
						            	<span style="color: #374151; font-size: 14px; margin: 0px 0px 0px 4px; float: left;">${communityVO.regDate}</span>
						            	<c:if  test="${communityVO.edit==1 }"> (수정됨)</c:if>
						            	<span style="color: #374151; margin: 0px 0px 0px 4px; font-size: 14px; float: left;">·</span>
						            	<img src="${contextPath}/resources/bootstrap/image/조회수.svg" style="width: 18px; height: 18px; float: left; margin: 2px 0px 0px 4px;">
						            	<span style="color: #374151; font-size: 14px; margin: 0px 0px 0px 4px; float: left;">${communityVO.views}</span>
							            <input type="hidden" name="title12" value="${communityVO.boardNum}" readonly>
					            	</span>
					            </div>
				            </div>
				    	</div>
		            <div class="sirendownscrapform">
		            	<div style="height: 44px; display: flex; align-items: center;">
	                                <a href="#" id="reportBtn"><img class="siren" src="${contextPath}/resources/bootstrap/image/siren.png"></a>
	                    </div>
	                    <div style="height: 44px; display: flex; align-items: center;">
	                    	<a href="#"><img class="download" src="${contextPath}/resources/bootstrap/image/download.png"></a>
	                    </div>
	                    <div style="height: 44px; margin-left:5px; display: flex; align-items: center;">
	                    	<a href="#" id="jjimBtn"><img class="bookmark" src="${contextPath}/resources/bootstrap/image/bookmark.png"></a>
	                    </div>
		        	</div>
					</div>
	            </div>
			</div> <%-- 본문 네비 끝 --%>
			
			<div style="display: flex; justify-content: space-between;">
            	<h1 style="width: 650px;font-size: 30px; color: #111827; font-weight: 600; margin: 0px 0px; line-height: 44px; overflow-y: auto;">${communityVO.title}</h1>
	            <div style="height: 44px; line-height: 44px;">
	            <c:choose>
	            <c:when test="${member.id eq communityVO.id}">
	
	
	                <form role="form">
	                    <input type="hidden" id="boardNum" name="boardNum" value="${communityVO.boardNum}">
	                    <button id = "modify_btn" class="update">글 수정</button>
	                    <button id = "delete_btn" class="delete">글 삭제</button>
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
	                <a href="${contextPath}/login" class="update">글 수정</a>
	                <a href="${contextPath}/login" class="delete">글 삭제</a>
	            </c:otherwise>
	        	</c:choose>
	        	</div>
        	</div> <%-- 타이틀 끝 --%>
        	
            <!-- <textarea cols="100" rows="10" name="content" readonly>${communityVO.content} </textarea><br> -->
            <div style="width: 100%; display: flex; justify-content: flex-end;">
	            <div style=" display: flex;">
	           		<a style="text-decoration-line: none;" href="#" onclick="clip(); return false;">
		            	<img style="width: 13px; height: 13px;" src="${contextPath}/resources/bootstrap/image/urllink.png">
		           		<span style="color: #B9BAC4; font-size: 12px;" name="url">localhost:8080${contextPath}/community/read?boardNum=${communityVO.boardNum}</span>
	           		</a>
	            </div>
            </div>
            
			<div style="margin-top: 2rem; margin-bottom: 100px; padding: 4px 0px 0px;">
            	<p>${communityVO.content }</p>
			</div>
			<div style="width: 100%; display: flex; justify-content: center; margin-bottom: 80px; ">
            	<div class="likedislikeform">
                	<button class="likebtn" id="goodBtn" onclick="likeClicked()">
                		<img class="likeimg" src="${contextPath}/resources/bootstrap/image/thumbsup.png">
                		<span class="likenum">0</span>
                	</button>
	                <button id="badBtn" class="dislikebtn" onclick="dislikeClicked()">
	                	<span class="dislikenum">0</span>
	                	<img class="dislikeimg" src="${contextPath}/resources/bootstrap/image/thumbsdown.png">
	                </button>               
            	</div>
            </div>

            <input type="hidden" name="id" value="${communityVO.id}" readonly>
            <input type="hidden" name="good" id="good" value="${communityVO.good}" readonly>
            <input type="hidden" name="bad"  id="bad" value="${communityVO.bad}" readonly>
            <input type="hidden" name="jjim"  id="jjim" value="${communityVO.jjim}" readonly>
            <input type="hidden" name="reply" value="${communityVO.reply}" readonly>   <br>
            <input type="hidden" name="category" value="${communityVO.category}" readonly>   <br>




			
			<hr style="height: 0.5px;">
				
			<div style="width: 100%; height: 36px; margin: 20px 0">
		   		<span style="font-size: 14px; color: #111827; font-weight: inherit;">${replyCount}개의 댓글</span>
		   </div>
			<%@ include file="reply.jsp" %>
			
		
        <c:choose>


        <c:when test="${member eq null}">

            <script>
                $('#goodBtn').on('click', function () {
                    alert("좋아요는 로그인 후에 가능해요.");
                });

                $('#badBtn').on('click', function () {
                    alert("싫어요는 로그인 후에 가능해요.");
                });

                $('#jjimBtn').on('click', function () {
                    alert("찜은 로그인 후에 가능해요.");
                });

                $('#reportBtn').on('click',function(){
                    alert("신고는 로그인 후에 가능해요.");

                });

            </script>

        </c:when>

            <c:otherwise>


        <script>
            let goodval = "${communityVO.good}";
            let badval = "${communityVO.bad}"
            let boardNum = "${communityVO.boardNum}";
            let id = "${member.id}";
            let isLiked = ${good > 0 ? 'true' : 'false'};
            let disLiked = ${bad > 0 ? 'true' : 'false'};
            let goodNum = "${communityVO.good}";
            let badNum = "${communityVO.bad}";

            let jjimval = "${jjim}";
            let isjjim = ${jjim > 0 ? 'true' : 'false'};
            let jjimNum = ${communityVO.jjim};
            let isreport = ${isreport > 0 ? 'true' : 'false'};






            if(isLiked){
            	 var htmls = "<img class='likeimg clicked' src='${contextPath}/resources/bootstrap/image/thumbsup.png'>"
                     // $("#goodBtn").html(data);
            		 htmls += "<span class='likenum' style='color: #374151'>"
                	 htmls += goodval
                	 htmls += "</span>"
                     $("#goodBtn").html(htmls);
            } else{
                //$('#goodBtn').html(goodNum);
            	 var htmls = "<img class='likeimg' src='${contextPath}/resources/bootstrap/image/thumbsup.png'>"
                 // $("#goodBtn").html(data);
            		 htmls += "<span class='likenum'>"
            		 htmls += goodval
            		 htmls += "</span>"
                 $("#goodBtn").html(htmls);

            } // 여기가 read들어갔을때 나오는 뷰 좋아요

            
            if(disLiked) {
                    // $("#badBtn").html(data);
           		var htmls = "<span class='dislikenum' style='color: #374151'>"
               	htmls += badval
               	htmls += "</span>"
            	htmls += "<img class='dislikeimg clicked2' src='${contextPath}/resources/bootstrap/image/thumbsdown.png'>"
                $('#badBtn').html(htmls)
            } else{
            	// $("#badBtn").html(data);
           		var htmls = "<span class='dislikenum'>"
               	htmls += badval
               	htmls += "</span>"
            	htmls += "<img class='dislikeimg' src='${contextPath}/resources/bootstrap/image/thumbsdown.png'>"
                $('#badBtn').html(htmls)

            } // 여기가 read들어갔을때 나오는 뷰 싫어요

            if(isjjim){
                //$('#jjimBtn').html("찜 취소" +jjimNum)
                var htmls = '<a href="#" id="jjimBtn"><img class="bookmark" src="${contextPath}/resources/bootstrap/image/bookmark-fill.png"></a>';
            
                $("#jjimBtn").html(htmls);
            } else{
                //$('#jjimBtn').html("찜" +jjimNum)
            	var htmls = '<a href="#" id="jjimBtn"><img class="bookmark" src="${contextPath}/resources/bootstrap/image/bookmark.png"></a>';
            
                $("#jjimBtn").html(htmls);
                
            }
            
            if(isreport){
            	var htmls = '<a href="#" id="reportBtn"><img class="siren clicked3" src="${contextPath}/resources/bootstrap/image/bookmark.png"></a>';
                $('#reportBtn').html("신고완료")
                $("#reportBtn").off('click');
                $("#reportBtn").prop('disabled', true).css('background-color', 'grey');
                //여기를 빨간색사이렌(클릭안되게 설정)
            }else{
            	var htmls = '<a href="#" id="reportBtn" onclick="openReportPopup()"><img class="siren" src="${contextPath}/resources/bootstrap/image/siren.png"></a>';
                $('#reportBtn').html(htmls)
                //여기는 클릭 가능한 사이렌

            } // read들어갔을때 뜨는 부분 



            function openReportPopup() {
                var boardNum = "${communityVO.boardNum}"
                var reporter = "${member.id}"; // 현재 사용자의 ID
                var reportee = "${communityVO.id}"; // 신고 대상의 ID
                var context = prompt("신고 내용을 입력하세요:"); // 사용자로부터 신고 내용 입력 받음

                // 사용자가 신고 내용을 입력하지 않은 경우
                if (context === null || context === "") {
                    alert("신고 내용을 입력해주세요.");
                    return;
                }

                var reportData = {
                    boardNum: boardNum,
                    reporter: reporter,
                    reportee: reportee,
                    context: context
                };

                // data: "boardNum=" + boardNum + "&id=" + id,

                    // 팝업 창으로 데이터 전송
                $.ajax({
                    type: 'post',
                    url: "${contextPath}/community/report",
                    dataType: "json",
                    data: "boardNum="+boardNum+"&reporter="+reporter+"&reportee="+reportee+"&context="+context,
                    success: function (data) { // 이 data는 그 게시글의 리포트 총 갯수.
                        alert("성공1");

                    	  $("#reportBtn").html("신고됨 "+data);

                          $("#reportBtn").off('click');
                          $("#reportBtn").prop('disabled', true).css('background-color', 'grey');
                          // 여기는 신고 후 일어나는 부분 클릭 못하는 빨간 사이렌으로 바꾸기.
                    },
                    error: function (data) {
                        // console.log("왜에러야;;");
                        // alert("첫번째 아작스 실패"+data);

                    }
                });


                $.ajax({
                    type: 'post',
                    url: "${contextPath}/member/report", // 이건 멤버테이블 신고횟수 늘리는거 건드릴필요없음. 
                    dataType: "json",
                    data: reportData,
                    success: function (data2) {
                        alert("성공2");
                    },
                    error: function (data2) {
                        alert("두번쨰 아작스 실패"+data2);
                    }

                });
            }








            start();



function start() {



    $('#jjimBtn').click(function () {

        if(isjjim){
            $.ajax({
                type: 'post',
                url: "${contextPath}/community/jjimDown",
                dataType: "json",
                data: "boardNum=" + "${communityVO.boardNum}" + "&memberIdx=" + "${member.idx}",
                success: function (data) {
                    isjjim = false;
                    
                    var htmls = "";
                    htmls += '<img class="bookmark" src="${contextPath}/resources/bootstrap/image/bookmark.png">';
                
                    $("#jjimBtn").html(htmls);
                },
                error: function (data) {
                    alert(data + "위쪽");
                }
            });
        } else{
            $.ajax({
                type: 'post',
                url: "${contextPath}/community/jjimUp",
                dataType: "json",
                data: "boardNum=" + "${communityVO.boardNum}" + "&memberIdx=" + "${member.idx}",
                success: function (data) {

                    // 좋아요 상태 변경
                    isjjim = true;
                    // 버튼 텍스트 변경
                    // $("#jjimBtn").html("찜 취소"+data);
                    
                    var htmls = "";
                	htmls += '<img class="bookmark" src="${contextPath}/resources/bootstrap/image/bookmark-fill.png">';
                
                    $("#jjimBtn").html(htmls);
                    
                },
                error: function (data) {
                    alert("실패");

                    alert(data + "아래쪽");
                }
            });
        }




    });



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
                    var htmls = "<img class='likeimg' src='${contextPath}/resources/bootstrap/image/thumbsup.png'>"
                    // $("#goodBtn").html(data);
                    	htmls += "<span class='likenum'>"
                       	htmls += data
                       	htmls += "</span>"
                    $("#goodBtn").html(htmls);
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
                    var htmls = "<img class='likeimg clicked' src='${contextPath}/resources/bootstrap/image/thumbsup.png'>"
                        // $("#goodBtn").html(data);
               		 	htmls += "<span class='likenum' style='color: #374151'>"
                   	 	htmls += data
                   		htmls += "</span>"
                     $("#goodBtn").html(htmls);
                },
                error: function (data) {
                    alert(data + "아래쪽");
                }
            });
        }
    }); // 좋아요 버튼 눌렀을때 반응하는곳

    $('#badBtn').click(function() {
        if(disLiked){

            $.ajax({
                type: 'post',
                url: "${contextPath}/community/dislikeDown",
                dataType: "json",
                data: "boardNum=" + boardNum + "&id=" + id,
                success: function(data) {
                    disLiked = false;
                    var htmls = "<span class='dislikenum'>"
                       	htmls += data
                       	htmls += "</span>"
                    	htmls += "<img class='dislikeimg' src='${contextPath}/resources/bootstrap/image/thumbsdown.png'>"
                    $("#badBtn").html(htmls);
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
                    var htmls = "<span class='dislikenum' style='color: #374151'>"
                       	htmls += data
                       	htmls += "</span>"
                    	htmls += "<img class='dislikeimg clicked2' src='${contextPath}/resources/bootstrap/image/thumbsdown.png'>"
                    $("#badBtn").html(htmls);
                },
                error: function(data) {
                    alert("read//dislikeUp.jsp에러야");
                }
            });
        }
     }); //싫어요 버튼 누르면 반응하는곳
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


        </div>
		<!-- Right side column. -->
  		<%@ include file="../include/right.jsp" %>
		
    </div>



</div>

<!-- footer -->
<%@ include file="../include/footer.jsp" %>

<script>
	var likeClickedOnce = false;
	var dislikeClickedOnce = false;
	
	function likeClicked() {
	    var likeBtn = document.querySelector('.likebtn');
	    var dislikeBtn = document.querySelector('.dislikebtn');
	    var likeImg = document.querySelector('.likeimg');
	    var likeNum = document.querySelector('.likenum');
	
	    if (!likeClickedOnce) {
	        likeImg.style.filter = 'invert(36%) sepia(83%) saturate(572%) hue-rotate(293deg) brightness(96%) contrast(103%)';
	        likeNum.style.color = '#374151';
	        likeClickedOnce = true;
	        dislikeBtn.onclick = null; // 비활성화
	    } else {
	        likeImg.style.filter = '';
	        likeNum.style.color = '';
	        likeClickedOnce = false;
	        dislikeBtn.onclick = dislikeClicked; // 활성화
	    }
	}
	
	function dislikeClicked() {
	    var likeBtn = document.querySelector('.likebtn');
	    var dislikeBtn = document.querySelector('.dislikebtn');
	    var dislikeImg = document.querySelector('.dislikeimg');
	    var dislikeNum = document.querySelector('.dislikenum');
	
	    if (!dislikeClickedOnce) {
	        dislikeImg.style.filter = 'invert(29%) sepia(94%) saturate(2261%) hue-rotate(199deg) brightness(94%) contrast(83%)';
	        dislikeNum.style.color = '#374151';
	        dislikeClickedOnce = true;
	        likeBtn.onclick = null; // 비활성화
	    } else {
	        dislikeImg.style.filter = '';
	        dislikeNum.style.color = '';
	        dislikeClickedOnce = false;
	        likeBtn.onclick = likeClicked; // 활성화
	    }
	}
</script>
<script>
//DOM 요소들을 가져옵니다.
var Airplane = document.querySelector('.airplane');
var paperairForm = document.querySelector('.paperairform');
var listButtons2 = document.querySelectorAll('.listbannerfont2');

	// categoryPriorityForm 버튼 클릭 시 이벤트 핸들러
	Airplane.addEventListener('click', function() {
	    // listbannerform을 토글(toggle)하여 보이거나 가리도록 합니다.
	    // hidden이 가리는게 아닌 보이게하는것으로 만들었다 *헷갈리지 않기* -정우-
	    paperairForm.classList.toggle('show3');
	});
	
		// 문서의 다른 곳을 클릭할 때 이벤트 핸들러
	document.addEventListener('click', function(event) {
	    // 클릭한 요소가 리스트배너나 리스트배너를 열기 위한 버튼인지 확인합니다.
	    var isClickInsideListBanner = paperairForm.contains(event.target) || Airplane.contains(event.target);
	
	    // 리스트배너가 열려있고, 클릭한 요소가 리스트배너 바깥인 경우에만 리스트배너를 닫습니다.
	    if (!isClickInsideListBanner) {
	    	paperairForm.classList.remove('show3');
	    	}
		});

	
	
		document.getElementById('list1').addEventListener('click', function() {
	    document.querySelector('.profilepicture').innerText = '프로필';
	});
	
	document.getElementById('list2').addEventListener('click', function() {
	    document.querySelector('.profilepicture').innerText = '활동내역';
	});
	
	document.getElementById('list3').addEventListener('click', function() {
	    document.querySelector('.profilepicture').innerText = '알림';
	});
	
	document.getElementById('list4').addEventListener('click', function() {
	    document.querySelector('.profilepicture').innerText = '로그아웃';
	});
</script>
</body>
</html>


