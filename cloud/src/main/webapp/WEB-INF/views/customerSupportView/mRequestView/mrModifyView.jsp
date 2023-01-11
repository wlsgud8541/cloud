<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">건의게시판 수정하기</h2>
		</div>
	</div>  
	<form name="mrUpdateForm" action="mrUpdateProcess" id="mrUpdateForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	  	<!-- 테스트를 위한 임시 회원 번호 -->
	  	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${sessionScope.mmNo }">
		<input type="hidden" class="form-control" name="mreNo" value="${mrequest.mreNo}">
		<input type="hidden" class="form-control" name="pageNum" value="${pageNum}">
	  	
	  	<div class="col-4 offset-md-2">
		    <label for="writer" class="form-label">글쓴이</label>
		    <input type="text" class="form-control" name="mreWriter"  id="mreWriter" placeholder="작성자를 입력해 주세요" value="${sessionScope.userId }"readonly>
  		</div>
  		<div class="col-8 offset-md-2">
		    <label for="title" class="form-label">제 목</label>
		    <input type="text" class="form-control" name="mreTitle"  id="mreTitle" value="${mrequest.mreTitle}">
  		</div>
		<div class="col-8 offset-md-2">
		    <label for="content" class="form-label">내 용</label>
		    <textarea class="form-control" name="mreContent" id="mreContent" rows="10">${mrequest.mreContent}</textarea>
  		</div>	
  		<div class="col-8 offset-md-2">
		    <label for="title" class="form-label">첨부파일</label>
		    <input type="file" class="form-control" name="mreAddFile"  id="mreAddFile" >
  		</div>
  		<div class="col-8 offset-md-2 text-center mt-5">
		   <input type="submit" value="수정하기" class="btn btn-success"/>&nbsp;&nbsp;
		   <input type="button" value="목록보기" onclick="location.href='mrSelectList?pageNum=${pageNum}'" class="btn btn-success"/>
  		</div>	
	</form>
</div>     