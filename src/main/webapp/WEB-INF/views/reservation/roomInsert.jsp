<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomInsert</title>
</head>
<body>
	
	<b>룸 추가 화면입니다.</b><br>
	<div>
	<form form="role" method="post">
		<table>
			<tr>
				<td><input type="text" name="studyroom" value="${studyRoomDTO.studyroom}" readonly/>
			</td></tr>
			<tr>
				<td><input type="text" value="${studyRoomDTO.name}" readonly/>
			</td></tr>
			<tr>
				<td><input type="text" name="name" placeholder="룸 이름을 입력하세요."/>
			</td></tr>
			<tr>
				<td><input type="text" name="min" placeholder="최소인원을 입력하세요"/>
			</td></tr>	
			<tr>
				<td><input type="text" name="max" placeholder="최대인원을 입력하세요"/>
			</td></tr>	
			<tr>
				<td><input type="text" name="content" placeholder="설명을 입력하세요"/>
			</td></tr>	
			<tr>
				<td><input type="text" name="cost" placeholder="시간당 비용을 입력하세요"/>
			</td></tr>	
			<tr>
				<td><input type="text" name="del" placeholder="삭제여부 0[유지], 1[삭제]"/>
			</td></tr>				
			<tr>
				<td><input type="file" name="fileName"/>
			</td></tr>
			<tr>
				<td><input type="submit" value="추가하기">
				<input type="reset" value="원래대로"></td>
			</tr>
		</table>	
	</form>
	</div>



</body>
</html>


<div class="modal-body">
				      	
				      