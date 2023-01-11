<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<div class="w3-content">
		<!-- 상단 게시판 제목 -->
		<div class="textTop">
			<h2 class="textTitle">실종신고 게시판</h2>
			
			<div class="explainbox">실종신고 게시판의 설명</div>
		</div>
		<div class="divtablebox">
			<!-- 게시판 리스트 -->
			<div>
				<table class="w3-table">
					<!-- 상단 리스트 -->
					<c:if test="${not empty list}">
					<c:forEach var="list" items="${list}">
						<tr>
							<th class="mhrListThNo">${list.mhrNo}</th>
							<th class="mhrListThTitle">
							<a href="mhrDetailView?mhrNo=${list.mhrNo}&pageNum=${currentPage}">${list.mhrTitle}</a></th>
							<th class="mhrListThWriter">${list.mhrWriter}</th>
							<th class="mhrListThDate"><fmt:formatDate value="${list.mhrRegDate}" pattern="yyyy-MM-dd"/></th>
							<th class="mhrListThReadCount">${list.mhrReadCnt}</th>
						</tr>
					</c:forEach>
					</c:if>
					<!-- 하단 리스트 -->
				</table>
			<div class="row">
				<div class="col">
					<nav>
						<ul>
							<c:if test="${startPage > pagegroup}">
								<li class="page-item">
									<a class="page-link" href="mhrSelectList?pageNum=${startPage - pagegroup}">Pre</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li class="page-item">
										<span class="page-link">${i}</span>
									</li>
								</c:if>
								<c:if test="${i != currentPage}">
									<li><a class="page-link" href="mhrSelectList?pageNum=${i}">${i}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${endPage>pageCount}">
								<li class="page-item">
									<a class="page-link" href="mhrSelectList?pageNum=${startPage+pagegroup}">Next</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			<div class="board-bottom">
				<a href="mhrInsert"> 등록하기</a>
				<a href="#" class="reportBtn">신고하기</a>
			</div>
		</div>
	</div>
	</div>
</body>
