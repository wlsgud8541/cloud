<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<c:if test="${ mpfDetail.mpfStatusCode == '01' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-danger">실종</a></td>
				</c:if>
				<c:if test="${ mpfDetail.mpfStatusCode == '02' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-primary">찾았어요!</a></td>
				</c:if>
			</tr>	
			</c:if>
			<c:if test="${mpfDetail.mpfAddFile == null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;💾 | 파일없음</td>
				<c:if test="${ mpfDetail.mpfStatusCode == '01' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-danger">실종</a></td>
				</c:if>
				<c:if test="${ mpfDetail.mpfStatusCode == '02' }">
					<td class="text-end">&nbsp;&nbsp;실종현황 : <a class="text-primary">찾았어요!</a></td>
				</c:if>
			</tr>	
			</c:if>
			 
		</table>
	<div class="row mt-4">
		<c:if test="${mpfDetail.mpfLocalCode == 01}">
			<div class="col text-center">
				<span class="btn btn-primary">서울</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 02}">
			<div class="col text-center">
				<span class="btn btn-primary">경기</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 03}">
			<div class="col text-center">
				<span class="btn btn-primary">인천</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 04}">
			<div class="col text-center">
				<span class="btn btn-primary">대전</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 05}">
			<div class="col text-center">
				<span class="btn btn-primary">광주</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 06}">
			<div class="col text-center">
				<span class="btn btn-primary">대구</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 07}">
			<div class="col text-center">
				<span class="btn btn-primary">울산</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 08}">
			<div class="col text-center">
				<span class="btn btn-primary">부산</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 09}">
			<div class="col text-center">
				<span class="btn btn-primary">세종</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 10}">
			<div class="col text-center">
				<span class="btn btn-primary">강원</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 11}">
			<div class="col text-center">
				<span class="btn btn-primary">충북</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 12}">
			<div class="col text-center">
				<span class="btn btn-primary">충남</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 13}">
			<div class="col text-center">
				<span class="btn btn-primary">전북</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 14}">
			<div class="col text-center">
				<span class="btn btn-primary">전남</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 15}">
			<div class="col text-center">
				<span class="btn btn-primary">경북</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 16}">
			<div class="col text-center">
				<span class="btn btn-primary">경남</span>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfLocalCode == 17}">
			<div class="col text-center">
				<span class="btn btn-primary">제주</span>
			</div>
		</c:if>
	</div>
	<div class="row mt-4">
		<b>상세위치 : ${mpfDetail.mpfLocalDetail}</b>
	</div>
	<div class="row mt-4">
		<c:if test="${mpfDetail.mpfPetType == 01}">
			<div>
				<b>종류 : 강아지</b>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfPetType == 02}">
			<div>
				<b>종류 : 고양이</b>
			</div>
		</c:if>
		<c:if test="${mpfDetail.mpfPetType == 03}">
			<div>
				<b>종류 : 기타</b>
			</div>
		</c:if>
	</div>
	
	<div class="row mt-4">
		<b>실종 일시 : <fmt:formatDate value="${mpfDetail.mpfInfoDate}" pattern="yyyy-MM-dd" /></b>
	</div>
	
	
		<div class="py-4 px-3">
<pre>
상세 내용 :
	${mpfDetail.mpfContent }
</pre>
	<c:if test="${not empty mpfDetail.mpfAddFile}">
		<div class="text-center">
			<img src="fileDownload?fileName=${mpfDetail.mpfAddFile}" style="width: 500px;">
		</div>
	</c:if>
	<c:if test="${empty mpfDetail.mpfAddFile}">
		<div class="text-center text-success p-4">
			등록된 사진이 없습니다.
		</div>
	</c:if>
	
		</div>
	</div>
	<div class="mpboxLine"></div>
	
	<div class="row">
		<div class="col text-center mt-4">
			<c:if test="${(sessionScope.userId == report.mhrWriter) or (sessionScope.userId == 'admin0001')}">
				<input type="button" class="btn btn-outline-primary" id="mpfUpdate" data-mpfNo="${mpfDetail.mpfNo}" data-pageNum="${pageNum}"value="수정하기"> 
				<input type="button" class="btn btn-outline-primary  mx-3"  id="mpfDelete" data-mpfNo="${mpfDetail.mpfNo}" data-pageNum="${pageNum}"value="삭제하기" /> 
			</c:if>
			<input type="button" onclick="location.href='mpfSelectList?pageNum=${pageNum}'" class="btn btn-outline-primary" value="목록으로" />
		</div>
	</div>
	
	<input type="hidden" name="pageNum" value="${pageNum}"/>
	<input type="hidden" name="mpfNo" value="${mpfDetail.mpfNo}"/>
	<input type="hidden" id="mmNo" name="mmNo" value="${sessionScope.mmNo}"/>
	<input type="hidden" class="form-control" id="mpfComWriter" name="mpfComWriter" value="${sessionScope.userId}" />
<div class="p-4">
      <input type="text" class="form-control" id="commContent" name="mpfComContent" />
   </div>
   <div>
      <input type="submit" class="btn" value="댓글쓰기" id="commInsert" />
   </div>
   <div>
      <div id="mpfComList">
         <c:if test="${not empty mpfCommList}">
            <c:forEach var="mpfCommList" items="${mpfCommList}">
               <div class="row">
                  <div class="col-6" id="mpfComContent${mpfCommList.mpfComNo}">
                      <p>${mpfCommList.mpfComContent}</p>
                  </div>
                  <div class="col-2">
                      <p>${mpfCommList.mpfComWriter}</p>
                  </div>
                  <div class="col-2">
                     <p><fmt:formatDate value="${mpfCommList.mpfComRegDate}" pattern="yyyy-MM-dd" /></p>
                  </div>
                  <div class="col-2">
                     <button class="btn btn-outline-success btn-sm mpfcUpdate" data-mpfComNo="${mpfCommList.mpfComNo}" id="mpfcUpdate${mpfCommList.mpfComNo }"> 
                        <i class="bi bi-journal-text">수정</i>
                     </button>
                     <button id="mpfcDelete" class="btn btn-outline-warning btn-sm" data-mpfComNo="${mpfCommList.mpfComNo}" id="mpfcDelete"> 
                        <i class="bi bi-trash">삭제</i>
                     </button>
                  </div>
               </div>
            </c:forEach>
         </c:if>
      </div>
   </div>

</div>
