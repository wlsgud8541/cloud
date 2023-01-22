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
	<div class="fs-2 fw-bold border-bottom border-danger border-4 d-inline-block"><a href="mhrSelectList">실종자 신고</a></div>
	<c:if test="${empty mhrSrch}">
		<div class="text-center fw-bold fw-3 mt-4"> 검색 결과가 없습니다.</div>
	</c:if>
	<c:if test="${not empty mhrSrch}">
	<div class="mt-4">
	<c:forEach var="mhrSrch" items="${mhrSrch}">
		<a href="mhrDetailView?mhrNo=${mhrSrch.mhrNo}&pageNum=1">${mhrSrch.mhrTitle}</a>||${mhrSrch.mhrContent}||${mhrSrch.mhrWriter }||<fmt:formatDate value="${mhrSrch.mhrRegDate }" pattern="yy-MM-dd"/> <br> <br>
	</c:forEach>
	</div>
	<div class="cl-pagination-wrap mt-5">
		<div class="col">
			<nav aria-label="Page navigation">
				<ul class="cl-pagination justify-content-center">
					<!-- 이젠 페이지 그룹 -->
					<c:if test="${ startPage > pageGroup }">
						<li class="prev"><a class="page-link"
							href="mhpSearch?pageNum=1">&lt;&lt;</a>
						</li>
					</c:if>
					<c:if test="${ startPage > pageGroup }">
						<li class="prev"><a class="page-link"
							href="mhpSearch?pageNum=${ startPage - pageGroup }">&lt;</a>
						</li>
					</c:if>
					<!-- 페이지 그룹 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage }">
							<li class="page-item active text-success" aria-current="page"><b>${i}</b></li>
						</c:if>
						<c:if test="${i != currentPage }">
							<li class="page-item"><a class="page-link" href="mhpSearch?pageNum=${i}">${i}</a></li>
						</c:if>
					</c:forEach>
					<!-- 다음페이지 그룹 -->
					<c:if test="${ endPage < pageCount }">
						<li class="next"><a class="page-link" href="mhpSearch?pageNum=${ startPage + pageGroup }">&gt;</a>
						</li>
					</c:if>
					<c:if test="${ endPage < pageCount }">
						<li class="next"><a class="page-link" href="mhpSearch?pageNum=${pageCount}">&gt;&gt;</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	</c:if>
</div>