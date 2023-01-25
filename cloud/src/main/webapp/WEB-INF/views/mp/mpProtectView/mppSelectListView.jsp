<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class=" pt-5 container">
	<!-- 상단 게시판 제목 -->
	<div class="textTop row">
		<div class="col fs-2">
			<b>실종 임시보호 신고 게시판</b>
		</div>
		<div class="col board-bottom text-end">
			<a href="mppInsert" class="btn btn-secondary posiRight my-2">글쓰기</a>
			<br>
		</div>
	</div>
	 
	<div class="divtablebox">
		<!-- 게시판 리스트 -->
		<div>
			<table class="table table-hover text-center">
				<!-- 상단 리스트 -->
				<tr class="table-primary">
					<th>번 호</th>
					<th>지 역</th>
					<th>상세위치</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>실종현황</th>
				</tr>
				<tbody>
					<c:forEach var="mppSelectList" items="${mppSelectList}" varStatus="status">
						<tr>
							<td style = "padding : 1.5rem 0.5rem;">${mppSelectList.mppNo }</td>
							<c:if test="${mppSelectList.mppLocalCode == 01}">
								<td style = "padding : 1.5rem 0.5rem;">서울</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 02}">
								<td style = "padding : 1.5rem 0.5rem;">경기</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 03}">
								<td style = "padding : 1.5rem 0.5rem;">인천</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 04}">
								<td style = "padding : 1.5rem 0.5rem;">대전</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 05}">
								<td style = "padding : 1.5rem 0.5rem;">광주</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 06}">
								<td style = "padding : 1.5rem 0.5rem;">대구</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 07}">
								<td style = "padding : 1.5rem 0.5rem;">울산</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 08}">
								<td style = "padding : 1.5rem 0.5rem;">부산</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 09}">
								<td style = "padding : 1.5rem 0.5rem;">세종</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 10}">
								<td style = "padding : 1.5rem 0.5rem;">강원</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 11}">
								<td style = "padding : 1.5rem 0.5rem;">충북</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 12}">
								<td style = "padding : 1.5rem 0.5rem;">충남</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 13}">
								<td style = "padding : 1.5rem 0.5rem;">전북</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 14}">
								<td style = "padding : 1.5rem 0.5rem;">전남</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 15}">
								<td style = "padding : 1.5rem 0.5rem;">경북</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 16}">
								<td style = "padding : 1.5rem 0.5rem;">경남</td>
							</c:if>
							<c:if test="${mppSelectList.mppLocalCode == 17}">
								<td style = "padding : 1.5rem 0.5rem;">제주</td>
							</c:if>
							<td style = "padding : 1.5rem 0.5rem;">${mppSelectList.mppLocalDetail}</td>
							<td style = "padding : 1.5rem 0.5rem;">
							<a href="mppSelectDetail?mppNo=${mppSelectList.mppNo}&pageNum=${mppModel.currentPage}">${mppSelectList.mppTitle}
								<c:if test="${mppSelectList.mppAddFile!=null }">
									💾								
								</c:if> </a></td>
							<td style = "padding : 1.5rem 0.5rem;">${mppSelectList.mppWriter}</td>
							<td style = "padding : 1.5rem 0.5rem;">${mppSelectList.mppReadCnt}</td>
							<td style = "padding : 1.5rem 0.5rem;"><fmt:formatDate value="${mppSelectList.mppRegDate}" pattern="yy-MM-dd HH:mm" /></td>
						<c:if test="${mppSelectList.mppStatusCode == '01' }">
							<td class="text-danger" style = "padding : 1.5rem 0.5rem;">실종</td>
						</c:if>
						<c:if test="${mppSelectList.mppStatusCode == '02' }">
							<td class="text-primary" style = "padding : 1.5rem 0.5rem;">찾았어요!</td>
						</c:if>
						</tr>
					</c:forEach>
				</tbody>

				<!-- 하단 리스트 -->
			</table>
			<div class="cl-pagination-wrap mt-5">
				<div class="col">
					<nav aria-label="Page navigation">
						<ul class="cl-pagination justify-content-center">
							<!-- 이젠 페이지 그룹 -->
							<c:if test="${ mppModel.startPage > mppModel.pageGroup }">
								<li class="prev"><a class="page-link"
									href="mppSelectList?pageNum=1">&lt;&lt;</a>
								</li>
							</c:if>
							<c:if test="${mppModel.startPage > mppModel.pageGroup }">
								<li class="prev"><a class="page-link"
									href="mppSelectList?pageNum=${ mppModel.startPage - mppModel.pageGroup }">&lt;</a>
								</li>
							</c:if>
							<!-- 페이지 그룹 -->
							<c:forEach var="i" begin="${mppModel.startPage}" end="${mppModel.endPage}">
								<c:if test="${i == mppModel.currentPage }">
									<li class="page-item active text-primary" aria-current="page"><b>${i}</b></li>
								</c:if>
								<c:if test="${i != mppModel.currentPage }">
									<li class="page-item"><a class="page-link" href="mppSelectList?pageNum=${ i }">${i}</a></li>
								</c:if>
							</c:forEach>
							<!-- 다음페이지 그룹 -->
							<c:if test="${ mppModel.endPage < mppModel.pageCount }">
								<li class="next"><a class="page-link" href="mppSelectList?pageNum=${ mppModel.startPage + mppModel.pageGroup }">&gt;</a>
								</li>
							</c:if> 
							<c:if test="${ mppModel.endPage < mppModel.pageCount }">
								<li class="next"><a class="page-link" href="mppSelectList?pageNum=${mppModel.pageCount}">&gt;&gt;</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			<div class="row text-center my-4">
				<form class="col row" action="mppSelectList" name="searchForm" id="searchForm" method="post">
					<div class="col text-end p-0">
						<select name="type" id="type" class="border border-end-0" style="left:0px;width:102px; height:54px;">
							<option value="title" ${type == 'title'? 'selected' : '' }>제 목</option>
							<option value="content" ${type == 'content'? 'selected' : '' }>내 용</option>
							<option value="writer" ${type == 'writer'? 'selected' : '' }>작성자</option>
						</select>
					</div>
					<div class="col text-start p-0">
						<input type="text" name="keyWord" value="${keyWord}" style="left:0px; width:500px; height:54px; background:#fff;  border:1px solid #d0d0d0;">
						<input type="submit" class="bg-primary text-white bg-opacity-75" style="left:0px; top:0px; width:54px; height:56px; background:#fff;  border:1px solid #d0d0d0;" value="검색">
					</div>
				</form>
			</div>
			
			<div class="board-bottom">
				<a href="mppInsert" class="btn btn-outline-primary posiRight my-2">글쓰기</a>
				<br>
			</div>
		</div>
	</div>
</div>