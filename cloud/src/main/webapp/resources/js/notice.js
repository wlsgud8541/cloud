$(document).ready(function(){
	
	//등록하기 버튼 클릭 시 벨류 체크
	$("#insert").on("submit", function(e){
		e.preventDefault();
		
		var writer = $("#writer").val(); // 작성자
		var title = $("#title").val();   // 제목
		var content = $("#content").val(); // 내용
		var addFile = $("#addFile").val(); // 첨부파일
		var gen = $("#gen").val();
		var infoDate = $("#infoDate").val();
		var localCode = $("#localCode").val();
		var mhrMage = $("#mhrMage").val(); 
		var mhrage = $("#mhrage").val();
		var mhrNation = $("#mhrNation").val();
		
		// 작성자 체크 
		if(writer == null){
			alert("작성자가 입력되지 않았습니다.");
			return false;
		}
		
		// 글 제목 체크
		if(title == null){
			alert("제목이 입력되지 않았습니다.");
			return false;
		}
		if(title.length < 2){
			alert("제목은 한글자 이상 입력해주세요.");
			return false;
		}
		
		// 글 내용 체크
		if(content == null){
			alert("내용이 입력되지 않았습니다.");
			return false;
		}
		
		if(content.length < 11){
			alert("내용은 최소 10글자 이상 작성해주세요.");
			return false;
		}
		
		// 실종자 실종당시 나이 체크
		if(mhrMage == 0){
			alert("실종당시 나이가 입력되지 않았습니다.");
			return false;
		}
		
		// 실종자 현재 나이 체크
		if(mhrage == 0){
			alert("나이가 입력되지 않았습니다.");
			return false;
		}
		
		// 실종자 실종 당시 날자 체크
		if(infoDate == 0){
			alert("실종당시 날자가 입력되지 않았습니다.");
			return false;
		}
		
		// 실종자 국적 체크
		if(mhrNation.length == 0){
			alert("국적이 입력되지 않았습니다.");
			return false;
		}
		
		// 실종자 실종 지역 체크
		if(localCode == null){
			alert("실종 지역이 입력되지 않았습니다.");
			return false;
		}
		
		// 실종자 성별
		if(gen== null){
			alert("성별이 입력되지 않았습니다.");
			return false;
		}
		
		
		//첨부파일 체크
		if(addFile == null || addFile.length == 0){
			var result = confirm('첨부파일이 등록되지 않았습니다. 등록하시겠습니까?');
			if(result){
				$("#insertForm").submit();
			}else{
				return false;
			}
		}
	});
	
	
	//공지사항 게시판 js
	
	//업데이트 버튼 클릭시
	$("#mnUpdate").on("click",function(){
		var mnNo = $(this).attr("data-mnNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href='mnUpdate?mnNo='+mnNo+'&pageNum='+pageNum;		
	});

	//삭제 버튼 클릭시
	$("#mnDelete").on("click",function(){
		var mnNo = $(this).attr("data-mnNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href='mnDeleteProcess?mnNo='+mnNo+'&pageNum='+pageNum;	
	});
	
	
	// qna게시판 js 설정
	
	$(".mqContent").css("display", "none");
	// qna게시판 글 제목 클릭시
	$(document).on("click",".mqTilte",function(){
		var flagCheck = $(this).next().children(".mqUpdate").hasClass("updateSuccess");
		var mqNo = $(this).next().children(".mqUpdate").attr("data-mqNo");

		console.log(flagCheck);
		
		if(flagCheck){
			return false;
		}else{
			if(!($("#mqDiv"+mqNo).is(":visible"))){
				$("#mqDiv"+mqNo).slideDown(300);
				$("#mqDiv"+mqNo).css("display", "block");	
			
			}else if($("#mqDiv"+mqNo).is(":visible")){
				$("#mqDiv"+mqNo).slideUp(300);
			}
		}
	});	

	// qna게시판 수정 버튼 클릭시 
	$(document).on("click",".mqUpdate",function(){
		var mqNo = $(this).attr("data-mqNo");
		var beforeTitle = $("#beforeTitle"+mqNo).html();
		var beforeCont = $("#beforeCont"+mqNo).html();
		
		// 수정 버튼시 : updateSuccess 클래스 포함 여부로 확인
		if($(this).hasClass("updateSuccess") === false){
			if(!($("#mqDiv"+mqNo).is(":visible"))){
				$("#mqDiv"+mqNo).slideDown(300);
				$("#mqDiv"+mqNo).css("display", "block");	
			
			}
	
			$("#mqTilte"+mqNo).empty();
			$("#mqDiv"+mqNo).empty();
			
			var tag1 = '<span class="member">'
					 + '	<input type="text" id="beforeTitle' + mqNo + '" class="form-control" value="' + beforeTitle + '">'
					 + '</span>'
			
			var tag2 =  '<div class="col p-3">'
					  + '	<input type="text" id="beforeCont' + mqNo + '" class="form-control" value="' + beforeCont + '">'
					  + '</div>'
					  ;
					  
			$(this).addClass("updateSuccess");
			$(this).children().html("수정완료");
			$("#mqTilte"+mqNo).append(tag1);
			$("#mqDiv"+mqNo).append(tag2);
		
		// 수정 완료 버튼시 : updateSuccess 클래스 포함 여부로 확인
		}else{
			var mqTitle = $("#beforeTitle"+mqNo).val();
			var mqContent = $("#beforeCont"+mqNo).val();
			var mqWriter = $("#mqWriter"+mqNo).val();
			
			console.log("mqWriter : "+mqWriter);
			
			var params = {
							mqNo : mqNo
						  , mqTitle : mqTitle
						  , mqContent : mqContent
						  , mqWriter : mqWriter
						 };
			
			$.ajax({
				url : "mqModifyProcess",
				type : "POST",
				data : params,
				datatype : "json",
				success : function(result){
					$("#qnaList").empty();
					
					$.each(result, function(i, data){
						
						var date = new Date(data.mqRegDate);
						var formatDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
 								? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
 								+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) +  " " 
 								+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
 								+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
 								+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());


						var tag = '<div class="row border border-top-0">'
							  +'     <input type="hidden" class="form-control" name="mqWriter" id="mqWriter'+data.mqNo+'" value="${sessionScope.userId}">'
							  +'	 <div class="col">'
							  +'		<div class="row bg-light p-2">'
							  +'			<div id="mqTilte' + data.mqNo + '" class="mqTilte col-4">'
							  +'				<span class="member" id="beforeTitle' + data.mqNo + '">' + data.mqTitle + '</span>'
							  +'				<span class="me-3">' + formatDate + '</span>'
							  +'			</div>'
							  +'			<div class="col-8 text-end">'
							  +'				<button class="mqUpdate btn btn-outline-success btn-sm" data-mqNo="' + data.mqNo + '">'
							  +'					<i class="bi bi-journal-text" >수정</i>'
							  +'				</button>'
							  +'				<button class="mqDelete btn btn-outline-warning btn-sm" data-mqNo="' + data.mqNo + '">'
							  +'					<i class="bi bi-trash">삭제</i>'
							  +'				</button>'
							  +'			</div>'
							  +'		</div>'
							  +'		<div id="mqDiv' + data.mqNo + '" class="mqContent row">'
							  +'			<div class="col p-3">'
							  +'				<pre><span id="beforeCont' + data.mqNo + '">' + data.mqContent + '</span></pre>'
							  +'			</div>'
							  +'		</div>'
							  +'  </div>'
							  +'</div>'
						
						$("#qnaList").append(tag);	  
					});
					
					$(".mqContent").css("display", "none");
					$("#mqDiv"+mqNo).css("display", "block");	
				},
				error : function(){
					alert("데이터 통신 실패, 관리자에게 문의하세요");
				}
			
			});
			
			$(this).removeClass("updateSuccess");
			$(this).children().html("수정");
		}
	});
	
	// 삭제 버튼 클릭시
	$(document).on("click",".mqDelete",function(){
	
		var delCk = confirm("해당 게시글이 삭제됩니다. 정말 삭제하시겠습니까?");

		if(delCk){
			var mqNo = $(this).attr("data-mqNo");
			var params = {
						mqNo : mqNo
						};
			
			$.ajax({
				url : "mqDeleteProcess",
				type : "POST",
				data : params,
				dataType : "json",
				success : function(result){
					$("#qnaList").empty();
					$.each(result, function(i, data){
						
						var date = new Date(data.mqRegDate);
						var formatDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
								? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
								+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) +  " " 
								+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
								+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
								+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
	
	
						var tag = '<div class="row border border-top-0">'
							  +'     <input type="hidden" class="form-control" name="mqWriter" id="mqWriter'+data.mqNo+'" value="${sessionScope.userId}">'
							  +'	 <div class="col">'
							  +'		<div class="row bg-light p-2">'
							  +'			<div id="mqTilte' + data.mqNo + '" class="mqTilte col-4">'
							  +'				<span class="member" id="beforeTitle' + data.mqNo + '">' + data.mqTitle + '</span>'
							  +'				<span class="me-3">' + formatDate + '</span>'
							  +'			</div>'
							  +'			<div class="col-8 text-end">'
							  +'				<button class="mqUpdate btn btn-outline-success btn-sm" data-mqNo="' + data.mqNo + '">'
							  +'					<i class="bi bi-journal-text" >수정</i>'
							  +'				</button>'
							  +'				<button class="mqDelete btn btn-outline-warning btn-sm" data-mqNo="' + data.mqNo + '">'
							  +'					<i class="bi bi-trash">삭제</i>'
							  +'				</button>'
							  +'			</div>'
							  +'		</div>'
							  +'		<div id="mqDiv' + data.mqNo + '" class="mqContent row">'
							  +'			<div class="col p-3">'
							  +'				<pre><span id="beforeCont' + data.mqNo + '">' + data.mqContent + '</span></pre>'
							  +'			</div>'
							  +'		</div>'
							  +'  </div>'
							  +'</div>'
						
						$("#qnaList").append(tag);	
					});
					
					$(".mqContent").css("display", "none");			
				},
				error : function(){
					alert("데이터 통신 실패, 관리자에게 문의하세요");
				}
			});
		
		}else{
			alert("삭제가 취소되었습니다.");
			return false;
		}	
	});
	
	// 실종반려동물 신고 게시판 - 민혁
	
	//업데이트 버튼 클릭시
	$("#mprUpdate").on("click",function(){
		var mprNo = $(this).attr("data-mprNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href='mprUpdate?mprNo='+mprNo+'&pageNum='+pageNum;		
	});

	//삭제 버튼 클릭시
	$("#mprDelete").on("click",function(){
		var mprNo = $(this).attr("data-mprNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href='mprDeleteProcess?mprNo='+mprNo+'&pageNum='+pageNum;
	});
	
	// 실종반려동물 목격 게시판 - 민혁
	
	//업데이트 버튼 클릭시
	$("#mpfUpdate").on("click",function(){
		var mpfNo = $(this).attr("data-mpfNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href='mpfUpdate?mpfNo='+mpfNo+'&pageNum='+pageNum;		
	});

	//삭제 버튼 클릭시
	$("#mpfDelete").on("click",function(){
		var mpfNo = $(this).attr("data-mpfNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href='mpfDeleteProcess?mpfNo='+mpfNo+'&pageNum='+pageNum;
	});
	
	
	// 실종반려동물 임시보호 게시판 - 민혁
	
	//업데이트 버튼 클릭시
	$("#mppUpdate").on("click",function(){
		var mppNo = $(this).attr("data-mppNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href='mppUpdate?mppNo='+mppNo+'&pageNum='+pageNum;		
	});

	//삭제 버튼 클릭시
	$("#mppDelete").on("click",function(){
		var mppNo = $(this).attr("data-mppNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href='mppDeleteProcess?mppNo='+mppNo+'&pageNum='+pageNum;
	});
	
	// 실종 반려동물 목격 게시판 댓글 수정버튼 클릭
	$(document).on("click","#mpfcUpdate", function(){
		console.log($("#mpfCommForm").css("display"));
		
		console.log($(this).next());
		var $mpfComList = $(this).next();
		if($("#mpfCommForm").is(":visible")){
			var $next = $mpfComList.next();
			if(! $next.is("#mpfCommForm")){
				$("#mpfCommForm").slideUp(500);
			}
			setTimeout(function(){
				$("#mpfCommForm").insertAfter($mpfComList).slideDown(500);
			},500);
		}else{
			$("#mpfCommForm").removeClass("d-none").css("display","none").insertAfter($mpfComList).slideDown(500);
		}
		
		$("#mpfCommForm").find("form").attr({"id":"modifyForm","data-mpfNo":$(this).attr("data-mpfNo")});
		
		var mpfcModify = $(this).parent().parent().find("pre").text();
		console.log("mpfcModify:"+mpfcModify);
		$("#mpfComContent").val($.trim(mpfcModify));
	});
	
	// 실종 반려동물 목격 게시판 댓글 수정 서브밋
	
	$(document).on("submit","#modifyForm", function(evt){
	evt.preventDefault();
		if($("#updateContent").val().length < 1){
			alert("댓글이 입력되지 않았습니다.");
			return false;
		}
		
		$mpfCommForm = $("#mpfCommForm").slideUp(500);
		console.log($(this));
		var param = $(this).serialize()+"&mpfComNo="+$(this).attr("data-mpfComNo");
		console.log("param:");
		console.log(param);
		$.ajax({
			"url":"mpfcUpdate",
			"data":param,
			"dataType":"json",
			"type":"post",
			"success":function(resultData){
				console.log(resultData);
				
				$("#mpfComList").empty();
				$.each(resultData, function(k, v) {
					var date = new Date(v.mpfComRegDate);
					var tmpDate = date.getFullYear() + "-" + ((date.getMonth()+1 <10) ? "0" + (date.getMonth()+1) : (date.getMoth()+1)) + "-"
										+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
										+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours())+":"
										+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
										+(date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
										
					var result =
							'<div>'
							+'<span>'+v.mpfComContent+'</span>'+'</div>'
							+'<div>'
							+'<span>'+v.mpfComWriter+'</span>'+'<br>'
							+'</div>'
							+'<div>'
							+'<span>'+tmpDate+'</span>'
							+'</div>'
							+'<button class="btn btn-outline-success btn-sm" data-no="'+v.mpfComNo+'">' 
								+'<i class="bi bi-journal-text">수정</i></button>'
							+'<button class="btn btn-outline-warning btn-sm" data-no="'+v.mpfComNo+'">' 
								+'<i class="bi bi-trash">삭제</i></button>'
		 					 				
		 				$("#mpfComList").append(result);					
				});
				
				$("#updateContent").val("");
				$mpfCommForm.css("display","none");
				$("#global > div.col").append($mpfCommForm);
			},
			"error":function(xhr, status){
				alert("ajax 실패:" + status);
				console.log(status);
				console.log(xhr);
			}
		});
		return false;
	});
	
	
	
	
	// 실종자 신고 게시판 -경욱
	
	// 수정버튼 클릭시
	$("#mhrUpdate").on("click",function(){
		var mhrNo = $(this).attr("data-mhrNo");
		var pageNum = $(this).attr("date-pageNum");
		location.href="mhrModifyView?mhrNo="+mhrNo+"&pageNum="+pageNum;
	});
	// 삭제버튼 클릭시
	$("#mhrDelete").on("click",function(){
		var mhrNo = $(this).attr("data-mhrNo");
		var pageNum = $(this).attr("date-pageNum");
		location.href='mhrDeleteProcess?mhrNo='+mhrNo+"&pageNum="+pageNum;		
	});
	// 실종자 목격 게시판
	// 수정버튼 클릭시
	$("#mhfUpdate").on("click",function(){
		var mhfNo = $(this).attr("data-mhfNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href="mhfModifyView?mhfNo="+mhfNo+"&pageNum"+pageNum;
	});
	// 삭제버튼 클릭시
	$("#mhfDelete").on("click",function(){
		var mhfNo = $(this).attr("data-mhfNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href="mhfDeleteProcess?mhfNo="+mhfNo+"&pageNum="+pageNum;
	});
	
	// 실종자 목격 게시판 댓글 ajax
	$(document).on("submit","#mhfCommInsert",function(evt){
		evt.preventDefault();
		if($("#commContent").val() < 1){
			alert("댓글 내용을 입력하지 않았습니다");
			return false;
		}
		var par = $(this).serialize();
	
		$.ajax({
			"url":"mhfCommInsert",
			"data":par,
			"type":"post",
			"dataType":"json",
			"success":function(resultData){
				console.log(resultData);
				
				$("#comList").empty();
				
		
				$.each(resultData, function(k, v) {
					var date = new Date(v.mhfComRegDate);
					var tmpDate = date.getFullYear() + "-" + ((date.getMonth()+1 <10) ? "0" + (date.getMonth()+1) : (date.getMoth()+1)) + "-"
										+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
										+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours())+":"
										+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
										+(date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
 					var result =
						'<div>'
						+'<span>'+v.mhfComContent+'</span>'+'</div>'
						+'<div>'
						+'<span>'+v.mhfComWriter+'</span>'+'<br>'
						+'</div>'
						+'<div>'
						+'<span>'+tmpDate+'</span>'
						+'</div>'
						+'<button class="btn btn-outline-success btn-sm" data-no="'+v.mhfComNo+'">' 
							+'<i class="bi bi-journal-text">수정</i></button>'
						+'<button class="btn btn-outline-warning btn-sm" data-no="'+v.mhfComNo+'">' 
							+'<i class="bi bi-trash">삭제</i></button>'
	 					 				
	 				$("#comList").append(result);
	 			
 				});
				$("#commForm").slideUp(300)
			},
			"error":function(xhr, status){
				console.log("error:");
				console.log(status);
			}
		});
		return false;
	});
	// 실종자 목격 게시판 댓글 수정버튼이 클릭 되었을때 이벤트
	$(document).on("click","#mhfcUpdate", function(){
		console.log($("#CommForm").css("display"));
		
		console.log($(this).parents("#comList"));
		var $comList = $(this).parent("#comList");
		if($("#CommForm").is(":visible")){
			var $next = $comList.next();
			if(! $next.is("#CommForm")){
				$("#CommForm").slideUp(500);
			}
			setTimeout(function(){
				$("#CommForm").insertAfter($comList).slideDown(500);
			},500);
		}else{
			$("#CommForm").removeClass("d-none").css("display","inline-block").insertAfter($comList).slideDown(500);
		}
		
		$("#CommForm").find("form").attr({"id":"modifyForm","data-mhfNo":$(this).attr("data-mhfNo")});
		
		var mhfcModify = $(this).parent().parent().find("pre").text();
		console.log("mhfcModify:"+mhfcModify);
		$("#mhfComContent").val($.trim(mhfcModify));
	});
	// 실종자 목격 게시판 댓글 수정 서브밋 될때 이벤트
	
	$(document).on("submit","#updateCom", function(){
		if($("#updateContent").val().length < 1){
			alert("댓글이 입력되지 않았습니다.");
			return false
		}
		
		$CommForm = $("#CommForm").slideUp(500);
		var param = $(this).serialize() + "&mhfComNo="+$(this).attr("data-mhfComNo");
		
		$.ajax({
			"url":"mhfcUpdate",
			"data":param,
			"dataType":"json",
			"type":"post",
			"success":function(resultData){
				console.log(resultData);
				
				$("#comList").empty();
				$.each(resultData, function(k, v) {
					var date = new Date(v.mhfComRegDate);
					var tmpDate = date.getFullYear() + "-" + ((date.getMonth()+1 <10) ? "0" + (date.getMonth()+1) : (date.getMoth()+1)) + "-"
										+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
										+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours())+":"
										+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
										+(date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
										
					var result =
							'<div>'
							+'<span>'+v.mhfComContent+'</span>'+'</div>'
							+'<div>'
							+'<span>'+v.mhfComWriter+'</span>'+'<br>'
							+'</div>'
							+'<div>'
							+'<span>'+tmpDate+'</span>'
							+'</div>'
							+'<button class="btn btn-outline-success btn-sm" data-no="'+v.mhfComNo+'">' 
								+'<i class="bi bi-journal-text">수정</i></button>'
							+'<button class="btn btn-outline-warning btn-sm" data-no="'+v.mhfComNo+'">' 
								+'<i class="bi bi-trash">삭제</i></button>'
		 					 				
		 				$("#comList").append(result);					
				});
				
				$("#updateContent").val("");
				$CommForm.css("display","none");
				$("#global" > div.col).append($CommForm);
			},
			"error":function(xhr, status){
				alert("ajax 실패:" + status);
			}
		});
		return false;
	});
	
	// 건의사항 게시판 js
	
	//수정 버튼 클릭시
	$("#mrUpdate").on("click",function(){
		var mreNo = $(this).attr("data-mreNo");
		var pageNum = $(this).attr("data-pageNum")
		location.href='mrUpdate?mreNo='+mreNo+"&pageNum="+pageNum;		
	});

	//삭제 버튼 클릭시
	$("#mrDelete").on("click",function(){
		var mreNo = $(this).attr("data-mreNo");
		var pageNum = $(this).attr("data-pageNum");
		location.href='mrDeleteProcess?mreNo='+mreNo+"&pageNum="+pageNum;
	});
	
	//추천 ajax
	$("#commend").click(function(){
		$.ajax({
			url : "mreRecoCnt.ajax",
			type : "post",
			data : {mreRecoCnt: $("#mreRecoCnt").val(), mreNo : $("#mreNo").val()},
			dataType : "json",
			success : function(data){
				alert("추천했습니다");
				$("#commend").text("추천👍("+ data.mreRecoCnt + ")");
			},
			error: function(xhr, status, error) {
				console.log("error : " + xhr.statusText + ", " + status + ", " + error);
			}
		});
	}).hover(function(){$(this).css({cursor:"pointer"});
	});
	
	//답글쓰기 메뉴에 마우스 호버 이벤트 처리
	$("#mrcInsert").hover(function(){
		$(this).css("cursor","pointer");
	});
	
	//답글 쓰기가 클릭되었을 때 이벤트 처리
	$("#mrcInsert").on("click", function() {
		
		
		// 화면에 보이는 상태인지 체크
		console.log($("#commForm").css("display"));
		console.log($("#commForm").is(":visible"));
		
		// 답글 쓰기 폼이 화면에 보이는 상태이면
		if($("#commForm").is(":visible")) {
			
			var $prev = $("#mreComTitle").prev();
			if(! $prev.is("#commForm")) {
				$("#commForm").slideUp(300);
			}
			setTimeout(function(){
				$("#commForm").insertBefore("#mreComTitle").slideDown(300);
			}, 300);	
					
		} else {	// 답글 쓰기 폼이 보이지 않는 상태이면		
			$("#commForm").removeClass("d-none")
				.css("display", "none").insertBefore("#mreComTitle").slideDown(300);			
		}
		
		$("#commForm").find("form")
			.attr("id", "mrcInsertForm").removeAttr("data-mreNo");
		$("#mreComContent").val("");
		$("#mrcInsertButton").val("답글쓰기");
		
	});
	
	// 답글쓰기 폼이 submit 될 때
	$(document).on("submit","#mrcInsertForm",function(e){
		
		e.preventDefault();
		
		if($("#mreComContent").val().length<5){
			alert("답글이 입력되지 않았습니다.");
			return false;
		}
		
		$commForm = $("#commForm").slideUp(300);
		
		var params = $(this).serialize();
		
		console.log(params);
		
		$.ajax({
			url: "mrcInsertProcess.ajax",
			data : params,
			type : "post",
			dataType : "json",
			success : function(resData){
				console.log(resData);
				
				$(".commReady").empty();
				
				var date = new Date(resData.mreComRegDate);
				var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1 )) + "-"
							+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
							+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
							+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
							
				var result = 
						'<div class="gunUnderBox row">'
						+'	<div><h4><b>답변 내용</b></h4></div>'
						+'	<div class="commRow gunUnderContent col border-top border-bottom py-4 px-3">'
						+'		<b>'+ resData.mreComTitle +'</b><br><br>'
						+'		<span>' + resData.mreComContent + '</span>'		
						+'		<br><br><small class="text-secondary"><b>' + resData.mreComWriter + '</b>&nbsp;|&nbsp;'+ strDate +'</small>'
						+'		<button class="mrcUpdate btn btn-outline-warning btn-sm" data-mreComNo="' + resData.mreComNo + '">'
						+'			<i class="bi bi-journal-text">수정</i>'								
						+'		</button>'
						+'		<button class="mrcDelete btn btn-outline-danger btn-sm" data-mreComNo="' + resData.mreComNo + '">'
						+'			<i class="bi bi-trash">삭제</i>'
						+'		</button>'
						+'		</div>'
						+'</div>'
					
				
				$("#mrcView").append(result);
				
			},
			"error": function(xhr, status){
				console.log("error : " + status);
			}
		
		});
		
		return false;
	});
	
	//건의게시판 답변 수정 클릭 이벤트
	
	$(document).on("click",".mrcUpdate",function(){

		var $commRow = $(this).parents(".commRow");
		if($("#commForm").is(":visible")){
			var $next = $commRow.next();
			
			if(!$next.is("#commForm")){
				$("#commForm").slideUp(300);
			}
			setTimeout(function(){$("#commForm").insertAfter($commRow).slideDown(300);}, 300);
			
		}else{
			$("#commForm").removeClass("d-none").css("display","none").insertAfter($commRow).slideDown(300);
		}
		
		$("#commForm").find("form").attr({"id": "mrcUpdateForm", "data-mreComNo": $(this).attr("data-mreComNo")});
		$("#mrcInsertButton").val("답글수정");
		
		var comm = $(this).parent().find("span").text();
		$("#mreComContent").val($.trim(comm));
	});
	
	// 건의게시판 수정 폼 submit
	$(document).on("submit","#mrcUpdateForm", function(){
	
		if($("#mreComContent").val().length<=5){
			alert("답글은 5자 이상 입력해야 합니다.");
			return false;
		}
		$commForm = $("#commForm").slideUp(300);
		
		var params = $(this).serialize() + "&mreComNo=" + $(this).attr("data-mreComNo");
		
		$.ajax({
			url : "mrcUpdateProcess.ajax",
			type : "post",
			data : params,
			dataType : "json",
			success : function(resData, status, xhr){
				
				$("#mrcView").empty();
				
				var date = new Date(resData.mreComRegDate);
				var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1 )) + "-"
							+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
							+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
							+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
				
				var result = 
					'<div class="gunUnderBox row">'
					+'	<div><h4><b>답변 내용</b></h4></div>'
					+'	<div class="commRow gunUnderContent col border-top border-bottom py-4 px-3">'
					+'		<b>'+ resData.mreComTitle +'</b><br><br>'
					+'		<span>' + resData.mreComContent + '</span>'		
					+'		<br><br><small class="text-secondary"><b>' + resData.mreComWriter + '</b>&nbsp;|&nbsp;'+ strDate +'</small>'
					+'		<button class="mrcUpdate btn btn-outline-warning btn-sm" data-mreComNo="' + resData.mreComNo + '">'
					+'			<i class="bi bi-journal-text">수정</i>'								
					+'		</button>'
					+'		<button class="mrcDelete btn btn-outline-danger btn-sm" data-mreComNo="' + resData.mreComNo + '">'
					+'			<i class="bi bi-trash">삭제</i>'
					+'		</button>'
					+'		</div>'
					+'</div>'
				
				$("#mrcView").append(result);
				
				$("mreComContent").val("");
				$commForm.css("display","none");
				$("#mrcView").append($commForm);
				
			},
			error: function(xhr, status, error){
				alert("ajax 실패 : " + status + " - " + xhr.status );
			}
		});
		return false;
	});
	
	// 건의게시판 답글 삭제 
	$(document).on("click",".mrcDelete",function(){
	
		var mreComNo = $(this).attr("data-mreComNo");
		var mreComWriter = $(this).parent().find(".text-secondary").text();
		var mreNo = $("#commForm input[name=mreNo]").val();
		var params = "mreComNo=" + mreComNo + "&mreNo=" + mreNo;
		console.log(params);
	
	
		var result = confirm("답글을 삭제하시겠습니까?");
		
		if (result) {
				$.ajax({
					url : "mrcDeleteProcess.ajax",
					type : "post",
					data : params,
					dataType : "json",
					success : function(resData, status, xhr){
						console.log(resData);
						
						$("#mrcView").empty();
						
						var date = new Date(resData.mreComRegDate);
						var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
		 								? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
		 								+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) +  " " 
		 								+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
		 								+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
		 								+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
						var result = 
									'	<div class="row commReady" id="mreComTitle">'
									+'	<div class="col p-2 text-center border rounded-4">'
									+'		<h3 class="fs-4"> 답변을 기다리는 중 입니다.</h3>'
									+'	</div>'
									+'</div>'
									
									
						$("#mrcView").append(result);
	
						$("#mreComContent").val("");
					}, 
					error : function(xhr, status, error){
						alert("ajax 실패 : " + status + " - " + xhr.status);
					}
				});
		} 
		return false; 
	});
});

