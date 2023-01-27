<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- content -->
<div class="w3-content ">
	<div class="textTop row">
		<div class="col fs-2">
			<b class="border-bottom border-4 border-success border-opacity-50">Q&A 게시판</b>
		</div>
		<c:if test="${not empty sessionScope.userId && sessionScope.userId eq 'admin0001'}">
			<div class="col board-bottom text-end">
				<a href="mqInsert" class="btn btn-secondary posiRight my-2">글쓰기</a>
				<br>
			</div>
		</c:if>
	</div>
	
	<div class="row rounded-4 mt-3 shadow-sm" style="background: #d1e7dd;">
		<div class="p-3 m-0 fw-bold fs-4" >자주 묻는 질문📣</div>
	</div>
	 
	<input type="hidden" class="form-control" name="mqWriter" id="mqWriter" value="${sessionScope.userId}">
	<div class="row mb-3">
		<div class="col" id="qnaList">

			<c:forEach var="mqList" items="${mQnaList}" >
				<div class="row mt-3 border rounded-4 shadow-sm">
					<div class="col"> 
						<div class="row bg-light p-2 rounded-4">
							<div class="mqTilte col pt-3 pb-2" id="mqTilte${mqList.mqNo}" data-mqNo="${mqList.mqNo}">
								<span class="member" id="beforeTitle${mqList.mqNo}">${mqList.mqTitle}</span>
								<br>
								<span class="me-3">
									<small><fmt:formatDate value="${mqList.mqRegDate}" pattern="yyyy-MM-dd" /></small>
								</span>
							</div>
							<div class="col-2 text-end">
								<c:if test="${fn:trim(sessionScope.userId) eq 'admin0001'}">
									<button class="mqUpdate btn btn-outline-success btn-sm" data-mqNo="${mqList.mqNo}">
										<i class="bi bi-journal-text" >수정</i>									
									</button>
									<button class="mqDelete btn btn-outline-warning btn-sm" data-mqNo="${mqList.mqNo}">
										<i class="bi bi-trash">삭제</i>
									</button>
								</c:if>
								<c:if test="${fn:trim(sessionScope.userId) ne 'admin0001'}">
									<input type="hidden" class="mqUpdate btn btn-outline-success btn-sm" data-mqNo="${mqList.mqNo}" >
									<input type="hidden" class="mqDelete btn btn-outline-success btn-sm" data-mqNo="${mqList.mqNo}" >
								</c:if>
							</div>
						</div>	
						<div id="mqDiv${mqList.mqNo}" class="mqContent row">
							<div class="col p-3">
								<pre><span id="beforeCont${mqList.mqNo}">${mqList.mqContent}</span></pre>
							</div>
						</div>
					</div>	
				</div>
			</c:forEach>
			
		</div>
	</div>
</div>
