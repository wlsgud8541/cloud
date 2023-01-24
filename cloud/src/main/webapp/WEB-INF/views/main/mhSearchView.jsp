<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="w3-content">
	<form action="mhSearch" method="post" class=" border row mt-4">
		<div class="p-4 inblock">
			<div class="mb-4 row">
				<label class="categ">
					<b class="border-bottom border-success border-2 opacity-75">대상</b>
				</label>
				<div class="checks col-lg-5 col-sm-4">
					<select name="mhCode" class="bg-white border">
						<option value="">--선택하세요--</option>
						<option value="01">비장애아동(18세 미만)</option>
						<option value="02">장애인(지적.자폐성.정신)</option>
						<option value="03">치매환자</option>
						<option value="04">가출인</option>
						<option value="05">기타</option>
					</select>
				</div>
			</div>
			<div class="mb-4 row" >
				<label class="categ">
					<b class="border-bottom border-success border-2 opacity-75">성별</b>
				</label>
				<div class="checks col-lg-5 col-sm-4">
					<select name="mhGen" class="bg-white border">
						<option value="">--선택하세요--</option>
						<option value="M">남 자</option>
						<option value="F">여 자</option>
					</select>
				</div>
					<label class=categ>
						<b class="border-bottom border-success border-2 opacity-75">이름</b>
					</label>
				<div class="checks col">
					<div class="checks schInput ">
						<input class="border bg-white" type="text" name="mhName" value="${mhName}">
					</div>
				</div>
			</div>
			<div class="mb-4 row">
				<label class="categ">
					<b class="border-bottom border-success border-2 opacity-75">발생일</b>
				</label>
				<div class="inblock col-5 schInput search_date ">
					<input type="date" name="mhInfoDate1"class="text-center bg-white border" style="padding: 0;">~<input type="date" name="mhInfoDate2"class="text-center bg-white border" style="padding: 0;">
				</div>
				<label class=categ>
					<b class="border-bottom border-success border-2 opacity-75">발생장소</b>
				</label>
				<div class="checks col">
					<div class="checks">
						<select name="mhrLocalCode" class="bg-white border">
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
			<div class="col-3 fs-2 fw-bold border-bottom border-danger border-4 border-opacity-50 ">
				실종자 신고
			</div>
			<div class="col text-end">
				<a href="mhrSelectList"><i class="bi bi-plus-lg fs-1"></i></a>
			</div>
		</div>
		<c:if test="${empty mhrSrch}">
			<div class="text-center fw-bold fw-3 mt-4"> 검색 결과가 없습니다.</div>
		</c:if>
		<c:if test="${not empty mhrSrch}">
		<div class="mt-4">
		<c:forEach var="mhrSrch" items="${mhrSrch}">
			<div class="mt-4 row">
				<div class=" inblock me-3"style="width: 90px; height: 120px;">
					<c:if test="${mhrSrch.mhrAddFile != null}">
						<a href="mhrDetailView?mhrNo=${mhrSrch.mhrNo}&pageNum=1">
							<img src="fileDownload?fileName=${mhrSrch.mhrAddFile}" style="width: 90px; height: 120px;" >
						</a>
					</c:if>
					<c:if test="${mhrSrch.mhrAddFile == null}">
						<a href="mhrDetailView?mhrNo=${mhrSrch.mhrNo}&pageNum=1">
							<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;" >
						</a>
					</c:if>
				</div>
				<div class="col">
					<a href="mhrDetailView?mhrNo=${mhrSrch.mhrNo}&pageNum=1">
				<c:if test="${mhrSrch.mhrIllCode == '01'}">
						<span class="fw-bold text-danger">비장애아동(18세 미만)</span>
				</c:if>
				<c:if test="${mhrSrch.mhrIllCode == '02'}">
						<span class="fw-bold text-danger">장애인(지적.자폐성.정신)</span>
				</c:if>
				<c:if test="${mhrSrch.mhrIllCode == '03'}">
						<span class="fw-bold text-danger">치매환자</span>
				</c:if>
				<c:if test="${mhrSrch.mhrIllCode == '04'}">
						<span class="fw-bold text-danger">가출인</span>
				</c:if>
				<c:if test="${mhrSrch.mhrIllCode == '05'}">
						<span class="fw-bold text-danger">기타</span>
				</c:if><br>
						<b>${mhrSrch.mhrTitle}</b>
						<p>${mhrSrch.mhrContent}</p>
						<small class="text-secondary">
							 ${mhrSrch.mhrWriter }&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${mhrSrch.mhrRegDate }" pattern="yy-MM-dd"/>
						</small>
					</a>
				</div>
			</div>
		</c:forEach>
		</div>
		</c:if>
	</div>
</div>