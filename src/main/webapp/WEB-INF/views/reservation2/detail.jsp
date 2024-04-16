<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<%@ include file="../include/head.jsp" %>

<style>

  
   #calendar {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 5px;
  }
  .calendar-day {
    border: 1px solid #ccc;
    padding: 5px;
    text-align: center;
    cursor: pointer;
  }
  .calendar-day:hover {
    background-color: #f0f0f0;
  }


  .time-btn {
    margin: 5px;
    padding: 10px;
    border: 1px solid #ccc;
    cursor: pointer;
  }
  .time-btn.disabled {
    background-color: #eee;
    cursor: not-allowed;
  }
  
</style>

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
		
			<!-- 스터디룸 정보 -->
			<div align="center">
			<br>
			
				<h1>${room.name}</h1>
				<br>
					<div class="image-box" style="width: 40%; height: 20%; overflow:hidden; margin:0 auto">
						<img class="image-thumbnail" style="width:100%; height: 100%; object-fit: cover" src="${contextPath}/resources/images/room/${room.fileName}" alt="${room.name}">
					</div>
					<br>
					
					<br>
					<br>
					<br>
						<div id="calendar"></div>
						<div id="selectDay"></div>
						
				
					수용인원 | ${room.min}명 ~ ${room.max}명<br>
					<br>
					${room.content}<br>
					
					<br>
					<br>
					
					
					<div id="time-buttons-container"></div>
					
					<br>
					<br>
					
					<form action="${contextPath }/reservation2/form" method="post">
						<!--   <div id="calendar"></div> -->
						<input id="dateInput" type="text" value="" name="date"/>
						<input type="hidden" name="studyroomNumber" value="${room.studyroom}">
						<input type="hidden" name="roomNumber" value="${room.roomNumber}"/>
						<input type="text" name="start" id="start"/>
						<input type="text" name="end" id="end"/>
					<input type="submit" id="submitReservation" class="btn btn-primary" value="예약하기"/>
					</form>
			</div>
		
			
				
		</div>
			
		<br>
		<br>
		<hr>
		<br>
		<br>
		
		<div align="center">
			<br>
			<br>
			<br>
			<h2>여기에 리뷰 구현</h2>
			<br>
			<br>
			<br>
		</div>
		
	</div>
	
	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>

<script>

$("#submitReservation").click(function(){
	location.href
})

</script>


<script>
$(document).ready(function() {
    // 서버에서 예약된 시간 가져오는 API 호출
    $.ajax({
        url: 'reservedTime',
        type: 'GET',
        data: { 'date': "2024-03-07" },
        success: function(reservations) {
            console.log(reservations);
            createButtons(reservations);
        }
    });
});

var startTime = null;
var endTime = null;


var calendarContainer = document.getElementById("calendar");
var selectDayContainer = document.getElementById("selectDay");
var date = selectDay.innerText;

var dateInput = document.getElementById("dateInput");


// HTML 요소를 가져와 변수에 저장
var timeButtonsContainer = document.getElementById("time-buttons-container");


// 시작 시간부터 끝 시간까지 버튼 생성
function createButtons(reservations) {
    for (var i = 9; i <= 24; i++) {
    	
    	var date = "2024-03-07";
    	//date = selectDay.innerText;
    	
        var button = document.createElement("button");
        button.textContent = i + ":00";
        button.classList.add("time-btn");

        for (var j = 0; j < reservations.length; j++) {
            var iTime = new Date(date + " " + i + ":00:00");
            var startTimeReserved = new Date(reservations[j].start);
            var endTimeReserved = new Date(reservations[j].end);

            if ((iTime >= startTimeReserved && iTime < endTimeReserved)) {
                button.classList.add("disabled");
                button.disabled = true;
                break;
            }
        }

        button.addEventListener("click", function() {
            var selectedTime = parseInt(this.textContent);

            if (!startTime) {
                startTime = selectedTime;
                date = selectDay.innerText;
                dateInput.value = date;
                document.getElementById("start").value = date + " " + startTime + ":00";
            } else if (!endTime && selectedTime > startTime) {
                endTime = selectedTime;
                date = selectDay.innerText;
                dateInput.value = date;
                document.getElementById("end").value = date + " " + endTime + ":00";
            } else {
                startTime = null;
                endTime = null;
                document.getElementById("start").value = "";
                document.getElementById("end").value = "";
                dateInput.value = "";
            }
        });

        timeButtonsContainer.appendChild(button);
    }
}
</script>




<script>

// 현재 날짜 가져오기
var currentDate = new Date();
var currentYear = currentDate.getFullYear();
var currentMonth = currentDate.getMonth();

// 현재 월의 첫째 날과 마지막 날 가져오기
var firstDayOfMonth = new Date(currentYear, currentMonth, 1);
var lastDayOfMonth = new Date(currentYear, currentMonth + 1, 0);

// 달력 생성 함수 호출
generateCalendar(currentYear, currentMonth);

// 달력 생성 함수
function generateCalendar(year, month) {
    // 달력을 초기화
    calendarContainer.innerHTML = '';

    // 현재 월의 첫째 날의 요일
    var firstDayOfWeek = firstDayOfMonth.getDay();

    // 이전 달의 마지막 날짜
    var lastDayOfPrevMonth = new Date(year, month, 0).getDate();

    // 이번 달의 일자를 달력에 추가
    for (var i = 1; i <= lastDayOfMonth.getDate(); i++) {
        var dayElement = document.createElement("div");
        dayElement.textContent = i;
        dayElement.classList.add("calendar-day");

        // 현재 월의 날짜는 선택 가능하도록 처리
        dayElement.addEventListener("click", function() {
            selectDayContainer.textContent = currentYear + "-" + (currentMonth + 1) + "-" + this.textContent;
            document.getElementById("start").value = "";
            document.getElementById("end").value = "";
        });

        calendarContainer.appendChild(dayElement);
    }
}

</script>




</body>
</html>
