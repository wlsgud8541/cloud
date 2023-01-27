<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-danger">실종</a></td>
				</c:if>
				<c:if test="${ mppDetail.mppStatusCode == '02' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-primary">찾았어요!</a></td>
				</c:if>
			</tr>	
			</c:if>
			<c:if test="${mppDetail.mppAddFile == null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;💾 | 파일없음</td>
				<c:if test="${ mppDetail.mppStatusCode == '01' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-danger">실종</a></td>
				</c:if>
				<c:if test="${ mppDetail.mppStatusCode == '02' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-primary">찾았어요!</a></td>
				</c:if>
			</tr>	
			</c:if>
			 
		</table>
	<a class="row mt-4">
		<c:if test="${mppDetail.mppLocalCode == 01}">
			<div class="col text-center">
				<span class="btn btn-primary">서울</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 02}">
			<div class="col text-center">
				<span class="btn btn-primary">경기</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 03}">
			<div class="col text-center">
				<span class="btn btn-primary">인천</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 04}">
			<div class="col text-center">
				<span class="btn btn-primary">대전</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 05}">
			<div class="col text-center">
				<span class="btn btn-primary">광주</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 06}">
			<div class="col text-center">
				<span class="btn btn-primary">대구</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 07}">
			<div class="col text-center">
				<span class="btn btn-primary">울산</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 08}">
			<div class="col text-center">
				<span class="btn btn-primary">부산</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 09}">
			<div class="col text-center">
				<span class="btn btn-primary">세종</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 10}">
			<div class="col text-center">
				<span class="btn btn-primary">강원</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 11}">
			<div class="col text-center">
				<span class="btn btn-primary">충북</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 12}">
			<div class="col text-center">
				<span class="btn btn-primary">충남</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 13}">
			<div class="col text-center">
				<span class="btn btn-primary">전북</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 14}">
			<div class="col text-center">
				<span class="btn btn-primary">전남</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 15}">
			<div class="col text-center">
				<span class="btn btn-primary">경북</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 16}">
			<div class="col text-center">
				<span class="btn btn-primary">경남</span>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppLocalCode == 17}">
			<div class="col text-center">
				<span class="btn btn-primary">제주</span>
			</div>
		</c:if>
	</a>
		<div class="row mt-4">
			<b>상세위치 : ${mppDetail.mppLocalDetail}</b>
		</div>
	
	<div class="row mt-4">
		<b>발견 일시 : <fmt:formatDate value="${mppDetail.mppInfoDate}" pattern="yyyy-MM-dd" /></b>
	</div>
		
	<div class="row mt-4">
		<c:if test="${mppDetail.mppPetType == 01}">
			<div>
				<b>종류 : 강아지</b>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppPetType == 02}">
			<div>
				<b>종류 : 고양이</b>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppPetType == 03}">
			<div>
				<b>종류 : 기타</b>
			</div>
		</c:if>
	</div>
	
	
	<div class="row mt-4">
		<c:if test="${mppDetail.mppGen == 'M '}">
			<div>
				<b>성별 : 수컷</b>
			</div>
		</c:if>
		<c:if test="${mppDetail.mppGen == 'F '}">
			<div>
				<b>성별 : 암컷</b>
			</div>
		</c:if>
	</div>
	
		<div class="py-4 px-3">
<pre>
상세 내용 :
	${mppDetail.mppContent }
</pre>
	<c:if test="${not empty mppDetail.mppAddFile}">
		<div class="text-center">
			<img src="fileDownload?fileName=${mppDetail.mppAddFile}" style="width: 500px;">
		</div>
	</c:if>
	<c:if test="${empty mppDetail.mppAddFile}">
		<div class="text-center text-success p-4">
			등록된 사진이 없습니다.
		</div>
	</c:if>
		</div>
	</div>
	<div class="mpboxLine"></div>



	<div class="row">
		<div class="col text-center mt-4">
			<c:if test="${(sessionScope.userId == mppDetail.mppWriter) or (sessionScope.userId == 'admin0001')}">
				<input type="button" class="btn btn-outline-primary" id="mppUpdate" data-mppNo="${mppDetail.mppNo}" data-pageNum="${pageNum}"value="수정하기"> 
				<input type="button" class="btn btn-outline-primary  mx-3"  id="mppDelete" data-mppNo="${mppDetail.mppNo}" data-pageNum="${pageNum}"value="삭제하기" />
			</c:if> 
			<input type="button" onclick="location.href='mppSelectList?pageNum=${pageNum}'" class="btn btn-outline-primary" value="목록으로" />
		</div>
	</div>
</div>
