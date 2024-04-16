<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/head.jsp" %>
<style>
	.listbannerform.show1 {
   display: block !important;
}

.pagenumYOU {
	width: 24px;
	height: 21px;
	text-decoration-line: none;
	color: #111827;
	padding-top: 18px;
	border: none;
	background-color: #fff;
}

.pagenumYOU:hover {
	color: #0090F9;
}

.pagenumME {
	width: 24px;
	height: 21px;
	text-decoration-line: none;
	color: #111827;
	padding-top: 16px;
	border: none;
	background-color: #fff;
	font-weight: 600;
	border-top: 2px solid #0090F9;
}

.pagenumME:hover {
	color: #0090F9;
}

</style>
</head>
<body>
	<div class="frame">

		<!-- nav -->
		<%@ include file="../include/nav.jsp" %>
		<div class="middle">	
		<!-- Left side column. -->
  		<div class="leftform">
		</div>
		<div class="communitymarginform">
			<div class="communityform">
				<a href="https://www.netflix.com/kr/" style="width: 840px; height: 140px; display: flex; justify-contet: center; padding-left: 40px;"><img src="resources/bootstrap/image/netflix.png" style="width: 750px; height: 140px;"></a>
				
				<div class="communitybannermargin">
					<div class="communitybannerform">
						<div class="communitybanner">
							<div class="communitybannername">COMMUNITY</div>
							<aside class="communitybannerct">좋은 질문과 유용한 답변으로 동료의 시간을 아껴주세요.</aside>
						</div>
					</div>
				</div>
				
				<div class="boardtopbar">
					<div class="categorysearchform">
						<div class="categorysearch">
							<button class="magnifierform" onclick="location.href='https://www.google.co.kr/?hl=ko'">
        						<img src="resources/bootstrap/image/돋보기.png" class="magnifier2" >
        					</button>
        					<input class="searchbox2" type="text" placeholder="COMMUNITY 내에서 검색">
						</div>
					</div>
					<div style="display: flex;">
						<div class="insertquestionform">
		
						<c:choose>
							<c:when test="${member ne null }">
								<a href="${contextPath}/community/insert" style="padding: 8px 16px 8px 12px; background-color: #0090F9; border-radius: 0.375rem; display: flex; justify-content: center; text-decoration-line: none;">
									<img class="questionpan" src="resources/bootstrap/image/pen.png">
									<span class="insertquestion">작성하기</span>
								</a>
							</c:when>
							<c:otherwise>
								<a href="${contextPath}/login" style="padding: 8px 16px 8px 12px; background-color: #0090F9; border-radius: 0.375rem; display: flex; justify-content: center; text-decoration-line: none;">
									<img class="questionpan" src="resources/bootstrap/image/pen.png">
									<span class="insertquestion">작성하기</span>
								</a>
							</c:otherwise>
						</c:choose>
						</div>
						<div class="forbtnbottomfixed">
							<button class="categorypriorityform">
								<div class="categorypriority">
									<img class="listcon" src="resources/bootstrap/image/목록.svg">
									<span class="listcategory">최신순</span>
								</div>					
							</button>
							<div class="listbannerform" id="banner">
								<div class="listbannerpadding">
									<button class="listbannerfont" id="list5">최신순</button>
									<button class="listbannerfont" id="list6">좋아요순</button>
									<button class="listbannerfont" id="list7">스크랩순</button>
									<button class="listbannerfont" id="list8">조회수순</button>
								</div>
							</div>
						</div>
					</div>
				</div>
	
		
				<div style="width: 100%; height: 56px; line-height: 56px; display: flex; align-items: center; justify-content: flex-end; border-bottom: 1px solid #D3D5D9; border-top: 1px solid #D3D5D9;">
					<div class="listboardkindform">
						<div class="contentssearchform">
								<select name="searchType" class="contentsselect">
									<option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
									<option value="content" <c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
									<option value="title_content" <c:if test="${searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
									<option value="id" <c:if test="${searchType eq 'id'}">selected</c:if>>아이디</option>
								</select>
							<input class="contentssearch" type="text" name="keyword" value="${keyword}"/>
							<button id="searchBtn" type="button" style="width:35px; height:25px; font-size:14px; padding:0; background-color:#fff; border:none; display:flex; align-items: center" type="button"  >검색</button>
						</div>
						
					</div>
				</div>
				<div class="listboardpageform">
					<div class="listboardform">
						<ul style="padding: 0px 0px; display: flex; flex-direction: column;">
							<li class="announcelistboard">
								<div style="width: 100%;display: flex; justify-content: flex-start;">
									<div class="useractivity">
									<a class="profilepic"  href="#"><img class="profilepic" src=""></a>
									<a class="nickname"  href="/member/mypage">닉네임</a>
									<div class="activity">
										<span style="margin-right: 0.125rem; font-size: 14px; float: left;">·</span>
										<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="like" viewBox="0 0 16 16" style=" float: left;">
  											<path d="M11.251.068a.5.5 0 0 1 .227.58L9.677 6.5H13a.5.5 0 0 1 .364.843l-8 8.5a.5.5 0 0 1-.842-.49L6.323 9.5H3a.5.5 0 0 1-.364-.843l8-8.5a.5.5 0 0 1 .615-.09z"/>
										</svg>
										<span style="height: 20px; float: left;">
											<span style="font-size: 14px; float: left;">0</span>
											<span style="margin: 0px 0px 0px 4px; font-size: 14px; float: left;">·</span>
											<span style="font-size: 14px; margin: 0px 0px 0px 4px; float: left;">0분 전</span>
										</span>
									</div>
								</div>
								</div>
								<div style="width: 100%;margin: 8px 0px;">
									<a class="announcementtitle" href="/">공지 제목</a>
								</div>
								<div class="boardhitsform">
									<div class="hitsform">
										<img src="resources/bootstrap/image/조회수.svg" style="width: 20px; height: 20px;">
										<span style="color: #374151; font-size: 15px; font-weight: 500; margin: 0px 0px 0px 3px;">0</span>
									</div>
									<div class="commentsform2">
										<img src="resources/bootstrap/image/댓글.svg" style="width: 18px; height: 18px; margin: 1px;">
										<span style="color: #374151; font-size: 15px; font-weight: 500; margin: 0px 0px 0px 4px;">0</span>
									</div>
									<div class="thumbsupform2">
										<img src="resources/bootstrap/image/좋아요.svg" style="width: 19px; height: 19px;">
										<span style="color: #374151; font-size: 15px; font-weight: 500; margin: 0px 0px 0px 3px;">0</span>
									</div>
								</div>
							</li>



						
							
							
						</ul>
					</div>
	
					<c:forEach items="${boardList}" var="list">
							<li class="listboard">
								<div style="width: 100%;display: flex; justify-content: flex-start;">
									<div class="useractivity">
									<a class="profilepic"  href="#"><img class="profilepic" src="${contextPath }/resources/images/profile/${list.profile}"></a>
									<a class="nickname"  href="/member/mypage">${list.nickname}</a>
									<div class="activity">
										<span style="margin-right: 0.125rem; font-size: 14px; float: left;">·</span>
										<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="like" viewBox="0 0 16 16" style=" float: left;">
  											<path d="M11.251.068a.5.5 0 0 1 .227.58L9.677 6.5H13a.5.5 0 0 1 .364.843l-8 8.5a.5.5 0 0 1-.842-.49L6.323 9.5H3a.5.5 0 0 1-.364-.843l8-8.5a.5.5 0 0 1 .615-.09z"/>
										</svg>
										<span style="height: 20px; float: left;">
											<span style="font-size: 14px; float: left;">0</span>
											<span style="margin: 0px 0px 0px 4px; font-size: 14px; float: left;">·</span>
											<span style="font-size: 14px; margin: 0px 0px 0px 4px; float: left;">${list.regDate}</span>
										</span>
									</div>
								</div>
								</div>
								<div style="width: 100%;margin: 8px 0px;">
									<a class="listboardtitle" href="${contextPath}/community/read?boardNum=${list.boardNum}">${list.title}</a>
								</div>
								<div style="margin-bottom: 1rem; width: 100%;">
									<a class="listboardcontent" href="/" style="font-size: 13px;">${list.content}</a>
								</div>
								<div class="boardhitsform">
									<div class="hitsform">
										<img src="resources/bootstrap/image/조회수.svg" style="width: 20px; height: 20px;">
										<span style="color: #374151; font-size: 15px; font-weight: 500; margin: 0px 0px 0px 3px;">${list.views}</span>
									</div>
									<div class="commentsform2">
										<img src="resources/bootstrap/image/댓글.svg" style="width: 18px; height: 18px; margin: 1px;">
										<span style="color: #374151; font-size: 15px; font-weight: 500; margin: 0px 0px 0px 4px;">${list.reply}</span>
									</div>
									<div class="thumbsupform2">
										<img src="resources/bootstrap/image/좋아요.svg" style="width: 19px; height: 19px;">
										<span style="color: #374151; font-size: 15px; font-weight: 500; margin: 0px 0px 0px 3px;">${list.good}</span>
									</div>
								</div>
							</li>

						</c:forEach>
							
							
						</ul>
					</div>
	
					<div style="width: 100%; display: flex; justify-content: center;">
                  		<c:if test="${page.prev}">
	                     	<button class="previousform" onclick="location.href='${contextPath}/community?num=${page.startPageNum-1}${page.searchTypeKeyword}'">
		                        <img class="rightarrow" src="${contextPath}/resources/bootstrap/image/rightarrow.png">
		                        <span class="previous">Previous</span>
	                     	</button>
                  		</c:if>
      					
      					
      					<div style="display: flex; margin-bottom: 20px;">
		                  	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			                  	<span>
				                    <c:if test="${select != num}">
				                    	<button onclick="location.href='${contextPath}/community?num=${num}${page.searchTypeKeyword}'" class="pagenumYOU">${num}</button>
				                    </c:if>
				                    <c:if test="${select == num}">
				                    	<button class="pagenumME">${num}</button>
				                    </c:if>
			                  	</span>
		                  	</c:forEach>
	      				</div>
		      			
	      				
	                  	<c:if test="${page.next}">
		                    <button class="nextform" onclick="location.href='${contextPath}/community?num=${page.endPageNum+1}${page.searchTypeKeyword}'">
			                    <span class="next">Next</span>
			                    <img class="leftarrow" src="${contextPath}/resources/bootstrap/image/leftarrow.png">
		                    </button>
	                  	</c:if>
					</div>
				
	<%--			<c:forEach begin="1" end="${pageNum}" var="num">--%>
	<%--				<span>--%>
	<%--					<a href = "${contextPath}/community?num=${num}">${num}</a>--%>
	<%--				</span>--%>
	
	
	<%--			</c:forEach>--%>
				
			
			
			</div>
		</div>
		
		<!-- Right side column. -->
  		<%@ include file="../include/right.jsp" %>	
		</div>
	</div>
	
	<!-- footer -->
		<%@ include file="../include/footer.jsp" %>

