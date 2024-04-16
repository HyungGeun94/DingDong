<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.commentbtn {
	padding: 10px 32px;
	font-size: 14px;
	color: #fff;
	background-color: #0090F9;
	font-weight: 600;
	border-radius: 0.375rem;
}

.commentbtn:hover {
	background-color: #0B7FD3;
}

.replynickname {
	font-size: 14px;
	color: #111827;
	text-decoration-line: none;
}

.replynickname:hover {
	color: #0090F9;
}

.replyct {
	margin-top: 0.625rem;
	margin-bottom: 0.625rem;
	padding-left: 8px;
}
</style>
</head>
<body>
	
   <div style="width: 792px; border: 1px solid rgb(209 213 219); margin: 20px 0; padding: 24px; border-radius: 0.5rem;">
   		<div style="display: flex; column-gap: 1rem;">
   			<img src="${contextPath }/resources/images/profile/${member.profile}" style="width: 40px; height: 40px; border-radius: 9999px;">
   			<textarea id="replyContent" rows="4" cols="50" placeholder="여러분의 생각을 댓글로 자유롭게 표현해주세요." style="padding: 16px 10px; border: 1px solid rgb(209 213 219); border-radius: 0.375rem; font-size: 14px; color: #111827; outline: none; width: 100%; resize: none;"></textarea>
   		</div>
   		<div style="display: flex; justify-content: flex-end; margin: 12px 0 0;">
 	  		<button class="commentbtn" onclick="addReply()">등록</button>
 	  	</div>
   </div>
   <div id="replySection">
		<!-- 댓글을 표시할 영역 -->
	</div>
	
	

	<script>
        $(document).ready(function() {
            loadReply();
        });

        function loadReply() {
        	
        	var htmls = '';
        	var boardNum = ${communityVO.boardNum};
        	
            $.ajax({
                url : "/dingdong/community/reply",
                type : "GET",
                data : {
                	'boardNum' : boardNum
                },
                success : function(list) {
                	
                	console.log(list);
                	console.log(list.replyList);
                	console.log(list.rereplyList);
                	
                	console.log(list.replyList[0]);
                	
       				var boardNum = ${communityVO.boardNum};
       				var good = ${communityVO.good};
                    var views = ${communityVO.views};
       				console.log(boardNum);
       	
       				$(list).each(function() {
       				  for (var i = 0; i < list.replyList.length; i++) {
       				    if (this.replyList[i].replyOrderNum === 0) {
       				      // 대댓글 출력
       				      htmls = htmls + '<div class="" id="replyNum' + this.replyList[i].replyNum + '">';
       				      htmls += '<div style="display: flex;"><p><strong class="text-gray-dark">' + this.replyList[i].nickname + '</strong></p>';
       				      htmls += '<p style="margin-left: 10px;">' + this.replyList[i].date + '</p></div>';
       				      htmls += '<p>' + this.replyList[i].content + '</p>';
       				      htmls += '<button onclick="displayReReplyForm(\'' + this.replyList[i].replyNum + '\')">댓글 쓰기</button>';
       				      htmls += '<div id="reReplyForm' + this.replyList[i].replyNum + '" style="display: none;"><textarea id="reReplyContent' + this.replyList[i].replyNum + '" rows="4" cols="50"></textarea><button onclick="addReReply(\'' + this.replyList[i].replyNum + '\')">댓글 작성</button></div>';
       				      htmls += '<hr>';

                       // 대댓글의 대댓글 출력
                          for (var j = 0; j < list.rereplyList.length; j++) {
                            if (this.replyList[i].replyNum === this.rereplyList[j].replyOrderNum) {
                              htmls += '<div></div>';
                              htmls += '<div class="" id="rereplyNum' + this.rereplyList[j].replyNum + '">';
                              htmls += '<div style="display: flex; margin-left: 50px;"><p><strong class="text-gray-dark">' + this.rereplyList[j].nickname + '</strong></p>';
                              htmls += '<p style="margin-left: 10px;">' + this.rereplyList[j].date + '</p></div>';
                              htmls += '<p style="margin-left: 50px;">' + this.rereplyList[j].content + '</p>';
                              htmls += '<button style="margin-left: 50px;" onclick="displayReReplyForm(\'' + this.rereplyList[j].replyNum + '\')">댓글 쓰기</button>';
                              htmls += '<div id="reReplyForm' + this.rereplyList[j].replyNum + '" style="display: none; margin-left:100px"><textarea id="reReplyContent' + this.rereplyList[j].replyNum + '" rows="4" cols="50"></textarea><button onclick="addReReply(\'' + this.rereplyList[j].replyNum + '\')">댓글 작성</button></div>';
                              htmls += '<hr>';

                                // 대대댓글 출력
                                     // 대대댓글 출력
                                        for (var k = 0; k < list.rereplyList.length; k++) {
                                          if (this.rereplyList[j].replyNum === this.rereplyList[k].replyOrderNum) {
                                            htmls += '<div></div>';
                                            htmls += '<div class="" id="rereplyNum' + this.rereplyList[k].replyNum + '">';
                                            htmls += '<div style="display: flex; margin-left: 100px;"><p><strong class="text-gray-dark">' + this.rereplyList[k].nickname + '</strong></p>';
                                            htmls += '<p style="margin-left: 10px;">' + this.rereplyList[k].date + '</p></div>';
                                            htmls += '<p style="margin-left: 100px;">' + this.rereplyList[k].content + '</p>';
                                            htmls += '<div id="reReplyForm' + this.rereplyList[k].replyNum + '" style="display: none; margin-left:200px"><textarea id="reReplyContent' + this.rereplyList[k].replyNum + '" rows="4" cols="50"></textarea><button onclick="addReReReply(\'' + this.rereplyList[k].replyOrderNum + '\')">댓글 작성</button></div>';
                                            htmls += '<hr>';
                                          } // if
                                        } // for
                                  } // if(this.replyList[i].replyNum === this.rereplyList[j].replyOrderNum)
                            } // for(j < list.rereplyList.length;);
                          } // if
                        } // for(i < list.replyList.length;)
                      }); // each
       				
                    
                    $("#replySection").html(htmls);
                    
                	
                	
               
            },
            error : function(xhr,status, error) {
                console.error("Error: " + error);
            }
        });
            
        }
        
            
        // 대댓글 작성 폼 표시
        function displayReReplyForm(replyNum) {
        	
            $("[id^=reReplyForm]").hide();
            $('#reReplyForm' + replyNum).show();
            
        }
           
        // 댓글 작성
        function addReply() {
            var replyContent = $('#replyContent').val();
            
            console.log(replyContent);
            var id = '${member.id}';
            var replyData = {
                'content' : replyContent,
                'boardNum' : ${communityVO.boardNum},
                'id' : id
            };
            $.ajax({
				url : "/dingdong/community/reply",
				type : "POST",
				dataType : "json",
				data : replyData,
				success : function(result) {
					if(result === 0){
						$('#replyContent').val(''); // 댓글 입력창 초기화
						loadReply(); // 댓글 추가 후 다시 로드
					}
				},
				error : function(xhr,status, error) {
					console.error("Error: " + error);
				}
			});
		}
        

        // 대댓글 작성
        function addReReply(replyNum) {
            var replyContent = $('#reReplyContent' + replyNum).val();
            var id = '${member.id}';
            console.log("replyNum " + replyNum);
            console.log("rereplyContent " + replyContent);
            
            var replyData = {
                'content' : replyContent,
                'boardNum' : ${communityVO.boardNum},
                'replyOrderNum' : replyNum, // 대댓글의 부모 댓글 ID
                'id' : id
            };
            $.ajax({
				url : "/dingdong/community/reply",
				type : "POST",
				dataType : "json",
				data : replyData,
				success : function(result) {
					if(result === 0){
						$('#replyContent').val(''); // 댓글 입력창 초기화
						loadReply(); // 댓글 추가 후 다시 로드
					}
				},
				error : function(xhr,status, error) {
					console.error("Error: " + error);
				} 
			});
		}
        
        

        // 대대댓글 작성
        function addReReReply(replyNum, replyOrderNum) {
            var replyContent = $('#reReplyContent' + replyNum).val();
            var id = '${member.id}';
            console.log("replyNum " + replyNum);
            console.log("rereplyContent " + replyContent);
            
            var replyData = {
                'content' : replyContent,
                'boardNum' : ${communityVO.boardNum},
                'replyOrderNum' : replyOrderNum, // 대댓글의 부모 댓글 ID
                'id' : id
            };
            $.ajax({
				url : "/dingdong/community/reply",
				type : "POST",
				dataType : "json",
				data : replyData,
				success : function(result) {
					if(result === 0){
						$('#replyContent').val(''); // 댓글 입력창 초기화
						loadReply(); // 댓글 추가 후 다시 로드
					}
				},
				error : function(xhr,status, error) {
					console.error("Error: " + error);
				}
			});
		}
        
    </script>
</body>
</html>