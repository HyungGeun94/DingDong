<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<head>
<style>

.loudspeakerform {
	padding: 6px;
	background-color: rgb(165 209 246);
	border-radius: 0.5rem;
	display: flex;
	justify-content: center;
}

.loudspeaker {
	width: 20px;
	height: 20px;
	margin: auto;
	filter: invert(100%) sepia(2%) saturate(8%) hue-rotate(342deg) brightness(104%) contrast(102%);
}
</style>

</head>
	<div class="leftform">
		<div class="leftlist">
			<div class="bugreportform">
				<a href = "/" style="text-decoration-line: none;">
					<div class="bugreport">
						<div class="loudspeakerform">
							<img src="resources/bootstrap/image/확성기.png" class="loudspeaker">
						</div>
						<span class="bugreportcontent">버그와 제안은 여기에 댓글로 남겨주세요</span>
					</div>
				</a>
			</div>
			<div class="topscrapers">
				<div class="topscraperstitle">Top Scrapers</div>

				<div class="topscraperscontent">

					<c:forEach items="${scrapjjim}" var="scrapjjim">

						<div class="scrap">
							<a href="${contextPath}/member/other/info?member=${scrapjjim.memberIdx}" class="topscraperpic"><img style="position: absolute; width: 24px; height: 24px; border-radius: 9999px; border: none;" src="${contextPath}/resources/images/profile/${scrapjjim.profile}"></a>
							<div class="topscrapernameform">
								<a href="${contextPath}/member/other/info?member=${scrapjjim.memberIdx}" class="topscrapernamelink">
									<span class="topscrapername">${scrapjjim.nickname}</span>
								</a>
							</div>
							<div class="scraptimesform">
							<span style="display: flex; justify-content: center; align-items: center;">
								<img src="resources/bootstrap/image/medal.svg" style="width: 16px; height: 16px;">
								<span class="scraptimes">${scrapjjim.jjim}</span>
							</span>
							</div>
						</div>



					</c:forEach>


				</div>
			</div>
		</div>
	</div>

