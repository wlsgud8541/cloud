<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="w3-content">
	<form enctype="multipart">
			<div class="">
				<div class="my-4">
					<h3>${mhfind.mhfTitle} </h3>
				</div>
				<div>
					<table class="topbox">
						<tr>
							<td class="mhThWriter py-2"><b>&nbsp;&nbsp;${mhfind.mhfWriter}</b></td>
							<td class="mhThDate py-2"><fmt:formatDate value="${mhfind.mhfRegDate}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td class="mhThReadCount ms-3 py-2">μ‘°νμ : ${mhfind.mhfReadCnt }</td>
						</tr>
						<c:if test="${mhfind.mhfAddFile != null}">
						<tr>
							<td class="py-2">&nbsp;&nbsp;πΎ | <a href="fileDownload?fileName=${mhfind.mhfAddFile}">λ€μ΄λ‘λ</a></td>
						</tr>	
						</c:if>
						<c:if test="${mhfind.mhfAddFile == null}">
						<tr>
							<td class="py-2">&nbsp;&nbsp;πΎ | νμΌμμ</td>
						</tr>	
						</c:if>
						 
					</table>
					<div class="row mt-4">
						<div class="col text-center ">
							<c:if test="${mhfind.mhfAddFile != null}">
								<div class="text-center inblock">
									<img src="fileDownload?fileName=${mhfind.mhfAddFile}" style="width: 350px;">
								</div>
							</c:if>
							<c:if test="${empty mhfind.mhfAddFile}">
								<div class="text-center inblock text-success p-4">
									<img src="resources/image/main/cloudLogo.png" style="width: 350px;">
								</div>
							</c:if>
						</div>
						<div class="col">
							<c:if test="${mhfind.mhfGen == 'M'}"><b>λ¨μ±</b></c:if>
							<c:if test="${mhfind.mhfGen== 'F'}"><b>μ¬μ±</b></c:if>
							<table class="table border-top border-2 mt-3">
								<tr>
									<th>λͺ©κ²©μ§μ­ / μμΈμμΉ</th>
									<td><c:if test="${fn:trim(fn:trim(mhfind.mhfLocalCode)) == 01}">μμΈ</c:if>
										<c:if test="${fn:trim(fn:trim(mhfind.mhfLocalCode)) == 02}">κ²½κΈ°</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 03}">μΈμ²</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 04}">λμ </c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 05}">κ΄μ£Ό</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 06}">λκ΅¬</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 07}">μΈμ°</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 08}">λΆμ°</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 09}">μΈμ’</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 10}">κ°μ</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 11}">μΆ©λΆ</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 12}">μΆ©λ¨</c:if> 
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 13}">μ λΆ</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 14}">μ λ¨</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 15}">κ²½λΆ</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 16}">κ²½λ¨</c:if>
										<c:if test="${fn:trim(mhfind.mhfLocalCode) == 17}">μ μ£Ό</c:if> / 	${mhfind.mhfLocalDetail}
									</td>
								</tr>
								<tr>
									<th>λͺ©κ²©μΌμ</th>
									<td><fmt:formatDate value="${mhfind.mhfInfoDate}" pattern="yyyy-MM-dd" /></td>
								</tr>
							</table>
						</div>
					</div>	
					<br><br>
					<b>${mhfind.mhfContent }</b>
				</div>
				<div class="mhboxLine"></div>
				<div class="row">
					<div class="col text-center mt-4">
						<c:if test="${mhfind.mhfWriter == sessionScope.userId}">
							<input type="button" class="btn btn-outline-danger me-3" id="mhfUpdate" data-mhfNo="${mhfind.mhfNo}" data-pageNum="${pageNum}"value="μμ νκΈ°"> 
							<input type="button" class="btn btn-outline-danger me-3" id="mhfDelete" data-mhfNo="${mhfind.mhfNo}" data-pageNum="${pageNum}"value="μ­μ νκΈ°" /> 
						</c:if>
						<input type="button" class="btn btn-outline-danger" value="λͺ©λ‘μΌλ‘" onclick="location.href='mhfSelectList?pageNum=${pageNum}'"/>
					</div>
				</div>
			</div>
		</form>	

	<div id="global" class="row mt-3">
		<div class="col">
			<form id="mhfCommInsert" name="mhfCommInsert" action="mhfCommInsert">
				<input type="hidden" name="mhfNo" value="${mhfind.mhfNo}"/>
				<div>
					<b>μκ²¬μ°κΈ°</b>
					<textarea class="form-control rounded-0" id="commContent" name="mhfComContent" style="resize: none;"></textarea>
					<input type="hidden" class="form-control" id="mhfComWriter" name="mhfComWriter" value="${sessionScope.userId}" />
					<input type="hidden" id="mmNo" name="mmNo" value="${sessionScope.mmNo}"/>
				</div>
				<div class="text-end">
					<input type="submit" class="btn btn-danger rounded-0" value="λ±λ‘" id="mhfcommInsert" />
				</div>
			</form>
		
			
			<div class="row">
				<div id="comList" class="col">
					<c:if test="${not empty mhfCommList}">
						<c:forEach var="mhfCommList" items="${mhfCommList}">
							<div class="row">
								<div class="col">
									<span id="mhfComWriter"><b>${mhfCommList.mhfComWriter}</b></span><br>
									<pre id="beforeCon${mhfCommList.mhfComNo}" class="m-0">${mhfCommList.mhfComContent}</pre>
									<small class="text-secondary"><fmt:formatDate value="${mhfCommList.mhfComRegDate}" pattern="yyyy-MM-dd" /></small>
									<c:if test="${fn:trim(sessionScope.userId) == 'admin0001' or fn:trim(sessionScope.userId) == mhfCommList.mhfComWriter}">
										<button class="btn btn-outline-dark btn-sm" data-mhfComNo="${mhfCommList.mhfComNo}" id="mhfcUpdate"> 
											<i class="bi bi-journal-text"></i>μμ </button>
										<button class="btn btn-outline-dark btn-sm" data-mhfComNo="${mhfCommList.mhfComNo}" id="mhfcDelete"> 
											<i class="bi bi-trash"></i>μ­μ </button>
									</c:if>
								</div>
							</div>
						<hr class="border border-dark">
						</c:forEach>
					</c:if>
				</div> 
			</div>
			
			<div class="row my-3 d-none" id="mhfcForm">
				<div class="col">
					<form name="WriteForm" id="WriteForm">
						<input type="hidden" name="mhfNo" value="${mhfind.mhfNo}"/>
						<input type="hidden" name="mhfComWriter" value="${sessionScope.userId}" />
						<input type="hidden" name="mmNo" value="${sessionScope.mmNo}"/>
						<div class="row bg-light my-3 p-3 border">
							<div class="row">
								<div class="col">
									<textarea name="mhfComContent" id="mhfComContent" class="form-control" rows="4"></textarea>
								</div>
								<div class="col-md">
									<input type="submit" value="λκΈ μμ " class="btn" id="updateCom"/>							
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>








