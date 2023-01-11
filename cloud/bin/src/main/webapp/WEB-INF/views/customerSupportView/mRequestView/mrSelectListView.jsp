<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="w3-content mt-5">
		<!-- 상단 게시판 제목 -->
		<div class="textTop">
			<h2 class="fs-3 fw-bold">건의사항 게시판</h2>
		</div>
		<div class="divtablebox">
			<!-- 게시판 리스트 -->
			<div>
				<table class="table table-hover text-center">
					<!-- 상단 리스트 -->
					<tr class="table-success">
						<th>답변여부</th>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>추천수</th>
						<th>작성일</th>
					</tr>
					<tbody>
						<c:forEach var="mrList" items="${mrList }">
							<tr>
								<c:if test="${mrList.mreReplyCode == '01' }">
									<td class="text-secondary">
										답변대기
									</td>
								</c:if>
								<c:if test="${mrList.mreReplyCode == '02' }">
									<td class="text-success">
										답변완료
									</td>
								</c:if>
								<td>${mrList.mreNo }</td>
								<td><a href="mrSelectDetail?mreNo=${mrList.mreNo}">${mrList.mreTitle}</a></td>
								<td>${mrList.mreWriter}</td>
								<td>${mrList.mreReadCnt}</td>
								<td>${mrList.mreRecoCnt}</td>
								<td>
									<fmt:formatDate value="${mrList.mreRegDate}" pattern="yy-MM-dd HH:mm" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<!-- 하단 리스트 -->
				</table>
			<div class="board-bottom">
				<a href="mrInsert" class="btn btn-outline-success posiRight my-3">글쓰기</a>
				<br>
			</div>
		</div>
	</div>
</div>