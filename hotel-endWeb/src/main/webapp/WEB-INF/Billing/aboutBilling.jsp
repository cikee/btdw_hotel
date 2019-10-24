<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>这是房态页面</h1>
	<table>
		<c:forEach items="${roomList}" var="room" varStatus="count">
			<tr>
				<td>${room.room_number}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>