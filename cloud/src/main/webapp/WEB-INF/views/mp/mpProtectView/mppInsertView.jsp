<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">게시글 쓰기</h2>
		</div>
	</div>
	<form name="mppInsert" action="mppInsertProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value=1>
	
	<div class="col-4 offset-md-2">
	    <label for="mppWriter" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mppTitle" id="title">
  	</div>
  	<div class="col-4">
	    <label for="mppInfoDate" class="form-label">내용</label>
	    <textarea class="form-control" name="mppContent" id="content"></textarea>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppNation" class="form-label">작성자</label>
	    <textarea class="form-control" name="mppWriter" id="writer" rows="10"></textarea>
  	</div>
  	<div class="col-4">
	    <label for="mppRegDate" class="form-label">실종 날짜</label>
	    <input type="text"class="form-control" name="mppInfoDate" id="mppInfoDate">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppContent" class="form-label">지역 코드</label>
	    <input class="form-control" name="mppLocalCode" id="mppLocalCode"></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppContent" class="form-label">동물 종류</label>
	    <input class="form-control" name="mppPetType" id="mppPetType"></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppIllCode" class="form-label">작성일시</label>
	    <input class="form-control" name="mppRegDate" id="mppRegDate"></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppLocalCode" class="form-label">동물 성별</label>
	    <input class="form-control" name="mppGen" id="mppGen"></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="title" class="form-label">파 일</label>
	    <input type="file" class="form-control" name="mppAddFile" id="addFile" >
	</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-primary" id="insert" />
		<input type="button" value="목록보기" onclick="location.href='mppSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
