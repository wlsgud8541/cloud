<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<!-- 상단 게시판 제목 -->
	
		<!-- 게시판 리스트 -->
<!-- content -->
			<div class="row">
				<div class="col-2">
					<h2 class="fs-2 fw-bold border-bottom border-danger border-4 border-opacity-50">실종신고</h2>
				</div>
				<div class="col text-end">
					<a href="mhrInsert" class="btn btn-outline-danger">글쓰기</a>
				</div>
			</div>  		
			<div class="mt-3">
			<table class="table table-hover text-center">
				<!-- 상단 리스트 -->
				<tr class="table-danger">
					<th>번 호</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
				<tbody>
					<c:if test="${not empty list}">
						<c:forEach var="list" items="${list}" varStatus="status">
							<tr>
								<td style = "padding : 1.5rem 0.5rem;">${list.mhrNo }</td>
								<td style = "padding : 1.5rem 0.5rem;">
								<a href="mhrDetailView?mhrNo=${list.mhrNo}&pageNum=${currentPage}">${list.mhrTitle}
									<c:if test="${list.mhrAddFile!=null }">
										💾								
									</c:if> </a></td>
								<td style = "padding : 1.5rem 0.5rem;">${list.mhrWriter}</td>
								<td style = "padding : 1.5rem 0.5rem;">${list.mhrReadCnt}</td>
								<td style = "padding : 1.5rem 0.5rem;"><fmt:formatDate value="${list.mhrRegDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr class="text-center">
							<td colspan="5" style = "padding : 1.5rem 0.5rem;"><h3>'${keyWord}' 에 대한 검색결과가 없습니다.</h3></td>
						</tr>
					</c:if>
				</tbody>
				<!-- 하단 리스트 -->
			</table>
			<div class="cl-pagination-wrap mt-5">
				<div class="col">
					<nav aria-label="Page navigation">
						<ul class="cl-pagination justify-content-center">
							<!-- 이젠 페이지 그룹 -->
							<c:if test="${ startPage > pageGroup }">
								<li class="prev"><a class="page-link"
									href="mhrSelectList?pageNum=1">&lt;&lt;</a>
								</li>
							</c:if>
							<c:if test="${ startPage > pageGroup }">
								<li class="prev"><a class="page-link"
									href="mhrSelectList?pageNum=${ startPage - pageGroup }">&lt;</a>
								</li>
							</c:if>
							<!-- 페이지 그룹 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage }">
									<li class="page-item active text-danger" aria-current="page"><b>${i}</b></li>
								</c:if>
								<c:if test="${i != currentPage }">
									<li class="page-item"><a class="page-link" href="mhrSelectList?pageNum=${ i }">${i}</a></li>
								</c:if>
							</c:forEach>
							<!-- 다음페이지 그룹 -->
							<c:if test="${ endPage < pageCount }">
								<li class="next"><a class="page-link" href="mhrSelectList?pageNum=${ startPage + pageGroup }">&gt;</a>
								</li>
							</c:if> 
							<c:if test="${ endPage < pageCount }">
								<li class="next"><a class="page-link" href="mhrSelectList?pageNum=${pageCount}">&gt;&gt;</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			
			<div class="row text-center my-4">
				<form class="col row" action="mhrSelectList" name="searchForm" id="searchForm" method="post">
					<div class="col text-end p-0">
						<select name="type" class="border border-end-0" style="left:0px;width:102px; height:54px;">
							<option value="title" ${type == 'title'? 'selected' : '' }>제 목</option>
							<option value="writer" ${type == 'writer'? 'selected' : '' }>작성자</option>
						</select>
					</div>
					<div class="col text-start p-0">
						<input type="text" name="keyWord" value="${keyWord}" style="left:0px; width:500px; height:54px; background:#fff; border:1px solid #d0d0d0;"><input type="submit" class="bg-danger text-white bg-opacity-75" style="left:0px; top:0px; width:54px; height:56px; background:#fff;  border:1px solid #d0d0d0;" value="검색">
					</div>
				</form>
			</div>
			<div class="board-bottom">
				<a href="mhrInsert" class="btn btn-outline-danger posiRight my-2">글쓰기</a>
				<br>
			</div>
		</div>