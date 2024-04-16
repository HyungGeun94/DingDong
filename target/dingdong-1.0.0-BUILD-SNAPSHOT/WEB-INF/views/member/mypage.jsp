<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>

<%@ include file="../include/head.jsp" %>
</head>

<body>
<!--  nav -->
<%@ include file="../include/nav.jsp" %>
      
      
      
   <div class="middle" style="margin-top: 2.5rem; margin-left: auto; margin-right: auto;">

      <!--  mypage left -->
      <div class="leftform" style="width: 256px !important;border-right: 1px solid #dee2e6;" >
         <%@ include file="include/mypageNav.jsp" %>
      </div>
      
      <!-- container -->
      <div class="container" style="max-width: 1024px; width: 100%; margin: 0; padding: 0;" align="center">
      
         <div style="width: 100%; margin-left: 100px; text-align: left; font-size: 21px; color: #111827; font-weight: 600;">회원 정보</div>
         <div align="center" style="width: 100%; display: flex; justify-content: space-between; margin: 0px 0px 50px;">
            
            <div class="rounded-circle" id="image-box" style="width: 250px; height: 250px; overflow:hidden; margin:auto;">
               <img style="width:100%; height: 100%; object-fit: cover" id="profile-img" src="${contextPath}/resources/images/profile/${info.profile}" alt="프로필 사진">
            </div>
            
            <br>
            
            
            
            <form id="member-edit-form" action="${contextPath }/member/update" method="post" enctype="multipart/form-data">
            
               <input type="file" style="display:none" id="uploadFile" name="uploadFile" onchange="readURL(this);"/>
               
               
               
               <br>
                <div class="mypageinfoform">
                	<span class="mypagespan" id="basic-addon1">아이디</span>
                	<br>
                	<input type="text" class="mypageinfo" name="id" value="${info.id }" readonly/>
                </div>
               
                <div class="mypageinfoform mg-20">
					<span class="mypagespan" id="basic-addon1">닉네임</span>
					<br>
                 	<input type="text" class="mypageinfo" id="nickname" name="nickname" minlength="5" maxlength="15" placeholder="5~15자를 입력해주세요." value="${info.nickname}" required/>
                </div>
               
                <div class="mypageinfoform mg-20">
                	<span class="mypagespan" id="basic-addon1">이름</span>
                	<br>
                	<input type="text" class="mypageinfo" id="name" name="name" minlength="2" maxlength="15" value="${info.name}" required readonly/>
                </div>
               
                <div class="mypageinfoform mg-20">
                	<span class="mypagespan" id="basic-addon1">이메일</span>
                	<br>
                	<input type="text" class="mypageinfo" name="email" placeholder="이메일" value="${info.email}" required/>
                </div>
               
                <div class="mypageinfoform mg-20">
                	<span class="mypagespan" id="basic-addon1">비밀번호</span>
                	<br>
                	<input type="password" class="mypageinfo" name="password" id="password" placeholder="변경 시에만 입력" required/>
                </div>
               
               <!--  비밀번호 확인 모달창 -->
                  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                       <div class="modal-dialog">
                         <div class="modal-content">
                           <div class="modal-header">
                             <h5 class="modal-title" id="exampleModalLabel">회원 정보 수정</h5>
                             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                           </div>
                           <div class="modal-body">
                               <div class="mb-3">
                                 <label for="message-text" class="col-form-label">현재 비밀번호를 입력하세요:</label>
                                 <input type="password" name="prevPassword" class="form-control" id="message-text" style="width:80%"></input>
                               </div>
                           </div>
                           <div class="modal-footer">
                             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                             <button type="button" class="btn btn-primary" id="editBtn">수정</button>
                           </div>
                         </div>
                    </div>
                  </div>
            </form>
            <br>
         </div>
         <div style="width: 100%; display: flex; justify-content: flex-end;">
         	<button type="button" class="mypagemodyfybtn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">저장</button>
         </div>
      
      
      <br>
      <br>
      </div>
       
   
      
      
      
   </div>
   
   <!-- footer -->
   <%@ include file="../include/footer.jsp" %>

<!--  <script src="${contextPath }/resources/member/js/mypage.js"></script> -->

<script>


// 새별: 수정 버튼 클릭 시 뜨는 비밀번호 확인 모달
// 카카오/네이버 로그인은 비밀번호가 없기 때문에 뜨면 안 됨... 구현 필요(24/03/06)
var exampleModal = document.getElementById('exampleModal');
var password = document.getElementById('password');

exampleModal.addEventListener('show.bs.modal', function (event) {
   
    // Button that triggered the modal
    var button = event.relatedTarget
    // Extract info from data-bs-* attributes
    var recipient = button.getAttribute('data-bs-whatever')
    // If necessary, you could initiate an AJAX request here
    // and then do the updating in a callback.
    //
    // Update the modal's content.
    var modalTitle = exampleModal.querySelector('.modal-title')
    var modalBodyInput = exampleModal.querySelector('.modal-body input')

}); // exampleModal.addEventListener(


// 새별: 비밀번호 확인 모달 내 수정 버튼 클릭 시
// 수정 버튼 -> form action 
$("#editBtn").click(function() {

   console.log("수정버튼 클릭");
   
   // 이미지 업로드 ajax
   var url = "/dingdong/member/profileUpdateAction";
   var formData = new FormData();
   
   var inputFile = $("input[name='uploadFile']")[0].files;
   var file = inputFile[0];
   
   console.log(inputFile);
   console.log(file);
   
   if(!checkExtension(file.name, file.size)){
      return false;
   }
   
   formData.append("uploadFile", file);
   
   $.ajax({
   
      url : url,
      processData : false,
      contentType : false,
      data : formData,
      type : 'post',
      success : function(result){
      // 통신 성공 로직 구현
         console.log('Uploaded');
         
      },
      error : function(result){
      // 통신 실패 로직 구현
      }
   
   });
   
   $("#member-edit-form").submit();
   
      
}) //$("#editBtn").click



// 새별: 이미지 버튼에 마우스 올리면 투명도 조절
$("#image-box").hover(function() {
   $("#profile-img").css('opacity', '0.5');
}, function(){
   $("#profile-img").css('opacity', '1');
})// $("#image-box").hover


// 새별: 프로필 이미지 누르면 파일 input 클릭
$("#image-box").click(function(){
   document.getElementById('uploadFile').click();
})// $("#image-box").click


// 새별: 프로필 변경 미리보기
function readURL(input){
if (input.files && input.files[0]) {
    var reader = new FileReader();
       reader.onload = function(data){
         document.getElementById('profile-img').src = data.target.result;
       };
       reader.readAsDataURL(input.files[0]);
    }else {
       document.getElementById('profile-img').src = "";
    }
}// function readURL(input){


// 새별: 이미지 용량 정하는 건데 수정 필요함(24/03/06)
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 524880; // 5MB

function checkExtension(fileName, fileSize){
   
   if(fileSize >= maxSize){
      alert("5MB 이상의 파일은 업로드할 수 없습니다.");
      return false;
   }
   
   if(regex.test(fileName)){
      alert("exe, sh, zip, alz는 업로드할 수 없습니다.");
      return false;
   }
   
   return true;
   
}// function checkExtension
   


</script>

</body>
</html>