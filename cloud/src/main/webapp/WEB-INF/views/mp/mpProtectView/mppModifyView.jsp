<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">게시글 쓰기</h2>
		</div>
	</div>
	<form name="mppUpdateProcess" action="mppUpdateProcess" id="mppUpdateForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${mpModify.mmNo}">
	<input type="hidden" class="form-control" name="mppNo" id="mppNo" value="${mpModify.mppNo}">
	<input type="hidden" class="form-control" name="pageNum" id="pageNum" value="${pageNum}">
	
	<div class="col-4 offset-md-2">
	    <label for="mppTitle" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mppTitle" id="mppTitle" value="${mpModify.mppTitle}">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppWriter" class="form-label">작성자</label>
	    <input class="form-control" name="mppWriter" id="mppWriter" value="${mpModify.mppWriter}" readonly></input>
  	</div>
  	<div class="col-4">
	    <label for="mppContent" class="form-label">내용</label>
	    <input class="form-control" name="mppContent" id="mppContent" value="${mpModify.mppContent}"></input>
  	</div>
  	<div class="col-4">
	    <label for="mppInfoDate" class="form-label">실종 날짜</label>
	    <input type="text"class="form-control" name="mppInfoDate" id="mppInfoDate" value="${mpModify.mppInfoDate}">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppLocalCode" class="form-label">지역 코드</label>
	    <input class="form-control" name="mppLocalCode" id="mppLocalCode" value="${mpModify.mppLocalCode}"></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppPetType" class="form-label">동물 종류</label>
	    <input class="form-control" name="mppPetType" id="mppPetType" value="${mpModify.mppPetType}"></input>
  	</div>
 
  	<div class="col-8 offset-md-2">
	    <label for="mppRegDate" class="form-label">작성일시</label>
	    <input class="form-control" name="mppRegDate" id="mppRegDate" value="${mpModify.mppRegDate}" readonly></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppGen" class="form-label">동물 성별</label>
	    <input class="form-control" name="mppGen" id="mppGen" value="${mpModify.mppGen}"></input>
  	</div>
  	<div class="col-8 offset-md-2">
		    <label for="mppAddFile" class="form-label">파 일</label>
		    <input type="file" class="form-control" name="mppAddFile"  id="addFile" >
  		</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-primary" />
		<input type="button" value="목록보기" onclick="location.href='mppSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
