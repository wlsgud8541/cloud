<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="w3-content row">
		<div class="row my-3">
			<div class="col text-end">
				<a href="mpfInsert" class="btn btn-outline-success">글쓰기</a>
			</div>
		</div>
	<h1>실종 반려동물 목격 게시판</h1>
	<c:forEach var="mpfSelectList" items="${mpfSelectList}">
		${mpfSelectList.mpfNo}
		<a href="mpfSelectDetail?mpfNo=${mpfSelectList.mpfNo}&pageNum=${mpfModel.currentPage}">${mpfSelectList.mpfTitle}</a>
		${mpfSelectList.mpfTitle}
		${mpfSelectList.mpfRegDate}
		${mpfSelectList.mpfWriter}
		<div>
			조회수 : ${mpfSelectList.mpfReadCnt}
		</div>
		<br>
	</c:forEach>
		<div class="row">
			<div class="col">
				<nav aria-label="Page navigation">
				  <ul class="pagination justify-content-center">
				  	<!-- 이젠 페이지 그룹 -->
				  	<c:if test="${mpfModel.startPage > mpfModel.pageGroup }">
					    <li class="page-item">
					      <a class="page-link" href="mpfSelectList?pageNum=${ mpfModel.startPage - mpfModel.pageGroup }">Pre</a>
					    </li>
				    </c:if>
				    <!-- 페이지 그룹 -->
				    <c:forEach var="i" begin="${mpfModel.startPage}" end="${mpfModel.endPage}">
				    	<c:if test="${i == mpfModel.currentPage }">
				    	<li class="page-item active" aria-current="page">
				    		<span class="page-link">${i}</span>
				    	</li>
				    	</c:if>
				    	<c:if test="${i != mpfModel.currentPage }">
					    	<li class="page-item"><a class="page-link" href="mpfSelectList?pageNum=${ i }">${i}</a></li>
					    </c:if>					    
				    </c:forEach>
				    <!-- 다음페이지 그룹 -->
					<c:if test="${ mpfModel.endPage < mpfModel.pageCount }">
					    <li class="page-item">
					      <a class="page-link" href="mpfSelectList?pageNum=${ mpfModel.startPage + mpfModel.pageGroup }">Next</a>
					    </li>
				  	</c:if>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>