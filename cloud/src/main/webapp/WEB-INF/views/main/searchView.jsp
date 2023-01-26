<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<body>
<h3 class="text-success fw-bold mt-4">검색결과</h3>
	<hr class="border border-success border-2 opacity-75">

<% int i = 0; %>
<c:forEach var="index" items="${searchList}" varStatus="status">
		<c:if test="${fn:trim(index.tableType) == '02'}">
			<%i++;%>
			<c:set var="count02" value="<%= i %>" />
		</c:if>
</c:forEach>


<c:if test="${not empty searchList}">
	<div class="col-3 fs-2 fw-bold border-bottom border-success border-4 border-opacity-50 ">
		실종자 신고
	</div>
	<br>
	 <c:forEach var="search" items="${searchList}" varStatus="st">
	 	<c:if test="${fn:trim(search.tableType) == '02'}">
			<div>
				<b><a href="mhrDetailView?mhrNo=${search.searchNo}&pageNum=1">${search.searchTitle}</a></b>
			</div>
			<p>${search.searchContent}</p>
			<small class="text-secondary">
				 ${search.searchWriter}&nbsp;&nbsp;|&nbsp;&nbsp;<fmt:formatDate value="${search.searchRegdate}" pattern="yy-MM-dd"/>
			</small>
		<br><br>
		</c:if>
	 </c:forEach>
	<c:if test="${count02 == null}">
		<h1>testestes</h1>
	</c:if>
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
			<b><a href="mhfDetailView?mhfNo=${search.searchNo}&pageNum=1">${search.searchTitle}</a></b>
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
			<b><a href="mprSelectDetail?mprNo=${search.searchNo}&pageNum=1">${search.searchTitle}</a></b>
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
			<b><a href="mpfSelectDetail?mpfNo=${search.searchNo}&pageNum=1">${search.searchTitle}</a></b>
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
			<b><a href="mppSelectDetail?mppNo=${search.searchNo}&pageNum=1">${search.searchTitle}</a></b>
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
			<b><a href="mnSelectDetail=${search.searchNo}&pageNum=1">${search.searchTitle}</a></b>
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
				<a href="mqSelectList">${search.searchTitle}</a>
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
	<div class="text-center fw-bold fw-3 mt-4"> 검색 결과가 없습니다.</div>
</c:if>

</body>