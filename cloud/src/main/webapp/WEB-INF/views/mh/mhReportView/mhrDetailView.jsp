<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<!-- 제스퍼 리포트용 벨류세팅 -->
	<input type="hidden" value="${report.mhrAddFile}" id="jxv_mhrAddFile">
	<input type="hidden" value="${report.mhrName}" id="jxv_mhrName"> 
	<input type="hidden" value="${report.mhrage}" id="jxv_mhrage">
	<input type="hidden" value="${report.mhrGen}" id="jxv_mhrGen">
	<input type="hidden" value="${report.mhrInfoDate}" id="jxv_mhrInfoDate">
	<!-- 특징 -->
	<input type="hidden" value="${report.mhrHairColor}" id="jxv_mhrHairColor">
	<input type="hidden" value="${report.mhrHair}" id="jxv_mhrHair">
	<input type="hidden" value="${report.mhrWear}" id="jxv_mhrWear">

	<input type="hidden" value="${report.mhrContent}" id="jxv_mhrContent">
	<input type="hidden" value="${report.memberTell}" id="jxv_memberTell">
	<!-- 제스퍼 리포트용 벨류세팅 end -->
	
	<form enctype="multipart">
		<div class="w3-content">
			<div class="my-4">
				<h3>${report.mhrTitle}</h3>
			</div>
			<div>
				<table class="topbox">
					<tr>
						<td class="mhThWriter py-2"><b>&nbsp;&nbsp;${report.mhrWriter}</b></td>
						<td class="mhThDate py-2"><fmt:formatDate
								value="${report.mhrRegDate}" pattern="yyyy-MM-dd HH:mm" /></td>
						<td class="mhThReadCount ms-3 py-2">조회수 : ${report.mhrReadCnt }</td>
					</tr>
					<c:if test="${report.mhrAddFile != null}">
					<tr>
						<td class="py-2">&nbsp;&nbsp;💾 | <a href="fileDownload?fileName=${report.mhrAddFile}">다운로드</a></td>
					</tr>	
					</c:if>
					<c:if test="${report.mhrAddFile == null}">
					<tr>
						<td class="py-2">&nbsp;&nbsp;💾 | 파일없음</td>
					</tr>	
					</c:if>
					 
				</table>
				<div class="py-4 px-3 row">
					<div class="col-3">
						<c:if test="${report.mhrAddFile != null}">
								<img src="fileDownload?fileName=${report.mhrAddFile}" style="width: 150px; height: 200px;" >
						</c:if>
						<c:if test="${report.mhrAddFile == null}">
							<img src="resources/image/main/cloudLogo.png" style="width: 150px; height: 200px;" >
						</c:if>
					</div>
					<div class="col-8">
						<div>
							<p><span class="p-2 me-2 bg-warning rounded-3 text-white ">
									<c:if test="${report.mhrIllCode == '01'}">
											<span>아동</span>
									</c:if>
									<c:if test="${report.mhrIllCode == '02'}">
											<span>장애</span>
									</c:if>
									<c:if test="${report.mhrIllCode == '03'}">
											<span>치매</span>
									</c:if>
									<c:if test="${report.mhrIllCode == '04'}">
											<span>가출</span>
									</c:if>
									<c:if test="${report.mhrIllCode == '05'}">
											<span>기타</span>
									</c:if>
								</span>
								<span class="fw-bold">${report.mhrName}(${report.mhrage}세)
									<c:if test="${report.mhrGen == 'M '}">
										남자
									</c:if>
									<c:if test="${report.mhrGen == 'F '}">
										여자
									</c:if>
								</span> </p>
								<table class="table border-top border-2">
									<tr>
										<th>당시나이</th>
										<td>${report.mhrMage}세</td>
									</tr>
									<tr>
										<th>발생일시</th>
										<td><fmt:formatDate value="${report.mhrInfoDate}" pattern="yyyy-MM-dd" /></td>
									</tr>
									<tr>
										<th>발생장소</th>
										<td>
											<c:if test="${report.mhrLocalCode == 01 }">서울/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 02 }">경기/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 03 }">인천/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 04 }">대전/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 05 }">광주/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 06 }">대구/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 07 }">울산/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 08 }">부산/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 09 }">세종/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 10 }">강원/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 11 }">충북/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 12 }">충남/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 13 }">전북/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 14 }">전남/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 15 }">경북/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 16 }">경남/${report.mhrLocalDetail}</c:if>
											<c:if test="${report.mhrLocalCode == 17 }">제주/${report.mhrLocalDetail}</c:if>
										</td>
									</tr>
									<tr>
										<th>국적</th>
										<td>
											<c:if test="${report.mhrNation == 'local'}">내국인</c:if>
											<c:if test="${report.mhrNation == 'foreign'}">외국인</c:if>
										</td>
									</tr>
									<tr>
										<th>키</th>
										<td>${report.mhrHeight}cm</td>
									</tr>
									<tr>
										<th>몸무게</th>
										<td>${report.mhrWeight}kg</td>
									</tr>
									<tr>
										<th>체격</th>
										<td>${report.mhrPhysical}</td>
									</tr>
									<tr>
										<th>얼굴형</th>
										<td>${report.mhrFace}</td>
									</tr>
									<tr>
										<th>두발색상</th>
										<td>${report.mhrHairColor}</td>
									</tr>
									<tr>
										<th>두발형태</th>
										<td>${report.mhrHair}</td>
									</tr>
									<tr>
										<th>착의의상</th>
										<td>${report.mhrWear}</td>
									</tr>
									<tr>
										<th>진행상태</th>
										<td>
											<c:if test="${report.mhrStatusCode == 01}">실종</c:if> 
											<c:if test="${report.mhrStatusCode == 02}">신고</c:if> 
											<c:if test="${report.mhrStatusCode == 03}">해결</c:if> 
										</td>
									</tr>
								</table>
								<br>
								${report.mhrContent}
						</div>
					</div>
				</div>
			</div>
			<div class="mhboxLine"></div>
			<div class="row">
				<div class="col text-center mt-4">
					<input type="button" class="btn btn-outline-danger me-3" value="전단지 출력📃"id ="jsReport" data-code="mh" />
					<c:if test="${(sessionScope.userId == report.mhrWriter) or (sessionScope.userId == 'admin0001')}">
						<input type="button" class="btn btn-outline-danger me-3" id="mhrUpdate" data-mhrNo="${report.mhrNo}" data-pageNum="${pageNum}"value="수정하기"> 
						<input type="button" class="btn btn-outline-danger me-3" id="mhrDelete" data-mhrNo="${report.mhrNo}" data-pageNum="${pageNum}"value="삭제하기" /> 
					</c:if>
					<input type="button" class="btn btn-outline-danger" value="목록으로" onclick="location.href='mhrSelectList?pageNum=${pageNum}'"/>
				</div>
			</div>
		</div>
	</form>
