<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		${mpDetail.mprNo}
		${mpDetail.mprTitle}
		${mpDetail.mprReadCnt}
		${mpDetail.mprRegDate}
		${mpDetail.mprWriter}
		${mpDetail.mprContent}

		<div class="col text-center">
			<input type="button" class="btn btn-warning" id="mprUpdate" data-mprNo="${mpreport.mprNo}" value="수정하기"/>
			<input type="button" class="btn btn-danger" id="mprDelete" data-mprNo="${mpreport.mprNo}" value="삭제하기" />
			<input type="button" value="목록보기" class="btn btn-primary" onclick="location.href='mprSelectList'"/>			
		</div>
		
		
</body>
</html>