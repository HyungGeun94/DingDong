<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />




	<div class="mainform">
 
		<div class="main">
			<a href="#"><img src="resources/bootstrap/image/메인광고.png" class="mainads"></a>
			
			<ul class="firstcomm" style="padding: 0;">
				<li class="QNA">
				
					<div class="titleform">
						<div class="QNAtitle">공지사항</div>
					</div>
					
					<div class="content">
					
					<c:forEach items="${listAllBynotice }" var="communityVO">
						<div class="content1">
							<div class="contenttitle">
								<div class="useractivity">
									<a  href="${contextPath }/member/other?member=">
										<img class="profilepic" src="${contextPath }/resources/images/profile/${communityVO.profile}">
									</a>
									<a class="nickname"  href="${contextPath }/member/other/">${communityVO.nickname }</a>
									<div class="activity">
										<img style="width: 15px; height: 15px; float: left; margin-top: 3px;" src="${contextPath }/resources/bootstrap/image/catfoot.png">
										<span style="height: 20px; float: left;">
                                 <span style="margin: 0px 0px 0px 4px; font-size: 14px; float: left;">·</span>
                                 <span style="font-size: 14px; margin: 0px 0px 0px 4px; float: left;">${communityVO.regDate }</span>
                              </span>
									</div>
								</div>


								

						<div class="assessment">
                           <div class="thumbsupform">
                              <img src="resources/bootstrap/image/좋아요.svg" style="width: 16px; height: 14px; margin: 3px 0px;">
                              <span style="color: #374151; font-size: 14px;">${communityVO.good }</span>
                           </div>
                           <div class="commentsform">
                              <img src="resources/bootstrap/image/댓글.svg" style="width: 16px; height: 14px; margin: 3px 0px;">
                              <span style="color: #374151; font-size: 14px;">${communityVO.reply}</span>
                           </div>
                        </div>




							</div>
							<div class="ctcontent">
								<a class="bringct" href="${contextPath }/community/read?boardNum=${communityVO.boardNum}">${communityVO.title }</a>
							</div>
						</div>
					</c:forEach>
						
					
						
						
						
					</div>
					
					
				</li>
				
				
				
				<li class="community">
					<div class="titleform">
						<div class="communitytitle">커뮤니티</div>
					</div>
					
					
					
					<div class="content">
					
						<c:forEach items="${listAll }" var="communityVO">
						<div class="content1">
							<div class="contenttitle">
								<div class="useractivity">
									<a  href="${contextPath }/member/other/info?member=${communityVO.memberIdx}">
									<img  class="profilepic" src="${contextPath }/resources/images/profile/${communityVO.profile}">
									</a>
									<a class="nickname"  href="${contextPath }/member/other/info?member=${communityVO.memberIdx}">${communityVO.nickname }</a>
									<div class="activity">
										<span style="margin-right: 0.125rem; font-size: 14px; float: left;">·</span>
										<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="like" viewBox="0 0 16 16" style=" float: left;">
  											<path d="M11.251.068a.5.5 0 0 1 .227.58L9.677 6.5H13a.5.5 0 0 1 .364.843l-8 8.5a.5.5 0 0 1-.842-.49L6.323 9.5H3a.5.5 0 0 1-.364-.843l8-8.5a.5.5 0 0 1 .615-.09z"/>
										</svg>
										<span style="height: 20px; float: left;">
											<span style="font-size: 14px; float: left;">0</span>
											<span style="margin: 0px 0px 0px 4px; font-size: 14px; float: left;">·</span>
											<span style="font-size: 14px; margin: 0px 0px 0px 4px; float: left;">${communityVO.regDate }</span>
										</span>
									</div>
								</div>
								

							<div class="assessment">
	                           <div class="thumbsupform">
	                              <img src="resources/bootstrap/image/좋아요.svg" style="width: 16px; height: 14px; margin: 3px 0px;">
	                              <span style="color: #374151; font-size: 14px;">${communityVO.good }</span>
	                           </div>
	                           <div class="commentsform">
	                              <img src="resources/bootstrap/image/댓글.svg" style="width: 16px; height: 14px; margin: 3px 0px;">
	                              <span style="color: #374151; font-size: 14px;">${communityVO.reply}</span>
	                           </div>
	                        </div>
	

							</div>
							<div class="ctcontent">
								<a class="bringct" href="${contextPath }/community/read?boardNum=${communityVO.boardNum}">${communityVO.title }</a>
							</div>
						</div>
					</c:forEach>
					
					
					
						
						
						
					</div>
				</li>			
			</ul>
			
			
			
			<ul class="secondcomm" style=" padding: 0;">
			<li class="weeklybest">
					<div class="titleform">
						<div class="weeklytitle">WEEKLY BEST</div>
					</div>
					
					
						<div class="content">

							<c:forEach items="${listAllByviews }" var="communityVO">
						<div class="content1">
							<div class="contenttitle">
								<div class="useractivity">
									<a  href="${contextPath }/member/other/info?member=${communityVO.memberIdx}">
									<img  class="profilepic" src="${contextPath }/resources/images/profile/${communityVO.profile}">
									</a>
									<a class="nickname"  href="${contextPath }/member/other/info?member=${communityVO.memberIdx}">${communityVO.nickname }</a>
									<div class="activity">

										<span style="margin-right: 0.125rem; font-size: 14px; float: left;">·</span>
										<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="like" viewBox="0 0 16 16" style=" float: left;">
  											<path d="M11.251.068a.5.5 0 0 1 .227.58L9.677 6.5H13a.5.5 0 0 1 .364.843l-8 8.5a.5.5 0 0 1-.842-.49L6.323 9.5H3a.5.5 0 0 1-.364-.843l8-8.5a.5.5 0 0 1 .615-.09z"/>
										</svg>
										<span style="height: 20px; float: left;">
											<span style="font-size: 14px; float: left;">0</span>
											<span style="margin: 0px 0px 0px 4px; font-size: 14px; float: left;">·</span>
											<span style="font-size: 14px; margin: 0px 0px 0px 4px; float: left;">${communityVO.regDate }</span>
										</span>
									</div>
								</div>
								

							<div class="assessment">
	                           <div class="thumbsupform">
	                              <img src="resources/bootstrap/image/좋아요.svg" style="width: 16px; height: 14px; margin: 3px 0px;">
	                              <span style="color: #374151; font-size: 14px;">${communityVO.good }</span>
	                           </div>
	                           <div class="commentsform">
	                              <img src="resources/bootstrap/image/댓글.svg" style="width: 16px; height: 14px; margin: 3px 0px;">
	                              <span style="color: #374151; font-size: 14px;">${communityVO.reply }</span>
	                           </div>
	                        </div>
	

							</div>
							<div class="ctcontent">
								<a class="bringct" href="${contextPath }/community/read?boardNum=${communityVO.boardNum}">${communityVO.title }</a>
							</div>
						</div>
					</c:forEach>
					
					
					
						
						
						
					</div>
					
					
					
					
					
					
						
						
				</li>
				
				
				
				
				
				
				<li class="editorschoice">
					<div class="titleform">
						<div class="editorstitle">EDITOR'S CHOICE</div>
					</div>
					
					
				
					
						<div class="content">
					
						<c:forEach items="${listAllBygood }" var="communityVO">
						<div class="content1">
							<div class="contenttitle">
								<div class="useractivity">
									<a  href="${contextPath }/member/other/info?member=${communityVO.memberIdx}">
									<img  class="profilepic" src="${contextPath }/resources/images/profile/${communityVO.profile}">
									</a>
									<a class="nickname"  href="${contextPath }/member/other/info?member=${communityVO.memberIdx}">${communityVO.nickname }</a>
									<div class="activity">
										<span style="margin-right: 0.125rem; font-size: 14px; float: left;">·</span>
										<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="like" viewBox="0 0 16 16" style=" float: left;">
  											<path d="M11.251.068a.5.5 0 0 1 .227.58L9.677 6.5H13a.5.5 0 0 1 .364.843l-8 8.5a.5.5 0 0 1-.842-.49L6.323 9.5H3a.5.5 0 0 1-.364-.843l8-8.5a.5.5 0 0 1 .615-.09z"/>
										</svg>
										<span style="height: 20px; float: left;">
											<span style="font-size: 14px; float: left;">0</span>
											<span style="margin: 0px 0px 0px 4px; font-size: 14px; float: left;">·</span>
											<span style="font-size: 14px; margin: 0px 0px 0px 4px; float: left;">${communityVO.regDate }</span>
										</span>
									</div>
								</div>
								

							<div class="assessment">
	                           <div class="thumbsupform">
	                              <img src="resources/bootstrap/image/좋아요.svg" style="width: 16px; height: 14px; margin: 3px 0px;">
	                              <span style="color: #374151; font-size: 14px;">${communityVO.good }</span>
	                           </div>
	                           <div class="commentsform">
	                              <img src="resources/bootstrap/image/댓글.svg" style="width: 16px; height: 14px; margin: 3px 0px;">
	                              <span style="color: #374151; font-size: 14px;">${communityVO.reply}</span>
	                           </div>
	                        </div>
	

							</div>
							<div class="ctcontent">
								<a class="bringct" href="${contextPath }/community/read?boardNum=${communityVO.boardNum}">${communityVO.title }</a>
							</div>
						</div>
					</c:forEach>
					
					
					
						
						
						</div>
				
				
				
						
						
				</li>
			</ul>











		</div>
	</div>
