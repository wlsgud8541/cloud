$(document).ready(function(){

	var arrPositions = []; // 마커 위치 정보 배열 
	var arrLinePath = []; // 라인 정보
	var latitude = ""; // 위도
	var longitude = ""; // 경도
	var locationArr = []; // 좌표로 주소 찾기용 배열
	var sessionCheck = $("#realTimeMmNo").val(); // 세션 체크
	
	
	if(sessionCheck != null && sessionCheck != ''){
		var mmNo = $("#realTimeMmNo").val();
		$.ajax({
			url : "realTimeMhInfoAjax",
			type : "POST",
			data : {
					 mmNo : mmNo,
				   },
			datatype : "json",
			success : function(result){
			
				if(result.length == 0){
					kakaoMapApi(latitude, longitude);
				}
			
				if(result.length > 0){
					for(var i = 0; i < result.length; i++){
					
					latitude = result[i].rthLatitude;   // 위도 값
					longitude = result[i].rthLongitude; // 경도 값
								
					// 마커 위치 정보
					var defaultPositions = {
							title : '1',
							latlng : new kakao.maps.LatLng(latitude, longitude)
						}; 
					
					// 라인 좌표 정보
					var defaultLinePath = new kakao.maps.LatLng(latitude, longitude);
					
					// 마커 위치 정보 배열로 저장			
					arrPositions.push(defaultPositions);		
					arrLinePath.push(defaultLinePath);
					}	
					kakaoMapApi(result[0].rthLatitude, result[0].rthLongitude, arrPositions, arrLinePath);
				}
			},
			error : function(){
				alert("위치 등록 중 문제가 발생했습니다. 관리자에 문의 부탁드립니다.");
			}
		});
	}
	
	
	var test = 0.0005;
	
	// Geolocation API 위치 확인
	$("#locationCheck").on("click",function(){
		
		if(sessionCheck == null || sessionCheck == ''){
			alert("로그인 후 해당 기능을 사용하실 수 있습니다.");
			return false;
		}
	
	
		//참조 사이트 : https://www.zerocho.com/category/HTML&DOM/post/59155228a22a5d001827ea5d
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				
				latitude = position.coords.latitude;   // 위도 값
				longitude = position.coords.longitude; // 경도 값

				//latitude = latitude + test;
				//longitude = longitude + test;
				//test = test+0.0005;
								
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
				
				
				console.log("arrPositions2222 : "+arrPositions);
				console.log("arrLinePath2222 : "+arrLinePath);
				
				
				kakaoMapApi(latitude, longitude, arrPositions, arrLinePath);
				
				// 해당 위치주소 가져오기
				var locationInfo = {latitude,longitude}; // 좌표 배열로 저장
				locationArr.push(locationInfo); // 배열에 좌표배열 저장
				callBackAddr(locationArr,latitude,longitude); // 함수호출
				
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
	
	// 좌표로 주소 가져오기
	var geocoder = new kakao.maps.services.Geocoder();
	var addr = '';
	var addrArr = [];
	function callBackAddr(locationArr,latitudeData,longitudeData){
		addrArr = [];
		for(var i = 0; i < locationArr.length; i++ ){
			searchDetailAddrFromCoords(locationArr[i].longitude,locationArr[i].latitude, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
					rthPlace = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
					addrArr.push(rthPlace);
		        }
		        if (addrArr.length == locationArr.length){
		        	var mmNo = $("#realTimeMmNo").val();
		        	var strAddr = addrArr[addrArr.length-1];
		        	
		        	console.log("strAddr : " + strAddr);
		        	 
					$.ajax({
						url : "realTimeInfoData",
						type : "POST",
						data : {
								 mmNo : mmNo,
								 strAddr : strAddr,
								 latitude : latitudeData,
								 longitude : longitudeData
							   },
						datatype : "json",
						success : function(result){
							console.log(result);
							
							var tag = "";
							for(var i = 0; i < result.length; i++){
								tag += "<tr>";
								tag += "<td>"+result[i].rthPlace+"</td>";
								tag += "<td>"+result[i].rthRegTime+"</td>";
								tag += "</tr>";
							}
							
							$(".realTimeInfos").empty();
							$(".realTimeInfos").append(tag);
							
						},
						error : function(){
							alert("위치 등록 중 문제가 발생했습니다. 관리자에 문의 부탁드립니다.");
						}
					});
		        }
		    });
		}

	    // 좌표로 법정동 상세 주소 정보를 요청합니다
		function searchDetailAddrFromCoords(longitude,latitude, callback) {
		    geocoder.coord2Address(longitude, latitude, callback);
		}
	}
});
