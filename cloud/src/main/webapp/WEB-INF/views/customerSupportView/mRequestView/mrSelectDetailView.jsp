<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<div class="w3-content">
	<input type="hidden" id="mreNo" value="${mrequest.mreNo}"> <input
		type="hidden" id="mreRecoCnt" value="${mrequest.mreRecoCnt}">
	<div class="my-4">
		<h3>${mrequest.mreTitle}</h3>
	</div>
	<div>
		<table class="topbox">
			<tr>
				<td class="gunThWriter py-2"><b>&nbsp;&nbsp;${mrequest.mreWriter}</b></td>
				<td class="gunThDate py-2"><fmt:formatDate
						value="${mrequest.mreRegDate}" pattern="yyyy-MM-dd HH:mm" /></td>
				<td class="gunThReadCount ms-3 py-2">조회수 : ${mrequest.mreReadCnt }</td>
			</tr>
			<c:if test="${mrequest.mreAddFile != null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;💾 | <a href="fileDownload?fileName=${mrequest.mreAddFile}">다운로드</a></td>
			</tr>	
			</c:if>
			<c:if test="${mrequest.mreAddFile == null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;💾 | 파일없음</td>
			</tr>	
			</c:if>
			 
		</table>
		<div class="py-4 px-3">
			<pre>${mrequest.mreContent }</pre>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col text-center">
			<span class="btn btn-success" id="commend" >추천👍(${mrequest.mreRecoCnt})</span>
		</div>
	</div>
	<div class="boxLine"></div>
	<div class="col text-end mt-4">
		<input type="button" onclick="location.href='mrSelectList'"
			class="btn btn-outline-success" value="목록으로" />
	</div>

	<c:if test="${mrequest.mreReplyCode == '01' }">
		<div class="row mt-5 commReady">
			<div class="col p-3 text-end">
				<span id="mrcInsert" class="text-secondary" style="cursor: pointer;">
					<i class="bi bi-file-earmark-text-fill"	style="color: cornflowerblue;"></i> 답글쓰기
				</span>
			</div>
		</div>
		<!-- 댓글 헤더 영역 -->
		<div class="row commReady" id="mreComTitle">
			<div class="col p-2 text-center border rounded-4">
				<h3 class="fs-4">답변을 기다리는 중 입니다.</h3>
			</div>
		</div>
	</c:if>


	<div class="gunUnderBox row" id="mrcView">
		<c:if test="${mrequest.mreReplyCode == '02' }">
			<div>
				<h4>
					<b>답변 내용</b>
				</h4>
			</div>
			<div class="commRow gunUnderContent col border-top border-bottom py-4 px-3">
				<pre><b>${mrequestcomm.mreComTitle}</b><br><br> <span>${mrequestcomm.mreComContent}</span></pre>
				<br> <br> 
				<c:if test="${mrequestcomm.mreComAddFile != null}">
				<tr>
					<td class="py-2">&nbsp;&nbsp;💾 | <a href="fileDownload?fileName=${mrequestcomm.mreComAddFile}">다운로드</a></td>
				</tr>	
				</c:if>
				<c:if test="${mrequestcomm.mreComAddFile == null}">
				<tr>
					<td class="py-2">&nbsp;&nbsp;💾 | 파일없음</td>
				</tr>	
				</c:if><br>
				<small class="text-secondary"><b>${mrequestcomm.mreComWriter}</b>&nbsp;|&nbsp;
				<fmt:formatDate
						value="${mrequestcomm.mreComRegDate}" pattern="yyyy-MM-dd HH:mm" /></small>
				<button class="mrcUpdate btn btn-outline-warning btn-sm"
					data-mreComNo="${ mrequestcomm.mreComNo }">
					<i class="bi bi-journal-text">수정</i>
				</button>
				<button class="mrcDelete btn btn-outline-danger btn-sm"
					data-mreComNo="${ mrequestcomm.mreComNo }">
					<i class="bi bi-trash">삭제</i>
				</button>
			</div>
		</c:if>
	</div>
	<!-- 댓글 쓰기 폼 -->
	<div class="row my-3 d-none" id="commForm">
		<div class="col">
			<form name="mrcInsertForm" id="mrcInsertForm" method="post" enctype="multipart/form-data">
				<input type="hidden" id="mMno" name="mmNo" value="${sessionScope.mmNo }" />
				<input type="hidden" id="mreNo" name="mreNo" value="${ mrequest.mreNo }" />
				<input type="hidden" id="mreComWriter" name="mreComWriter" value="${sessionScope.userId }" />
				<div class="row bg-light my-3 p-3 border">
					<div class="col">
						<div class="row my-3">
							<div class="col-md-10">
								<input type="text" class="form-control" id="mreComTitle" name="mreComTitle" value="${mrequestcomm.mreComTitle}">
								<textarea name="mreComContent textEditor" id="mreComContent" class="form-control mt-2" rows="4"></textarea>
								<label for="title" class="form-label">파 일</label>
		    					<input type="file" class="form-control" name="mreAddFile"  id="mreAddFile" >
							</div>
							<div class="col-md">
								<input type="submit" value="답글쓰기" class="btn btn-success h-100 w-100" id="mrcInsertButton">
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- end replyForm -->

	<div class="row">
		<div class="col text-center mt-4">
			<input type="button" class="btn btn-outline-success" id="mrUpdate" data-mreNo="${mrequest.mreNo}" data-pageNum="${pageNum}"value="수정하기"> 
			<input type="button" class="btn btn-outline-success  mx-3"  id="mrDelete" data-mreNo="${mrequest.mreNo}" data-pageNum="${pageNum}"value="삭제하기" /> 
			<input type="button" onclick="location.href='mrSelectList?pageNum=${pageNum}'" class="btn btn-outline-success" value="목록으로" />
		</div>
	</div>
</div>

