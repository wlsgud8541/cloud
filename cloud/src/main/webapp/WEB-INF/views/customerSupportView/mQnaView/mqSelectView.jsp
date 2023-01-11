<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<div class="row my-5" id="global-content">
	<div class="row my-3">
		<div class="col text-end">
			<a href="mqInsert" class="btn btn-outline-success">글쓰기</a>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col" id="qnaList">
			<c:forEach var="mqList" items="${mQnaList}" >
				<div class="row border border-top-0">
					<input type="hidden" class="form-control" name="mqWriter" id="mqWriter${mqList.mqNo}" value="${sessionScope.userId}">
					<div class="col">
						<div class="row bg-light p-2">
							<div id="mqTilte${mqList.mqNo}" class="mqTilte col-4">
								<span class="member" id="beforeTitle${mqList.mqNo}">${mqList.mqTitle}</span>
								<span class="me-3">
									<fmt:formatDate value="${mqList.mqRegDate}" pattern="yyyy-MM-dd" />
								</span>
							</div>
							<div class="col-8 text-end">
								<button class="mqUpdate btn btn-outline-success btn-sm" data-mqNo="${mqList.mqNo}">
									<i class="bi bi-journal-text" >수정</i>									
								</button>
								<button class="mqDelete btn btn-outline-warning btn-sm" data-mqNo="${mqList.mqNo}">
									<i class="bi bi-trash">삭제</i>
								</button>
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
