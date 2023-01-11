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
		${mpfDetail.mpfNo}
		${mpfDetail.mpfTitle}
		${mpfDetail.mpfReadCnt}
		${mpfDetail.mpfRegDate}
		${mpfDetail.mpfWriter}
		${mpfDetail.mpfContent}
			<table>
				<c:if test="${ empty mpfDetail.mpfAddFile }">
					<div>첨부된 파일이 없습니다.</div>
				</c:if>
				<c:if test="${ not empty mpfDetail.mpfAddFile }">
					<tr>		
						<th class="table-light">파&nbsp;&nbsp;&nbsp;&nbsp;일</th>
						<td><a href="fileDownload?fileName=${mpfDetail.mpfAddFile}">파일 다운로드</a></td>
					</tr>
				</c:if>
			</table>
			
			<form id="mpfCommInsert" name="mpfCommInsert" action="mpfCommInsert">
				<input type="hidden" name="mpfNo" value="${mpfDetail.mpfNo}"/>
			
				<div>
					<input type="text" class="form-control" id="commContent" name="mpfComContent" />
					<input type="hidden" class="form-control" id="mpfComWriter" name="mpfComWriter" value="회원" />
					<input type="hidden" id="mmNo" name="mmNo" value="1"/>
				</div>
				<div>
					<input type="submit" class="btn" value="댓글쓰기" id="commInsert" />
				</div>
			</form>
			<div>
				<div id="mpfComList">
					<c:if test="${not empty mpfCommList}">
						<c:forEach var="mpfCommList" items="${mpfCommList}">
							${mpfCommList.mpfComContent},${mpfCommList.mpfComWriter}<br>
							<fmt:formatDate value="${mpfCommList.mpfComRegDate}" pattern="yyyy-MM-dd" />
							<button class="btn btn-outline-success btn-sm" data-mpfComNo="${mpfCommList.mpfComNo }" id="mpfcUpdate"> 
								<i class="bi bi-journal-text">수정</i></button>
							<button id="mpfcDelete" class="btn btn-outline-warning btn-sm" data-mpfComNo="${mpfCommList.mpfComNo }"id="mpfcDelete"> 
								<i class="bi bi-trash">삭제</i></button>
						</c:forEach>
					</c:if>
				</div>
				<div class="row my-3 d-none" id="mpfCommForm">
					<div class="col">
						<form name="WriteForm" id="WriteForm">
							<input type="hidden" name="mpfNo" value="${mpfDetail.mpfNo}"/>
							<input type="hidden" name="mpfComWriter" value="회원" />
							<input type="hidden" name="mmNo" value="1"/>
							<div class="row bg-light my-3 p-3 border">
								<div class="row">
									<div class="col">
										<textarea name="mpfComContent" id="updateContent" class="form-control" rows="4"></textarea>
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
			
			
			
			
			
		<div class="col text-center">
			<input type="button" class="btn btn-warning" id="mpfUpdate" data-mpfNo="${mpfDetail.mpfNo}" data-pageNum="${pageNum}" value="수정하기"/>
			<input type="button" class="btn btn-danger" id="mpfDelete" data-mpfNo="${mpfDetail.mpfNo}" data-pageNum="${pageNum}" value="삭제하기" />
			<input type="button" value="목록보기" class="btn btn-primary" onclick="location.href='mpfSelectList?pageNum=${pageNum}'"/>			
		</div>
		
		
</body>
</html>