<script>
       // DOM 요소들을 가져옵니다.
       var categoryPriorityForm = document.querySelector('.categorypriorityform');
       var listButtons = document.querySelectorAll('.listbannerfont');
       var listBannerForm = document.querySelector('.listbannerform');
   
       // categoryPriorityForm 버튼 클릭 시 이벤트 핸들러
       categoryPriorityForm.addEventListener('click', function() {
           // listbannerform을 토글(toggle)하여 보이거나 가리도록 합니다.
           // hidden이 가리는게 아닌 보이게하는것으로 만들었다 *헷갈리지 않기* -정우-
           listBannerForm.classList.toggle('show1');
       });
       
       // 문서의 다른 곳을 클릭할 때 이벤트 핸들러
       document.addEventListener('click', function(event) {
           // 클릭한 요소가 리스트배너나 리스트배너를 열기 위한 버튼인지 확인합니다.
           var isClickInsideListBanner = listBannerForm.contains(event.target) || categoryPriorityForm.contains(event.target);

           // 리스트배너가 열려있고, 클릭한 요소가 리스트배너 바깥인 경우에만 리스트배너를 닫습니다.
           if (!isClickInsideListBanner) {
               listBannerForm.classList.remove('show1');
           }
       });
   
       // listButtons 버튼들에 대한 클릭 이벤트 핸들러
       listButtons.forEach(function(button) {
           button.addEventListener('click', function() {
               // 클릭된 버튼의 id 값을 가져옵니다.
               var listId = this.id;
   
               // 해당 id에 해당하는 내용을 보여주도록 합니다.
               // 예를 들어, list1 버튼을 누르면 list1 내용을 보여주고, 나머지는 가리게 합니다.
               var contents = document.querySelectorAll('.listbannerpadding > .listbannerform');
               contents.forEach(function(content) {
                   if (content.id === listId) {
                       content.style.display = 'block';
                   } else {
                       content.style.display = 'none';
                   }
               });
           });
       });
       
       
       document.getElementById('list5').addEventListener('click', function() {
           document.querySelector('.listcategory').innerText = '최신순';
       });
    
       document.getElementById('list6').addEventListener('click', function() {
           document.querySelector('.listcategory').innerText = '좋아요순';
       });
    
       document.getElementById('list7').addEventListener('click', function() {
           document.querySelector('.listcategory').innerText = '스크랩순';
       });
    
       document.getElementById('list8').addEventListener('click', function() {
           document.querySelector('.listcategory').innerText = '조회수순';
       });
       
       
       document.getElementById("searchBtn").onclick = function () {
           console.log("hihihihi")
           let searchType = document.getElementsByName("searchType")[0].value;
           let keyword = document.getElementsByName("keyword")[0].value;

           location.href="${contextPath}/community?num=1"+"&searchType="+searchType+"&keyword="+keyword;

        }
       
   </script>
	
</body>
</html>