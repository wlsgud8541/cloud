<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=edab573809fed3c259c4cef10f07faec"></script>
<script type="text/javascript" src="resources/js/realTimeInfo.js"></script>
<!-- 
참조 사이트 : https://apis.map.kakao.com/web/guide/
다음 카카오 자바스크립트 키 : edab573809fed3c259c4cef10f07faec
-->
<div class="w3-content">
	<div class="textTop row">
		<div class="col fs-2 text-center">
			<b>실시간 동선체크</b>
		</div>
	</div>
	<div class="divtablebox text-center">
		<div class="my-5">
			<div id="map" style="width:980px;height:500px;"></div>
			<input type="button" id="locationCheck" value="현재위치 확인" />
		</div>
	</div>	
</div>