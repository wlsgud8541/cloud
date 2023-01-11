<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 반려동물 정보 -->

	<div class="w3-content row">
		<div class="row my-3">
			<div class="col text-end">
				<a href="mprInsert" class="btn btn-outline-success">글쓰기</a>
			</div>
		</div>
		<h1>반려동물 신고 게시판</h1>
	<c:forEach var="mprSelectList" items="${mprSelectList}">
		${mprSelectList.mprNo}
		<a href="mprSelectDetail?mprNo=${mprSelectList.mprNo}&pageNum=${mprModel.currentPage}">${mprSelectList.mprTitle}</a>
		${mprSelectList.mprTitle}
		${mprSelectList.mprRegDate}
		${mprSelectList.mprWriter}
		<div>
			조회수 : ${mprSelectList.mprReadCnt}
		</div>
		<br>
	</c:forEach>
		<div class="row">
			<div class="col">
				<nav aria-label="Page navigation">
				  <ul class="pagination justify-content-center">
				  	<!-- 이젠 페이지 그룹 -->
				  	<c:if test="${mprModel.startPage > mprModel.pageGroup }">
					    <li class="page-item">
					      <a class="page-link" href="mprSelectList?pageNum=${ mprModel.startPage - mprModel.pageGroup }">Pre</a>
					    </li>
				    </c:if>
				    <!-- 페이지 그룹 -->
				    <c:forEach var="i" begin="${mprModel.startPage}" end="${mprModel.endPage}">
				    	<c:if test="${i == mprModel.currentPage }">
				    	<li class="page-item active" aria-current="page">
				    		<span class="page-link">${i}</span>
				    	</li>
				    	</c:if>
				    	<c:if test="${i != mprModel.currentPage }">
					    	<li class="page-item"><a class="page-link" href="mprSelectList?pageNum=${ i }">${i}</a></li>
					    </c:if>					    
				    </c:forEach>
				    <!-- 다음페이지 그룹 -->
					<c:if test="${ mprModel.endPage < mprModel.pageCount }">
					    <li class="page-item">
					      <a class="page-link" href="mprSelectList?pageNum=${ mprModel.startPage + mprModel.pageGroup }">Next</a>
					    </li>
				  	</c:if>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
