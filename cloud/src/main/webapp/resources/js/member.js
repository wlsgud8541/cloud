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
		var kakaoId = $("#kakaoId").val();
		var naverId = $("#naverId").val();
		
		if(checkValue == 'N'){
			alert("다음으로 진행하시려면 개인정보 수집 및 이용 동의에 동의하셔야합니다.");
			return false;
		}
		if(checkValue == 'Y'){
			console.log("kakaoId value check : "+kakaoId);
			console.log("naverId value check : "+naverId);
			
			if(kakaoId != '' && kakaoId !== undefined){
				console.log("카카오 회원 가입 처리");
				$("#mmInsertJoin2Form").attr("action","mmKakaoInsertJoin2");
				$("#mmInsertJoin2Form").submit();
				return false;
			}
			if(naverId != '' && naverId !== undefined){
				console.log("네이버 회원 가입 처리");
				$("#mmInsertJoin2Form").attr("action","mmNaverInsertJoin2");
				$("#mmInsertJoin2Form").submit();
				return false;
			}
			if((kakaoId == '' || kakaoId === undefined)
				|| (naverId == '' || naverId === undefined)){
				console.log("일반 회원 가입 처리");
				$("#mmInsertJoin2Form").attr("action","mmInsertJoin2");
				$("#mmInsertJoin2Form").submit();
				return false;
			}	
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

	// 아이디 중복확인
	$("#idCheckBtn").on("click",function(){
		var id = $("#id").val();
		var tag1 = '<p class="text-primary">\'' + id + '\'는 사용 할 수 있는 아이디입니다.</p>';
		var tag2 = '<p class="text-danger">\'' + id + '\'는 중복된 아이디이거나 사용 할 수 없는 아이디입니다.</p>';
	
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
		
		var tag1 = '<p class="text-danger">올바르지 않은 아이디 형식입니다.영문자와 숫자 조합인 8~15글자의 형식으로 입력바랍니다.</p>';

		var tag2 = '<p class="text-warning">올바른 형식의 아이디입니다. 아이디 중복검사를 실행해주세요.</p>';
		
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
		var tag1 = '<p class="text-primary">사용 할 수 있는 패스워드 입니다.</p>'
		var tag2 = '<p class="text-danger">패스워드는 8~16자 영문, 숫자 조합으로 입력해주세요.</p>';
		
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
		var tag1 = '<p class="text-danger">패스워드가 일치하지 않습니다.</p>';
		var tag2 = '<p class="text-primary">패스워드가 일치합니다.</p>';
		
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
			passBool2 = true;
		}
	});
	
	// 이름 체크
	$("#name").on("keyup",function(){
		// 이름 체크 정규식(한글만 가능, 1글자 이상 입력)
		var nameCheck = /^[ㄱ-힣]/;
		var name = $("#name").val();
		var tag1 = '<p class="text-danger">이름은 한 글자 이상 한글로 입력 부탁드립니다.</p>';
		
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
		
		alert("이메일이 전송되었습니다. 입력하신 이메일을 확인해주세요.");
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
					var tag1 = '<button type="button" class="secondary" id="emailCheckBtn">인증번호 확인</button>'
					$(".emailCheck").empty();
					$(".emailCheck").append(tag1);
					emailCerNum = result.strCN; //result.strCN : 이메일 인증 번호
				}
			},
			error : function(){
				alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
			}
		});
	});
	
	$(document).on("click","#emailCheckBtn",function(){
		if(emailCerNumCheck == true){
			emailCerNumCheck = true;
			alert("이미 인증처리가 완료되었습니다.");
			return false;
		}
	
		var emailCheck = $("#emailCheck").val();
		
		if(emailCerNum == emailCheck){
			alert("인증이 완료되었습니다.");
			var tag1 = '<button type="button" class="secondary" id="emailCheckBtn" disabled>인증완료</button>'
			$(".emailCheck").empty();
			$(".emailCheck").append(tag1);
			emailCerNumCheck = true;
		}
		
		if(emailCerNum != emailCheck){
			alert("인증번호가 일치하지 않습니다. 확인 후 재인증 부탁드립니다");
			emailCerNumCheck = false;
			return false;
		}
	});
	
	// 이메일 도메인 change event
	$("#emailId").on("change",function(){
		emailCerNumCheck = false;
		var tag1 = '<button type="button" class="secondary" id="emailSendBtn">이메일 인증하기</button>'
		$("#emailCheck").val("");
		$(".emailCheck").empty();
		$(".emailCheck").append(tag1);
	});

	$("#emailDomain").on("change",function(){
		emailCerNumCheck = false;
		var tag1 = '<button type="button" class="secondary" id="emailSendBtn">이메일 인증하기</button>'
		$("#emailCheck").val("");
		$(".emailCheck").empty();
		$(".emailCheck").append(tag1);
	});
	
	$("#selectDomain").on("change",function(){
		var selectDomain = $("#selectDomain").val();
		if(selectDomain == "직접입력"){
			$("#emailDomain").val("");
			$("#emailDomain").attr("disabled",false);
		}else{
			$("#emailDomain").val(selectDomain);
			$("#emailDomain").attr("disabled",true);
		}
	});
	
	// 주소 검색
	// API 참고 사이트 : http://postcode.map.daum.net/guide
	$("#btnZipcode").on("click",function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	var zonecode = data.zonecode; 				  // 국가기초구역번호, 2015년 8월 1일부터 시행될 새 우편번호
	        	var userSelectedType = data.userSelectedType; // 유저가 선택한 주소의 타입 | R:도로명 주소 | J:지번 주소
	        	var roadAddress = data.roadAddress 			  // 도로명 주소
	        	var jibunAddress = data.jibunAddress 		  // 지번주소
	        	var buildingName = data.buildingName 		  // 건물명
	        	
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
	
	// SMS 전송
	$(document).on("click","#SMSsendBtn",function(){
		var telCheck = /^\d{3}-\d{3,4}-\d{4}$/;

		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();

		var tel = tel1 + "-" + tel2 + "-" + tel3;
		
		
		if(telCheck.test(tel) == false){
			alert("전화번호 입력 양식이 올바르지 않습니다. 전화번호를 확인해주세요.");
			telBool = false;
			return false;
		}
		
		if(telCheck.test(tel) == true){
			telBool = true;
		}
		
		if(telCerNumCheck == true){
			alert("이미 인증처리가 완료되었습니다.");
			return false;
		}
		
		if(tel1 == "" || tel2 == "" || tel3 == ""){
			alert("전화번호가 입력되지 않았습니다. 전화번호를 확인해주세요.");
			return false;
		}
		
		var paramTel = tel1 + tel2 + tel3;
		
		$.ajax({
			url : "sendMessege",
			type : "POST",
			data : {tel : paramTel},
			dataType : "json",
			success : function(result){
				// 1 : 전송 성공 | 0 : 전송 실패
				if(result == 1){
					alert("인증번호가 전송되었습니다.");
					var tag1 = '<input type="button" class="btn btn-secondary" id="SMSsendBtn" value="인증번호 확인">&nbsp;&nbsp;';
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
		var tag1 = '<input type="button" class="btn btn-secondary" id="SMSsendBtn" value="인증번호 전송">&nbsp;&nbsp;';
		$("#telCheck").val("");
		$(".telCheck").empty();
		$(".telCheck").append(tag1);
	});

	$("#tel2").on("change",function(){
		telCerNumCheck = false;
		var tag1 = '<input type="button" class="btn btn-secondary" id="SMSsendBtn" value="인증번호 전송">&nbsp;&nbsp;';
		$("#telCheck").val("");
		$(".telCheck").empty();
		$(".telCheck").append(tag1);
	});

	$("#tel3").on("change",function(){
		telCerNumCheck = false;
		var tag1 = '<input type="button" class="btn btn-secondary" id="SMSsendBtn" value="인증번호 전송">&nbsp;&nbsp;';
		$("#telCheck").val("");
		$(".telCheck").empty();
		$(".telCheck").append(tag1);
	});
	
	// 회원가입 폼 전송
	$("#insertJoin").on("submit",function(e){
		
		var kakaoId = $("kakaoId").val();
		var naverId = $("naverId").val();
		
		console.log("kakaoId : " +kakaoId);
		console.log("naverId : " +naverId);
		
		var name = $("#name").val();
		var gen = $("input[name=mmGen]:checked").val();
		var id = $("#id").val();
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
		var birth = $("#birth").val();
		
		
		// 카카오 회원, 네이버 회원이 아닌 일반 회원일때만 체크
		if((kakaoId === undefined) && (naverId === undefined)){
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
		}	
		
		// 카카오 회원, 일반 회원 공통 체크 항목
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
		
		return ture;
	});
	
		
	// 마이페이지 페이징
	$(document).on("click",".myPageSelectPage",function(){
		var mmNo = $("#mInfo_mmNo").val();
		var pageNum = $(this).attr("data-pageNum");
		
		if(pageNum === 'undefined'){
			pageNum = 1;
		}
		
		$.ajax({
			url : "myPagePaging",
			type : "POST",
			data : { 
					mmNo : mmNo,
				   	pageNum : pageNum
				   },
			datatype : "json",
			success : function(result){
				var startPage = result.startPage;
				var endPage = result.endPage;
				var currentPage = result.currentPage;
				var pageCount = result.pageCount;
				var pageGroup = result.pageGroup;
				
				var tag1 = "<tr>";
				var tag2 = "";
			
				var memberRequestList = result.memberRequestList;
				
				for(var i = 0; i < memberRequestList.length; i++){
					tag1 += "<td><small><a href='mrSelectDetail?mreNo="+memberRequestList[i].mreNo+"&pageNum=1'>"+memberRequestList[i].mreTitle+"</a></small></td>";
					
					if(memberRequestList[i].mreReplyCode == "01"){
						tag1 += "<td><small>답변대기</small></td>";
					}
					if(memberRequestList[i].mreReplyCode == "02"){
						tag1 += "<td><small>답변완료</small></td>";
					}					
					tag1 += "</tr>";
				}
				$(".mReqList").empty();
				$(".mReqList").append(tag1);
				


				if(result.startPage > result.pageGroup){
					tag2 += '<li class="prev"><a class="page-link myPageSelectPage" data-pageNum="1">&lt;&lt;</a></li>';
					tag2 += '<li class="prev"><a class="page-link myPageSelectPage" href="#" data-pageNum="'+ (result.startPage - result.pageGroup) + '">&lt;</a></li>'
				}

				for(var i = startPage; i <= endPage; i++){
					if(i == result.currentPage){
						tag2 += '<li class="page-item active text-success" aria-current="page"><b>'+i+'</b></li>';
					}
					if(i != result.currentPage){
						tag2 += '<li class="page-item"><a class="page-link myPageSelectPage" href="#" data-pageNum="'+i+'" >'+i+'</a></li>';
					}
				}

				if(result.startPage > result.pageGroup){
					tag2 += '<li class="next"><a class="page-link myPageSelectPage" href="#" data-pageNum="' + (result.startPage + result.pageGroup) + '">&gt;</a></li>';
					tag2 += '<li class="next"><a class="page-link myPageSelectPage" href="#" data-pageNum="' + result.pageCount + '">&gt;&gt;</a></li>';
				}
			
				
				$(".pageGroup").empty();
				$(".pageGroup").append(tag2);				
				
			},
			error : function(){
				alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
			}	   
		});

	});
	
	
	
	$(document).on("click",".myPageWriterList",function(){
		var mmNo = $("#mInfo_mmNo").val();
		var pageNum = $(this).attr("data-pageNum");
		
		if(pageNum === 'undefined'){
			pageNum = 1;
		}
		
		$.ajax({
			url : "myPageWriterPaging",
			type : "POST",
			data : { 
					mmNo : mmNo,
				   	pageNum : pageNum
				   },
			datatype : "json",
			success : function(result){
				var startPage = result.mwStartPage;
				var endPage = result.mwEndPage;
				var currentPage = result.mwCurrentPage;
				var pageCount = result.mwPageCount;
				var pageGroup = result.mwPageGroup;
				
				var tag1 = "<tr>";
				var tag2 = "";
			
				var memberWriterInfoList = result.memberWriterInfoList;
				
				for(var i = 0; i < memberWriterInfoList.length; i++){
					if($.trim(memberWriterInfoList[i].tableType) == "01"){
						tag1 += "<td><small>실종자 목격 게시판 </small></td>";
						tag1 += "<td><small><a href='mhfDetailView?mhfNo="+memberWriterInfoList[i].noticeNo+"&pageNum=1'>"+memberWriterInfoList[i].noticeTitle+"</a></small></td>";
					}
					if($.trim(memberWriterInfoList[i].tableType) == "02"){
						tag1 += "<td><small>실종자 신고 게시판 </small></td>";
						tag1 += "<td><small><a href='mhrDetailView?mhrNo="+memberWriterInfoList[i].noticeNo+"&pageNum=1'>"+memberWriterInfoList[i].noticeTitle+"</a></small></td>";
					}
					if($.trim(memberWriterInfoList[i].tableType) == "11"){
						tag1 += "<td><small>반려동물 목격 게시판 </small></td>";
						tag1 += "<td><small><a href='mpfSelectDetail?mpfNo="+memberWriterInfoList[i].noticeNo+"&pageNum=1'>"+memberWriterInfoList[i].noticeTitle+"</a></small></td>";
					}
					if($.trim(memberWriterInfoList[i].tableType) == "12"){
						tag1 += "<td><small>반려동물 임시보호 게시판 </small></td>";
						tag1 += "<td><small><a href='mppSelectDetail?mppNo="+memberWriterInfoList[i].noticeNo+"&pageNum=1'>"+memberWriterInfoList[i].noticeTitle+"</a></small></td>";
					}
					if($.trim(memberWriterInfoList[i].tableType) == "13"){
						tag1 += "<td><small>반려동물 실종신고 게시판 </small></td>";
						tag1 += "<td><small><a href='mprSelectDetail?mprNo="+memberWriterInfoList[i].noticeNo+"&pageNum=1'>"+memberWriterInfoList[i].noticeTitle+"</a></small></td>";
					}
					
					tag1 += "</tr>";
				}
				$(".memberWriterInfo").empty();
				$(".memberWriterInfo").append(tag1);


				if(startPage > pageGroup){
					tag2 += '<li class="prev"><a class="page-link myPageWriterList" data-pageNum="1">&lt;&lt;</a></li>';
					tag2 += '<li class="prev"><a class="page-link myPageWriterList" href="#" data-pageNum="'+ (startPage - pageGroup) + '">&lt;</a></li>'
				}

				for(var i = startPage; i <= endPage; i++){
					if(i == currentPage){
						tag2 += '<li class="page-item active text-success" aria-current="page"><b>'+i+'</b></li>';
					}
					if(i != currentPage){
						tag2 += '<li class="page-item"><a class="page-link myPageWriterList" href="#" data-pageNum="'+i+'" >'+i+'</a></li>';
					}
				}

				if(startPage > pageGroup){
					tag2 += '<li class="next"><a class="page-link myPageWriterList" href="#" data-pageNum="' + (startPage + pageGroup) + '">&gt;</a></li>';
					tag2 += '<li class="next"><a class="page-link myPageWriterList" href="#" data-pageNum="' + pageCount + '">&gt;&gt;</a></li>';
				}
				
				$(".memberWriterPageGroup").empty();
				$(".memberWriterPageGroup").append(tag2);				
				
			},
			error : function(){
				alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
			}	   
		});

	});
	
	$("#changePass").on("click",function(){
		window.open('mmPassChange', '네이버팝업', 'width=500px,height=300px,scrollbars=no');
	});
	
	$("#passCkBtn").on("click",function(e){
		e.preventDefault();
		
		var mmId = $("#mmId").val();
		var mmPass = $("#mmPass").val();
		
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
				// 패스워드가 일치하지 않을시 : -1
				// 패스워드 일치시 : 1
				var loginCheck = result.result;
			
				if(loginCheck == 0){
					alert("존재하지 않는 아이디 입니다.");
				}
				if(loginCheck == -1){
					alert("패스워드가 일치하지 않습니다.");
				}
				if(loginCheck == 1){
					var tag = '';

					tag += '<input type="password" id="mmPass" name="mmPass" placeholder="새 비밀번호 입력" class="form-field" />';
					tag += '<div class="passCheck1" ></div>';
					tag += '<input type="password" id="checkPass" name="checkPass" placeholder="새 비밀번호 확인" class="form-field"  />';
					tag += '<div class="passCheck2"></div>';
					tag += '<button class="button primary" type="submit" id="passChangeBtn">비밀번호 변경</button>';
					
					$(".changePassword").empty();
					$(".changePassword").append(tag);
				}
			},
			error : function(){
				alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
			}
		});
	});
	
	var changePassBool1 = false;
	var changePassBool2 = false;
	
	$(document).on("keyup","#mmPass",function(){
		// 비밀번호 체크 정규식(8~16자 영문, 숫자 조합)
		var passCheck = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
		var pass1 = $("#mmPass").val();
		var tag1 = '<p class="text-primary">사용 할 수 있는 패스워드 입니다.</p>'
		var tag2 = '<p class="text-danger">패스워드는 8~16자 영문, 숫자 조합으로 입력해주세요.</p>';
		
		if(passCheck.test(pass1) == true){
			$(".passCheck1").empty();
			$(".passCheck1").append(tag1);
			changePassBool1 = true;
		}
		
		if(passCheck.test(pass1) == false){
			$(".passCheck1").empty();
			$(".passCheck1").append(tag2);
			changePassBool1 = false;
		}
	});
		
	$(document).on("keyup","#checkPass",function(){
		var pass1 = $("#mmPass").val();
		var pass2 = $("#checkPass").val();
		var tag1 = '<p class="text-danger">패스워드가 일치하지 않습니다.</p>';
		var tag2 = '<p class="text-primary">패스워드가 일치합니다.</p>';
		
		// 비밀번호가 일치하지 않는 경우
		if(!(pass2 == pass1)){ 
			$(".passCheck2").empty();
			$(".passCheck2").append(tag1);
			changePassBool2 = false;
		}
		
		// 비밀번호가 일치하는 경우
		if(pass2 == pass1){
			$(".passCheck2").empty();
			$(".passCheck2").append(tag2);
			changePassBool2 = true;
		}
	});
	
	$(document).on("click","#passChangeBtn",function(e){
		e.preventDefault();
		
		var mmId = $("#mmId").val();
		var mmPass = $("#mmPass").val();
		var checkPass = $("#checkPass").val();
		
		if(mmPass != checkPass){
			alert("비밀번호를 다시 확인해주세요.");
			return false;
		}
		
		if(changePassBool1 == false){
			alert("비밀번호를 다시 확인해주세요.");
			return false;
		}

		if(changePassBool2 == false){
			alert("비밀번호를 다시 확인해주세요.");
			return false;
		}
		
		var param = {
						mmId : mmId,
						mmPass : mmPass
					}
		$.ajax({
			url : "changePassProc",
			type : "POST",
			data : param,
			dataType : "json",
			success : function(result){
				if(result == 0){
					alert("비밀번호 변경 중 오류가 발생했습니다. 관리자에게 문의 부탁드립니다.");
				}
				if(result == 1){
					alert("비밀번호 변경이 완료되었습니다. 재로그인 부탁드립니다.");
					opener.location.href = "mmLogout?passChange=passSuc";
					window.close();
				}
			},
			error : function(){
				alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
			}
			
		});
	});
	
	$("#memberDisabled").on("click",function(){
		var memberDisabled = confirm("회원탈퇴를 진행합니다. 정말 탈퇴하시겠습니까?");
		var mmNo = $("#mInfo_mmNo").val(); 
		
		if(memberDisabled){
			$.ajax({
				url : "memberDisabled",
				type : "POST",
				data : {
						mmNo : mmNo
					   },
				datatype : "json",
				success : function(result){
					if(result == 0){
						alert("회원 탈퇴 처리 중 오류가 발생했습니다. 관리자에게 문의 부탁드립니다.");
					}
					if(result == 1){
						alert("회원 탈퇴가 완료되었습니다. 감사합니다.");
						location.href = "main";
					}
				},
				error : function(){
					alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
				}
			});			
		}
	});
	
	// 아이디 찾기, 비밀번호 찾기 인증 처리
	var strCN = "";
	
	$("#btnSearch").on("click", function(){
		
		var userInfoSearchType = $(this).attr("data-type");
		var searchEmail = "";
		
		// 아이디 찾기를 실행했을 경우 벨류 세팅
		if(userInfoSearchType == 'id'){
			searchEmail = $("#searchIdEmail").val();
		}
		
		// 비밀번호 찾기를 실행했을 경우 벨류 세팅
		if(userInfoSearchType == 'pass'){
			searchEmail = $("#searchPassEmail").val();
		}

		if(searchEmail == ""){
			alert("이메일 아이디가 입력되지 않았습니다. 이메일을 확인해주세요.");
			return false;
		}

		alert("이메일이 전송되었습니다. 입력하신 이메일을 확인해주세요.");
		$("#btnSearch").attr("disabled","disabled");
		$("#btnSearch").removeClass("button secondary");
		$("#btnSearch").addClass("btn-success");
		
		$.ajax({
			url : "sendEmail",
			type : "POST",
			data : {email : searchEmail},
			datatype : "json",
			success : function(result){
				// 0:전송 실패 | 1:전송 성공
				if(result.result = 0){
					alert("이메일이 전송 중 오류가 발생했습니다. 관리자에게 문의해주세요.");
				}
				
				if(result.result = 1){
					strCN = result.strCN;
				}
			},
			error : function(){
				alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
			}
		});
	});

	// 인증 완료시 아이디 찾기 처리
	$("#checkNum").on("click", function(){
		var userInfoSearchType = $(this).attr("data-type");
		
		// 아이디 찾기 시 프로세스
		if(userInfoSearchType == 'id'){
			var searchIdEmail = $("#searchIdEmail").val();
			var searchIdCheckNum = $("#searchIdCheckNum").val();
			var tag = "";
			
			if(strCN != searchIdCheckNum){
				alert("인증번호가 일치하지 않습니다. 확인 후 다시 시도해주세요.");
			}
			
			if(strCN == searchIdCheckNum){
				$("#checkNum").attr("disabled","disabled");
				$("#checkNum").removeClass("button secondary");
				$("#checkNum").addClass("btn-success");
				alert("인증이 확인되었습니다.");
				
				$.ajax({
					url : "idSearch",
					type : "POST",
					data : {mmEmail : searchIdEmail},
					datatype : "json",
					success : function(result){
						
						if(result.resultCnt == 0){
							tag += '<h4 class="text-center pt-1">해당 이메일로 등록된 아이디가 존재하지 않습니다.<br><br>확인 후 다시 시도 부탁드립니다.</h4>';
							tag += '<div class="text-center">';
							tag += '<button class="button secondary mt-4" type="button" id="redirectLoginView">로그인 화면</button>';
							tag += '</div>';
							$(".userInfoSearch").empty();
							$(".userInfoSearch").append(tag);
							
						}else{
							var userId = result.mmEmail;
							var userBeginId = userId.substring(0,3);
							var userEndId = userId.slice(-3,userId.length);
							var userBeginIdLen = userBeginId.length;
							var userEndIdLen = userEndId.length;
							var masking = "";
							for(var i = 0; i < (userId.length - (userBeginIdLen + userEndIdLen)); i++){
								masking += "*";
							}
							userId = userBeginId + masking + userEndId; 
						
							//admin0001
							//adm***0001
							tag += '<h4 class="text-center pt-5">회원님께서 등록하신 아이디는 [<b>'+userId+'</b>] 입니다.</h4>';
							tag += '<div class="text-center">';
							tag += '<button class="button secondary mt-5" type="button" id="redirectLoginView">로그인 화면</button>';
							tag += '</div>';
							$(".userInfoSearch").empty();
							$(".userInfoSearch").append(tag);
						}
					},
					error : function(){
						alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
					}
				});
			}
		}
		
		// 비밀번호 찾기 시 프로세스
		if(userInfoSearchType == 'pass'){
			var searchPassId = $("#searchPassId").val();
			var searchPassEmail = $("#searchPassEmail").val();
			var searchPassCheckNum = $("#searchPassCheckNum").val();
			var tag = "";
			
			if(strCN != searchPassCheckNum){
				alert("인증번호가 일치하지 않습니다. 확인 후 다시 시도해주세요.");
			}
			
			if(strCN == searchPassCheckNum){
				$("#checkNum").attr("disabled","disabled");
				$("#checkNum").removeClass("button secondary");
				$("#checkNum").addClass("btn-success");
				alert("인증이 확인되었습니다.");
				
				$.ajax({
					url : "idSearch",
					type : "POST",
					data : {
							mmEmail : searchPassEmail,
							mmId : searchPassId
							},
					datatype : "json",
					success : function(result){
						
						if(result.resultCnt == 0){
							tag += '<h4 class="text-center pt-1">해당 이메일로 등록된 아이디가 존재하지 않습니다.<br><br>확인 후 다시 시도 부탁드립니다.</h4>';
							tag += '<div class="text-center">';
							tag += '<button class="button secondary mt-4" type="button" id="redirectLoginView">로그인 화면</button>';
							tag += '</div>';
							$(".userInfoSearch").empty();
							$(".userInfoSearch").append(tag);
							
						}else{
							tag += '<h4 class="text-center pt-1">회원님의 이메일로 임시 비밀번호를 발송했습니다.<br><br>로그인 후 비밀번호를 변경 부탁드립니다.</h4>';
							tag += '<div class="text-center">';
							tag += '<button class="button secondary mt-5" type="button" id="redirectLoginView">로그인 화면</button>';
							tag += '</div>';
							$(".userInfoSearch").empty();
							$(".userInfoSearch").append(tag);
							
							$.ajax({
								url : "sendEmail",
								type : "POST",
								data : {
										email : searchPassEmail,
										type : "searchPass",
										mmId : searchPassId
										},
								datatype : "json",
								success : function(result){
									// 0:전송 실패 | 1:전송 성공
									if(result.resultCnt = 0){
										alert("이메일이 전송 중 오류가 발생했습니다. 관리자에게 문의해주세요.");
									}
								},
								error : function(){
									alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
								}
							});
						}
					},
					
					error : function(){
						alert("데이터 통신 실패. 관리자에게 문의 부탁드립니다.");
					}
				});
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			}
		}
	});
	
	$(document).on("click","#redirectLoginView",function(){
		location.href = "loginView";
	});
	
	
});