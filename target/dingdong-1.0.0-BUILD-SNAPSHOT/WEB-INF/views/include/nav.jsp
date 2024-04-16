<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<head>
<style>	
.magnifier {
	width: 16px;
	height: 16px;
	margin: 0px 0px 3px;
	filter: invert(72%) sepia(8%) saturate(288%) hue-rotate(180deg) brightness(85%) contrast(90%);
}

.forbtnbottomfixed2 {
   position: relative;
   margin-left: 8px;
}

.profilepictureform {
   border: none;
   width: 35px;
   height: 35px;
   border-radius: 9999px;
   background-color: #fff;
   padding: 0;
}

.profilepicture {
   width:35px;
   height: 35px;
   object-fit: cover;
   border-radius: 9999px;
   cursor: pointer;
}

.listbannerform2 {
   width: 200px;
   margin: 8px 0px 0px;
   display: none;
    position: absolute;
    top: 35px;
    right: 0;
}

.listbannerform2.show {
   display: block;
}

.listbannerpadding2 {
   width: 100%;
   padding: 16px 0px 4px;
   border: none;
   box-shadow:0 10px 15px -3px rgba(0,0,0,.1),0 4px 6px -4px rgba(0,0,0,.1), 0 0 0 1px rgba(0,0,0,0.05);
   background-color: #fff;
   border-radius: 0.375rem;
}

.listbannerfont2 {
   width: 168px;
   padding: 8px 16px;
   height: 26px;
   color: #4B5563;
   font-size: 14px;
   border: none;
   font-weight: 500;
   background-color: #fff;
   text-align: left;
}

.listbannerfont2:hover {
   color: #0090F9;
   background-color: #F3F4F6;
}

.redbtn {
	width: 10px;
	height: 10px;
	background-color: #FF5442;
	border-radius: 9999px;
	border: none;
	z-index: 1;
	position: absolute;
	top: 0%;
	right: 0%;
}

.recentrecordform {
	width: 200px;
    margin: 8px 0px 0px;
    display: none;
    position: absolute;
    top: 35px;
    right: 0;
}

.recentrecord {
	width: 100%;
  	padding: 16px 0px 4px;
   	border: none;
   	box-shadow:0 10px 15px -3px rgba(0,0,0,.1),0 4px 6px -4px rgba(0,0,0,.1), 0 0 0 1px rgba(0,0,0,0.05);
   	background-color: #fff;
   	border-radius: 0.375rem;
}

.record {
	width: 168px;
    padding: 8px 16px;
    height: 26px;
    background-color: #fff;
    text-align: left;
}

.notewindowform {
   width: 200px;
   margin: 8px 0px 0px;
   display: none;
    position: absolute;
    top: 35px;
    right: 0;
}

.notewindowform.show2 {
   display: block;
}

.notewindow {
	width: 100%;
   	padding: 12px 0px;
   	border: none;
   	box-shadow:0 10px 15px -3px rgba(0,0,0,.1),0 4px 6px -4px rgba(0,0,0,.1), 0 0 0 1px rgba(0,0,0,0.05);
   	background-color: #fff;
   	border-radius: 0.375rem;
}

.listbannerfont3 {
   width: 168px;
   padding: 8px 16px;
   height: 26px;
   color: #4B5563;
   font-size: 14px;
   border: none;
   font-weight: 500;
   background-color: #fff;
   text-align: left;
}

.listbannerfont3:hover {
   color: #0090F9;
   background-color: #F3F4F6;
}

.message {
	width: 25px;
	height: 25px;
	padding-top: 4px;
	padding-right: 6px;
}


