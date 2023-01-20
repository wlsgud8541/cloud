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
					<c:if test="${not empty mhfList}">
					<c:forEach var="mhfList" items="${mhfList}">
						<tr>
							<th class="mhfmhfListThNo">${mhfList.mhfNo}</th>
							<th class="mhfmhfListThTitle">
							<a href="mhfDetailView?mhfNo=${mhfList.mhfNo}&pageNum=${currentPage}">${mhfList.mhfTitle}</a></th>
							<th class="mhfmhfListThWriter">${mhfList.mhfWriter}</th>
							<th class="mhfmhfListThDate"><fmt:formatDate value="${mhfList.mhfRegDate}" pattern="yyyy-MM-dd"/></th>
							<th class="mhfmhfListThReadCount">${mhfList.mhfReadCnt}</th>
						</tr>
					</c:forEach>
					</c:if>
					<!-- 하단 리스트 -->
				</table>
			<div class="row">
				<div class="col">
					<nav>
						<ul>
							<c:if test="${startPage > pageGroup}">
								<li class="page-item">
									<a class="page-link" href="mhfSelectList?pageNum=${startPage - pageGroup}">Pre</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li class="page-item">
										<span class="page-link">${i}</span>
									</li>
								</c:if>
								<c:if test="${i != currentPage}">
									<li><a class="page-link" href="mhfSelectList?pageNum=${i}">${i}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${endPage>pageCount}">
								<li class="page-item">
									<a class="page-link" href="mhfSelectmhfList?pageNum=${startPage+pageGroup}">Next</a>
								</li>
							</c:if>
							<c:if test="${empty mhfList}">
							<div>
								<h2>게시글이 없습니다.</h2>
							</div>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			<div class="row text-center my-4">
				<form class="row col" action="mhfSelectList" name="mhfSearchForm" id="mhfSearchForm" method="post">
					<div class="col text-end p-0">
						<select name="type" class="border border-end-0" style="left:0px; width:102px; height:54px;">
							<option value="title" ${type=='title' ? 'selected' : '' }>제목</option>
							<option value="writer" ${type=='writer' ? 'seleted' : '' }>작성자</option>
						</select>
					</div>
					<div class="col text-start p-0">
						<input type="text" name="keyword" value="${keyword}" style="left:0px; width:500px; height:54px; background:#fff; border:1px solid #d0d0d0;">
						<input type="submit" class="bg-success text-white bg-opacity-75" style="left:0px; top:0px; width:54px; height:56px; background:#fff;  border:1px solid #d0d0d0;" value="검색">
					</div>
				</form>
			</div>
			<div class="board-bottom">
				<a href="mhfInsert"> 등록하기</a>
				<a href="#" class="reportBtn">신고하기</a>
			</div>
		</div>
	</div>
	</div>
</body>
