<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">게시글 쓰기</h2>
		</div>
	</div>
	<form name="mpfUpdateProcess" action="mpfUpdateProcess" id="mpfUpdateForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${mpModify.mmNo}">
	<input type="hidden" class="form-control" name="mpfNo" id="mpfNo" value="${mpModify.mpfNo}">
	<input type="hidden" class="form-control" name="pageNum" id="pageNum" value="${pageNum}">
	
	<div class="col-4 offset-md-2">
	    <label for="mpfTitle" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mpfTitle" id="mpfTitle" value="${mpModify.mpfTitle}">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfWriter" class="form-label">작성자</label>
	    <input class="form-control" name="mpfWriter" id="mpfWriter" value="${mpModify.mpfWriter}" readonly></input>
  	</div>
  	<div class="col-4">
	    <label for="mpfContent" class="form-label">내용</label>
	    <input class="form-control" name="mpfContent" id="mpfContent" value="${mpModify.mpfContent}"></input>
  	</div>
  	<div class="col-4">
	    <label for="mpfInfoDate" class="form-label">실종 날짜</label>
	    <input type="text"class="form-control" name="mpfInfoDate" id="mpfInfoDate" value="${mpModify.mpfInfoDate}">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfStatusCode" class="form-label">상태코드</label>
	    <input type="text"class="form-control" name="mpfStatusCode" id="mpfStatusCode" value="${mpModify.mpfStatusCode}">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfLocalCode" class="form-label">지역 코드</label>
	    <input class="form-control" name="mpfLocalCode" id="mpfLocalCode" value="${mpModify.mpfLocalCode}"></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfPetType" class="form-label">동물 종류</label>
	    <input class="form-control" name="mpfPetType" id="mpfPetType" value="${mpModify.mpfPetType}"></input>
  	</div>
 
  	<div class="col-8 offset-md-2">
	    <label for="mpfRegDate" class="form-label">작성일시</label>
	    <input class="form-control" name="mpfRegDate" id="mpfRegDate" value="${mpModify.mpfRegDate}" readonly></input>
  	</div>
  	<div class="col-8 offset-md-2">
		    <label for="mpfAddFile" class="form-label">파 일</label>
		    <input type="file" class="form-control" name="mpfAddFile"  id="mpfAddFile" >
  		</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-primary" />
		<input type="button" value="목록보기" onclick="location.href='mpfSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
