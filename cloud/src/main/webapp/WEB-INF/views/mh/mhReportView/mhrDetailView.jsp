<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
<form enctype="multipart">
		${report.mhrNo},${report.mhrName},${report.mhrMage},${report.mhrage},${report.mhrIllCode},
		${report.mhrGen},${report.mhrHeight},${report.mhrWeight},${report.mhrFace},
		${report.mhrHairColor},${report.mhrHair},${report.mhrWear},${report.mhrStatusCode},
		${report.mhrLocalCode},${report.mhrTitle},${report.mhrContent}${report.mhrReadCnt},
		<fmt:formatDate value="${report.mhrInfoDate}" pattern="yyyy-MM-dd" />실종일
		<fmt:formatDate value="${report.mhrRegDate}" pattern="yyyy-MM-dd"/>작성일
		<a href = "fileDownload?fileName=${report.mhrAddFile}">파일</a>
		
		<input type="button" class="btn" value="수정하기" id = "mhrUpdate" data-mhrNo="${report.mhrNo}" data-pageNum="${pageNum}">
		<input type="button" class="btn" value="삭제하기" id="mhrDelete" data-mhrNo="${report.mhrNo}" data-pageNum="${pageNum}"/>
		<input type="button" class="btn" value="돌아가기" onclick="location.href='mhrSelectList?pageNum=${pageNum}'"/>
</form>
</body>
