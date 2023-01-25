<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
<div id="global" class="row container">
	<div class="col">
		<form enctype="multipart">
				${mhfind.mhfNo},${mhfind.mhfTitle},${mhfind.mhfContent},
				<fmt:formatDate value="${mhfind.mhfInfoDate}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${mhfind.mhfRegDate}" pattern="yyyy-MM-dd"/>
				${mhfind.mhfWriter}, ${mhfind.mhfGen},${mhfind.mhfReadCnt},
				<a href="fileDownload?fileName="${mhfind.mhfAddFile}>파일</a>
				<input type="button" class="btn" value="수정하기" id = "mhfUpdate" data-mhfNo="${mhfind.mhfNo}" data-pageNum="${pageNum}">
				<input type="button" class="btn" value="삭제하기" id="mhfDelete" data-mhfNo="${mhfind.mhfNo}" data-pageNum="${pageNum}"/>
				<input type="button" class="btn" value="돌아가기" onclick="location.href='mhfSelectList?pageNum=${pageNum}'"/>
		</form>
		
		<form id="mhfCommInsert" name="mhfCommInsert" action="mhfCommInsert">
			<input type="hidden" name="mhfNo" value="${mhfind.mhfNo}"/>
			<div>
				<input type="text" class="form-control" id="commContent" name="mhfComContent" />
				<input type="hidden" class="form-control" id="mhfComWriter" name="mhfComWriter" value="회원" />
				<input type="hidden" id="mmNo" name="mmNo" value="1"/>
			</div>
			<div>
				<input type="submit" class="btn" value="댓글쓰기" id="commInsert" />
			</div>
		</form>
		
			<c:if test="${not empty mhfCommList}">
			<div class="row">
				<div id="comList" class="col">
						<c:forEach var="mhfCommList" items="${mhfCommList}">
							<div class="row">
								<div class="col">
								<pre id="beforeCon${mhfCommList.mhfComNo}">${mhfCommList.mhfComContent}</pre>
								<span id="mhfComWriter">${mhfCommList.mhfComWriter}</span><br>
								<fmt:formatDate value="${mhfCommList.mhfComRegDate}" pattern="yyyy-MM-dd HH:mm" />
								<button class="btn btn-outline-success btn-sm" data-mhfComNo="${mhfCommList.mhfComNo}" id="mhfcUpdate"> 
									<i class="bi bi-journal-text">수정</i></button>
								<button class="btn btn-outline-warning btn-sm" data-mhfComNo="${mhfCommList.mhfComNo}" id="mhfcDelete"> 
									<i class="bi bi-trash">삭제</i></button>
								</div>
							</div>
						</c:forEach>
				</div> 
			</div>
			</c:if>
		
		<div class="row my-3 d-none" id="mhfcForm">
			<div class="col">
				<form name="WriteForm" id="WriteForm">
					<input type="hidden" name="mhfNo" value="${mhfind.mhfNo}"/>
					<input type="hidden" name="mhfComWriter" value="회원" />
					<input type="hidden" name="mmNo" value="1"/>
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
</body>