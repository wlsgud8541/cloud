<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=edab573809fed3c259c4cef10f07faec"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=edab573809fed3c259c4cef10f07faec&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="resources/js/realTimeInfo.js"></script>
<!-- 
참조 사이트 : https://apis.map.kakao.com/web/guide/
다음 카카오 자바스크립트 키 : edab573809fed3c259c4cef10f07faec
-->
<div>
	<input type="hidden" id="realTimeMmNo" value="${sessionScope.mmNo}">
	<div class="row text-center">
		<div class="col text-center">
			<h2 class="fs-3 fw-bold mb-1"><b>반려동물 실시간 동선체크</b></h2>
			<p class="border border-bottom border-dark border-2" style="width: 310px; display: inline-block; margin-bottom: 0px;"></p>
		</div>
	</div>  
	
	<div class="row">
		<div class="divtablebox text-center col">
			<div class="my-5 border border-dark shadow">
				<div id="map" style="width:750px;height:500px;"></div>
			</div>
		</div>
		
		<div class="col my-5">
			<table class="table table-hover text-center shadow-sm">
				<tr class="table-dark">
					<th>번호</th>
					<th>주소</th>
					<th>시간</th>
				</tr>	
				<tbody class="realTimeInfos">
					<c:if test="${not empty rtList}">
						<c:set var="rLength" value="${fn:length(rtList)}" />
						<c:forEach var="rtList" items="${rtList}" varStatus="status">
							<tr>
								<td>${rLength - status.index}</td>
								<td>${rtList.rtpPlace}</td>
								<td>${rtList.rtpRegTime}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<div class="text-end">
				<input class="btn border border-dark" type="button" id="locationCheck" value="현재위치 확인" />
			</div>
		</div>
	</div>			
</div>