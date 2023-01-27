<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="w3-content">
	<form enctype="multipart">
			<div class="">
				<div class="my-4">
					<h3>${mhfind.mhfTitle} </h3>
				</div>
				<div>
					<table class="topbox">
						<tr>
							<td class="mhThWriter py-2"><b>&nbsp;&nbsp;${mhfind.mhfWriter}</b></td>
							<td class="mhThDate py-2"><fmt:formatDate value="${mhfind.mhfRegDate}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td class="mhThReadCount ms-3 py-2">조회수 : ${mhfind.mhfReadCnt }</td>
						</tr>
						<c:if test="${mhfind.mhfAddFile != null}">
						<tr>
							<td class="py-2">&nbsp;&nbsp;💾 | <a href="fileDownload?fileName=${mhfind.mhfAddFile}">다운로드</a></td>
						</tr>	
						</c:if>
						<c:if test="${mhfind.mhfAddFile == null}">
						<tr>
							<td class="py-2">&nbsp;&nbsp;💾 | 파일없음</td>
						</tr>	
						</c:if>
						 
					</table>
					<div class="py-4 px-3 row">
						<pre>${mhfind.mhfContent}</pre>
					</div>
				</div>
				<div class="mhboxLine"></div>
				<div class="row">
					<div class="col text-center mt-4">
						<c:if test="${mhfind.mhfWriter == sessionScope.userId}">
							<input type="button" class="btn btn-outline-danger me-3" id="mhfUpdate" data-mhfNo="${mhfind.mhfNo}" data-pageNum="${pageNum}"value="수정하기"> 
							<input type="button" class="btn btn-outline-danger me-3" id="mhfDelete" data-mhfNo="${mhfind.mhfNo}" data-pageNum="${pageNum}"value="삭제하기" /> 
						</c:if>
						<input type="button" class="btn btn-outline-danger" value="목록으로" onclick="location.href='mhfSelectList?pageNum=${pageNum}'"/>
					</div>
				</div>
			</div>
		</form>
	
	<div id="global" class="row mt-3">
		<div class="col">
			<form id="mhfCommInsert" name="mhfCommInsert" action="mhfCommInsert">
				<input type="hidden" name="mhfNo" value="${mhfind.mhfNo}"/>
				<div>
					<b>의견쓰기</b>
					<textarea class="form-control rounded-0" id="commContent" name="mhfComContent" style="resize: none;"></textarea>
					<input type="hidden" class="form-control" id="mhfComWriter" name="mhfComWriter" value="${sessionScope.userId}" />
					<input type="hidden" id="mmNo" name="mmNo" value="${sessionScope.mmNo}"/>
				</div>
				<div class="text-end">
					<input type="submit" class="btn btn-danger rounded-0" value="등록" id="mhfcommInsert" />
				</div>
			</form>
			
			<div class="row">
				<div id="comList" class="col">
					<c:if test="${not empty mhfCommList}">
						<c:forEach var="mhfCommList" items="${mhfCommList}">
							<div class="row">
								<div class="col">
									<span id="mhfComWriter"><b>${mhfCommList.mhfComWriter}</b></span><br>
									<pre id="beforeCon${mhfCommList.mhfComNo}" class="m-0">${mhfCommList.mhfComContent}</pre>
									<small class="text-secondary"><fmt:formatDate value="${mhfCommList.mhfComRegDate}" pattern="yyyy-MM-dd" /></small>
									<c:if test="${fn:trim(sessionScope.userId) == 'admin0001' or fn:trim(sessionScope.userId) == mhfCommList.mhfComWriter}">
										<button class="btn btn-outline-dark btn-sm" data-mhfComNo="${mhfCommList.mhfComNo}" id="mhfcUpdate"> 
											<i class="bi bi-journal-text"></i>수정</button>
										<button class="btn btn-outline-dark btn-sm" data-mhfComNo="${mhfCommList.mhfComNo}" id="mhfcDelete"> 
											<i class="bi bi-trash"></i>삭제</button>
									</c:if>
								</div>
							</div>
						<hr class="border border-dark">
						</c:forEach>
					</c:if>
				</div> 
			</div>
			
			<div class="row my-3 d-none" id="mhfcForm">
				<div class="col">
					<form name="WriteForm" id="WriteForm">
						<input type="hidden" name="mhfNo" value="${mhfind.mhfNo}"/>
						<input type="hidden" name="mhfComWriter" value="${sessionScope.userId}" />
						<input type="hidden" name="mmNo" value="${sessionScope.mmNo}"/>
						<div class="row bg-light my-3 p-3 border">
							<div class="row">
								<div class="col">
									<textarea name="mhfComContent" id="mhfComContent" class="form-control" rows="4"></textarea>
								</div>
								<div class="col-md">
									<input type="submit" value="댓글 수정" class="btn" id="updateCom"/>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
				
		</div>
	</div>
</div>

