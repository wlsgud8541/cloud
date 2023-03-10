<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">게시글 쓰기</h2>
		</div>
	</div>
	<form name="mprInsert" action="mprInsertProcess" id="mprInsert" class="row g-3 border-primary" method="post">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value= 1>
	
	<div class="col-4 offset-md-2">
	    <label for="mprWriter" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mprTitle" id="mprTitle">
  	</div>
  	<div class="col-4">
	    <label for="mprInfoDate" class="form-label">내용</label>
	    <textarea class="form-control" name="mprContent" id="mprContent"></textarea>
  	</div>
  	<div class="col-4">
	    <label for="mprRegDate" class="form-label">실종 날짜</label>
	    <input type="text"class="form-control" name="mprInfoDate" id="mprInfoDate">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprTitle" class="form-label">상태코드</label>
	    <input type="text"class="form-control" name="mprStatusCode" id="mprStatusCode">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprContent" class="form-label">지역 코드</label>
	    <textarea class="form-control" name="mprLocalCode" id="mprLocalCode" rows="10"></textarea>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprContent" class="form-label">동물 종류</label>
	    <textarea class="form-control" name="mprPetType" id="mprPetType" rows="10"></textarea>
  	</div>
 
  	<div class="col-8 offset-md-2">
	    <label for="mprNation" class="form-label">작성자</label>
	    <textarea class="form-control" name="mprWriter" id="mprWriter" rows="10"></textarea>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprIllCode" class="form-label">작성일시</label>
	    <textarea class="form-control" name="mprRegDate" id="mprRegDate" rows="10"></textarea>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprStatusCode" class="form-label">회원번호</label>
	    <textarea class="form-control" name="mmNo" id="mmNo" rows="10"></textarea>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprLocalCode" class="form-label">동물 성별</label>
	    <textarea class="form-control" name="mprGen" id="mprGen" rows="10"></textarea>
  	</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-primary" />
		<input type="button" value="목록보기" onclick="location.href='mprSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
