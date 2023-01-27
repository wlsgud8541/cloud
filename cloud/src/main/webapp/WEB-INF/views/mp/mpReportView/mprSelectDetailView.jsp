<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<div class="w3-content">
	<input type="hidden" id="mprNo" value="${mprDetail.mprNo}">
	
	<!-- 제스퍼 리포트용 벨류세팅 -->
	<input type="hidden" value="${mprDetail.mprAddFile}" id="jxv_mprAddFile"><!-- 사진 -->
	<input type="hidden" value="${mprDetail.mprPetType}" id="jxv_mprPetType"> <!-- 동물종류 -->
	<input type="hidden" value="${mprDetail.mprGen}" id="jxv_mprGen"> <!-- 성별 -->
	<input type="hidden" value="${mprDetail.mprLocalCode}" id="jxv_mprLocalCode"> <!-- 실종지역코드 -->
	<input type="hidden" value="${mprDetail.mprInfoDate}" id="jxv_mprInfoDate"> <!-- 실종일시 -->
	<!-- 특징 -->
	<input type="hidden" value="${mprDetail.mprContent}" id="jxv_mprContent">
	<input type="hidden" value="${mprDetail.memberTell}" id="jxv_memberTell">
	<!-- 제스퍼 리포트용 벨류세팅 end -->
	
	<div class="my-4">
		<h3>${mprDetail.mprTitle}</h3>
	</div>
	<div>
		<table class="topbox">
			<tr>
				<td class="mpgunThWriter py-2"><b>&nbsp;&nbsp;작성자 : ${mprDetail.mprWriter}</b></td>
				<td class="mpgunThDate py-2"><fmt:formatDate
						value="${mprDetail.mprRegDate}" pattern="yyyy-MM-dd HH:mm" /></td>
				<td class="mpgunThReadCount ms-3 py-2">조회수 : ${mprDetail.mprReadCnt }</td>
			</tr>
			<c:if test="${mprDetail.mprAddFile != null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;💾 | <a href="fileDownload?fileName=${mprDetail.mprAddFile}">다운로드</a></td>
				<c:if test="${ mprDetail.mprStatusCode == '01' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-danger"><b>실종</b></a></td>
				</c:if>
				<c:if test="${ mprDetail.mprStatusCode == '02' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-primary"><b>찾았어요!</b></a></td>
				</c:if>
			</tr>	
			</c:if>
			<c:if test="${mprDetail.mprAddFile == null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;💾 | 파일없음</td>
				<c:if test="${ mprDetail.mprStatusCode == '01' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-danger">실종</a></td>
				</c:if>
				<c:if test="${ mprDetail.mprStatusCode == '02' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-primary">찾았어요!</a></td>
				</c:if>
			</tr>	
			</c:if>
		</table>
	<div class="row mt-4">
		<div class="col">
			<c:if test="${mprDetail.mprAddFile != null}">
				<div class="text-center">
					<img src="fileDownload?fileName=${mprDetail.mprAddFile}" style="width: 500px;">
				</div>
			</c:if>
			<c:if test="${empty mprDetail.mprAddFile}">
				<div class="text-center text-success p-4">
					<img src="resources/image/main/cloudLogo.png" style="width: 350px;">
				</div>
			</c:if>
		</div>
		<div class="col">
			<c:if test="${mprDetail.mprPetType == 01}"><b>강아지</b></c:if>
			<c:if test="${mprDetail.mprPetType == 02}"><b>고양이</b></c:if>
			<c:if test="${mprDetail.mprPetType == 03}"><b>기타</b></c:if>
			(<c:if test="${mprDetail.mprGen == 'M '}"><b><i class="bi bi-gender-male"></i></b></c:if>
			<c:if test="${mprDetail.mprGen == 'F '}"><b><i class="bi bi-gender-female"></i></b></c:if>)
			<table class="table border-top border-2 mt-3">
				<tr>
					<th>실종지역 / 상세위치</th>
					<td><c:if test="${mprDetail.mprLocalCode == 01}">서울</c:if>
						<c:if test="${mprDetail.mprLocalCode == 02}">경기</c:if>
						<c:if test="${mprDetail.mprLocalCode == 03}">인천</c:if>
						<c:if test="${mprDetail.mprLocalCode == 04}">대전</c:if>
						<c:if test="${mprDetail.mprLocalCode == 05}">광주</c:if>
						<c:if test="${mprDetail.mprLocalCode == 06}">대구</c:if>
						<c:if test="${mprDetail.mprLocalCode == 07}">울산</c:if>
						<c:if test="${mprDetail.mprLocalCode == 08}">부산</c:if>
						<c:if test="${mprDetail.mprLocalCode == 09}">세종</c:if>
						<c:if test="${mprDetail.mprLocalCode == 10}">강원</c:if>
						<c:if test="${mprDetail.mprLocalCode == 11}">충북</c:if>
						<c:if test="${mprDetail.mprLocalCode == 12}">충남</c:if>
						<c:if test="${mprDetail.mprLocalCode == 13}">전북</c:if>
						<c:if test="${mprDetail.mprLocalCode == 14}">전남</c:if>
						<c:if test="${mprDetail.mprLocalCode == 15}">경북</c:if>
						<c:if test="${mprDetail.mprLocalCode == 16}">경남</c:if>
						<c:if test="${mprDetail.mprLocalCode == 17}">제주</c:if> / 	${mprDetail.mprLocalDetail}
					</td>
				</tr>
				<tr>
					<th>실종일시</th>
					<td><fmt:formatDate value="${mprDetail.mprInfoDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</table>
			<b>${mprDetail.mprContent }</b>
		</div>
	</div>
</div>
		
	<div class="mpboxLine"></div>

	<div class="row">
		<div class="col text-center mt-4">
			<input type="button" class="btn btn-outline-primary" value="전단지 출력📃"id ="jsReport" data-code="mp" />
			<c:if test="${(sessionScope.userId == mprDetail.mprWriter) or (sessionScope.userId == 'admin0001')}">
				<input type="button" class="btn btn-outline-primary" id="mprUpdate" data-mprNo="${mprDetail.mprNo}" data-pageNum="${pageNum}"value="수정하기"> 
				<input type="button" class="btn btn-outline-primary"  id="mprDelete" data-mprNo="${mprDetail.mprNo}" data-pageNum="${pageNum}"value="삭제하기" /> 
			</c:if>
			<input type="button" class="btn btn-outline-primary" onclick="location.href='mprSelectList?pageNum=${pageNum}'"value="목록으로" />
		</div>
	</div>
</div>
