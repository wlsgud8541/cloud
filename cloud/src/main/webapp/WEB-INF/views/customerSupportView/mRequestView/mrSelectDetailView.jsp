<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<input type="hidden" id="commSessionCk" value="${SessionScope.userId}">
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
				<td class="gunThReadCount ms-3 py-2">์กฐํ์ : ${mrequest.mreReadCnt }</td>
			</tr>
			<c:if test="${mrequest.mreAddFile != null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;๐พ | <a href="fileDownload?fileName=${mrequest.mreAddFile}">๋ค์ด๋ก๋</a></td>
			</tr>	
			</c:if>
			<c:if test="${mrequest.mreAddFile == null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;๐พ | ํ์ผ์์</td>
			</tr>	
			</c:if>
			 
		</table>
		<div class="py-4 px-3">
			<pre>${mrequest.mreContent }</pre>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col text-center">
			<span class="btn btn-success" id="commend" >์ถ์ฒ๐(${mrequest.mreRecoCnt})</span>
		</div>
	</div>
	<div class="boxLine"></div>
	<div class="col text-end mt-4">
		<input type="button" onclick="location.href='mrSelectList'"
			class="btn btn-outline-success" value="๋ชฉ๋ก์ผ๋ก" />
	</div>

	<c:if test="${mrequest.mreReplyCode == '01' }">
		<div id="test">
			<div class="row mt-5 commReady">
				<div class="col p-3 text-end">
				<c:if test="${sessionScope.userId == 'admin0001'}">
					<span id="mrcInsert" class="text-secondary" style="cursor: pointer;">
						<i class="bi bi-file-earmark-text-fill"	style="color: cornflowerblue;"></i> ๋ต๊ธ์ฐ๊ธฐ
					</span>
				</c:if>
				</div>
			</div>
			<!-- ๋๊ธ ํค๋ ์์ญ -->
			<div class="row commReady" id="mreComTitle">
				<div class="col p-2 text-center border rounded-4">
					<h3 class="fs-4">๋ต๋ณ์ ๊ธฐ๋ค๋ฆฌ๋ ์ค ์๋๋ค.</h3>
				</div>
			</div>
		</div>
	</c:if>


	<div class="gunUnderBox row" id="mrcView">
		<c:if test="${mrequest.mreReplyCode == '02' }">
			<div>
				<h4>
					<b>๋ต๋ณ ๋ด์ฉ</b>
				</h4>
			</div>
			<div class="commRow gunUnderContent col border-top border-bottom py-4 px-3">
				<pre><b>${mrequestcomm.mreComTitle}</b><br><br> <span id="beforeContent" >${mrequestcomm.mreComContent}</span></pre>
				<br> <br> 
				<small class="text-secondary"><b>${mrequestcomm.mreComWriter}</b>&nbsp;|&nbsp;
				<fmt:formatDate
						value="${mrequestcomm.mreComRegDate}" pattern="yyyy-MM-dd HH:mm" /></small>
				<c:if test="${sessionScope.userId == 'admin0001'}">
					<button class="mrcUpdate btn btn-outline-warning btn-sm"
						data-mreComNo="${ mrequestcomm.mreComNo }">
						<i class="bi bi-journal-text">์์?</i>
					</button>
					<button class="mrcDelete btn btn-outline-danger btn-sm"
						data-mreComNo="${ mrequestcomm.mreComNo }">
						<i class="bi bi-trash">์ญ์?</i>
					</button>
				</c:if>
			</div>
		</c:if>
	</div>
	<!-- ๋๊ธ ์ฐ๊ธฐ ํผ -->
	<div class="row my-3 d-none" id="commForm">
		<div class="col">
			<form name="mrcInsertForm" id="mrcInsertForm" method="post">
				<input type="hidden" id="mmNo" name="mmNo" value="${sessionScope.mmNo }" />
				<input type="hidden" id="mreNo" name="mreNo" value="${ mrequest.mreNo }" />
				<input type="hidden" id="mreComWriter" name="mreComWriter" value="${sessionScope.userId }" />
				<div class="row bg-light my-3 p-3 border">
					<div class="col">
						<div class="row my-3">
							<div class="col-md-10">
								<input type="text" class="form-control" id="mreComTitle" name="mreComTitle" value="${mrequestcomm.mreComTitle}">
								<textarea name="mreComContent" id="mreComContent" class="form-control mt-2 textEditor" rows="4">${mrequestcomm.mreComContent}</textarea>
							</div>
							<div class="col-md">
								<input type="submit" value="๋ต๊ธ์ฐ๊ธฐ" class="btn btn-success h-100 w-100" id="mrcInsertButton">
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
			<c:if test="${(sessionScope.userId == mrequest.mreWriter) or (sessionScope.userId == 'admin0001')}">
				<input type="button" class="btn btn-outline-success" id="mrUpdate" data-mreNo="${mrequest.mreNo}" data-pageNum="${pageNum}"value="์์?ํ๊ธฐ"> 
				<input type="button" class="btn btn-outline-success  mx-3"  id="mrDelete" data-mreNo="${mrequest.mreNo}" data-pageNum="${pageNum}"value="์ญ์?ํ๊ธฐ" />
			</c:if> 
			<input type="button" onclick="location.href='mrSelectList?pageNum=${pageNum}'" class="btn btn-outline-success" value="๋ชฉ๋ก์ผ๋ก" />
		</div>
	</div>
</div>

