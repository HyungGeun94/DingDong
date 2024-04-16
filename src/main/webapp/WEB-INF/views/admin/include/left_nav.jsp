<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Core</div>
				<a class="nav-link" href="${contextPath }/">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> 홈
				</a>
				
				
				
				<div class="sb-sidenav-menu-heading">관리</div>
				
				
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayouts-1" aria-expanded="false"
					aria-controls="collapseLayouts-1">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 
					회원
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayouts-1"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="${contextPath }/admin/member/listAll">전체 회원</a>
						<a class="nav-link" href="${contextPath }/admin/member/del">탈퇴 회원</a>
					</nav>
				</div>
				
				
				
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
					<div class="sb-nav-link-icon">
						<i class="fas fa-book-open"></i>
					</div> 
					게시판
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapsePages"
					aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav accordion"
						id="sidenavAccordionPages">
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
						커뮤니티
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="pagesCollapseAuth"
							aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordionPages">
							<nav class="sb-sidenav-menu-nested nav">
								<a id="community-all" class="nav-link" href="${contextPath}/admin/board/listAll">전체</a> 
								<a id="community-blind" class="nav-link" href="${contextPath}/admin/board/blind">블라인드</a>
								<a id="community-del" class="nav-link" href="${contextPath}/admin/board/del">삭제</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#pagesCollapseError" aria-expanded="false"
							aria-controls="pagesCollapseError"> 
							거래
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="pagesCollapseError"
							aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordionPages">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="#">전체</a> 
								<a class="nav-link" href="#">블라인드</a>
								<a class="nav-link" href="#">거래 완료</a>
								<a class="nav-link" href="#">삭제</a>
							</nav>
						</div>
					</nav>
				</div>
				
				
				
				
				
				
				
				
				
				
				
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayouts-2" aria-expanded="false"
					aria-controls="collapseLayouts-2">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 
					예약
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayouts-2"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="${contextPath }/admin/reservation">전체 내역</a>
						<a class="nav-link" href="${contextPath }/admin/reservation/del">취소 내역</a>
					</nav>
				</div>
				
				
				
				
				
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayouts-3" aria-expanded="false"
					aria-controls="collapseLayouts-3">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 
					신고
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayouts-3"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="#">글 신고</a>
						<a class="nav-link" href="#">댓글 신고</a>
					</nav>
				</div>
				
				
				
				
				
				
				
				
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayouts-4" aria-expanded="false"
					aria-controls="collapseLayouts-4">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 
					공지사항
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayouts-4"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="${contextPath }/admin/notice/write">작성</a>
						<a class="nav-link" href="${contextPath}/admin/notice/listAll">전체</a>
						<a class="nav-link" href="#">커뮤니티</a>
					</nav>
				</div>
				
				
				
				
				
				
				
				<div class="sb-sidenav-menu-heading">정보</div>
				
						<a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 내 정보
						</a>
						<a class="nav-link" href="${contextPath }/adminLogout">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 로그아웃
						</a>
				
			</div>
		</div>
		
		<div class="sb-sidenav-footer">
			<div class="small">Logged in as:</div>
			Start Bootstrap
		</div>
	</nav>
</div>