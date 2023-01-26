<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<body>
<h3 class="text-success fw-bold mt-4">검색결과</h3>
	<hr class="border border-success border-2 opacity-75">

<c:if test="${not empty searchList}">
	<div class="col-3 fs-2 fw-bold border-bottom border-success border-4 border-opacity-50 ">
		실종자 신고
	</div>
	<br>
	<c:forEach var="search" items="${searchList}">
		<c:if test="${fn:trim(search.tableType) == '02'}">
		<div>
			<b><a href="mhrDetailView?mhrNo=${search.searchNo}&pageNum=${pageNum}">${search.searchTitle}</a></b>
		</div>
		<p>${search.searchContent}</p>
		<small class="text-secondary">
			 ${search.searchWriter}&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${search.searchRegdate}" pattern="yy-MM-dd"/>
		</small>
		<br><br>
		</c:if>
	</c:forEach>
	<div class="text-end">
	<a href="mhrSelectList">실종자 신고 더보기</a>
	</div>
	<hr class="border border-dark">
		<div class="col-3 fs-2 fw-bold border-bottom border-success border-4 border-opacity-50 ">
			실종자 목격
		</div>
	<c:forEach var="search" items="${searchList}">
		<c:if test="${fn:trim(search.tableType) == '01'}">
		<div>
			<b><a href="mhfSelectList?mhfNo=${search.searchNo}&pageNum=${pageNum}">${search.searchTitle}</a></b>
		</div>
		<p>${search.searchContent}</p>
		<small class="text-secondary">
			 ${search.searchWriter}&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${search.searchRegdate }" pattern="yy-MM-dd"/>
		</small>
		<br><br>
		</c:if>
	</c:forEach>
	<div class="text-end">
		<a href="mhfSelectList">실종자 목격 더보기</a>
	</div>
	<hr class="border border-dark">
	<div class="col-3 fs-2 fw-bold border-bottom border-success border-4 border-opacity-50 ">
			반려동물 신고
		</div>
		<c:forEach var="search" items="${searchList}">
		<c:if test="${fn:trim(search.tableType) == '13'}">
		<div>
			<b><a href="mprSelectList?mprNo=${search.searchNo}&pageNum=${pageNum}">${search.searchTitle}</a></b>
		</div>
		<p>${search.searchContent}</p>
		<small class="text-secondary">
			 ${search.searchWriter}&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${search.searchRegdate }" pattern="yy-MM-dd"/>
		</small>
		<br><br>
		</c:if>
	</c:forEach>
	<div class="text-end">
		<a href="mprSelelctList">반려동물 신고 더보기</a>
	</div>
	<hr class="border border-dark">
	<div class="col-3 fs-2 fw-bold border-bottom border-success border-4 border-opacity-50 ">
			반려동물 목격
	</div>
	<c:forEach var="search" items="${searchList}">
		<c:if test="${fn:trim(search.tableType) == '11'}">
		<div>
			<b><a href="mpfSelectList?mpfNo=${search.searchNo}&pageNum=${pageNum}">${search.searchTitle}</a></b>
		</div>
		<small class="text-secondary">
			 ${search.searchWriter}&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${search.searchRegdate }" pattern="yy-MM-dd"/>
		</small>
		<br><br>
		</c:if>
	</c:forEach>
	<div class="text-end">
		<a href="mpfSelectList">반려동물 목격 더보기</a>
	</div>
	<hr class="border border-dark">
	<div class="col-3 fs-2 fw-bold border-bottom border-success border-4 border-opacity-50 ">
			반려동물 임시보호
	</div>
	<c:forEach var="search" items="${searchList}">
		<c:if test="${fn:trim(search.tableType) == '12'}">
		<div>
			<b><a href="mppSelectList?mppNo=${search.searchNo}&pagenum=${pageNum}">${search.searchTitle}</a></b>
		</div>
		<small class="text-secondary">
			 ${search.searchWriter}&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${search.searchRegdate }" pattern="yy-MM-dd"/>
		</small>
		<br><br>
		</c:if>
	</c:forEach>
	<div class="text-end">
		<a href="mppSelectList">반려동물 임시보호 더보기</a>
	</div>
	<hr class="border border-dark">
	<div class="col-3 fs-2 fw-bold border-bottom border-success border-4 border-opacity-50 ">
			공지사항
	</div>
	<c:forEach var="search" items="${searchList}">
		<c:if test="${fn:trim(search.tableType) == '21'}">
		<div>
			<b><a href="mnSelectList=${search.searchNo}&pageNum=${pageNum}">${search.searchTitle}</a></b>
		</div>
		<small class="text-secondary">
			 ${search.searchWriter}&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${search.searchRegdate }" pattern="yy-MM-dd"/>
		</small>
		</c:if>
	</c:forEach>
	<div class="text-end">
		<a href="mnSelectList">공지사항 더보기</a>
	</div>
	<hr class="border border-dark">
	<div class="col-3 fs-2 fw-bold border-bottom border-success border-4 border-opacity-50 ">
			Q&A
	</div>
	<c:forEach var="search" items="${searchList}">
		<c:if test="${fn:trim(search.tableType) == '22'}">
			<div>
				<a href="mqSelectList?mqNo=${search.searchNo}&pageNum=${pageNum}">${search.searchTitle}</a>
			</div>
			<small class="text-secondary">
				 ${search.searchWriter}&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${search.searchRegdate }" pattern="yy-MM-dd"/>
			</small>
		</c:if>
	</c:forEach>
	<div class="text-end">
		<a href="mqSelectList">Q&A 더보기</a>
	</div>
</c:if>

<c:if test="${empty searchList}">
	<h2> 자료가 없습니다.</h2>
</c:if>

</body>