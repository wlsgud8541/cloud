<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- content -->
<div class="w3-content">
	<input type="hidden" id="mpfNo" value="${mpfDetail.mpfNo}">
	<div class="my-4">
		<h3>${mpfDetail.mpfTitle}</h3>
	</div>
	<div>
		<table class="topbox">
			<tr>
				<td class="mpgunThWriter py-2"><b>&nbsp;&nbsp;작성자 : ${mpfDetail.mpfWriter}</b></td>
				<td class="mpgunThDate py-2"><fmt:formatDate
						value="${mpfDetail.mpfRegDate}" pattern="yyyy-MM-dd HH:mm" /></td>
				<td class="mpgunThReadCount ms-3 py-2">조회수 : ${mpfDetail.mpfReadCnt }</td>
			</tr>
			<c:if test="${mpfDetail.mpfAddFile != null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;💾 | <a href="fileDownload?fileName=${mpfDetail.mpfAddFile}">다운로드</a></td>
			</tr>	
			</c:if>
			<c:if test="${mpfDetail.mpfAddFile == null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;💾 | 파일없음</td>
			</tr>	
			</c:if>
			 
		</table>
	<div class="row mt-4">
		<div class="col">
			<c:if test="${mpfDetail.mpfAddFile != null}">
				<div class="text-center">
					<img src="fileDownload?fileName=${mpfDetail.mpfAddFile}" style="width: 500px;">
				</div>
			</c:if>
			<c:if test="${empty mpfDetail.mpfAddFile}">
				<div class="text-center text-success p-4">
					<img src="resources/image/main/cloudLogo.png" style="width: 350px;">
				</div>
			</c:if>
		</div>
		<div class="col">
			<c:if test="${mpfDetail.mpfPetType == 01}"><b>강아지</b></c:if>
			<c:if test="${mpfDetail.mpfPetType == 02}"><b>고양이</b></c:if>
			<c:if test="${mpfDetail.mpfPetType == 03}"><b>기타</b></c:if>
			<table class="table border-top border-2 mt-3">
				<tr>
					<th>실종지역 / 상세위치</th>
					<td><c:if test="${mpfDetail.mpfLocalCode == 01}">서울</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 02}">경기</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 03}">인천</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 04}">대전</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 05}">광주</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 06}">대구</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 07}">울산</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 08}">부산</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 09}">세종</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 10}">강원</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 11}">충북</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 12}">충남</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 13}">전북</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 14}">전남</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 15}">경북</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 16}">경남</c:if>
						<c:if test="${mpfDetail.mpfLocalCode == 17}">제주</c:if> / 	${mpfDetail.mpfLocalDetail}
					</td>
				</tr>
				<tr>
					<th>실종일시</th>
					<td><fmt:formatDate value="${mpfDetail.mpfInfoDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</table>
			<b>${mpfDetail.mpfContent }</b>
		</div>
	</div>		
</div>		
<div class="mpboxLine"></div>

<div class="row">
	<div class="col text-center mt-4">
		<c:if test="${(fn:trim(sessionScope.userId) eq fn:trim(mpfDetail.mpfWriter)) or (fn:trim(sessionScope.userId) eq 'admin0001')}">
			<input type="button" class="btn btn-outline-primary" id="mpfUpdate" data-mpfNo="${mpfDetail.mpfNo}" data-pageNum="${pageNum}"value="수정하기"> 
			<input type="button" class="btn btn-outline-primary mx-3"  id="mpfDelete" data-mpfNo="${mpfDetail.mpfNo}" data-pageNum="${pageNum}"value="삭제하기" />
		</c:if>  
		<input type="button" onclick="location.href='mpfSelectList?pageNum=${pageNum}'" class="btn btn-outline-primary" value="목록으로" />
	</div>
</div>
	
<input type="hidden" name="pageNum" value="${pageNum}"/>
<input type="hidden" name="mpfNo" value="${mpfDetail.mpfNo}"/>
<input type="hidden" id="mmNo" name="mmNo" value="${sessionScope.mmNo}"/>
<input type="hidden" class="form-control" id="mpfComWriter" name="mpfComWriter" value="${sessionScope.userId}" />
<div class="">
<b>의견쓰기</b>	
      <textarea class="form-control rounded-0" id="commContent" name="mpfComContent" style="resize: none;"></textarea>
   </div>
   <div class="text-end">
      <input type="submit" class="btn btn-primary rounded-0" value="등록" id="commInsert" />
   </div>
   <div>
      <div id="mpfComList">
         <c:if test="${not empty mpfCommList}">
            <c:forEach var="mpfCommList" items="${mpfCommList}">
               <div class="row">
                  <div>
                      <p id="mpfcWriter"><b>${mpfCommList.mpfComWriter}</b></p>
                  </div>
                  <div class="col-6" id="mpfComContent${mpfCommList.mpfComNo}">
                      <p>${mpfCommList.mpfComContent}</p>
                  </div>
                  <div id="mpfComBtn${mpfCommList.mpfComNo}">
                     <small class="text-secondary"><fmt:formatDate value="${mpfCommList.mpfComRegDate}" pattern="yyyy-MM-dd" /></small>
                    <c:if test="${(fn:trim(sessionScope.userId) eq fn:trim(mpfCommList.mpfComWriter)) or (fn:trim(sessionScope.userId) eq 'admin0001')}">
                     <button class="btn btn-outline-dark btn-sm mpfcUpdate" data-mpfComNo="${mpfCommList.mpfComNo}" id="mpfcUpdate${mpfCommList.mpfComNo }"> 
                        <i class="bi bi-journal-text"></i>수정</button>
                     <button class="btn btn-outline-dark btn-sm" data-mpfComNo="${mpfCommList.mpfComNo}" id="mpfcDelete"> 
                        <i class="bi bi-trash"></i>삭제</button>
					</c:if>
                  </div>
               </div>
               <hr class="border border-dark">
            </c:forEach>
         </c:if>
      </div>
   </div>

</div>

