<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">신고 게시판 작성하기</h2>
		</div>
	</div>
	<form name="mprInsert" action="mprInsertProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value=1>
	<input type="hidden" class="form-control" name="mprRegDate" id="mprRegDate" value=2020-01-01>
	<input type="hidden" class="form-control" name="mprWriter" id="mprWriter" value="${sessionScope.userId} ">
	
	<div class="col-4 offset-md-2">
	    <label for="mprTitle" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mprTitle" id="title">
  	</div>
  	<div class="col-5 offset-md-2">
	    <label for="mprContent" class="form-label">내용</label>
	    <textarea class="form-control" name="mprContent" id="content"></textarea>
  	</div>
  	<div class="col-2 offset-md-1">
	    <label for="mprInfoDate" class="form-label">실종 날짜</label>
	    <input type="date"class="form-control" name="mprInfoDate" id="mprInfoDate">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprStatusCode" class="form-label">실종현황</label>
	    <select class="form-control col-2" name="mprStatusCode" id="mprStatusCode">
	    	<option value="01">실종</option>
	    	<option value="02">찾았어요!</option>
	    </select>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprContent" class="form-label">지역</label>
	    <select class="form-control col-2" name="mprLocalCode" id="mprLocalCode">
	    	<option value="">--선택하세요--</option>
	    	<option value="01">서울</option>
	    	<option value="02">경기</option>
	    	<option value="03">인천</option>
	    	<option value="04">대전</option>
	    	<option value="05">광주</option>
	    	<option value="06">대구</option>
	    	<option value="07">울산</option>
	    	<option value="08">부산</option>
	    	<option value="09">세종</option>
	    	<option value="10">강원</option>
	    	<option value="11">충북</option>
	    	<option value="12">충남</option>
	    	<option value="13">전북</option>
	    	<option value="14">전남</option>
	    	<option value="15">경북</option>
	    	<option value="16">경남</option>
	    	<option value="17">제주</option>
	    </select>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprPetType" class="form-label">동물 종류</label>
	    <select class="form-control col-2" name="mprPetType" id="mprPetType">
	    	<option value="">--선택하세요--</option>
	    	<option value="01">강아지</option>
	    	<option value="02">고양이</option>
	    	<option value="03">기타(내용에 동물종류를 기재해주세요)</option>
	    </select>
  	</div>
 	
  	<div class="col-8 offset-md-2">
	    <label for="mprGen" class="form-label">동물 성별</label>
	     <select class="form-control col-2" name="mprGen" id="mprGen">
	    	<option value="M">남</option>
	    	<option value="F">여</option>
    	</select>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="title" class="form-label">파 일</label>
	    <input type="file" class="form-control" name="mprAddFile" id="mnAddFile" >
	</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-primary" id="insert" />
		<input type="button" value="목록보기" onclick="location.href='mprSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
