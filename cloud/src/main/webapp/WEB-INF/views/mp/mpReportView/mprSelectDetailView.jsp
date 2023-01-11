<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		${mprDetail.mprNo}
		${mprDetail.mprTitle}
		${mprDetail.mprReadCnt}
		${mprDetail.mprRegDate}
		${mprDetail.mprWriter}
		${mprDetail.mprContent}
			<table>
			<c:if test="${ empty mprDetail.mprAddFile }">
				<div>첨부된 파일이 없습니다.</div>
			</c:if>
			<c:if test="${ not empty mprDetail.mprAddFile }">
				<tr>		
					<th class="table-light">파&nbsp;&nbsp;&nbsp;&nbsp;일</th>
					<td><a href="fileDownload?fileName=${mprDetail.mprAddFile}">파일 다운로드</a></td>
				</tr>
			</c:if>
			</table>

		<div class="col text-center">
			<input type="button" class="btn btn-warning" id="mprUpdate" data-mprNo="${mprDetail.mprNo}" data-pageNum="${pageNum}" value="수정하기"/>
			<input type="button" class="btn btn-danger" id="mprDelete" data-mprNo="${mprDetail.mprNo}" data-pageNum="${pageNum}" value="삭제하기" />
			<input type="button" value="목록보기" class="btn btn-primary" onclick="location.href='mprSelectList?pageNum=${pageNum}'"/>			
		</div>
		
		
</body>
</html>