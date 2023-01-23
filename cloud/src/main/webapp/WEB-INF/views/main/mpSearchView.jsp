<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<div class="pt-4">
	<div class="mt-4">
		<div class="border row">
			<div class="p-4 inblock">
				<div class="mb-4 inblock row">
					<div class="checks">
						<label class="categ">
							<b>대상</b>
						</label>
						<div class="checks col2">
							<input type="checkbox">
							<label> 전체 </label>
						</div>
						<div class="checks col2">
							<input type="checkbox">
							<label> 비장애아동(18세 미만) </label>
						</div>
						<div class="checks col2">
							<input type="checkbox">
							<label> 장애인(지적.자폐성.정신)</label>
						</div>
						<div class="checks col2">
							<input type="checkbox">
							<label> 치매환자 </label>
						</div>
						<div class="checks col2">
							<input type="checkbox">
							<label> 가출인 </label>
						</div>
						<div class="checks col2">
							<input type="checkbox">
							<label> 기타 </label>
						</div>
					</div>
				</div>
				<div class="mb-4">
					<label class="categ">
						<b>성별</b>
					</label>
					<div class="checks col-lg-5 col-sm-4">
						<div class="checks col4">
							<input type="radio">
							<label class="checks "> 전체 </label>
						</div>
						<div class="checks col4">
							<input type="radio">
							<label class="checks "> 남자 </label>
						</div>
						<div class="checks col4">
							<input type="radio">
							<label class="checks "> 여자 </label>
						</div>
					</div>
					<div class="checks col-lg-5 col-sm-4">
						<label class=categ>
							<b>이름</b>
						</label>
						<div class="checks">
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="mb-4">
					<label class="categ">
						<b>발생일</b>
					</label>
					<div class="inblock col-lg-5 col-sm-4">
						<div class="inblock">
							<input type="date"  class="form-control">
						</div>	
							~
						<div class="inblock">
							<input type="date" class="form-control">
						</div>
					</div>
					<label class="categ">
						<b>당시나이</b>
					</label>
					<div class="inblock col-lg-5 col-sm-4">
						<div class="inblock">
							<input type="text" class="form-control">
						</div>
							~
						<div class="inblock">
							<input type="text"  class="form-control">
						</div>
					</div>
				</div>
				<div class="mb-4">
					<label class="categ">
						<b>신체특징</b>
					</label>
					<div class="checks col-lg-5 col-sm-4">
						<div class="checks">
							<input type="text" class="form-control">
						</div>
					</div>
					<label class=categ>
						<b>발생장소</b>
					</label>
					<div class="checks col-lg-5 col-sm-4">
						<div class="checks">
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="row inblock">
					<div class="col">	
						<a href="#"><button type="button" class="btn btn-lg btn-outline-secondary">검색</button></a>
					</div>
	            </div>
			</div>
		</div>
	</div>
</div>
<h3 class="text-success fw-bold mt-4">검색결과</h3>
<hr class="border border-success border-2 opacity-50">
<div>
	<div class="fs-3 fw-bold border-bottom border-primary border-4 d-inline-block"><a href="mprSelectList">실종 반려동물 신고</a></div>
	<c:if test="${empty mprSrchList}">
		<div class="text-center fw-bold fw-3 mt-4"> 검색 결과가 없습니다.</div>
	</c:if>
	<c:if test="${not empty mprSrchList}">
	<div class="mt-4">
	<c:forEach var="mprSrchList" items="${mprSrchList}">
		<a href="mprSelectDetail?mprNo=${mprSrchList.mprNo}&pageNum=1">${mprSrchList.mprTitle}</a>||${mprSrchList.mprContent}||${mprSrchList.mprWriter }||<fmt:formatDate value="${mprSrchList.mprRegDate }" pattern="yy-MM-dd"/> <br> <br>
	</c:forEach>
	</div>
	</c:if>
</div>
<div>
	<div class="fs-3 fw-bold border-bottom border-primary border-4 d-inline-block"><a href="mppSelectList">실종 반려동물 임시보호</a></div>
	<c:if test="${empty mppSrchList}">
		<div class="text-center fw-bold fw-3 mt-4"> 검색 결과가 없습니다.</div>
	</c:if>
	<c:if test="${not empty mppSrchList}">
	<div class="mt-4">
	<c:forEach var="mppSrchList" items="${mppSrchList}">
		<a href="mppSelectDetail?mppNo=${mppSrchList.mppNo}&pageNum=1">${mppSrchList.mppTitle}</a>||${mppSrchList.mppContent}||${mppSrchList.mppWriter }||<fmt:formatDate value="${mppSrchList.mppRegDate }" pattern="yy-MM-dd"/> <br> <br>
	</c:forEach>
	</div>
	</c:if>
</div>