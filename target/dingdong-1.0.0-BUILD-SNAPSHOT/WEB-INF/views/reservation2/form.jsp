<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<%@ include file="../include/head.jsp" %>
</head>
<body>
	<div class="frame">

		<!-- header -->
		
		
		<!--  nav -->
		<nav>
		<%@ include file="../include/nav.jsp" %>
		</nav>
			
		<!-- container -->
		<div class="container">
		
			<div align="center">
			
				
				<!-- 새별: 순서는 branchList - listAll - detail - form(결제 ajax) - success(결제 성공 시)입니다. -->
				
				<br>	
				<h1>여기에 정보 구현</h1><br>
				${room.name}<br>
				날짜 <input type="hidden" id="reservationDate" name="date" value="${reservation.date}"/>${reservation.date}<br>
				시작 ${reservation.start}<br>
				끝 ${reservation.end}
				
				<br>
				<br>
				<hr>
				<br>
				<br>
				<input type="hidden" name="roomNumber" value="${room.roomNumber}"/>
				<!-- 이름 들어와있고 수정할 수 있게  구현 -->
				이름 <input name="name" id="name" value="${reservation.name}"/><br>
				전화번호 <input type="tel" name="phone" id="phone" value="${reservation.phone}" placeholder="010-1234-5678" required/><br>
				인원 <select name="party" id="party">
				        <option value="3">3명</option>
				        <option value="4">4명</option>
				        <option value="5">5명</option>
				        <option value="6">6명</option>
				    </select><br>
				결제 방식 <select name="pay_method" id="pay_method">
				          <option value="kakaopay">카카오페이</option>
				          <option value="naverpay">네이버페이</option>
				        </select>
				
				  <br>
				  <br>
				<button class="btn btn-primary" id="payment">결제하기</button>
							
				
			</div>
		
		
		</div>
		
		
		
	</div>
	
	<!-- footer -->
	<footer>
	<%@ include file="../include/footer.jsp" %>
	</footer>


<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>

//	새별: 결제하기 버튼 클릭 이벤트
const buyButton = document.getElementById('payment');
buyButton.setAttribute('onclick', `kakaoPay('${reservation.email}', '${reservation.name}')`);


// 새별: 카카오페이 ajax
// 현재(24/03/06) 카카오페이만 구현되어있기 때문에 결제 버튼을 누르면 무조건 카카오페이 api가 실행됩니다.
// 추가 시 pay_method에 따라 함수가 실행될 수 있도록 구현해야합니다.
function kakaoPay(email, name) {
    if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
      if (${member != null}) { // 회원만 결제 가능(어차피 인터셉트로 못 들어오게 막을 거긴 한데 더블 체크 24/03/06)
    	

    	// 주문번호: 카카오페이 K + YYYYMMDDssms + 아이디 두글자 대문자 변환 
        var merchant_uid = "K" + makeMerchantUid();
      	console.log("[주문번호] " + merchant_uid);
      	var start = '${reservation.start}';
      	var end = '${reservation.end}';
      	
        var cost =  ( end.substring(10, 12) - start.substring(10, 12) ) * ${room.cost};
        
        console.log(start);
        console.log(end.substring(10, 12));
        console.log(start.substring(10, 12));
        console.log(end);
        console.log(cost);
        
        IMP.init("imp86101416"); // 가맹점 식별코드
        IMP.request_pay({
          pg: 'kakaopay', // PG사 코드표에서 선택
          pay_method: 'card', // 결제 방식
          merchant_uid : merchant_uid, // 결제 고유 번호
          name: '${room.name}', // 제품명
          amount: cost, // 가격
          
          //구매자 정보
          buyer_email: email,
          buyer_name: name,
          // buyer_tel : '010-1234-5678',
          // buyer_addr : '주소',
          // buyer_postcode : '123-456'
        }, async function (rsp) { // callback
		  //결제 성공시
          if (rsp.success) { 
            console.log(rsp);
          	console.log(rsp.imp_uid);

          	// reservation DB에 정보를 넣습니당
            $.ajax({
                url : "/dingdong/reservation2/insert",
                data : {
                    'reservationNumber' : merchant_uid,
                    'studyroomNumber' : '${room.studyroom}',
                    'roomNumber' : '${room.roomNumber}',
                    'memberId' : '${member.id}',
                    'name' : document.getElementById("name").value,
                    'phone' : '${reservation.phone}',
                    'start' : '${reservation.start}',
                    'end' : '${reservation.end}',
                    'cost' : cost,
                    'party' : document.getElementById("party").value,
                    'reservationDate' : document.getElementById("reservationDate").value,
                    'phone' : document.getElementById("phone").value,
                    'payWith' : 'kakaoPay',
                   	'email' : email
                },
                type : 'post',
                dataType : 'json',
                success : function (data) {
                	// ajax 통신 성공
                	// data.status == 200 은 DB저장 성공 시 반환되는 코드입니다.
                	// 성공 시 로직을 구현할 수 있습니다.
                	if(data === 0){
	                    alert('결제 완료!')
    	                location.href='/dingdong/reservation2/success?number=' + merchant_uid;
                	}
                },
                error : function (data) {
                    alert(`error:[${response.status}]\n결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
                    window.location.reload();
                }
            })
          } else if (rsp.success == false) { // 결제 실패시
            alert(rsp.error_msg)
          }
        });
      }
      else { // 비회원 결제 불가
        alert('로그인이 필요합니다!');
        location.href='${contextPath}/login';
      }
    } else { // 구매 확인 알림창 취소 클릭시 돌아가기
      return false;
    }
  }
  
  
//	새별: 주문 번호 생성 yyyymmddhhmmssmsID
function makeMerchantUid(){
	
	var id = '${member.id}';
	
	
    var today = new Date();
   	console.log(today);
   	var year = today.getFullYear();
   	
   	var month = today.getMonth() + 1;
   	if(month.toString().length === 1){
   		month = '0' + month;
   	}
   	
    var hours = today.getHours(); // 시
    if(hours.toString().length === 1){
    	hours = '0' + hours;
    }
    
    var minutes = today.getMinutes();  // 분
    if(minutes.toString().length === 1){
    	minutes = '0' + minutes;
    }
    
    var seconds = today.getSeconds();  // 초
    if(seconds.toString().length === 1){
    	seconds = '0' + seconds;
    }
    
    var milliseconds = today.getMilliseconds();
    
    
    console.log(year);
    console.log(month);
    console.log(hours);
    console.log(minutes);
    console.log(seconds);
    console.log(milliseconds);
    
    
    var makeMerchantUid = year.toString() + month.toString() + hours.toString() + minutes.toString() + seconds.toString() + milliseconds.toString();

    // yyyymmddhhmmssms에 아이디 두글자를 붙여서 반환합니다.
    return makeMerchantUid + id.substring(0,2).toUpperCase();
}


</script>
</body>
</html>