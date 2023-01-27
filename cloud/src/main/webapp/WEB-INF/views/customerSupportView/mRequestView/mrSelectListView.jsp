<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<!-- 상단 게시판 제목 -->
	<div class="textTop row">
		<div class="col fs-2">
			<b class="border-bottom border-4 border-success border-opacity-50">건의사항 게시판</b>
		</div>
		<div class="col board-bottom text-end">
			<a href="mrInsert" class="btn btn-secondary posiRight my-2">글쓰기</a>
			<br>
		</div>
	</div>
	 
	<div class="divtablebox">
		<!-- 게시판 리스트 -->
		<div>
			<table class="table table-hover text-center">
				<!-- 상단 리스트 -->
				<tr class="table-success">
					<th>답변여부</th>
					<th>번 호</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>추천수</th>
					<th>작성일</th>
				</tr>
				<tbody>
					<c:if test="${not empty mrList}">
						<c:forEach var="mrList" items="${mrList}" varStatus="status">
							<tr>
								<c:if test="${mrList.mreReplyCode == '01' }">
									<td class="text-secondary" style = "padding : 1.5rem 0.5rem;">답변대기</td>
								</c:if>
								<c:if test="${mrList.mreReplyCode == '02' }">
									<td class="text-success" style = "padding : 1.5rem 0.5rem;"><b>답변완료</b></td>
								</c:if>
								<td style = "padding : 1.5rem 0.5rem;">${mrList.mreNo}</td>
								<td style = "padding : 1.5rem 0.5rem;">
								<a href="mrSelectDetail?mreNo=${mrList.mreNo}&pageNum=${currentPage}">${mrList.mreTitle}
									<c:if test="${mrList.mreAddFile!=null }">
										💾								
									</c:if> </a></td>
								<td style = "padding : 1.5rem 0.5rem;">${mrList.mreWriter}</td>
								<td style = "padding : 1.5rem 0.5rem;">${mrList.mreReadCnt}</td>
								<td style = "padding : 1.5rem 0.5rem;">${mrList.mreRecoCnt}</td>
								<td style = "padding : 1.5rem 0.5rem;"><fmt:formatDate value="${mrList.mreRegDate}" pattern="yy-MM-dd HH:mm" /></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty mrList}">
						<tr class="text-center">
							<td colspan="7" style = "padding : 1.5rem 0.5rem;"><h3>'${keyWord}' 에 대한 검색결과가 없습니다.</h3></td>
						</tr>
					</c:if>
				</tbody>
			</table>
				<!-- 하단 리스트 -->
			<div class="cl-pagination-wrap mt-5">
				<div class="col">
					<nav aria-label="Page navigation">
						<ul class="cl-pagination justify-content-center">
							<!-- 이젠 페이지 그룹 -->
							<c:if test="${ startPage > pageGroup }">
								<li class="prev"><a class="page-link"
									href="mrSelectList?pageNum=1">&lt;&lt;</a>
								</li>
							</c:if>
							<c:if test="${ startPage > pageGroup }">
								<li class="prev"><a class="page-link"
									href="mrSelectList?pageNum=${ startPage - pageGroup }">&lt;</a>
								</li>
							</c:if>
							<!-- 페이지 그룹 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage }">
									<li class="page-item active text-success" aria-current="page"><b>${i}</b></li>
								</c:if>
								<c:if test="${i != currentPage }">
									<li class="page-item"><a class="page-link" href="mrSelectList?pageNum=${ i }">${i}</a></li>
								</c:if>
							</c:forEach>
							<!-- 다음페이지 그룹 -->
							<c:if test="${ endPage < pageCount }">
								<li class="next"><a class="page-link" href="mrSelectList?pageNum=${ startPage + pageGroup }">&gt;</a>
								</li>
							</c:if>
							<c:if test="${ endPage < pageCount }">
								<li class="next"><a class="page-link" href="mrSelectList?pageNum=${pageCount}">&gt;&gt;</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			<div class="row text-start offset-md-3 my-4">
				<form class="row" action="mrSelectList" name="searchForm" id="searchForm" method="post">
					<select name="type" id="type" class="border border-end-0" style="left:0px;width:102px; height:54px;">
						<option value="title" ${type == 'title'? 'selected' : '' }>제 목</option>
						<option value="content" ${type == 'content'? 'selected' : '' }>내 용</option>
						<option value="writer" ${type == 'writer'? 'selected' : '' }>작성자</option>
					</select>
					<div class="col text-start p-0" >
						<input type="text" name="keyword" id="keyword" value="${keyWord}" style="left:0px; width:500px; height:54px; background:#fff; border:1px solid #d0d0d0;"><input type="submit" class="bg-success text-white bg-opacity-75" style="width:53px; height:53px; background:#fff;border:1px solid #d0d0d0; border-left: none;" value="검색">
					</div>
				</form>
			</div>
			
			<div class="board-bottom">
				<a href="mrInsert" class="btn btn-outline-success posiRight my-2">글쓰기</a>
				<br>
			</div>
		</div>
	</div>
</div>