


//아이디, 비밀번호 확인하지 않으면 join 버튼 비활성화	
var idCheck = false;
var passwordCheck = false;
var nicknameCheck = false;


//	아이디 중복 체크	
function checkId(){
  var inputId = $('#id').val();
  $.ajax({
      
      data : { inputId : inputId },
      dataType : 'JSON',
      url : '/dingdong/idDuplicateCheck',
      type : 'POST',
      success : function(data){
          if(data === 1){	//	아이디가 중복되었다면
              $('#id').css("background-color", "lightpink");
              $('#id-alert-true').css("display", "none");
              $('#id-alert-false').css("display", "block");
              $('#id').focus();
              idCheck = false;
          }else {				//	중복이 아니라면
              $('#id').css("background-color", "lightgreen");
              $('#id-alert-true').css("display", "block");
              $('#id-alert-false').css("display", "none");
              idCheck = true;
          }
          joinBtnControll();
      }
      
  })
}

//	비밀번호 - 비밀번호 확인 일치 체크
function checkPassword() {
  var inputPassword = $('#password').val();
  var inputPasswordCheck = $('#passwordCheck').val();
  
  if(inputPassword !== inputPasswordCheck){	//	비밀번호-확인이 같지 않으면
      $('#password-alert').css("display", "block");
      $('#passwordCheck').css("background-color", "lightpink");
      $('#password').css("background-color", "lightpink");
      passwordCheck = false;
  }else{										//	비밀번호-확인이 같으면
      $('#password-alert').css("display", "none");
      $('#passwordCheck').css("background-color", "lightgreen");
      $('#password').css("background-color", "lightgreen");
      passwordCheck = true;
  }
      joinBtnControll();
  
}


//join 버튼 활성화
function joinBtnControll() {
//		아이디 체크 완료
      if(idCheck && passwordCheck){
          document.getElementById("joinBtn").removeAttribute('disabled');
      }else{
          // 여기에 join 버튼 비활성화 구현
          document.getElementById("joinBtn").setAttribute('disabled', 'disabled');
      }
}