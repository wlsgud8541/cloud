$(document).ready(function(){

	var arrPositions = []; // 마커 위치 정보 배열 
	var arrLinePath = []; // 라인 정보
	var latitude = ""; // 위도
	var longitude = ""; // 경도

	if(latitude == ""){
		kakaoMapApi(latitude, longitude);
	};
	
	//var test = 0.001; // 마커 테스트
	
	// Geolocation API 위치 확인
	$("#locationCheck").on("click",function(){
		//참조 사이트 : https://www.zerocho.com/category/HTML&DOM/post/59155228a22a5d001827ea5d
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				
				latitude = position.coords.latitude;   // 위도 값
				longitude = position.coords.longitude; // 경도 값
				
				
				// 마커 테스트
				/*
				latitude = latitude + test;
				longitude = longitude + test;
				test = test + 0.001;
				*/
								
				// 마커 위치 정보
				var positions = {
									title : '1',
									latlng : new kakao.maps.LatLng(latitude, longitude)
								}; 
				
				// 라인 좌표 정보
				var linePath = new kakao.maps.LatLng(latitude, longitude);
				
				// 마커 위치 정보 배열로 저장			
				arrPositions.push(positions);			
				// 라인 좌표 정보 배열로 저장
				arrLinePath.push(linePath);

				kakaoMapApi(latitude, longitude, arrPositions, arrLinePath);
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


	// kakao 지도 API
	// 참조 사이트 : https://apis.map.kakao.com/web/guide/
	function kakaoMapApi(latitude, longitude, arrPositions, arrLinePath){
		var container = document.getElementById('map'); // 지도 담을 영역 DOM 레퍼런스
	
		if(latitude == ""){
			// 지도 생성 옵션
			// options : 지도 생성 옵션
			// center : 지도 중심 좌표 *필요 요소 위도,경도 순으로 파라미터 입력
			// level : 지도 확대/축소 레벨
			var options = {
				center : new kakao.maps.LatLng(33.450701, 126.5706667),
				level : 3
			};
			var map = new kakao.maps.Map(container, options);
		}
		
		if(latitude != ""){
			var options = {
				center : new kakao.maps.LatLng(latitude, longitude),
				level : 3
			};
			var map = new kakao.maps.Map(container, options);
			kakaoMapMarkerApi(arrPositions, map, arrLinePath);
		}
	}
	
	// kakao 지도 Marker API
	// 참조 사이트 : https://apis.map.kakao.com/web/sample/multipleMarkerImage/
	function kakaoMapMarkerApi(arrPositions, map, arrLinePath){
		var markerImg = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		var imgSize = new kakao.maps.Size(24, 35); 				        // 마커 이미지 크기
		var markerImg = new kakao.maps.MarkerImage(markerImg, imgSize); // 마커 이미지 생성
		
		for(var i=0; i<arrPositions.length; i++){
			// 마커 생성
			var marker = new kakao.maps.Marker({
				map : map,						   // 마커를 표시할 지도
				position : arrPositions[i].latlng, // 마커 표시 위치
				title : arrPositions[i].title,	   // 마커 타이틀, 마커에 마우스 올리면 타이틀 표시
				image : markerImg				   // 마커 이미지
			});
		}
		
		// 지도에 표시할 라인 정보 생성
		var mapLineInfo = new kakao.maps.Polyline({
			path : arrLinePath,		 // 좌표 배열
			strokeWeight : 5,		 // 선 두께
			strokeColor : '#FF0000', // 선 색상
			strokeOpacity : 0.7,	 // 선 불투명도 1 ~ 0 | 0에 가까울수록 투명
			strokeStyle : 'solid'	 // 선 스타일
		});
		
		// 지도에 선 그리기
		mapLineInfo.setMap(map);
	}
});
