<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<!-- 상단 게시판 제목 -->
<div class="pt-5">	
	<div class="textTop row">
		<h3 class="textTitle col-3 fs-2 fw-bold border-bottom border-danger border-4 border-opacity-50 ">실종신고</h3>
	</div>
	<div class="divtablebox">
			<!-- 게시판 리스트 -->
			<div>
				<table class="w3-table">
					<!-- 상단 리스트 -->
					<c:if test="${not empty list}">
					<c:forEach var="list" items="${list}">
						<tr>
							<th class="listThNo">
							<a href="mhrDetailView?mhrNo=${list.mhrNo}">${list.mhrNo}</a></th>
							<th class="listThTitle">${list.mhrTitle}</th>
							<th class="listThWriter">${list.mhrWriter}</th>
							<th class="listThDate">${list.mhrRegDate}</th>
							<th class="listThReadCount">${mhrReadCnt}</th>
						</tr>
					</c:forEach>
					</c:if>
					<!-- 하단 리스트 -->
				</table>
			<div class="board-bottom">
				<a href="mhrInsert"> 등록하기</a>
				<a href="#" class="reportBtn">신고하기</a>
			</div>
		</div>
	</div>
</div>