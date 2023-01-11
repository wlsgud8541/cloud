<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<div class="row" id="global-content" style="min-height: 600px">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">공지사항 게시판 상세보기</h2>
		</div>
	</div>  
	<div class="row">
		<div class="col">	
			<table class="table table-bordered">
				<tr>
					<th class="table-light">제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
					<td colspan="3">${mnotice.mnTitle}</td>		
				</tr>
				<tr>
					<th class="table-light">작성자</th>
					<td>${mnotice.mnWriter}</td>
					<th class="table-light">작성일</th>
					<td><fmt:formatDate value="${mnotice.mnRegDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>		
				</tr>
				<tr>		
					<th class="table-light">조회수</th>
					<td>${mnotice.mnReadCnt}</td>
					<th class="table-light">파&nbsp;&nbsp;&nbsp;&nbsp;일</th>
					<td><a href="fileDownload?fileName=${mnotice.mnAddFile}">파일 다운로드</a></td>		
				</tr>	
				<tr>		
					<td colspan="4">
						<pre>${mnotice.mnContent}</pre>
					</td>
				</tr>
			</table>
		</div>
	</div>	
	<div class="row">
		<div class="col text-center">
			<input type="button" class="btn btn-warning" id="mnUpdate" data-mnNo="${mnotice.mnNo}" data-pageNum="${pageNum}" value="수정하기"/>&nbsp;&nbsp;
			<input type="button" class="btn btn-danger" id="mnDelete" data-mnNo="${mnotice.mnNo}" data-pageNum="${pageNum}" value="삭제하기" />&nbsp;&nbsp;
			<input type="button" value="목록보기" class="btn btn-primary" onclick="location.href='mnSelectList?pageNum=${pageNum}'"/>
		</div>
	</div>
</div>	