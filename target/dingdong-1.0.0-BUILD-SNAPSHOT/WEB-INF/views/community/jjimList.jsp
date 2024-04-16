<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:forEach var="list" items="${jjimList}">

    ${list.memberIdx}<br>
    ${list.title}<br>
    ${list.regDate}<br>
    ${list.content}<br>



</c:forEach>

</body>
</html>
