

//비밀번호 확인 모달
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

});



// 수정 버튼 -> form action 
$("#editBtn").click(function() {

	console.log("수정버튼 클릭");
	
	if(!checkExtension(files[i].name, files[i].size)){
		return false;
	}
	
	// 이미지 업로드 ajax
	var url = "/dingdong/member/profileUpdateAction";
	var formData = new FormData();
	var inputFile = $("input[name='new-profile-img']");
	
	$.ajax({
	
		url : url,
		processData : false,
		contentType : false,
		data : formData,
		type : 'post',
		success : function(result){
		// 통신 성공 로직 구현
			alert('Uploaded');
		},
		error : function(result){
		// 통신 실패 로직 구현
		}
	
	});
	
	// $("#member-edit-form").submit();
		
})

$("#image-box").hover(function() {
	$("#profile-img").css('opacity', '0.5');
}, function(){
	$("#profile-img").css('opacity', '1');
})

// 프로필 이미지 누르면 파일 input 클릭
$("#image-box").click(function(){
	document.getElementById('new-profile-img').click();
})


// 프로필 변경 미리보기
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
}


// 버튼 hover
const button = document.querySelectorAll(".link-btn");

for(let i=0;i<button.length;i++){
	button[i].addEventListener("mouseover", function(){
		button[i].classList.add("active");
	});
}

for(let i=0;i<button.length;i++){
	button[i].addEventListener("mouseout", function(){
		button[i].classList.remove("active");
	});
}




$(document).ready(function(){
	
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
		
	}
	
	
});

