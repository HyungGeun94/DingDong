<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<%@ include file="include/head.jsp" %>

</head>
<body>
	<div class="signuppage">

		<!-- container -->
		<div class="signupform">
			<div class="signup">
				<div onclick="location.href ='/#'" style="cursor:pointer; width: 100%; height: 48px;">
					<img alt="" src="" style="width: 66.2px; height: 48px; margin: 0px 190px;">
				</div>
				<h2 class="logintitle">DingDong에 오신것을 환영합니다.</h2>
				<p class="logincontent">DingDong은 소프트웨어 개발자를 위한 지식공유 플랫폼입니다.</p>
				<div class="signupandsns">
					<div class="snssignup">
						<span style="font-weight: 500; font-size: 14px;">SNS 회원가입</span>
						<div class="sns">
							<div class="githubsignup" OnClick="location.href ='/'">
								<img src="${contextPath }/resources/bootstrap/image/github.svg" class="github">
							</div>
							<div class="googlesignup" OnClick="location.href ='/'">
								<img src="${contextPath }/resources/bootstrap/image/google.svg" class="google">
							</div>
							<div class="facebooksignup" OnClick="location.href ='/'">
								<img src="${contextPath }/resources/bootstrap/image/facebook.svg" class="facebook">
							</div>
							<div class="naversignup" OnClick="naverLogin()">
								<img src="${contextPath }/resources/bootstrap/image/naver.svg" class="naver">
							</div>
							
							<div class="kakaosignup" OnClick="kakaoLogin()">
								<img src="${contextPath }/resources/bootstrap/image/kakao.png" class="kakao">
							</div>
						</div>
					</div>
					<div class="signuplineform">
						<div class="signuplinect">
							<span class="signupannouncement">회원가입에 필요한 기본정보를 입력해주세요.</span>
						</div>
					</div>
					<form method="post" action="${contextPath }/signupAction" class="dingdongsignupform">
					
					<div>
						<div id="id-alert-true" style="display:none">
							사용 가능한 아이디입니다.
						</div>
						<div id="id-alert-false" style="display:none">
							이미 사용 중인 아이디입니다. 
						</div>
						
						<div id="password-alert" style="display:none"> 
							비밀번호가 일치하지 않습니다.
						</div>
						
						<br>
						
						<div class="personalinfoform">
							<label style="color: #374151; font-size: 14px; font-weight: 500;">아이디</label>
							<div class="infoinputform">
								<input type="text" id="id" name="id" minlength="4" maxlength="15" oninput="checkId()" placeholder="4~15자 이내로 입력해주세요" class="infoinput">
							</div>
						</div>
						<div class="personalinfoform">
							<label style="color: #374151; font-size: 14px; font-weight: 500;">비밀번호</label>
							<div class="infoinputform">
								<input type="password" id="password" name="password" minlength="6" maxlength="20" oninput="checkPassword()" placeholder="최소 6자 이상(알파벳, 숫자 필수)" class="infoinput">
							</div>
						</div>
						<div class="personalinfoform">
							<label style="color: #374151; font-size: 14px; font-weight: 500;">비밀번호 확인</label>
							<div class="infoinputform">
								<input type="password" id="passwordCheck" pattern=".{10,20}" required oninput="checkPassword()" placeholder="비밀번호를 확인해주세요" class="infoinput">
							</div>
						</div>
						<div class="personalinfoform">
							<label style="color: #374151; font-size: 14px; font-weight: 500;">이메일</label>
							<div class="emailinputform">
								<input type="text" name="emailId" minlength="4" maxlength="15" placeholder="4~15자 이내로 입력해주세요" class="emailinfoinput">
								<span style="line-height: 42px;">@</span>
								<select name="emailDomain" class="selectform">
									<option selected>직접입력</option>
									<option value="@google.com">google.com</option>
									<option value="@naver.com" >naver.com</option>
								</select>
							</div>
						</div>
						<div class="personalinfoform">
							<label style="color: #374151; font-size: 14px; font-weight: 500;">실명</label>
							<div class="infoinputform">
								<input type="text" id="name" name="name" minlength="2" maxlength="15" placeholder="김무명" class="infoinput">
							</div>
						</div>
						<div class="personalinfoform">
							<label style="color: #374151; font-size: 14px; font-weight: 500;">닉네임</label>
							<div class="infoinputform">
								<input type="text" id="nickname" name="nickname" minlength="2" maxlength="20" placeholder="별명을 알파벳, 한글, 숫자를 20자 이하로 입력해주세요." class="infoinput">
							</div>
						</div>
						
						
					</div>
					
					<div style="margin: 24px 0px 0px;">
						<ul class="receptionagreeform">
							<li style="width: 100%; height: 84px; display: list-item !important; list-style: none;">
								<div class="receptionagree">
									<div class="receptionnameform">
										<p class="receptionname">이메일 수신동의</p>
									</div>
									<button class="receptionbtn" id="myButton" type="button">
										<div class="btncircle"></div>
									</button>
								</div>
								<p class="receptionagreeexpl">DingDong에서 주최하는 다양한 이벤트, 정보성 뉴스레터 및 광고 수신여부를 설정할 수 있습니다.</p>
							</li>
						</ul>
					</div>
					<div class="policyagreeform">
						<div class="policyagreename">약관동의</div>
						<div class="policyagreecheckform">
							<div class="allpolicyagree">
								<input id="agreeall" type="checkbox" class="allagreecheckbox" onchange="toggleCheckboxes()">
								<label for="agreeall" class="allagreectform">
									<span style="color: #111827; font-size: 14px; align-items: center;">전체 동의</span>
									<span style="color: #6B7280; font-size: 12px; margin: 0px 0px 0px 8px;">전체동의를 선택하시면 아래의 모든 약관에 동의하게 됩니다.</span>
								</label>
							</div>
							<hr style="color: #999999">
							<div class="eachpolicyagree">
								<div style="margin: 20px 0px;">
									<div style="width: 100%; height: 20px; display: flex; justify-content: flex-start; column-gap: 0.5rem; align-items: center;">
										<input type="checkbox" class="eachagreecheckbox">
										<span style="color: #111827; font-size: 14px;">통합 서비스 이용약관
											<button id="modalBtn" type="button" style="color: #0090F9; font-size: 14px; border: none; background-color: #fff; padding: 0px; text-decoration: underline;">보기</button>
											<!-- 모달 -->
											<div id="myModal" class="combinationmodal">
											  <!-- 모달 내용 -->
											  <div class="combinationmodal-content">
											    <div style="width: 100%; height: 38px;">
											    	<span class="combinationmodal-close">&times;</span>
											    </div>
											    <h2 style="font-size: 32px; color: #111827; font-weight: 700;">통합 서비스 이용약관</h2>
											    <h2 class="combinationh2">DingDong을 찾아주셔서 감사합니다.</h2>
											    <p class="combinationct">DingDong을 방문하신 여러분을 환영합니다. 이 약관은 (주)딩동코리아(이하 회사)가 제공하는 서비스를 회원 또는 비회원 이용자가 보다 효과적이고 안전하게 누리는데 도움이 되는 정보를 담고 있습니다.</p>
											    <p class="combinationct">여러분이 DingDong의 서비스를 이용하거나 회원으로 가입하게 될 경우, 여러분은 이 약관과 각 서비스의 운영 규정을 확인하거나 동의하게 되므로 시간을 내어 신중하게 읽어주시기 바랍니다.</p>
											    <h2 class="combinationh2">DingDong이 제공하는 다양한 서비스를 이용해보세요.</h2>
											    <p class="combinationct">DingDong은 DingDong 도메인의 웹사이트와 응용 프로그램을 통해 정보 플랫폼으로서 다양한 서비스를 제공하고 있습니다. 여러분은 DingDong의 서비스를 자유롭게 이용할 수 있으며, 개별 서비스의 구체적인 내용은 각 서비스의 안내문, 공지사항, 운영 규정 등을 통해 확인할 수 있습니다. DingDong이 제공하는 모든 서비스에는 이 약관이 공통적으로 적용됩니다.</p>
											    <h2 class="combinationh2">DingDong 회원으로 가입하시면 DingDong의 모든 서비스를 보다 효과적으로 이용하실 수 있습니다.</h2>
											    <p class="combinationct">여러분은 이 약관을 읽고 동의하신 후에 회원 가입을 신청하실 수 있습니다. DingDong이 여러분의 회원 신청정보 등을 확인하고 승낙하면 회원 가입 절차가 완료됩니다. DingDong은 DingDong 회원에게 서비스 이용계정을 부여하고 회원은 이 계정을 이용하여 DingDong이 제공하는 서비스를 좀 더 편리하게 이용할 수 있습니다.</p>
											    <p class="combinationct">DingDong은 기업전용 서비스를 이용할 수 있도록 일반 계정을 기업회원 계정으로 전환 지원합니다. 기업회원 구성원들은 하나의 기업에 귀속되며 개별적인 계정 및 아이디(ID)와 비밀번호를 소유하고 계정에 로그인하고 해당 서비스를 이용하게 됩니다.</p>
											    <p class="combinationct">기업회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 기업회원을 대표하고 기업회원 계정을 운용합니다. 따라서 관리자는 기업회원 계정을 통해 회원으로서 권리를 행사하거나 기업회원에서 탈퇴할 수 있고, 멤버들의 기업회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 DingDong 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다.</p>
											    <h2 class="combinationh2">여러분이 DingDong을 통해 공유하는 컨텐츠에 대한 권리와 책임은 여러분에게 있습니다.</h2>
											    <p class="combinationct">여러분은 사진, 글, 정보, 영상 등의 컨텐츠를 DingDong과 DingDong이 제공하는 여러 서비스에 게시할 수 있으며 이러한 게시물에 대한 저작권을 포함한 지적재산권은 당연히 권리자가 계속하여 보유합니다.</p>
											    <p class="combinationct">DingDong을 통해 여러분이 제공한 게시물을 적법하게 공유하려면 해당 컨텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다. 게시물 게재로 여러분은 DingDong에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다. 이러한 권리를 보유하지 않아 발생하는 모든 문제에 대해서는 게시자가 책임을 부담하게 됩니다.</p>
											    <p class="combinationct">DingDong은 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 DingDong 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다. 만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다.</p>
											    <p class="combinationct">또한 여러분이 제공한 소중한 콘텐츠는 DingDong 서비스를 개선하고 새로운 DingDong 서비스를 제공하기 위해 연구 개발 목적으로 DingDong에서 사용될 수 있습니다. DingDong은 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다.</p>
											    <h2 class="combinationh2">DingDong은 여러분의 더 활발한 이용을 지원하기 위한 포인트 제도를 가지고 있습니다.</h2>
											    <p class="combinationct">DingDong은 여러분의 DingDong 서비스에 대한 기여의 정도에 따라 활동점수 등의 포인트를 부여하고 있습니다. 활동점수는 여러분의 일정한 DingDong 서비스 이용과 연동하여 DingDong이 임의로 책정하거나 조정하여 부여하는 일정한 계산 단위를 갖는 서비스 상의 가상 데이터를 말합니다.</p>
											    <p class="combinationct">활동점수는 재산적 가치가 없기 때문에 금전으로 환불 또는 전환할 수 없지만, 활동점수의 많고 적음에 따라 여러분의 DingDong 서비스 이용에의 혜택이 차등화될 수 있으므로 서비스에 따라 적절히 활용해 보세요.</p>
											    <p class="combinationct">DingDong은 DingDong 서비스의 효율적 이용을 지원하거나 서비스 운영을 개선하기 위해 필요한 경우 사전에 여러분께 안내 드린 후 부득이 활동점수의 일부 또는 전부를 조정할 수 있습니다. 그리고 활동점수는 DingDong이 정한 기간에 따라 주기적으로 소멸할 수도 있으니 활동점수가 부여되는 DingDong 서비스 이용 시 유의해 주시기 바랍니다.</p>
											    <h2 class="combinationh2">DingDong 서비스에는 광고가 게재되어 있습니다.</h2>
											    <p class="combinationct">DingDong 서비스에는 다양한 종류의 광고가 게재되어 있습니다. 이는 여러분에게 제공하는 DingDong 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 DingDong이 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다.</p>
											    <p class="combinationct">DingDong은 더 나은 서비스의 제공을 위하여 여러분에게 서비스의 이용과 관련된 각종 고지, 관리 메시지 및 기타 광고를 비롯한 다양한 정보를 서비스 내에 표시하거나 여러분의 DingDong 계정 정보에 등록되어 있는 연락처로 직접 발송할 수 있습니다. 단, 광고성 정보 전송의 경우에는 사전에 수신에 동의한 경우에만 전송합니다.</p>
											    <p class="combinationct">DingDong은 사이트 등에 게재되어 있는 광고주의 홍보활동에 개인회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 모든 손실과 손해에 대해 책임을 지지 않습니다.</p>
											    <h2 class="combinationh2">DingDong 서비스의 일부 기능은 유료로 제공됩니다.</h2>
											    <p class="combinationct">DingDong 서비스는 무료로 제공되는 것이 기본 원칙입니다만, 개별 서비스 내의 일부 기능은 수익자 비용부담의 원칙 하에 유료로 제공될 수 있습니다. 여러분이 회사가 제공하는 유료 기능을 이용하는 경우 이용대금을 납부한 후 이용하는 것을 원칙으로 합니다. 여기서 정하지 않은 내용은 개별 서비스 운영 규정을 따릅니다.</p>
											    <h2 class="combinationh2">DingDong 서비스를 이용하실 때, 반드시 알고 계셔야 하는 주의사항이 있습니다.</h2>
											    <p class="combinationct">① 허위 정보를 기재하여 회원 가입 신청을 해서는 안 됩니다. 또한 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다.</p>
											    <p class="combinationct">② 타인에 대해 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 용납되지 않습니다.</p>
											    <p class="combinationct">③ 관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.</p>
											    <p class="combinationct">④ 성적 수치심을 유발시킬 수 있는 내용의 게시물, 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 사용하여 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.</p>
											    <p class="combinationct">⑤ DingDong 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물과 DingDong 서비스의 기능을 비정상적으로 이용하여 게재된 게시물은 다른 이용자들의 정상적인 DingDong 서비스 이용에 불편을 초래하고 더 나아가 DingDong의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다.</p>
											    <p class="combinationct">⑥ DingDong의 동의 없이 자동화된 수단에 의해 DingDong에 게시물을 업로드하거나, 업로드된 게시물 또는 광고 등의 컨텐츠에 수정・변조・삭제 등의 영향을 끼치는 행위는 금지됩니다.</p>
											    <p class="combinationct">여러분의 서비스 이용과 권리침해 예방을 위해 위의 사항에 해당하는 문제가 발생될 경우, 여러분의 게시물 게재나 DingDong 서비스 이용이 제한될 수 있습니다. 또한 여러분이 게재한 게시물이 관련 법령, 약관, 서비스 운영 규정 등에 위배되는 것으로 판단된다면 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 DingDong이 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다.</p>
											    <h2 class="combinationh2">DingDong 서비스가 업그레이드 또는 변경될 때 그 내용을 여러분께 알려드리겠습니다.</h2>
											    <p class="combinationct">DingDong은 여러분과의 소통을 소중하게 생각합니다.</p>
											    <p class="combinationct">여러분은 언제든지 DingDong의 고객센터에 접속하여 의견을 개진할 수 있습니다.</p>
											    <p class="combinationct">DingDong이 회원에게 개별적으로 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 알려 드릴 것이며, 회원 전체에 대한 공지가 필요할 경우엔 7일 이상 DingDong 초기 화면의 공지사항 등에 관련 내용을 게시하도록 하겠습니다.</p>
											    <h2 class="combinationh2">DingDong은 여러분의 개인정보를 소중하게 보호하겠습니다.</h2>
											    <p class="combinationct">DingDong은 서비스의 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집・이용하며, 개인정보 보호 관련 법령에 따라 관리합니다. 관련 법령에 의하거나 여러분이 별도로 동의하지 아니하는 한 회사가 여러분의 개인정보를 제3자에게 제공하는 일은 없습니다. DingDong이 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.</p>
											    <h2 class="combinationh2">DingDong이 정당한 책임을 수행하겠습니다.</h2>
											    <p class="combinationct">회사의 과실로 인하여 여러분이 손해를 입게 될 경우 본 약관 및 관련 법령에 따라 여러분의 손해를 배상하겠습니다. 다만 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 DingDong이 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 발생된 손해에 대해서는 책임을 부담하지 않습니다. 또한 회사는 관련 법률에 직접적으로 저촉되지 않는 한 간접 손해, 특별 손해, 결과적 손해, 징계적 손해, 및 징벌적 손해에 대한 책임을 부담하지 않습니다. 한편, 회사는 여러분 상호간 또는 여러분과 제3자 상호간에 서비스를 매개로 발생한 분쟁에 대해서는 개입할 의무가 없으며 이로 인한 손해를 배상할 책임도 없습니다.</p>
											    <h2 class="combinationh2">여러분은 언제든지 자유롭게 서비스 이용계약을 해지할 수 있습니다.</h2>
											    <p class="combinationct">회원은 언제든지 DingDong 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 DingDong은 관련 법령 등이 정하는 바에 따라 즉시 처리합니다.</p>
											    <p class="combinationct">유료서비스 이용계약의 해지는 여러분의 유료서비스 이용계약 해지 신청 및 회사의 승낙에 의해 성립하게 되고, 환불할 금액이 있는 경우 환불도 이루어 지게 됩니다. 다만 각 세부 하위 서비스의 일부 유료 기능에서 본 약관과 다른 계약해지 방법 및 효과를 규정하고 있는 경우 각 유료서비스 관련 세부지침에서 정한 바에 따릅니다.</p>
											    <p class="combinationct">서비스 이용계약이 해지된 경우라도 여러분은 다시 회사에 대하여 이용계약의 체결을 신청할 수 있습니다. 다만, 여러분이 관련 법령, 본 약관 및 세부지침을 준수하지 않아 서비스의 이용이 중단된 상태에서 이용계약을 해지한 후 다시 이용계약 체결을 신청하는 경우에는 통합 서비스 가입과 개별 서비스의 이용에 일정기간 기능적 제한이 있을 수 있습니다.</p>
											    <h2 class="combinationh2">여러분이 쉽게 확인 할 수 있는 곳에 이 약관을 게시하고 개정하게 되는 경우에는 사전공지하겠습니다.</h2>
											    <p class="combinationct">이 약관의 내용을 여러분이 손쉽게 확인할 수 있도록 서비스 초기 화면에 게시합니다.</p>
											    <p class="combinationct">DingDong은 관련 법령을 위배하지 않는 범위 내에서 본 약관을 변경할 수 있습니다. 본 약관이 변경되는 경우, 회사는 변경사항을 시행일자 7일 전부터 여러분에게 서비스 공지사항에서 공지 또는 통지하는 것을 원칙으로 하며, 여러분에게 불리한 내용으로 변경할 경우에는 그 시행일자 30일 전부터 서비스 내에 공지하고 별도의 전자적 수단(이메일 등)을 통해 개별적으로 알릴 것입니다.</p>
											    <p class="combinationct">DingDong이 변경된 약관을 게시한 날부터 효력 발생일까지 거부의사가 표시되지 않을 경우에는 여러분이 변경된 약관으로 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 또한 여러분은 변경된 약관에 대하여 거부의사를 표시함으로써 이용계약의 해지를 선택할 수 있습니다.</p>
											    <p class="combinationct">이 약관은 한국어를 정본으로 합니다. 약관 또는 DingDong 서비스와 관련된 여러분과 DingDong과의 관계에는 대한민국의 법령이 적용됩니다. 그리고 약관 또는 DingDong 서비스와 관련하여 여러분과 DingDong 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다.</p>
											  </div>
											</div>
										</span>
									</div>
								</div>
								<div style="margin: 20px 0px">
									<div style="width: 100%; height: 20px; display: flex; justify-content: flex-start; column-gap: 0.5rem; align-items: center;">
										<input type="checkbox" class="eachagreecheckbox">
										<span style="color: #111827; font-size: 14px;">개인 정보 처리 방침
										<button id="Btnmodal" type="button" style="color: #0090F9; font-size: 14px; border: none; background-color: #fff; padding: 0px; text-decoration: underline;">보기</button>
										<!-- 모달 -->
											<div id="Modalmy" class="individualmodal">
											  <!-- 모달 내용 -->
											  <div class="individualmodal-content">
											    <div style="width: 100%; height: 38px;">
											    	<span class="individualmodal-close">&times;</span>
											    	</div>
											    	<h2 style="font-size: 32px; color: #111827; font-weight: 700;">개인정보 처리방침</h2>
											    	<h2 class="combinationh2">1.</h2>
											    	<p class="combinationct">“개인정보 처리방침”은 이용자가 안심하고 서비스를 이용할 수 있도록 회사가 준수해야 할 지침을 의미하며, DingDong은 개인정보처리자가 준수하여야 하는 대한민국의 관계 법령 및 개인정보보호 규정, 가이드라인을 준수하여 개인정보 처리방침을 제공합니다.</p>
											    	<p class="combinationct">DingDong은 이용자의 동의를 기반으로 개인정보를 수집·이용 및 제공하고 있으며 이용자의 권리(개인정보 자기결정권)를 적극적으로 보장하기 위해 개인정보 처리방침을 알기 쉽게 제공할 수 있도록 다양한 노력을 기울이고 있습니다.</p>
											    	<h2 class="combinationh2">2.</h2>
											    	<p class="combinationct">DingDong 이용자는 회원가입을 하지 않아도 대부분의 DingDong 서비스를 회원과 동일하게 이용할 수 있습니다.</p>
											    	<p class="combinationct">이용자가 컨텐츠를 게시하거나 이용하는 등의 목적으로 회원가입을 할 경우, DingDong은 서비스 제공을 위해 필요한 최소한의 개인정보를 수집합니다.</p>
											    	<h2 class="combinationh2">3.</h2>
											    	<p class="combinationct">서비스 제공을 위해 수집하는 개인정보는 아래와 같습니다.</p>
											    	<p class="combinationct">회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다.</p>
											    	<p class="combinationct">회원정보에 별명을 입력하지 않은 경우에는 가상 아이디가 별명으로 자동 입력됩니다. DingDong 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집이 필요한 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.</p>
											    	<p class="combinationct">이용자 동의 후 개인정보를 추가 수집하는 경우, 서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보가 수집될 수 있습니다.</p>
											    	<p class="combinationct">DingDong은 아래의 방법을 통해 개인정보를 수집합니다.</p>
											    	<p class="combinationct">회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의를 하고 직접 정보를 입력하는 경우, 해당 개인정보를 수집합니다.</p>
											    	<p class="combinationct">고객센터를 통한 상담 과정에서 웹페이지, 메일, 전화 등을 통해 이용자의 개인정보가 수집될 수 있습니다.</p>
											    	<p class="combinationct">오프라인에서 진행되는 이벤트, 세미나 등에서 서면을 통해 개인정보가 수집될 수 있습니다.</p>
											    	<p class="combinationct">DingDong과 제휴한 외부 기업이나 단체로부터 개인정보를 제공받거나 제공할 수 있으며, 이러한 경우에는 개인정보보호법에서 요구하는 동의 등의 절차를 거치게 됩니다. 기기정보와 같은 생성정보는 PC웹, 모바일 웹/앱 이용 과정에서 자동으로 생성되어 수집될 수 있습니다.</p>
											    	<h2 class="combinationh2">수집하는 개인정보 세부 내역</h2>
											    	<ol style="list-style-type: decimal;">
											    		<li style="width: 100%;"> 회원가입 시 수집
											    			<ol style="list-style-type: disc;">
											    				<li>일반 가입: 로그인 아이디, 비밀번호, 이름, 이메일, 접속 IP 정보, 쿠키, 서비스 이용 기록, 접속 로그</li>
											    				<li>소셜회원 가입
											    					<ol style="list-style-type: disc;">
											    						<li>카카오: 프로필 이미지(선택 사항), 이메일, 이름</li>
											    						<li>구글: 프로필 이미지(선택 사항), 이메일, 이름</li>
											    						<li>Facebook: 프로필 이미지(선택 사항), 이메일, 이름</li>
											    						<li>GitHub: 프로필 이미지(선택 사항), 이메일</li>
											    						<li>Naver: 프로필 이미지(선택 사항), 이메일, 이름</li>
											    					</ol>
											    				</li>
											    				<li>기업회원 가입: 사업자 등록번호, 기업명, 대표자명, 회사주소, 업종, 연락처, 담당자명, 이메일, 사업자 증빙서류(사업자 등록증, 사업자 등록 증명원)</li>
											    			</ol>
											    		</li>
											    		<li> 이력서 저장 시 수집
											    			<ol style="list-style-type: disc;">
											    				<li>필수: 이름, 연락처(전화번호/휴대폰), 이메일, 직군, 직무, 보유기술, 연차, 학력, 근무경력, 선호하는 근무조건</li>
											    				<li>선택: 근무경력, 프로젝트경력, 상세소개, 이력서, 포트폴리오, 홈페이지, SNS주소</li>
											    			</ol>
											    		</li>
											    		<li> 스마트 필터 이용 시 수집
											    			<ol style="list-style-type: disc;">
												    			<li>
												    				필수 항목 : 경력, 연봉
												    			</li>
											    			</ol>
											    		</li>
											    		<li> 본인인증 시 수집
											    			<ol style="list-style-type: disc;">
												    			<li>
												    				생년월일, 성별, 내/외국인
												    			</li>
											    			</ol>
											    		</li>
											    		<li> 유료 정보 이용 시 수집
											    			<ol style="list-style-type: disc;">
											    				<li>
											    					필수 항목: 은행명, 계좌번호, 계좌주명, 카드사명, 카드번호, 생년월 (개인카드)
											    				</li>
											    			</ol>
											    		</li>
											    		<li> 서비스 이용과정이나 사업처리 과정에서 자동 수집
											    			<ol style="list-style-type: disc;">
												    			<li>
												    				IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록, 광고 아이디, 접속 환경
												    			</li>
											    			</ol>
											    		</li>
											    	</ol>
											    	<h2 class="combinationh2">4.</h2>
											    	<p class="combinationct">DingDong은 회원관리, 서비스 개발·제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.</p>
											    	<p class="combinationct">회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.</p>
											    	<p class="combinationct">콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.</p>
											    	<p class="combinationct">법령 및 약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.</p>
											    	<p class="combinationct">유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.</p>
											    	<p class="combinationct">이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다. 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.</p>
											    	<p class="combinationct">보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.</p>
											    	<p class="combinationct">DingDong은 수집한 개인정보를 특정 개인을 알아볼 수 없도록 가명처리하여 통계작성, 과학적 연구, 공익적 기록 보존 등을 위하여 처리할 수 있습니다. 이 때 가명정보는 재식별되지 않도록 추가정보와 분리하여 별도 저장·관리하고 필요한 기술적·관리적 보호조치를 취합니다.</p>
											    	<h2 class="combinationh2">5.</h2>
											    	<p class="combinationct">DingDong은 이용자의 사전 동의 없이 개인정보를 외부에 제공하지 않습니다. 단, 이용자가 외부 제휴사의 서비스를 이용하기 위하여 개인정보 제공에 직접 동의를 한 경우, 그리고 관련 법령에 의거해 DingDong에 개인정보 제출 의무가 발생한 경우, 이용자의 생명이나 안전에 급박한 위험이 확인되어 이를 해소하기 위한 경우에 한하여 개인정보를 제공하고 있습니다.</p>
											    	<p class="combinationct">DingDong은 편리하고 더 나은 서비스를 제공하기 위해 업무 중 일부를 외부에 위탁하고 있습니다.</p>
											    	<p class="combinationct">DingDong은 서비스 제공을 위하여 필요한 업무 중 일부를 외부 업체에 위탁하고 있으며, 위탁받은 업체가 개인정보보호법에 따라 개인정보를 안전하게 처리하도록 필요한 사항을 규정하고 관리/감독을 하고 있습니다.</p>
											    	<p class="combinationct">DingDong이 수탁업체에 위탁하는 업무와 관련된 서비스를 이용하지 않는 경우, 이용자의 개인정보가 수탁업체에 제공되지 않습니다.</p>
											    	<h2 class="combinationh2">이용자 동의 후 개인정보 제공이 발생하는 경우</h2>
											    	<p class="combinationct">DingDong 서비스 이용을 위해 개인정보를 제공하는 목록입니다.</p>
											    	<p class="combinationct">이용자가 해당 서비스 이용을 위해 자신의 개인정보를 제3자에게 제공하는 것에 대해 동의한 경우이며, 회사는 이용자에게 '개인정보를 제공받는 자, 개인정보를 제공받는자의 이용 목적, 제공하는 개인정보 항목, 제공받는 개인정보의 보유 및 이용기간'을 사전에 개인정보처리지침을 통해 고지하고 서비스 신청 단계에서 이에 대해 명시적·개별적 동의를 얻습니다.</p>
											    	<p class="combinationct">해당 서비스를 이용하지 않는 경우에는 개인정보 제공이 발생하지 않습니다.</p>
											    	<p class="combinationct"><strong>DingDong Jobs Position (구인 서비스)</strong></p>
											    	<ol style="list-style-type: disc;">
											    		<li>제공 받는 자 : 구인게시물을 업로드한 기업회원</li>
											    		<li>제공 목적 : 채용 논의 진행</li>
											    		<li>제공하는 개인정보 항목 : 이메일</li>
											    		<li>개인정보를 제공받는 자의 개인정보 보유 및 이용 기간 : 서비스 해지 시까지 또는 채용 종료 시까지</li>
											    	</ol>
											    	<p class="combinationct"><strong>DingDong Jobs Talent (구직 서비스)</strong></p>
											    	<ol style="list-style-type: disc;">
											    		<li>제공 받는 자 : 구직 서비스 이용을 신청한 기업회원</li>
											    		<li>제공 목적 : 채용 논의 진행</li>
											    		<li>제공하는 개인정보 항목 : 기본정보(이름, 이메일, 휴대폰), 사진, 학력사항(학교명, 졸업여부, 전공), 경력사항(경력구분, 회사명, 재직여부, 재직기간, 총 경력), 홈페이지, 자기소개서</li>
											    		<li>개인정보를 제공받는 자의 개인정보 보유 및 이용 기간 : 서비스 해지 시까지 또는 최대 150일까지</li>
											    	</ol>
											    	<h2 class="combinationh2">6.</h2>
											    	<p class="combinationct">회사는 이용자의 개인정보를 회원 탈퇴 또는 이용목적 달성 시 지체없이 파기하고 있습니다.</p>
											    	<p class="combinationct">단, 회원에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.</p>
											    	<ol style="list-style-type: decimal;">
											    		<li>내부 방침에 의한 보관
											    			<ol style="list-style-type: disc;">
											    				<li>부정이용기록은 부정 이용 방지를 위해 1년간 보관됩니다.</li>
											    			</ol>
											    		</li>
											    		<li>관련 법령에 의한 보관
											    			<ol style="list-style-type: disc;">
											    				<li>계약 또는 청약철회 등에 관한 기록 보유 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)</li>
											    				<li>대금결제 및 재화 등의 공급에 관한 기록 보유 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)</li>
											    				<li>소비자 불만 또는 분쟁처리에 관한 기록 보유 : 3년 (전자상거래 등에서의 소비자보호에 관한 법률)</li>
											    				<li>방문에 관한 기록 보유 : 3개월 (통신비밀보호법)</li>
											    			</ol>
											    		</li>
											    	</ol>
											    	<p class="combinationct">개인정보가 삭제되더라도 업로드한 정보, 질문, 답변은 사이트에 남아있게 되며, 작성자는 익명화되어 나중에 사이트를 다시 방문하더라도 작성자가 누구인지 식별되지 않습니다. 개인정보가 삭제된 후에는 작성자가 누구인지 특정하기 어려우므로, 작성자의 권한에 의한 삭제는 불가능합니다. 따라서, 컨텐츠와 개인정보를 모두 삭제하기 원하는 경우에는 컨텐츠 삭제 처리를 완료한 후 회원탈퇴를 진행하셔야 합니다.</p>
											    	<h2 class="combinationh2">7.</h2>
											    	<p class="combinationct">회원은 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 비밀번호를 포함한 회원의 개인정보가 유출되지 않도록 조심하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오.</p>
											    	<p class="combinationct">회원이 입력한 부정확한 정보로 인해 발생하는 사고의 책임은 회원 자신에게 있습니다. 회원은 개인정보를 최신의 상태로 정확하게 입력하여 불의의 사고를 예방하여야 할 의무가 있습니다.</p>
											    	<p class="combinationct">회원이 위 책임을 다하지 못하고 타인의 정보 및 존엄성을 훼손할 시에는 『개인정보 보호법』, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 등 관련 법률에 의해 처벌받을 수 있습니다.</p>
											    	<p class="combinationct">❶ 회원은 언제든지 DingDong 로그인 후, 로그인 아이디를 제외한 자신의 개인정보를 조회하거나 수정할 수 있습니다.
											    	<br>
																			 ❷ 회원은 언제든지 회원 탈퇴 등을 통해 개인정보의 수집 및 이용 동의를 철회할 수 있습니다.
													<br>
																			 ❸ 회원이 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 해당 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.
													</p>
											    	<h2 class="combinationh2">8.</h2>
											    	<p class="combinationct">DingDong은 회원의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다.</p>
											    	<p class="combinationct"><strong>해킹 등에 대비한 대책</strong><br>DingDong은 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다. 회원의 개인정보나 자료가 유출되거나 손상되지 않도록 방지하고 있으며, 암호화 통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. 그리고 침입차단시스템 등을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</p>
											    	<p class="combinationct"><strong>개인정보취급자의 최소화 및 교육</strong><br>DingDong의 개인정보취급자는 해당 업무를 직접적으로 수행하는 담당자에 한정시키고 있으며 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 회사의 개인정보보호 정책 및 개인정보 처리방침 등 관련 규정의 준수를 항상 강조하고 있습니다.</p>
											    	<p class="combinationct"><strong>개인정보보호전담기구의 운영</strong><br>DingDong은 사내 개인정보보호전담기구 등을 통하여 회사의 개인정보보호정책 및 개인정보 처리방침의 이행사항 및 담당자의 준수여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다. 단, 회원 본인의 부주의나 회사의 고의 또는 중대한 과실이 아닌 사유로 개인정보가 유출되어 발생한 문제에 대해 회사는 일체의 책임을 지지 않습니다.</p>
											    	<h2 class="combinationh2">9.</h2>
											    	<p class="combinationct">DingDong은 이용자의 개인정보 관련 문의사항 및 불만 처리 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p>
											    	<p class="combinationct">개인정보 관리책임자<br>이 름: 홍길동<br>전 화: 031-1234-5678<br>메 일: info@dingdong.kr</p>
											    	<p class="combinationct">기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.</p>
											    	<p class="combinationct">개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)<br>대검찰청 사이버범죄수사단 (www.spo.go.kr / 02-3480-3571)<br>경찰청 사이버안전국 (www.ctrc.go.kr / 국번없이 182)</p>
												</div>
										    </div>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="recaptchaform">
						<div id="recaptcha"></div>
					</div>
					<button class="signupbtnform" type="submit" id="signupbtn" value="Sign up" disabled>
						<strong style="font-size: 14px; color: #fff;">회원가입</strong>
					</button>
					<p class="pathloginmember">
						<span style="font-size: 14px; color: #111827;">이미 회원이신가요?</span>
						<a href="/login" style="font-size: 14px; color: #0090F9; margin: 0px 0px 0px 4px;">로그인</a>
					</p>
					</form>
			
				</div>
			</div>
		</div>
	</div>
	
		<script src="${contextPath }/resources/js/signup.js"></script>
		<%@ include file="include/footer.jsp" %>
		<script>
			function toggleCheckboxes() {
			    var agreeAllCheckbox = document.getElementById("agreeall");
			    var checkboxes = document.getElementsByClassName("eachagreecheckbox");
			
			    for (var i = 0; i < checkboxes.length; i++) {
			        checkboxes[i].checked = agreeAllCheckbox.checked;
			    }
			}
		</script>
		
		<script>
			// 각각의 체크박스 요소를 선택합니다.
			const eachCheckboxes = document.querySelectorAll('.eachagreecheckbox');
			// 전체 동의 체크박스 요소를 선택합니다.
			const allCheckbox = document.querySelector('.allagreecheckbox');
			
			// 각각의 체크박스에 대해 변경 이벤트를 추가합니다.
			eachCheckboxes.forEach(checkbox => {
			    checkbox.addEventListener('change', function() {
			        // 모든 각각의 체크박스가 선택되었는지 확인합니다.
			        const allChecked = [...eachCheckboxes].every(checkbox => checkbox.checked);
			        // 전체 동의 체크박스를 변경합니다.
			        allCheckbox.checked = allChecked;
			    });
			});
			
			// 전체 동의 체크박스에 대해 변경 이벤트를 추가합니다.
			allCheckbox.addEventListener('change', function() {
			    // 전체 동의 체크박스의 상태에 따라 각각의 체크박스를 변경합니다.
			    eachCheckboxes.forEach(checkbox => {
			        checkbox.checked = allCheckbox.checked;
			    });
			});
		</script>
		
		<script>document.getElementById("myButton").addEventListener("click", function() {
			  this.classList.toggle("clicked");
		});
		</script>
		<script>
			// 모달 버튼 선택
			var modalBtn = document.getElementById("modalBtn");
	
			// 모달 창 선택
			var modal = document.getElementById("myModal");
	
			// 모달 창 닫기 버튼 선택
			var closeBtn = document.getElementsByClassName("combinationmodal-close")[0];
	
			// 모달 버튼 클릭 이벤트 핸들러
			modalBtn.onclick = function() {
			  modal.style.display = "block";
			}
	
			// 모달 닫기 버튼 클릭 이벤트 핸들러
			closeBtn.onclick = function() {
			  modal.style.display = "none";
			}
	
			// 모달 영역 외 클릭 시 모달 닫기
			window.onclick = function(event) {
			  if (event.target == modal) {
			    modal.style.display = "none";
			  }
			}
		</script>
		<script>
			// 모달 버튼 선택
			var Btnmodal = document.getElementById("Btnmodal");
	
			// 모달 창 선택
			var Modalmy = document.getElementById("Modalmy");
	
			// 모달 창 닫기 버튼 선택
			var Btnclose = document.getElementsByClassName("individualmodal-close")[0];
	
			// 모달 버튼 클릭 이벤트 핸들러
			Btnmodal.onclick = function() {
				Modalmy.style.display = "block";
			}
	
			// 모달 닫기 버튼 클릭 이벤트 핸들러
			Btnclose.onclick = function() {
				Modalmy.style.display = "none";
			}
	
			// 모달 영역 외 클릭 시 모달 닫기
			window.onclick = function(event) {
			  if (event.target == Modalmy) {
				  Modalmy.style.display = "none";
			  }
			}
		</script>


		<script type="text/javascript">
		    var onloadCallback = function() {
			captcha = grecaptcha.render('recaptcha', {
			    'sitekey' : '6LduZnopAAAAAG58eFt2dQmsLx4z6kHe5v5qjg2F',
			    'secretkey' : '6LduZnopAAAAAKBKcj9oWtXw5fTqnL2MFQNNkIWE',
			    'type':'the text'
			});
		    };
		</script>
		<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer>
		</script>
		
		<script>
			// 'agreeall' 체크박스와 'eachagreecheckbox' 클래스를 가진 체크박스들을 선택합니다.
			const agreeAllCheckbox = document.getElementById('agreeall');
			const eachAgreeCheckboxes = document.querySelectorAll('.eachagreecheckbox');
			const signupButton = document.getElementById('signupbtn');
	
			// 함수를 만들어 체크박스들의 상태를 확인하고 버튼을 활성화 또는 비활성화합니다.
			function checkAgreement() {
			    // agreeall 체크박스가 체크되었는지 확인합니다.
			    const agreeAllChecked = agreeAllCheckbox.checked;
	
			    // eachagreecheckbox 클래스를 가진 체크박스들의 체크 상태를 확인합니다.
			    const eachAgreeCheckboxesChecked = Array.from(eachAgreeCheckboxes).every(checkbox => checkbox.checked);
	
			    // 'agreeall' 체크박스가 체크되었거나 'eachagreecheckbox' 클래스를 가진 모든 체크박스들이 체크되었을 때 버튼을 활성화합니다.
			    signupButton.disabled = !(agreeAllChecked || eachAgreeCheckboxesChecked);
			}
	
			// 체크박스들의 상태가 변경될 때마다 checkAgreement 함수를 호출하여 버튼 상태를 업데이트합니다.
			agreeAllCheckbox.addEventListener('change', checkAgreement);
			eachAgreeCheckboxes.forEach(checkbox => checkbox.addEventListener('change', checkAgreement));
		</script>
		
		<script>
		// HTML에서 "직접입력" 옵션을 선택했을 때 이벤트 처리
		document.querySelector('.selectform').addEventListener('change', function() {
		    var domainSelect = document.querySelector('[name="emailDomain"]');
		    var customDomainOption = domainSelect.options[domainSelect.selectedIndex];

		    // "직접입력" 옵션을 선택한 경우
		    if (customDomainOption.value === '직접입력') {
		        var emailIdInput = document.querySelector('[name="emailId"]');
		        var emailId = emailIdInput.value.trim(); // 입력한 이메일 ID를 얻기

		        // 입력한 이메일 ID가 비어 있지 않은 경우
		        if (emailId !== '') {
		            var emailAddress = emailId + customDomainOption.value; // 이메일 주소 생성
		            console.log('사용자의 이메일 주소:', emailAddress);
		            // 여기서 할 일: 이메일 주소를 사용하여 필요한 작업 수행 (예: 유효성 검사, 이메일 전송 등)
		        } else {
		            console.log('이메일 ID를 입력하세요.');
		        }
		    }
		});
		
		
		
		
		// 새별: kakao, naver 버튼 클릭 시 api 실행
		// 그냥 버튼 href로 구현 되면 좋겠는데 계속 오류나서 그냥 여기로 뺐음(24/03/06)
		function kakaoLogin(){
			location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=02dbaa97c87035feee18dd2668dd61a6&redirect_uri=http://localhost:8080/dingdong/oauth/kakao&response_type=code'
		}
		
		function naverLogin(){
			location.href = 'https://nid.naver.com/oauth2.0/authorize?client_id=6f2bLBR28K9LHe94s9_i&state=STATE_STRING&redirect_uri=http://localhost:8080/dingdong/oauth/naver&response_type=code'
		}
		
		
		</script>
		
</body>
</html>