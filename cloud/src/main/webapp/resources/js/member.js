$(document).ready(function(){
	
	
	// 로그인 버튼 클릭시 로그인 처리 진행
	$("#btnLogin").on("click",function(e){
		e.preventDefault();
		
		var mmId = $("#mmId").val();
		var mmPass = $("#mmPass").val();
		
		if(mmId.length == 0){
			alert("아이디가 입력되지 않았습니다. 확인 후 재로그인 부탁드립니다.");
			return false;
		}
		
		if(mmPass.length == 0){
			alert("패스워드가 입력되지 않았습니다. 확인 후 재로그인 부탁드립니다.");
			return false;
		}
		
		var params = {
						mmId : mmId,
						mmPass : mmPass
					 }
		
		$.ajax({
			url : "mmSelectLoginCheck",
			type : "POST",
			data : params,
			dataType : "json",
			success : function(result){
				// 아이디가 존재하지 않을시 : 0
				// 패스워드가 일치하지 않을시 : -1
				// 로그인 성공시 : 1
				
				var loginCheck = result.result;
			
				if(loginCheck == 0){
					alert("존재하지 않는 아이디 입니다. 확인 후 로그인 부탁드립니다.");
				}
				if(loginCheck == -1){
					alert("패스워드가 일치하지 않습니다. 확인 후 로그인 부탁드립니다.");
				}
				if(loginCheck == 1){
					var sessionUserId = result.userId;
					alert(sessionUserId + "님 로그인되셨습니다.");
					location.href='main';
				}
			},
			error : function(){
				alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
			}
		});
	});
	
	// 회원가입 버튼 클릭시
	$("#btnJoin").on("click",function(){
		location.href='mmInsertJoin1';
	});		
	
	// 회원가입 동의 후 계속 진행 버튼
	$("#insertContinue").on("click",function(){
		var checkValue = $("input[name=mmUseUserInfoYn]:checked").val();
		
		if(checkValue == 'N'){
			alert("다음으로 진행하시려면 개인정보 수집 및 이용 동의에 동의하셔야합니다.");
			return false;
		}
		if(checkValue == 'Y'){
			location.href='mmInsertJoin2?mmUseUserInfoYn=Y';
		}
	});
	
	$("#insertSuccess").on("click",function(){
		location.href='main';
	});
	

	// 정규표현식 결과 변수
	var nameBool = true;
	var idBool = true;
	var passBool1 = true;
	var passBool2 = true;
	var emailCerNum = 0;
	var emailCerNumCheck = false;
	var telCerNumCheck = false;
	var telBool = true;

	// 이름 체크
	$("#name").on("keyup",function(){
		// 이름 체크 정규식(한글만 가능, 1글자 이상 입력)
		var nameCheck = /^[ㄱ-힣]/;
		var name = $("#name").val();
		
		var tag1 = '<div class="row mt-2">'
				  +'  <div class="col-8">'
				  +'	  <p class="text-danger">이름은 한 글자 이상 한글로 입력 부탁드립니다.</p>'
				  +'  </div>'
				  +'</div>'
		
		if(nameCheck.test(name) == false){
			$(".nameCheck").empty();
			$(".nameCheck").append(tag1);
			nameBool = false;
		}
		
		if(nameCheck.test(name) == true){
			$(".nameCheck").empty();
			nameBool = true;
		}
	});

		
	// 아이디 중복확인
	$("#idCheckBtn").on("click",function(){
		var id = $("#id").val();
		
		var tag1 =  '<div class="row mt-2">'
				  +'  <div class="col-8">'
				  +'	  <p class="text-primary">\'' + id + '\'는 사용 할 수 있는 아이디입니다.</p>'
				  +'  </div>'
				  +'</div>'

		var tag2 = '<div class="row mt-2">'
				  +'  <div class="col-8">'
				  +'	  <p class="text-danger">\'' + id + '\'는 중복된 아이디이거나 사용 할 수 없는 아이디입니다.</p>'
				  +'  </div>'
				  +'</div>'
	
	
		$.ajax({
			url : "idCheck",
			type : "POST",
			data : {mmId : id},
			dataType : "json",
			success : function(result){
				if(result == 0){
					alert("사용할 수 있는 아이디 입니다.");
					$(".idForm").empty();
					$(".idForm").append(tag1);
					$("#idCheckFlag").val('Y');
				}
				if(result == 1){
					alert("중복된 아이디 입니다. 다른 아이디를 검색해주세요.");
					$(".idForm").empty();
					$(".idForm").append(tag2);
					$("#idCheckFlag").val('N');
				}
			},
			error : function(){
				alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
			}
		});
	});

	
	// 아이디 체크
	$("#id").on("keyup",function(){
		// 아이디 체크 정규식(영문자+숫자로 시작하는 8~15글자)
		var idCheck = /^[a-z]+[a-zA-Z0-9]{8,15}/;
		var id = $("#id").val();
		
		var tag1 = '<div class="row mt-2">'
				  +'  <div class="col-8">'
				  +'	  <p class="text-danger">올바르지 않은 아이디 형식입니다.영문자와 숫자 조합인 8~15글자의 형식으로 입력바랍니다.</p>'
				  +'  </div>'
				  +'</div>'

		var tag2 = '<div class="row mt-2">'
				  +'  <div class="col-8">'
				  +'	  <p class="text-warning">올바른 형식의 아이디입니다. 아이디 중복검사를 실행해주세요.</p>'
				  +'  </div>'
				  +'</div>'
		
		if(idCheck.test(id) == false){
			$(".idForm").empty();
			$(".idForm").append(tag1);
			$("#idCheckFlag").val('N');
		}
		
		if(idCheck.test(id) == true){
			$(".idForm").empty();
			$(".idForm").append(tag2);
		}
	});

	// 비밀번호 체크
	$("#pass1").on("keyup",function(){
		// 비밀번호 체크 정규식(8~16자 영문, 숫자 조합)
		var passCheck = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
		var pass1 = $("#pass1").val();
		
		var tag1 = '<div class="row mt-2">'
				  +'  <div class="col-8">'
				  +'	  <p class="text-primary">사용 할 수 있는 패스워드 입니다.</p>'
				  +'  </div>'
				  +'</div>'
				  
		var tag2 = '<div class="row mt-2">'
				  +'  <div class="col-8">'
				  +'	  <p class="text-danger">패스워드는 8~16자 영문, 숫자 조합으로 입력해주세요.</p>'
				  +'  </div>'
				  +'</div>'
		
		if(passCheck.test(pass1) == true){
			$(".passCheck1").empty();
			$(".passCheck1").append(tag1);
			passBool1 = true;
		}
		
		if(passCheck.test(pass1) == false){
			$(".passCheck1").empty();
			$(".passCheck1").append(tag2);
			passBool1 = false;
		}
		
	});
	
	$("#pass2").on("keyup",function(){
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
		var tag1 = '<div class="row mt-2">'
				  +'  <div class="col-8">'
				  +'	  <p class="text-danger">패스워드가 일치하지 않습니다.</p>'
				  +'  </div>'
				  +'</div>'
				  
		var tag2 = '<div class="row mt-2">'
				  +'  <div class="col-8">'
				  +'	  <p class="text-primary">패스워드가 일치합니다.</p>'
				  +'  </div>'
				  +'</div>'
		
		// 비밀번호가 일치하지 않는 경우
		if(!(pass2 == pass1)){ 
			$(".passCheck2").empty();
			$(".passCheck2").append(tag1);
			passBool2 = false;
		}
		
		// 비밀번호가 일치하는 경우
		if(pass2 == pass1){
			$(".passCheck2").empty();
			$(".passCheck2").append(tag2);
		}
		
			
	});
	
	// 주소 검색
	// API 참고 사이트 : http://postcode.map.daum.net/guide
	$("#btnZipcode").on("click",function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	var zonecode = data.zonecode; // 국가기초구역번호, 2015년 8월 1일부터 시행될 새 우편번호
	        	var userSelectedType = data.userSelectedType; // 유저가 선택한 주소의 타입 | R:도로명 주소 | J:지번 주소
	        	var roadAddress = data.roadAddress // 도로명 주소
	        	var jibunAddress = data.jibunAddress // 지번주소
	        	var buildingName = data.buildingName // 건물명
	        	
	        	$("#zipcode").val(zonecode);
	        	
	        	if(userSelectedType == 'R'){
	        		$("#addr1").val(roadAddress+"("+buildingName+")");
	        	}

	        	if(userSelectedType == 'J'){
	        		$("#addr1").val(jibunAddress);
	        	}
	        }
    }).open();
	});
	
	// 이메일 인증
	$(document).on("click","#emailSendBtn",function(){
		var emailId = $("#emailId").val();
		var emailDomain = $("#emailDomain").val();
		var email = emailId + "@" + emailDomain;
		
		if(emailId == ""){
			alert("이메일 아이디가 입력되지 않았습니다. 이메일을 확인해주세요.");
			return false;
		}

		if(emailDomain == ""){
			alert("이메일 도메인이 입력되지 않았습니다. 이메일을 확인해주세요.");
			return false;
		}

		if(email == ""){
			alert("이메일이 입력되지 않았습니다. 이메일을 확인해주세요.");
			return false;
		}
		
		$.ajax({
			url : "sendEmail",
			type : "POST",
			data : {email : email},
			datatype : "json",
			success : function(result){
				// 0:전송 실패 | 1:전송 성공
				if(result.result = 0){
					alert("이메일이 전송 중 오류가 발생했습니다. 관리자에게 문의해주세요.");
				}
				if(result.result = 1){
					alert("이메일이 전송되었습니다. 입력하신 이메일을 확인해주세요.");
					var tag1 = '<input type="button" class="btn btn-warning" id="emailCheckBtn" value="인증번호 확인">'
					$(".emailCheck").empty();
					$(".emailCheck").append(tag1);
					emailCerNum = result.strCN;
				}
			},
			error : function(){
				alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
			}
		});
	});
	
	$(document).on("click","#emailCheckBtn",function(){
		
		if(emailCerNumCheck == true){
			alert("이미 인증이 완료처리 되었습니다.");
			return false;
		}
	
		var emailCheck = $("#emailCheck").val();
		
		if(emailCerNum == emailCheck){
			alert("인증이 완료되었습니다.");
			var tag1 = '<input type="button" class="btn btn-primary" id="emailCheckBtn" value="인증완료" disabled>'
			$(".emailCheck").empty();
			$(".emailCheck").append(tag1);
			emailCerNumCheck = true;
		}
		
		if(emailCerNum != emailCheck){
			alert("인증번호가 일치하지 않습니다. 확인후 재인증 부탁드립니다");
			emailCerNumCheck = false;
			return false;
		}
	});
	
	// 이메일 도메인 change event
	$("#emailId").on("change",function(){
		emailCerNumCheck = false;
		var tag1 = '<input type="button" class="btn btn-warning" id="emailSendBtn" value="이메일 인증하기">'
		$("#emailCheck").val("");
		$(".emailCheck").empty();
		$(".emailCheck").append(tag1);
	});

	$("#emailDomain").on("change",function(){
		emailCerNumCheck = false;
		var tag1 = '<input type="button" class="btn btn-warning" id="emailSendBtn" value="이메일 인증하기">'
		$("#emailCheck").val("");
		$(".emailCheck").empty();
		$(".emailCheck").append(tag1);
	});
	
	$("#selectDomain").on("change",function(){
		var selectDomain = $("#selectDomain").val();
		console.log("selectDomain : "+selectDomain);
		if(selectDomain == "직접입력"){
			$("#emailDomain").val("");
			$("#emailDomain").attr("disabled",false);
		}else{
			$("#emailDomain").val(selectDomain);
			$("#emailDomain").attr("disabled",true);
		}
	});
	
	// SMS 전송
	$(document).on("click","#SMSsendBtn",function(){
		var telCheck = /^\d{3}-\d{3,4}-\d{4}$/;

		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();

		var tel = tel1 + "-" + tel2 + "-" + tel3;
		
		
		if(telCheck.test(tel) == false){
			alert("전화번호 입력양식이 올바르지 않습니다. 전화번호를 확인해주세요.");
			telBool = false;
			return false;
		}
		
		if(telCheck.test(tel) == true){
			telBool = true;
		}
		
		if(telCerNumCheck == true){
			alert("이미 인증이 완료처리 되었습니다.");
			return false;
		}
	
		
		if(tel1 == "" || tel2 == "" || tel3 == ""){
			alert("전화번호가 입력되지 않았습니다. 전화번호를 확인해주세요.");
			return false;
		}
		
		var tel = tel1 + tel2 + tel3;
		
		$.ajax({
			url : "sendMessege",
			type : "POST",
			data : {tel : tel},
			dataType : "json",
			success : function(result){
				// 1 : 전송 성공
				// 0 : 전송 실패
				if(result == 1){
					alert("인증번호가 전송되었습니다.");
					var tag1 = '<input type="button" class="btn btn-primary" id="SMSsendBtn" value="인증완료" disabled>'
					$(".telCheck").empty();
					$(".telCheck").append(tag1);
					telCerNumCheck = true;
				}
				if(result == 0){
					alert("인증번호 전송 실패. 인증번호 재전송 부탁드립니다.");
				}
			},
			error : function(){
				alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
			}
		});
	});
	
	// 전화번호 변경 change event
	$("#tel1").on("change",function(){
		telCerNumCheck = false;
		var tag1 = '<input type="button" class="btn btn-primary" id="SMSsendBtn" value="인증번호 전송">'
		$("#telCheck").val("");
		$(".telCheck").empty();
		$(".telCheck").append(tag1);
	});

	$("#tel2").on("change",function(){
		telCerNumCheck = false;
		var tag1 = '<input type="button" class="btn btn-primary" id="SMSsendBtn" value="인증번호 전송">'
		$("#telCheck").val("");
		$(".telCheck").empty();
		$(".telCheck").append(tag1);
	});

	$("#tel3").on("change",function(){
		telCerNumCheck = false;
		var tag1 = '<input type="button" class="btn btn-primary" id="SMSsendBtn" value="인증번호 전송">'
		$("#telCheck").val("");
		$(".telCheck").empty();
		$(".telCheck").append(tag1);
	});
	
	// 회원가입 폼 전송
	$("#insertJoin").on("submit",function(e){
		
		var name = $("#name").val();
		var gen = $("input[name=mmGen]:checked").val();
		var id = $("#id").val();
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
		var birth = $("#birth").val();
		
		if(name == ""){
			alert("이름을 입력해주세요.");
			return false;
		}
		
		if(nameBool == false){
			alert("입력된 형식이 올바르지 않습니다. 이름을 확인해주세요.");
			return false;
		}
		
		if(gen == ""){
			alert("성별을 체크해주세요.");
			return false;
		}
	
		if(id == ""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		if(idBool == false){
			alert("아이디 형식이 올바르지 않습니다. 아이디를 확인해주세요.");
			return false;
		}
		
		if($("#idCheckFlag").val() == "N"){
			alert("아이디 중복검사가 실행되지 않았습니다. 중복검사 버튼을 클릭해주세요.");
			return false;
		}
		
		if(passBool1 == false){
			alert("비밀번호 형식이 올바르지 않습니다. 비밀번호를 확인해주세요.");
			return false;
		}

		if(passBool2 == false){
			alert("비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.");
			return false;
		}

		if(!(pass1 == pass2)){
			alert("비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.");
			return false;
		}
		
		if(birth == ""){
			alert("생년월일이 입력되지 않았습니다. 생년월일을 확인해주세요.");
			return false;
		}
		
		if($("#zipcode").val() == ""){
			alert("주소가 입력되지 않았습니다. 우편번호 찾기를 통해 주소를 입력해주세요.");
			return false;
		}
		
		if($("#addr1").val() == ""){
			alert("주소가 입력되지 않았습니다. 우편번호 찾기를 통해 주소를 입력해주세요.");
			return false;
		}

		if($("#addr2").val() == ""){
			alert("상세주소가 입력되지 않았습니다. 상세주소를 확인해주세요.");
			return false;
		}
		
		if(emailCerNumCheck == false){
			alert("이메일 인증이 완료되지 않았습니다. 이메일 인증을 실행해주세요.");
			return false;
		}
		
		if(telBool == false){
			alert("전화번호 입력 양식이 올바르지 않습니다. 전화번호를 확인해주세요.");
			return false;
		}

		if(telCerNumCheck == false){
			alert("전화번호 인증이 완료되지 않았습니다. 전화번호 인증을 실행해주세요.");
			return false;
		}
		
		//return false;
		return ture;
	});
	
});