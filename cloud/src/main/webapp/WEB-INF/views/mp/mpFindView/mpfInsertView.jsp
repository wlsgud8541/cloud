<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">게시글 쓰기</h2>
		</div>
	</div>
	<form name="mpfInsert" action="mpfInsertProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value=1>
	
	<div class="col-4 offset-md-2">
	    <label for="mpfWriter" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mpfTitle" id="title">
  	</div>
  	<div class="col-4">
	    <label for="mpfInfoDate" class="form-label">내용</label>
	    <textarea class="form-control" name="mpfContent" id="content"></textarea>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfNation" class="form-label">작성자</label>
	    <textarea class="form-control" name="mpfWriter" id="writer" rows="10"></textarea>
  	</div>
  	<div class="col-4">
	    <label for="mpfRegDate" class="form-label">실종 날짜</label>
	    <input type="text"class="form-control" name="mpfInfoDate" id="mpfInfoDate">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfTitle" class="form-label">상태코드</label>
	    <input type="text"class="form-control" name="mpfStatusCode" id="mpfStatusCode">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfContent" class="form-label">지역 코드</label>
	    <input class="form-control" name="mpfLocalCode" id="mpfLocalCode"></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfContent" class="form-label">동물 종류</label>
	    <input class="form-control" name="mpfPetType" id="mpfPetType"></input>
  	</div>
 
  	<div class="col-8 offset-md-2">
	    <label for="mpfIllCode" class="form-label">작성일시</label>
	    <input class="form-control" name="mpfRegDate" id="mpfRegDate"></input>
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
