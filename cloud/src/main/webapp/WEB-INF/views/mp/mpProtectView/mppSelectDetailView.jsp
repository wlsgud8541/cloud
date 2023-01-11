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
<div class="w3-content row">
		${mppDetail.mppNo}
		${mppDetail.mppTitle}
		
		${mppDetail.mppReadCnt}
		${mppDetail.mppRegDate}
		${mppDetail.mppWriter}
		${mppDetail.mppContent}
		${mppDetail.mppGen}
		
			<table>
			<c:if test="${ empty mppDetail.mppAddFile }">
				<div>첨부된 파일이 없습니다.</div>
			</c:if>
			<c:if test="${ not empty mppDetail.mppAddFile }">
				<tr>		
					<th class="table-light">파&nbsp;&nbsp;&nbsp;&nbsp;일</th>
					<td><a href="fileDownload?fileName=${mppDetail.mppAddFile}">파일 다운로드</a></td>
				</tr>
			</c:if>
			
			
			</table>
			
			
			
		<div class="col text-center">
			<input type="button" class="btn btn-warning" id="mppUpdate" data-mppNo="${mppDetail.mppNo}" data-pageNum="${pageNum}" value="수정하기"/>
			<input type="button" class="btn btn-danger" id="mppDelete" data-mppNo="${mppDetail.mppNo}" data-pageNum="${pageNum}" value="삭제하기" />
			<input type="button" value="목록보기" class="btn btn-primary" onclick="location.href='mppSelectList?pageNum=${pageNum}'"/>			
		</div>
		
		</div>
</body>
</html>