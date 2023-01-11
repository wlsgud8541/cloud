<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="w3-content">
	<div class="my-4">
		<h3>${mrequest.mreTitle}</h3>
	</div>
	<div>
		<table class="topbox">
			<tr>
				<td class="gunThWriter"><b>&nbsp;&nbsp;${mrequest.mreWriter}</b></td>
				<td class="gunThDate"><fmt:formatDate value="${mrequest.mreRegDate}" pattern="yyyy-MM-dd HH:mm"/></td>
				<td class="gunThReadCount ms-3">조회수 : ${mrequest.mreReadCnt }</td>
			</tr>
		</table>
		<div class="py-4 px-3">
			<pre>${mrequest.mreContent }</pre>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col text-center">
			<input type="button" class="btn btn-success" value="추천👍(${mrequest.mreRecoCnt})">
		</div>
	</div>
	<div class="boxLine"></div>
		<div class="col text-end mt-4">
			<input type="button" onclick="location.href='mrSelectList'" class="btn btn-outline-success" value="목록으로"/>
		</div>
	<c:if test="${mrequest.mreReplyCode == '02' }">
		<div class="gunUnderBox row">
			<div><h4><b>답변 내용</b></h4></div>
			<div class="gunUnderContent col border-top border-bottom py-4 px-3">
				<b>${mrequestcomm.mreComTitle}</b><br><br>
				${mrequestcomm.mreComContent}<br><br>
				<small class="text-secondary"><b>${mrequestcomm.mreComWriter}</b>&nbsp;|&nbsp;<fmt:formatDate value="${mrequestcomm.mreComRegDate}" pattern="yyyy-MM-dd HH:mm"/></small>
				</div>
		</div>
	</c:if>
	<div class="row">
		<div class="col text-center mt-4">
			<input type="button" id="mrUpdate" data-mreNo="${mrequest.mreNo }"class="btn btn-outline-success " value="수정하기">
			<input type="button" id="mrDelete" data-mreNo="${mrequest.mreNo }"class="btn btn-outline-success  mx-3" value="삭제하기"/>
			<input type="button" onclick="location.href='mrSelectList'" class="btn btn-outline-success" value="목록으로"/>
		</div>
	</div>
</div>