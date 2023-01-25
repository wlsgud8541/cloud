<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">임시보호 게시판 작성하기</h2>
		</div>
	</div>
	<form name="mppInsert" action="mppInsertProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value=1>
	<input type="hidden" class="form-control" name="mppRegDate" id="mppRegDate">
	<input type="hidden" class="form-control" name="mppWriter" id="mppWriter" value="${sessionScope.userId} ">
	
	<div class="row mb-2">
		<div class="col-8 offset-md-2">
		    <label for="mppTitle" class="form-label">제목</label>
		    <input type="text"class="form-control" name="mppTitle" id="title">
	  	</div>
	</div>
	
	<div class="row mb-2">
		<div class="col-3 offset-md-2">
		    <label for="mppContent" class="form-label">동물 종류</label>
		    <select class="form-control col-2" name="mppPetType" id="mppPetType">
		    	<option value="">--선택하세요--</option>
		    	<option value="01">강아지</option>
		    	<option value="02">고양이</option>
		    	<option value="03">기타(내용에 동물종류를 기재해주세요)</option>
		    </select>
	  	</div>
	 	
	  	<div class="col-3">
		    <label for="mppLocalCode" class="form-label">동물 성별</label>
		    <select class="form-control col-2" name="mppGen" id="gen">
		    	<option value="M">수컷</option>
		    	<option value="F">암컷</option>
	    	</select>
	  	</div>
	
	  	<div class="col-2">
		    <label for="mppInfoDate" class="form-label">임시보호 날짜</label>
	 	    <input type="date"class="form-control" name="mppInfoDate" id="infoDate">
	  	</div>
	</div>
	
	<div class="row mb-2">
	  	<div class="col-1 offset-md-2">
		    <label for="mppStatusCode" class="form-label">실종현황</label>
		    <select class="form-control col-2" name="mppStatusCode" id="mppStatusCode">
		    	<option value="01">실종</option>
		    	<option value="02">찾았어요!</option>
		    </select>
	  	</div>
	  	<div class="col-2">
		    <label for="mppContent" class="form-label">지역 코드</label>
		    <select class="form-control col-2" name="mppLocalCode" id="localCode">
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
	  	 <div class="col-5">
	       	<label for="zipcode" class="form-label">상세위치</label><br>
			<input type="text" class="form-control" name="mppLocalDetail" id="addr1" readonly>
		</div>
  	</div>
	<div class="row mb-2" style="position: relative; left: 77px;">
		<div class="col-1 offset-md-8">
			<input type="button" class="btn btn-secondary" id="btnZipcode" value="상세위치 찾기"><br>
		</div>
	</div>
	<div class="col-7 offset-md-2">
  		<div class="offset-md-1">
		    <textarea class="form-control textEditor" name="mppContent" id="content"></textarea>
  		</div>
  	</div>
 
  	<div class="col-8 offset-md-2">
	    <label for="title" class="form-label">파 일</label>
	    <input type="file" class="form-control" name="mppAddFile" id="mnAddFile" >
	</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-primary" id="insert" />
		<input type="button" value="목록보기" onclick="location.href='mppSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
