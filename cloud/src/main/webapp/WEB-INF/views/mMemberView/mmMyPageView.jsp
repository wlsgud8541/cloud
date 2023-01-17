<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row my-5 w3-content" id="global-content">
	<div class="col">
		<div class="row my-3 text-center">
			<div class="col-4 offset-4">
				<h2 class="fs-3 fw-bold">Cloud 마이페이지</h2>
			</div>
		</div>
		<div class="row commReady" id="mreComTitle">
			<div class="col-4 p-5 text-start border rounded-4 me-2">
				<input type="hidden" value="${mInfo.mmNo}" id="mInfo_mmNo">
				<div class="row border-bottom py-2">
					<span class="fs-4 fw-bold">${mInfo.mmName}</span>
					<span><small>${mInfo.mmEmail}</small></span>
				</div>
				<div class="row border-bottom py-2">
					<span>${mInfo.mmId}</span>
				</div>
				<div class="row border-bottom py-2">
					<span>${mInfo.mmBirth}&nbsp;&nbsp;/&nbsp;&nbsp;${mInfo.mmGen}</span>
				</div>
				<div class="row border-bottom py-2">
					<span>📞&nbsp;&nbsp;${mInfo.mmTel}</span>
				</div>
				<div class="row py-2">
					<span>🏚&nbsp;&nbsp;${mInfo.mmAddr1}</span>
				</div>
				<div class="row border-bottom pb-2 ms-3">
					<span>${mInfo.mmAddr2}</span>
				</div>
				<div class="row pt-2 pb-1">
					<span>카카오 연동 여부 : ${mInfo.mmIdConnKAKAO}</span>
				</div>
				<div class="row pt-2 pb-1">
					<span>네이버 연동 여부 : ${mInfo.mmIdConnNaver}</span>
				</div>
				<div class="row pt-2 pb-1">
					<button class="btn btn-secondary">비밀번호 변경하기</button>
				</div>
				<div class="row pt-2 pb-1">
					<button class="btn btn-secondary">카카오 연동하기</button>
				</div>
				<div class="row pt-2 pb-1">
					<button class="btn btn-secondary">네이버 연동하기</button>
				</div>
				<div class="row py-1">
					<button class="btn btn-secondary">전단지 출력하기</button>
				</div>
			</div>
			<div class="col-7 text-start">
			
				<div class="border rounded-4 p-5">
					<div class="row border-bottom py-2">
						<span class="fs-4 fw-bold">내가 작성한 게시글</span>
					</div>
					<div class="row border-bottom py-2">
						<table class="memberWriterInfo">
							<c:forEach var="mw" items="${memberWriterInfo}">
								<tr>
									<c:if test="${fn:trim(mw.tableType) == '01'}">
										<td><small>실종자 목격 게시판 </small></td>
									</c:if>
									<c:if test="${fn:trim(mw.tableType) == '02'}">
										<td><small>실종자 신고 게시판 </small></td>
									</c:if>
									<c:if test="${fn:trim(mw.tableType) == '11'}">
										<td><small>반려동물 목격 게시판 </small></td>
									</c:if>
									<c:if test="${fn:trim(mw.tableType) == '12'}">
										<td><small>반려동물 임시보호 게시판 </small></td>
									</c:if>
									<c:if test="${fn:trim(mw.tableType) == '13'}">
										<td><small>반려동물 실종신고 게시판 </small></td>
									</c:if>
									<td><small>${mw.noticeTitle}</small></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="cl-pagination-wrap mt-5">
						<div class="col">
							<nav aria-label="Page navigation">
								<ul class="cl-pagination justify-content-center memberWriterPageGroup">
									<!-- 이젠 페이지 그룹 -->
									<c:if test="${ mwStartPage > mwPageGroup }">
										<li class="prev"><a class="page-link myPageWriterList" href="#" data-pageNum="1">&lt;&lt;</a></li>
										<li class="prev"><a class="page-link myPageWriterList" href="#" data-pageNum="${ mwStartPage - mwPageGroup }">&lt;</a></li>
									</c:if>
									<!-- 페이지 그룹 -->
									<c:forEach var="i" begin="${mwStartPage}" end="${mwEndPage}">
										<c:if test="${i == mwCurrentPage }">
											<li class="page-item active text-success" aria-current="page"><b>${i}</b></li>
										</c:if>
										<c:if test="${i != mwCurrentPage }">
											<li class="page-item"><a class="page-link myPageWriterList" href="#" data-pageNum="${i}" >${i}</a></li>
										</c:if>
									</c:forEach>
									<!-- 다음페이지 그룹 -->
									<c:if test="${ mwEndPage < mwPageCount }">
										<li class="next"><a class="page-link myPageWriterList" href="#" data-pageNum="${mwStartPage + mwPageGroup}">&gt;</a></li>
										<li class="next"><a class="page-link myPageWriterList" href="#" data-pageNum="${mwPageCount}">&gt;&gt;</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				
				<div class="border rounded-4 p-5 mt-4">
					<div class="row border-bottom py-2">
						<span class="fs-4 fw-bold">내가 문의한 글</span>
					</div>
					<div class="row border-bottom py-2">
						<table class="mReqList">
							<c:forEach var="mre" items="${memberRequestList}">
								<tr>
									<td><small>${mre.mreTitle}</small></td>
									<c:if test="${mre.mreReplyCode == '01'}">
										<td><small>답변대기</small></td>
									</c:if>
									<c:if test="${mre.mreReplyCode == '02'}">
										<td><small>답변완료</small></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<div class="cl-pagination-wrap mt-5">
						<div class="col">
							<nav aria-label="Page navigation">
								<ul class="cl-pagination justify-content-center pageGroup">
									<!-- 이젠 페이지 그룹 -->
									<c:if test="${ startPage > pageGroup }">
										<li class="prev"><a class="page-link myPageSelectPage" href="#" data-pageNum="1">&lt;&lt;</a></li>
										<li class="prev"><a class="page-link myPageSelectPage" href="#" data-pageNum="${ startPage - pageGroup }">&lt;</a></li>
									</c:if>
									<!-- 페이지 그룹 -->
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage }">
											<li class="page-item active text-success" aria-current="page"><b>${i}</b></li>
										</c:if>
										<c:if test="${i != currentPage }">
											<li class="page-item"><a class="page-link myPageSelectPage" href="#" data-pageNum="${i}" >${i}</a></li>
										</c:if>
									</c:forEach>
									<!-- 다음페이지 그룹 -->
									<c:if test="${ endPage < pageCount }">
										<li class="next"><a class="page-link myPageSelectPage" href="#" data-pageNum="${startPage + pageGroup}">&gt;</a></li>
										<li class="next"><a class="page-link myPageSelectPage" href="#" data-pageNum="${pageCount}">&gt;&gt;</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
