$(document).ready(function(){

	var latitude = ""; //위도
	var longitude = ""; //경도
	if(latitude == ""){
		kakaoMapApi();
	}
	
	// Geolocation API 위치 확인
	$("#locationCheck").on("click",function(){
		//참조 사이트 : https://www.zerocho.com/category/HTML&DOM/post/59155228a22a5d001827ea5d
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				console.log(position.coords.latitude + ' ' + position.coords.longitude);
				latitude = position.coords.latitude;
				longitude = position.coords.longitude;
				kakaoMapApi();
			},
			function(error){
				console.error(error);
			},
			{
				enableHighAccuracy : true,
				maximumAge : 0,
				timeout : Infinity
			});
		}else{
			alert('GPS를 지원하지 않습니다.');
		}
	});
	

/*
	kakao 지도 API
	참조 사이트 : https://apis.map.kakao.com/web/guide/
	1. containor : 지도 담을 영역 DOM 레퍼런스
	2. options : 지도 생성 옵션
	3. center : 지도 중심 좌표 *필요 요소 위도,경도 순으로 파라미터 입력
	4. level : 지도 확대/축소 레벨
*/
	function kakaoMapApi(){
		var container = document.getElementById('map');
	
		if(latitude == ""){
			console.log("check1");
			var options = {
				center : new kakao.maps.LatLng(33.450701, 126.5706667),
				level : 3
			};
			var map = new kakao.maps.Map(container, options);
		}
		
		if(latitude != ""){
			console.log("check2");
			var options = {
				center : new kakao.maps.LatLng(latitude, longitude),
				level : 3
			};
			var map = new kakao.maps.Map(container, options);
		}
	}
});
