<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">게시글 쓰기</h2>
		</div>
	</div>
	<form name="mprUpdateProcess" action="mprUpdateProcess" id="mprUpdateForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${mpModify.mmNo}">
	<input type="hidden" class="form-control" name="mprNo" id="mprNo" value="${mpModify.mprNo}">
	<input type="hidden" class="form-control" name="pageNum" id="pageNum" value="${pageNum}">
	
	<div class="col-4 offset-md-2">
	    <label for="mprTitle" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mprTitle" id="mprTitle" value="${mpModify.mprTitle}">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprWriter" class="form-label">작성자</label>
	    <input class="form-control" name="mprWriter" id="mprWriter" value="${mpModify.mprWriter}" readonly></input>
  	</div>
  	<div class="col-4">
	    <label for="mprContent" class="form-label">내용</label>
	    <input class="form-control" name="mprContent" id="mprContent" value="${mpModify.mprContent}"></input>
  	</div>
  	<div class="col-4">
	    <label for="mprInfoDate" class="form-label">실종 날짜</label>
	    <input type="text"class="form-control" name="mprInfoDate" id="mprInfoDate" value="${mpModify.mprInfoDate}">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprStatusCode" class="form-label">상태코드</label>
	    <input type="text"class="form-control" name="mprStatusCode" id="mprStatusCode" value="${mpModify.mprStatusCode}">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprLocalCode" class="form-label">지역 코드</label>
	    <input class="form-control" name="mprLocalCode" id="mprLocalCode" value="${mpModify.mprLocalCode}"></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprPetType" class="form-label">동물 종류</label>
	    <input class="form-control" name="mprPetType" id="mprPetType" value="${mpModify.mprPetType}"></input>
  	</div>
 
  	<div class="col-8 offset-md-2">
	    <label for="mprRegDate" class="form-label">작성일시</label>
	    <input class="form-control" name="mprRegDate" id="mprRegDate" value="${mpModify.mprRegDate}" readonly></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprGen" class="form-label">동물 성별</label>
	    <input class="form-control" name="mprGen" id="mprGen" value="${mpModify.mprGen}"></input>
  	</div>
  	<div class="col-8 offset-md-2">
		    <label for="mprAddFile" class="form-label">파 일</label>
		    <input type="file" class="form-control" name="mprAddFile"  id="mprAddFile" >
  		</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-primary" />
		<input type="button" value="목록보기" onclick="location.href='mprSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
