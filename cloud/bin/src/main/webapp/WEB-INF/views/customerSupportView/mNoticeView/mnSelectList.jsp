<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<div class="row " id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">공지사항 게시판</h2>
			</div>
		</div>  		
			
		<div class="row my-3">
			<div class="col text-end">
				<a href="mnInsert" class="btn btn-outline-success">글쓰기</a>
			</div>
		</div>
		
		<div class="row my-3">
			<div class="col">
				<table class="table table-hover">
					<thead>
						<tr class="table-dark">
							<th>NO</th>
							<th>제목</th>
							<th>작성자</th>
							<th>첨부파일</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>		
					</thead>
					<tbody class="text-secondary">
						<c:forEach var="mList" items="${mnList}" varStatus="status">
							<tr>
								<td>${mList.mnNo}</td>
								<td>
									<a href="mnSelectDetail?mnNo=${mList.mnNo}"class="text-decoration-none link-secondary">${ mList.mnTitle }</a>
								</td>
								<td>${mList.mnWriter}</td>
								<td>${mList.mnAddFile}</td>
								<td><fmt:formatDate value="${mList.mnRegDate}" pattern="yyyy-MM-dd" /></td>
								<td>${mList.mnReadCnt}</td>
							</tr>
						</c:forEach>
					</tbody>					
				</table>
			</div>			
		</div>
		<div class="row">
			<div class="col">
				<nav aria-label="Page navigation">
				  <ul class="pagination justify-content-center">
				  	<!-- 이젠 페이지 그룹 -->
				  	<c:if test="${ startPage > pageGroup }">
					    <li class="page-item">
					      <a class="page-link" href="mnSelectList?pageNum=${ startPage - pageGroup }">Pre</a>
					    </li>
				    </c:if>
				    <!-- 페이지 그룹 -->
				    <c:forEach var="i" begin="${startPage}" end="${endPage}">
				    	<c:if test="${i == currentPage }">
				    	<li class="page-item active" aria-current="page">
				    		<span class="page-link">${i}</span>
				    	</li>
				    	</c:if>
				    	<c:if test="${i != currentPage }">
					    	<li class="page-item"><a class="page-link" href="mnSelectList?pageNum=${ i }">${i}</a></li>
					    </c:if>					    
				    </c:forEach>
				    <!-- 다음페이지 그룹 -->
					<c:if test="${ endPage < pageCount }">
					    <li class="page-item">
					      <a class="page-link" href="mnSelectList?pageNum=${ startPage + pageGroup }">Next</a>
					    </li>
				  	</c:if>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</div>
