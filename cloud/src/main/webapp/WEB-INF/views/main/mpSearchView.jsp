<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="w3-content">	
	<form action="mpSearch" method="post" class=" border row mt-4 ">
		<div class="p-4 inblock">
			<div class="mb-4 row">
				<label class="categ">
					<b class="border-bottom border-success border-2 opacity-75">동물종류</b>
				</label>
				<div class="checks col-lg-5 col-sm-4">
					<select name="mpType" class="bg-white border">
						<option value="">--선택하세요--</option>
						<option value="01">강아지</option>
						<option value="02">고양이</option>
						<option value="03">기타</option>
					</select>
				</div>
			</div>
			<div class="mb-4 row" >
				<label class="categ">
					<b class="border-bottom border-success border-2 opacity-75">성별</b>
				</label>
				<div class="checks col-lg-5 col-sm-4">
					<select name="mpGen" class="bg-white border">
						<option value="">--선택하세요--</option>
						<option value="M">수 컷</option>
						<option value="F">암 컷</option>
					</select>
				</div>
					<label class=categ>
						<b class="border-bottom border-success border-2 opacity-75">키워드</b>
					</label>
				<div class="checks col">
					<div class="checks schInput ">
						<input type="text" name="mpKeyword" class="bg-white border">
					</div>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="categ">
					<b class="border-bottom border-success border-2 opacity-75">발생일</b>
				</label>
				<div class="inblock col-5 schInput search_date ">
					<input type="date" name="mpDate1"class="text-center bg-white border" style="padding: 0;">~<input type="date" name="mpDate2"class="text-center bg-white border" style="padding: 0;">
				</div>
				<label class=categ>
					<b class="border-bottom border-success border-2 opacity-75">발생장소</b>
				</label>
				<div class="checks col">
					<div class="checks">
						<select name="mpLocalCode" class="bg-white border">
							<option value="">--선택하세요--</option>
					    	<option value="01">서울</option>
					    	<option value="02">경기</option>
					    	<option value="03">인천</option>
					    	<option value="04">대전</option>
					    	<option value="05">광주</option>
					    	<option value="06">대구</option>
					    	<option value="07">울산</option>
					    	<option value="08">부산</option>
					    	<option value="09">세종</option>
					    	<option value="10">강원</option>
					    	<option value="11">충북</option>
					    	<option value="12">충남</option>
					    	<option value="13">전북</option>
					    	<option value="14">전남</option>
					    	<option value="15">경북</option>
					    	<option value="16">경남</option>
					    	<option value="17">제주</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="inblock text-end float-end">
				<button type="submit" class="btn btn-lg btn-outline-secondary rounded-0">검색</button>
	           </div>
		</div>
	</form>
	<h3 class="text-success fw-bold mt-4">검색결과</h3>
	<hr class="border border-success border-2 opacity-75">
	<div>
		<div class="row">
			<div class="col-4 fs-2 fw-bold border-bottom border-primary border-4 border-opacity-50 ">
				실종 반려동물 신고
			</div>
			<div class="col text-end">
				<a href="mprSelectList"><i class="bi bi-plus-lg fs-1"></i></a>
			</div>
		</div>
		<c:if test="${empty mprSrchList}">
			<div class="text-center fw-bold fw-3 mt-4"> 검색 결과가 없습니다.</div>
		</c:if>
		<c:if test="${not empty mprSrchList}">
		<c:forEach var="mprSrchList" items="${mprSrchList}">
		<div class="mt-4 row">
			<div class=" inblock me-3 "style=" width: 90px; height: 120px;">
				<c:if test="${mprSrchList.mprAddFile != null}">
					<a href="mprSelectDetail?mprNo=${mprSrchList.mprNo}&pageNum=1">
						<img src="fileDownload?fileName=${mprSrchList.mprAddFile}" style="width: 90px; height: 120px;" >
					</a>
				</c:if>
				<c:if test="${mprSrchList.mprAddFile == null}">
					<a href="mprSelectDetail?mprNo=${mprSrchList.mprNo}&pageNum=1">
						<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;" >
					</a>
				</c:if> 
			</div>
			<div class="col">
				<a href="mprSelectDetail?mprNo=${mprSrchList.mprNo}&pageNum=1">
				<c:if test="${mprSrchList.mprPetType == 01 }">
					<span class="fw-bold text-primary">강아지</span>
				</c:if>
				<c:if test="${mprSrchList.mprPetType == 02 }">
					<span class="fw-bold text-primary">고양이</span>
				</c:if>
				<c:if test="${mprSrchList.mprPetType == 03 }">
					<span class="fw-bold text-primary">기타</span>
				</c:if><br>
					<b>${mprSrchList.mprTitle}</b>
					<p>${mprSrchList.mprContent}</p>
					<small class="text-secondary">
						${mprSrchList.mprWriter }&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${mprSrchList.mprRegDate }" pattern="yy-MM-dd"/>
					</small>
				</a>
			</div>
		</div>
		</c:forEach>
		</c:if>
	</div>
	<br>
	<div>
		<div class="row">
			<div class="col-4 fs-2 fw-bold border-bottom border-primary border-4 border-opacity-50 ">
				실종 반려동물 임시보호
			</div>
			<div class="col text-end">
				<a href="mppSelectList"><i class="bi bi-plus-lg fs-1"></i></a>
			</div>
		</div>
		<c:if test="${empty mppSrchList}">
			<div class="text-center fw-bold fw-3 mt-4"> 검색 결과가 없습니다.</div>
		</c:if>
		<c:if test="${not empty mppSrchList}">
		<c:forEach var="mppSrchList" items="${mppSrchList}">
		<div class="mt-4 row">
			<div class=" inblock me-3 "style=" width: 90px; height: 120px;">
				<c:if test="${mppSrchList.mppAddFile != null}">
					<a href="mppSelectDetail?mppNo=${mppSrchList.mppNo}&pageNum=1">
						<img src="fileDownload?fileName=${mppSrchList.mppAddFile}" style="width: 90px; height: 120px;" >
					</a>
				</c:if>
				<c:if test="${mppSrchList.mppAddFile == null}">
					<a href="mppSelectDetail?mprNo=${mppSrchList.mppNo}&pageNum=1">
						<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;" >
					</a>
				</c:if> 
			</div>
			<div class="col">
				<a href="mppSelectDetail?mppNo=${mppSrchList.mppNo}&pageNum=1">
				<c:if test="${mppSrchList.mppPetType == 01 }">
					<span class="fw-bold text-primary">강아지</span>
				</c:if>
				<c:if test="${mppSrchList.mppPetType == 02 }">
					<span class="fw-bold text-primary">고양이</span>
				</c:if>
				<c:if test="${mppSrchList.mppPetType == 03 }">
					<span class="fw-bold text-primary">기타</span>
				</c:if><br>
					<b>${mppSrchList.mppTitle}</b>
					<p>${mppSrchList.mppContent}</p>
					<small class="text-secondary">
						${mppSrchList.mppWriter }&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${mppSrchList.mppRegDate }" pattern="yy-MM-dd"/>
					</small>
				</a>
			</div>
		</div>
		</c:forEach>
		</c:if>
	</div>
	
</div>