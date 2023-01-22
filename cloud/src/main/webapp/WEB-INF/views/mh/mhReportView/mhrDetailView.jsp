<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<!-- 제스퍼 리포트용 벨류세팅 -->
	<input type="hidden" value="${report.mhrName}" id="jxv_mhrName"> 
	<input type="hidden" value="${report.mhrage}" id="jxv_mhrage">
	<input type="hidden" value="${report.mhrGen}" id="jxv_mhrGen">
	<input type="hidden" value="${report.mhrInfoDate}" id="jxv_mhrInfoDate">
	<!-- 특징 -->
	<input type="hidden" value="${report.mhrHairColor}" id="jxv_mhrHairColor">
	<input type="hidden" value="${report.mhrHair}" id="jxv_mhrHair">
	<input type="hidden" value="${report.mhrWear}" id="jxv_mhrWear">

	<input type="hidden" value="${report.mhrContent}" id="jxv_mhrContent">
	<input type="hidden" value="${report.memberTell}" id="jxv_memberTell">
	<!-- 제스퍼 리포트용 벨류세팅 end -->
	
	<form enctype="multipart">
		${report.mhrNo},${report.mhrName},${report.mhrMage},${report.mhrage},${report.mhrIllCode},
		${report.mhrGen},${report.mhrHeight},${report.mhrWeight},${report.mhrFace},
		${report.mhrHairColor},${report.mhrHair},${report.mhrWear},${report.mhrStatusCode},
		${report.mhrLocalCode},${report.mhrTitle},${report.mhrContent}${report.mhrReadCnt},
		<fmt:formatDate value="${report.mhrInfoDate}" pattern="yyyy-MM-dd" />실종일
		<fmt:formatDate value="${report.mhrRegDate}" pattern="yyyy-MM-dd"/>작성일
		<a href = "fileDownload?fileName=${report.mhrAddFile}">파일</a>
		
		<input type="button" class="btn" value="전단지 출력" id ="jsReport" data-code="mh" />
		<input type="button" class="btn" value="수정하기" id ="mhrUpdate" data-mhrNo="${report.mhrNo}" data-pageNum="${pageNum}">
		<input type="button" class="btn" value="삭제하기" id ="mhrDelete" data-mhrNo="${report.mhrNo}" data-pageNum="${pageNum}"/>
		<input type="button" class="btn" value="돌아가기" onclick="location.href='mhrSelectList?pageNum=${pageNum}'"/>
	</form>
</body>
