<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="row my-3">
			<div class="col text-end">
				<a href="mppInsert" class="btn btn-outline-success">글쓰기</a>
			</div>
		</div>

	<c:forEach var="mppSelectList" items="${mppSelectList}">
		${mppSelectList.mppNo}
		<a href="mppSelectDetail?mppNo=${mppSelectList.mppNo}&pageNum=${mppModel.currentPage}">${mppSelectList.mppTitle}</a>
		${mppSelectList.mppTitle}
		${mppSelectList.mppRegDate}
		${mppSelectList.mppWriter}
		<div>
			조회수 : ${mppSelectList.mppReadCnt}
		</div>
		<br>
	</c:forEach>
		<div class="row">
			<div class="col">
				<nav aria-label="Page navigation">
				  <ul class="pagination justify-content-center">
				  	<!-- 이젠 페이지 그룹 -->
				  	<c:if test="${mppModel.startPage > mppModel.pageGroup }">
					    <li class="page-item">
					      <a class="page-link" href="mppSelectList?pageNum=${ mppModel.startPage - mppModel.pageGroup }">Pre</a>
					    </li>
				    </c:if>
				    <!-- 페이지 그룹 -->
				    <c:forEach var="i" begin="${mppModel.startPage}" end="${mppModel.endPage}">
				    	<c:if test="${i == mppModel.currentPage }">
				    	<li class="page-item active" aria-current="page">
				    		<span class="page-link">${i}</span>
				    	</li>
				    	</c:if>
				    	<c:if test="${i != mppModel.currentPage }">
					    	<li class="page-item"><a class="page-link" href="mppSelectList?pageNum=${ i }">${i}</a></li>
					    </c:if>					    
				    </c:forEach>
				    <!-- 다음페이지 그룹 -->
					<c:if test="${ mppModel.endPage < mppModel.pageCount }">
					    <li class="page-item">
					      <a class="page-link" href="mppSelectList?pageNum=${ mppModel.startPage + mppModel.pageGroup }">Next</a>
					    </li>
				  	</c:if>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>