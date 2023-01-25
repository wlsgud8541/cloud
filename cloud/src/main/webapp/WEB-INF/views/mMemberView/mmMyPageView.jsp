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
					<div class="col-1">
						♦
					</div>
					<div class="col">
						<span>${mInfo.mmId}</span>
					</div>
				</div>
				<div class="row border-bottom py-2">
					<div class="col-1">
						🙍‍♂️
					</div>
					<div class="col">
						<span>${mInfo.mmBirth}&nbsp;&nbsp;/&nbsp;&nbsp;${mInfo.mmGen}</span>
					</div>
				</div>
				<div class="row border-bottom py-2">
					<div class="col-1">
						📞
					</div>
					<div class="col">
						<span>${mInfo.mmTel}</span>
					</div>
				</div>
				<div class="row py-2">
					<div class="col-1">
						🏚
					</div>
					<div class="col">
						<span>${mInfo.mmAddr1}&nbsp;${mInfo.mmAddr2}</span>
					</div>
				</div>
				<%-- 
				<div class="row border-bottom pb-2 ms-3">
					<a href="printTest?code=mh">문서출력 테스트</a>
				</div>
				<div class="row pt-2 pb-1">
					<span>카카오 연동 여부 : ${mInfo.mmIdConnKAKAO}</span>
				</div>
				<div class="row pt-2 pb-1">
					<span>네이버 연동 여부 : ${mInfo.mmIdConnNaver}</span>
				</div> 
				--%>
				<c:if test="${fn:trim(mInfo.mmIdConnKAKAO) == 'N' && fn:trim(mInfo.mmIdConnNaver) == 'N'}">
					<div class="row pt-2 pb-1">
						<button class="btn btn-secondary" id="changePass">비밀번호 변경하기</button>
					</div>
				</c:if>
				<div class="row pt-2 pb-1">
					<button class="btn btn-secondary" id="memberDisabled">회원 탈퇴</button>
				</div>
			</div>
			<div class="col-7 text-start">
			
				<div class="border rounded-4 p-5" style="min-height: 370px;">
					<div class="row border-bottom py-2">
						<span class="fs-4 fw-bold">내가 작성한 게시글</span>
					</div>
					<c:if test="${not empty memberWriterInfo}">
						<div class="row border-bottom py-2" style="min-height: 141px;">
							<table class="memberWriterInfo">
								<c:forEach var="mw" items="${memberWriterInfo}">
									<tr>
										<c:if test="${fn:trim(mw.tableType) == '01'}">
											<td><small>실종자 목격 게시판 </small></td>
											<td><small><a href="mhfDetailView?mhfNo=${mw.noticeNo}&pageNum=1">${mw.noticeTitle}</a></small></td>
										</c:if>
										<c:if test="${fn:trim(mw.tableType) == '02'}">
											<td><small>실종자 신고 게시판 </small></td>
											<td><small><a href="mhrDetailView?mhrNo=${mw.noticeNo}&pageNum=1">${mw.noticeTitle}</a></small></td>
										</c:if>
										<c:if test="${fn:trim(mw.tableType) == '11'}">
											<td><small>반려동물 목격 게시판 </small></td>
											<td><small><a href="mpfSelectDetail?mpfNo=${mw.noticeNo}&pageNum=1">${mw.noticeTitle}</a></small></td>
										</c:if>
										<c:if test="${fn:trim(mw.tableType) == '12'}">
											<td><small>반려동물 임시보호 게시판 </small></td>
											<td><small><a href="mppSelectDetail?mppNo=${mw.noticeNo}&pageNum=1">${mw.noticeTitle}</a></small></td>
										</c:if>
										<c:if test="${fn:trim(mw.tableType) == '13'}">
											<td><small>반려동물 실종신고 게시판 </small></td>
											<td><small><a href="mprSelectDetail?mprNo=${mw.noticeNo}&pageNum=1">${mw.noticeTitle}</a></small></td>
										</c:if>
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
					</c:if>
					<c:if test="${empty memberWriterInfo}">
						<div class="row border-bottom py-2" style="min-height: 141px;">
							<table class="memberWriterInfo">
								<tr>
									<td><h5>작성한 게시글이 존재하지 않습니다.</h5></td>
								</tr>
							</table>
						</div>	
					</c:if>
				</div>
				
				<div class="border rounded-4 p-5 mt-4" style="min-height: 370px;">
					<div class="row border-bottom py-2">
						<span class="fs-4 fw-bold">내가 문의한 글</span>
					</div>
					<c:if test="${not empty memberRequestList}">
						<div class="row border-bottom py-2" style="min-height: 141px;">
							<table class="mReqList">
								<c:forEach var="mre" items="${memberRequestList}">
									<tr>
										<td><small><a href="mrSelectDetail?mreNo=${mre.mreNo}&pageNum=1">${mre.mreTitle}</a></small></td>
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
					</c:if>
					<c:if test="${empty memberRequestList}">
						<div class="row border-bottom py-2" style="min-height: 141px;">
							<table class="mReqList">
								<tr>
									<td><h5>작성한 문의글이 존재하지 않습니다.</h5></td>
								</tr>
							</table>
						</div>
					</c:if>
					
				</div>
			</div>
		</div>
	</div>
</div>
