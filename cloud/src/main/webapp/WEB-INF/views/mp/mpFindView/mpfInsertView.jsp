<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">목격 게시판 작성하기</h2>
		</div>
	</div>
	<form name="mpfInsert" action="mpfInsertProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value=1>
	<input type="hidden" class="form-control" name="mpfRegDate" id="mpfRegDate">
	<input type="hidden" class="form-control" name="mpfWriter" id="mpfWriter" value="${sessionScope.userId} ">
	
	<div class="col-4 offset-md-2">
	    <label for="mpfTitle" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mpfTitle" id="title">
  	</div>
  	<div class="col-5 offset-md-2">
	    <label for="mpfContent" class="form-label">내용</label>
	    <textarea class="form-control" name="mpfContent" id="content"></textarea>
  	</div>
  	<div class="col-2 offset-md-1">
	    <label for="mpfInfoDate" class="form-label">발견 날짜</label>
	    <input type="date"class="form-control" name="mpfInfoDate" id="infoDate">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfLocalCode" class="form-label">지역 코드</label>
	    <select class="form-control col-2" name="mpfLocalCode" id="localCode">
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
	    <label for="mpfPetType" class="form-label">동물 종류</label>
	    <select class="form-control col-2" name="mpfPetType" id="mpfPetType">
	    	<option value="01">강아지</option>
	    	<option value="02">고양이</option>
	    	<option value="03">기타(내용에 동물종류를 기재해주세요)</option>
	    </select>
  	</div>
 
  	<div class="col-8 offset-md-2">
	    <label for="title" class="form-label">파 일</label>
	    <input type="file" class="form-control" name="mpfAddFile" id="mnAddFile" >
	</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-primary" id="insert" />
		<input type="button" value="목록보기" onclick="location.href='mpfSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
