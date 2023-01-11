$(document).ready(function(){

	//공지사항 게시판 js
	
	//업데이트 버튼 클릭시
	$("#mnUpdate").on("click",function(){
		var mnNo = $(this).attr("data-mnNo");
		location.href='mnUpdate?mnNo='+mnNo;		
	});

	//삭제 버튼 클릭시
	$("#mnDelete").on("click",function(){
		var mnNo = $(this).attr("data-mnNo");
		location.href='mnDeleteProcess?mnNo='+mnNo;
	});
	
	
	// 실종반려동물 신고 게시판 - 민혁
	
	//업데이트 버튼 클릭시
	$("#mprUpdate").on("click",function(){
		var mprNo = $(this).attr("data-mprNo");
		location.href='mprUpdate?mprNo='+mprNo;		
	});

	//삭제 버튼 클릭시
	$("#mprDelete").on("click",function(){
		var mprNo = $(this).attr("data-mprNo");
		location.href='mprDeleteProcess?mprNo='+mprNo;
	});
	
	/*건의사항 게시판 js*/
	
	//수정 버튼 클릭시
	$("#mrUpdate").on("click",function(){
		var mreNo = $(this).attr("data-mreNo");
		location.href='mrUpdate?mreNo='+mreNo;		
	});

	//삭제 버튼 클릭시
	$("#mrDelete").on("click",function(){
		var mreNo = $(this).attr("data-mreNo");
		location.href='mrDeleteProcess?mreNo='+mreNo;
	});
	
});