.logo{
   width: 115px;
   height: 28px;
    text-decoration-line: none;
}
</style>
</head>


 <nav class="form border">
        	<div class="banner">
        	
        	
        	
        		<div class="logolist">
        			<a class="logo" href="${contextPath }/"><img style="width: 28px; height: 28px;" src="${contextPath }/resources/bootstrap/image/dingdong.png"><span style="color: #3DCFF4; font-size: 17px; font-weight: 600; margin-left: 4px;">DingDong</span></a>
        			<ul class="list" style="padding: 0;">
        				<li class="detaillist"><a class="name" href="${contextPath }/community">커뮤니티</a></li>
        				<li class="detaillist"><a class="name" href="#">중고</a></li>
        				<li class="detaillist"><a class="name" href="${contextPath }/reservation/branchList">예약</a></li>
        				<li class="detaillist"><a class="name" href="${contextPath }/reservation2/branchList">예약2</a></li>
        				<li class="detaillist"><a class="name" href="${contextPath }/admin">관리자</a></li>
        			</ul>
        		</div>
        		
        		



        		
        		
        		<div class="searchlogin">
        			<div class="searchmode">
        				<div class="search">
        					<button id="searchButton" class="magnifierform" onclick="location.href='${contextPath}/community'">
        						<img src="${contextPath}/resources/bootstrap/image/돋보기.png" class="magnifier" >
        					</button>
        					<input class="searchbox" type="text" placeholder="검색">
        				
        				</div>
        		
        				
        				
        				
        			</div>






					<c:choose>
					<c:when test="${member eq null}">


					<div style="display: flex;">
						<div class="login" OnClick="location.href ='${contextPath}/login'">로그인</div>
						<div class="join" onclick="location.href ='${contextPath}/signup'">회원가입</div>
					</div>
					
					</c:when>
					<c:otherwise>
							<div style="display: flex; align-items: center;">
								<a class="navnickname">${member.nickname }</a>
								<span style="font-size: 13px;">님 환영합니다.</span>
								<div style="display: flex;">
									<div class="forbtnbottomfixed2">
										<div class="profilepictureform" id="profileImg">
										<c:choose>
										<c:when test="${member.etc eq  null }">
	                              				<img class="profilepicture" src="${contextPath }/resources/images/profile/${member.profile}">
										</c:when>
										<c:otherwise>
											<img class="profilepicture" src="${member.profile}">
										</c:otherwise>
										</c:choose>
										<div id="alarmBtn"></div>
										<!--  <button style="width: 10px; height: 10px; background-color: red; border-radius: 9999px;"></button> -->
										</div>
										<div class="listbannerform2" id="banner">
											<div class="listbannerpadding2">
												<span style="width: 100%; padding-left: 14px; font-size: 14px; font-weight: 500;">내 계정</span>
												<button class="listbannerfont2" id="list1" style="margin-top: 12px;" onclick="location.href='${contextPath}/member/mypage'">프로필</button>
												<button class="listbannerfont2" id="list2">활동내역</button>
												<button class="listbannerfont2" id="list4" onclick="location.href='${contextPath}/member/alarm/list'">알림</button>
												<button class="listbannerfont2" id="list5" onclick="location.href='${contextPath}/member/note/list'">쪽지</button>
												<button class="listbannerfont2" id="list3" onclick="location.href='${contextPath}/logout'">로그아웃</button>
														
												<!-- 쪽지 모달 버튼 -->
												<!--  <button class="listbannerfont2" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" id="quit-modal">쪽지</button>  -->
											</div>
										</div>
									</div>
									<div class="forbtnbottomfixed2">
										<div class="chatform" style="display: flex; align-items: center; margin-left: 12px; cursor: pointer;">
											<img class="message" src="${contextPath }/resources/bootstrap/image/message.png">
											<div class="redbtn"></div>
										</div>
										<div class="notewindowform" id="banner">
											<div class="notewindow">
												<button class="listbannerfont3" id="firstlist" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" id="quit-modal">쪽지 보내기</button>
												<button class="listbannerfont3" id="secondlist">받은 쪽지</button>
											</div>
										</div>
									</div>
								</div>
							</div>
					</c:otherwise>
					</c:choose>
					
					
					<br>
				
				



        		</div>
				
				


        	</div>

		</nav>


<!--  쪽지 모달창 -->
<!--  새별: nav에서 누르거나 쪽지 list창에서 버튼 누르면 뜹니다 -->

<!--  얘가 쪽지 작성 버튼 -->
<!--  <button class="btn listbannerfont2" style="text-align:center; background-color: blue; color: white" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" id="quit-modal">작성</button> -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">쪽지 작성</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
			      <div class="mb-3">
		            <label for="message-text" class="col-form-label">받는 사람</label>
		            <input type="text" style="width: 95%;" id="receiver" name="receiver" class="form-control" id="message-text"></input>
		          </div>
		          <div class="mb-3">
		            <label for="message-text" class="col-form-label">내용</label>
		            <textarea style="width: 95%; height : 150px" id="noteContent" name="content" class="form-control" id="message-text"></textarea>
		          </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" id="noteBtn">보내기</button>
		      </div>
		    </div>
	  </div>
	</div>
