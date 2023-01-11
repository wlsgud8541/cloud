<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div class="row my-3">
			<div class="col text-end">
				<a href="mprInsert" class="btn btn-outline-success">글쓰기</a>
			</div>
		</div>

	<c:forEach var="mpList" items="${mpList}">
		${mpList.mprNo}
		<a href="mprSelectDetail?mprNo=${mpList.mprNo}">${mpList.mprTitle}</a>
		${mpList.mprTitle}
		${mpList.mprReadCnt}
		${mpList.mprRegDate}
		${mpList.mprWriter}
		<br>
		
	</c:forEach>
		
</body>
</html>