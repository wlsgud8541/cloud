<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!-- content -->
<div class="w3-content">
	<input type="hidden" id="mppNo" value="${mppDetail.mppNo}">
	<div class="my-4">
		<h3>${mppDetail.mppTitle}</h3>
	</div>
	<div>
		<table class="topbox">
			<tr>
				<td class="mpgunThWriter py-2"><b>&nbsp;&nbsp;작성자 : ${mppDetail.mppWriter}</b></td>
				<td class="mpgunThDate py-2"><fmt:formatDate
						value="${mppDetail.mppRegDate}" pattern="yyyy-MM-dd HH:mm" /></td>
				<td class="mpgunThReadCount ms-3 py-2">조회수 : ${mppDetail.mppReadCnt }</td>
			</tr>
			<c:if test="${mppDetail.mppAddFile != null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;💾 | <a href="fileDownload?fileName=${mppDetail.mppAddFile}">다운로드</a></td>
				<c:if test="${ mppDetail.mppStatusCode == '01' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-danger"><b>실종</b></a></td>
				</c:if>
				<c:if test="${ mppDetail.mppStatusCode == '02' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-primary"><b>찾았어요!</b></a></td>
				</c:if>
			</tr>	
			</c:if>
			<c:if test="${mppDetail.mppAddFile == null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;💾 | 파일없음</td>
				<c:if test="${ mppDetail.mppStatusCode == '01' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-danger"><b>실종</b></a></td>
				</c:if>
				<c:if test="${ mppDetail.mppStatusCode == '02' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-primary"><b>찾았어요!</b></a></td>
				</c:if>
			</tr>	
			</c:if>
			 
		</table>
		
		
<div class="row mt-4">
		<div class="col">
			<c:if test="${mppDetail.mppAddFile != null}">
				<div class="text-center">
					<img src="fileDownload?fileName=${mppDetail.mppAddFile}" style="width: 500px;">
				</div>
			</c:if>
			<c:if test="${empty mppDetail.mppAddFile}">
				<div class="text-center text-success p-4">
					<img src="resources/image/main/cloudLogo.png" style="width: 350px;">
				</div>
			</c:if>
		</div>
		<div class="col">
			<c:if test="${mppDetail.mppPetType == 01}"><b>강아지</b></c:if>
			<c:if test="${mppDetail.mppPetType == 02}"><b>고양이</b></c:if>
			<c:if test="${mppDetail.mppPetType == 03}"><b>기타</b></c:if>
			(<c:if test="${mppDetail.mppGen == 'M '}"><b><i class="bi bi-gender-male"></i></b></c:if>
			<c:if test="${mppDetail.mppGen == 'F '}"><b><i class="bi bi-gender-female"></i></b></c:if>)
			<table class="table border-top border-2 mt-3">
				<tr>
					<th>실종지역 / 상세위치</th>
					<td><c:if test="${mppDetail.mppLocalCode == 01}">서울</c:if>
						<c:if test="${mppDetail.mppLocalCode == 02}">경기</c:if>
						<c:if test="${mppDetail.mppLocalCode == 03}">인천</c:if>
						<c:if test="${mppDetail.mppLocalCode == 04}">대전</c:if>
						<c:if test="${mppDetail.mppLocalCode == 05}">광주</c:if>
						<c:if test="${mppDetail.mppLocalCode == 06}">대구</c:if>
						<c:if test="${mppDetail.mppLocalCode == 07}">울산</c:if>
						<c:if test="${mppDetail.mppLocalCode == 08}">부산</c:if>
						<c:if test="${mppDetail.mppLocalCode == 09}">세종</c:if>
						<c:if test="${mppDetail.mppLocalCode == 10}">강원</c:if>
						<c:if test="${mppDetail.mppLocalCode == 11}">충북</c:if>
						<c:if test="${mppDetail.mppLocalCode == 12}">충남</c:if>
						<c:if test="${mppDetail.mppLocalCode == 13}">전북</c:if>
						<c:if test="${mppDetail.mppLocalCode == 14}">전남</c:if>
						<c:if test="${mppDetail.mppLocalCode == 15}">경북</c:if>
						<c:if test="${mppDetail.mppLocalCode == 16}">경남</c:if>
						<c:if test="${mppDetail.mppLocalCode == 17}">제주</c:if> / 	${mppDetail.mppLocalDetail}
					</td>
				</tr>
				<tr>
					<th>실종일시</th>
					<td><fmt:formatDate value="${mppDetail.mppInfoDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</table>
			<b>${mppDetail.mppContent }</b>
		</div>
	</div>		
</div>
		
	<div class="mpboxLine"></div>



	<div class="row">
		<div class="col text-center mt-4">
			<c:if test="${(fn:trim(sessionScope.userId) eq fn:trim(mppDetail.mppWriter)) or (fn:trim(sessionScope.userId) eq 'admin0001')}">
				<input type="button" class="btn btn-outline-primary" id="mppUpdate" data-mppNo="${mppDetail.mppNo}" data-pageNum="${pageNum}"value="수정하기"> 
				<input type="button" class="btn btn-outline-primary  mx-3"  id="mppDelete" data-mppNo="${mppDetail.mppNo}" data-pageNum="${pageNum}"value="삭제하기" />
			</c:if> 
			<input type="button" onclick="location.href='mppSelectList?pageNum=${pageNum}'" class="btn btn-outline-primary" value="목록으로" />
		</div>
	</div>
</div>