<!--  쪽지 모달 끝 -->



	<script>
		// DOM 요소들을 가져옵니다.
	    var profilepicture = document.querySelector('.profilepicture');
	    var listButtons2 = document.querySelectorAll('.listbannerfont2');
	    var listBannerForm2 = document.querySelector('.listbannerform2');
	
	    // categoryPriorityForm 버튼 클릭 시 이벤트 핸들러
	    profilepicture.addEventListener('click', function() {
	        // listbannerform을 토글(toggle)하여 보이거나 가리도록 합니다.
	        // hidden이 가리는게 아닌 보이게하는것으로 만들었다 *헷갈리지 않기* -정우-
	        listBannerForm2.classList.toggle('show');
	    });
	    
	 	// 문서의 다른 곳을 클릭할 때 이벤트 핸들러
	    document.addEventListener('click', function(event) {
	        // 클릭한 요소가 리스트배너나 리스트배너를 열기 위한 버튼인지 확인합니다.
	        var isClickInsideListBanner = listBannerForm2.contains(event.target) || profilepicture.contains(event.target);
	
	        // 리스트배너가 열려있고, 클릭한 요소가 리스트배너 바깥인 경우에만 리스트배너를 닫습니다.
	        if (!isClickInsideListBanner) {
	        	listBannerForm2.classList.remove('show');
	        }
	    });

	 	
	 	
	 	/* document.getElementById('list1').addEventListener('click', function() {
		    document.querySelector('.profilepicture').innerText = '프로필';
		});
	
		document.getElementById('list2').addEventListener('click', function() {
		    document.querySelector('.profilepicture').innerText = '활동내역';
		});
	
		document.getElementById('list3').addEventListener('click', function() {
		    document.querySelector('.profilepicture').innerText = '로그아웃';
		});
		
		document.getElementById('list4').addEventListener('click', function() {
		    document.querySelector('.profilepicture').innerText = '쪽지';
		}); */
		
		
		
		// 페이지 로드 후 실행되는 함수
		// $(document).ready()는 이제 사용하지 않습니다.
		// jQuery 3.0 버전 이후부터는 $(hander)를 사용하는 것을 권장
		$(function(){
		// $(document).ready(function() {
			// Enter 키가 눌렸을 때 실행되는 함수
			$('.searchbox').keypress(function(event) {
				// Enter 키의 keyCode가 13일 때(Enter 키가 눌린 경우)
				if (event.keyCode === 13) {
					// 현재 검색어를 가져와서 구글 검색 페이지로 이동
					var searchKeyword = $(this).val();
					window.location.href = 'http://localhost:8080/dingdong/community?keyword=' + searchKeyword;
				}
			});
			
			
			// 새별: 로그인 했을 때 알림 개수 불러오는 아작스
			if(${member ne null}){
				var htmls = "";
				
				var url = "/dingdong/member/alarm";
				var id = "${member.id}";
				
				var paramData = {
						"id" : id
				}
				//아작스
				$.ajax({
					url : url,
					data : paramData,
					dataType : 'json',
					type : 'POST',
					success : function(result) {
						// 여기에 통신 성공 로직 구현
						// result.countAlarm 읽지 않은 알람 개수
						// result.countNote 읽지 않은 쪽지 개수
						
						// 읽지 않은 알람 개수가 0보다 많으면
						if(result.countAlarm > 0){
							htmls = "<div class='redbtn'></div>"
							// htmls += "<button class='redbtn' onclick='showAlarm()' id='showAlarm' style='height: 10px; background-color: #FF5442; border-radius: 9999px; border: none; z-index: 1; position: absolute; top: 0%; right: 0%;'></button>"
							$("#alarmBtn").html(htmls);
						}
						
						// 읽지 않은 쪽지 개수가 0보다 많으면
						if(result.countNote > 0){
							htmls = "<div class='redbtn2'></div>"
							// alert('읽지 않은 쪽지가 있습니다.');
							$("#noteBtn").replaceWith(htmls);
						}
					},
					error : function(result) {
						alert('error!');
						// 여기에 통신 실패 로직 구현
					}
				})
			} // if(${member ne null}){
			
				
				
			$('#searchButton').click(function() {
				// 검색어 입력란에서 검색어 가져오기
				var searchKeyword = $('.searchbox').val();
				// 검색어가 비어있지 않은 경우에만 검색 페이지로 이동
				if (searchKeyword.trim() !== "") {
					window.location.href = 'http://localhost:8080/dingdong/community?keyword=' + searchKeyword;
				}
			});
			
		});//$(document).ready

		
	//--------------------------------------- 정우 수정 (24/03/06)
	
		document.addEventListener('DOMContentLoaded', function () {
	        // 'redbtnform' 클래스를 가진 요소를 가져옵니다.
	        const redbtnform = document.querySelector('.redbtnform');
	        // 'recentrecordform' 클래스를 가진 요소를 가져옵니다.
	        const recentrecordform = document.querySelector('.recentrecordform');

	        // 'redbtnform'을 클릭했을 때 실행될 함수를 정의합니다.
	        redbtnform.addEventListener('click', function (event) {
	            // 'recentrecordform'의 스타일을 변경합니다.
	            recentrecordform.style.display = 'block';
	            // 이벤트의 전파를 중단합니다.
	            event.stopPropagation();
	        });

	        // 도큐먼트를 클릭했을 때 실행될 함수를 정의합니다.
	        document.addEventListener('click', function (event) {
	            // 클릭된 이벤트가 'redbtnform' 안에 있는지 확인합니다.
	            const isClickedInsideRedbtnform = redbtnform.contains(event.target);
	            // 클릭된 이벤트가 'redbtnform' 안에 있지 않은 경우
	            if (!isClickedInsideRedbtnform) {
	                // 'recentrecordform'의 스타일을 변경합니다.
	                redbtnform.style.display = 'none';
	                recentrecordform.style.display = 'none';
	            }
	        });
	    });

		
		// -----------------------------------------------
		
		
		
		
		// 새별: 쪽지 모달 창에서 작성한 내용, 아이디로 쪽지 발송.
		$('#noteBtn').click(function() {
			var receiver = $("#receiver").val();
			var noteContent = $("#noteContent").val();

			var url = "/dingdong/member/note/send";
			var paramData = {
					"receiver" : receiver,
					"content" : noteContent
			}
			
			$.ajax({
				url : url,
				data : paramData,
				dataType : 'json',
				type : 'POST',
				success : function(result) {
					if(result === 1){
						alert('쪽지 보내기 성공!');
						window.location.reload();
					}else if(result == 2){
						// 2면 존재하지 않는 회원
						alert('존재하지 않는 회원입니다.');
					}else if(result == 1){
						alert('쪽지 발송에 실패했습니다.');
					}
				},
				error : function(result) {
					alert('쪽지 발송에 실패했습니다.');
					// 여기에 통신 실패 로직 구현
				}
			}) // ajax 
			
			
			
		})// $('#noteBtn').click
		
		
		// 새별: 알람 버튼을 누르면 알람 리스트로 이동합니다.
		// 모달로 구현해도 괜찮을듯 
		function showAlarm(){
			location.href = '/dingdong/member/alarm/list';
		}
		
		
		
	</script>
	
	<script>
	// DOM 요소들을 가져옵니다.
    var Message = document.querySelector('.message');
    var notewindowForm = document.querySelector('.notewindowform');
    var listButtons3 = document.querySelectorAll('.listbannerfont3');

    // categoryPriorityForm 버튼 클릭 시 이벤트 핸들러
    Message.addEventListener('click', function() {
        // listbannerform을 토글(toggle)하여 보이거나 가리도록 합니다.
        // hidden이 가리는게 아닌 보이게하는것으로 만들었다 *헷갈리지 않기* -정우-
        notewindowForm.classList.toggle('show2');
    });
    
 	// 문서의 다른 곳을 클릭할 때 이벤트 핸들러
    document.addEventListener('click', function(event) {
        // 클릭한 요소가 리스트배너나 리스트배너를 열기 위한 버튼인지 확인합니다.
        var isClickInsideListBanner = notewindowForm.contains(event.target) || Message.contains(event.target);

        // 리스트배너가 열려있고, 클릭한 요소가 리스트배너 바깥인 경우에만 리스트배너를 닫습니다.
        if (!isClickInsideListBanner) {
        	notewindowForm.classList.remove('show2');
        }
    });

 	
 	
 	document.getElementById('firstlist').addEventListener('click', function() {
	    document.querySelector('.message').innerText = '쪽지 보내기';
	});

	document.getElementById('secondlist').addEventListener('click', function() {
	    document.querySelector('.message').innerText = '받은 쪽지';
	});
	</script>  
	
	
	     

        