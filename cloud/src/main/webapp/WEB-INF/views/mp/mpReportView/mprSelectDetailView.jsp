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
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-danger">실종</a></td>
				</c:if>
				<c:if test="${ mprDetail.mprStatusCode == '02' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-primary">찾았어요!</a></td>
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
		<c:if test="${mprDetail.mprLocalCode == 01}">
			<div class="col text-center">
				<span class="btn btn-primary">서울</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 02}">
			<div class="col text-center">
				<span class="btn btn-primary">경기</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 03}">
			<div class="col text-center">
				<span class="btn btn-primary">인천</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 04}">
			<div class="col text-center">
				<span class="btn btn-primary">대전</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 05}">
			<div class="col text-center">
				<span class="btn btn-primary">광주</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 06}">
			<div class="col text-center">
				<span class="btn btn-primary">대구</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 07}">
			<div class="col text-center">
				<span class="btn btn-primary">울산</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 08}">
			<div class="col text-center">
				<span class="btn btn-primary">부산</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 09}">
			<div class="col text-center">
				<span class="btn btn-primary">세종</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 10}">
			<div class="col text-center">
				<span class="btn btn-primary">강원</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 11}">
			<div class="col text-center">
				<span class="btn btn-primary">충북</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 12}">
			<div class="col text-center">
				<span class="btn btn-primary">충남</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 13}">
			<div class="col text-center">
				<span class="btn btn-primary">전북</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 14}">
			<div class="col text-center">
				<span class="btn btn-primary">전남</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 15}">
			<div class="col text-center">
				<span class="btn btn-primary">경북</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 16}">
			<div class="col text-center">
				<span class="btn btn-primary">경남</span>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprLocalCode == 17}">
			<div class="col text-center">
				<span class="btn btn-primary">제주</span>
			</div>
		</c:if>
	</div>
	<div class="row mt-4">
		<b>상세위치 : ${mprDetail.mprLocalDetail}</b>
	</div>
	<div class="row mt-4">
		<c:if test="${mprDetail.mprPetType == 01}">
			<div>
				<b>종류 : 강아지</b>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprPetType == 02}">
			<div>
				<b>종류 : 고양이</b>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprPetType == 03}">
			<div>
				<b>종류 : 기타</b>
			</div>
		</c:if>
	</div>
	
	<div class="row mt-4">
		<b>실종 일시 : <fmt:formatDate value="${mprDetail.mprInfoDate}" pattern="yyyy-MM-dd" /></b>
	</div>
	
	<div class="row mt-4">
		<c:if test="${mprDetail.mprGen == 'M '}">
			<div>
				<b>성별 : 수컷</b>
			</div>
		</c:if>
		<c:if test="${mprDetail.mprGen == 'F '}">
			<div>
				<b>성별 : 암컷</b>
			</div>
		</c:if>
	</div>
	
		<div class="py-4 px-3">
<pre>
상세 내용 :
	${mprDetail.mprContent }
</pre>
	<c:if test="${mprDetail.mprAddFile != null}">
		<div class="text-center">
			<img src="fileDownload?fileName=${mprDetail.mprAddFile}" style="width: 500px;">
		</div>
	</c:if>
	<c:if test="${empty mprDetail.mprAddFile}">
		<div class="text-center text-success p-4">
			등록된 사진이 없습니다.
		</div>
	</c:if>
		</div>
	</div>
	<div class="mpboxLine"></div>



	<div class="row">
		<div class="col text-center mt-4">
			<input type="button" class="btn" value="전단지 출력" id ="jsReport" data-code="mp" />
			<input type="button" class="btn btn-outline-primary" id="mprUpdate" data-mprNo="${mprDetail.mprNo}" data-pageNum="${pageNum}"value="수정하기"> 
			<input type="button" class="btn btn-outline-primary  mx-3"  id="mprDelete" data-mprNo="${mprDetail.mprNo}" data-pageNum="${pageNum}"value="삭제하기" /> 
			<input type="button" onclick="location.href='mprSelectList?pageNum=${pageNum}'" class="btn btn-outline-primary" value="목록으로" />
		</div>
	</div>
</div>
