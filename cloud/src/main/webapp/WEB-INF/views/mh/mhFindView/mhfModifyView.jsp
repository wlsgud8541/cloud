<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">게시글 쓰기</h2>
		</div>
	</div>
	<form name="mhfUpdateProcess" action="mhfUpdateProcess" id="modifyForm" 
	class="row g-3 border-primary" method="post" enctype="multipart/form-data">
		<div class="col-4 offset-md-2">
		    <label for="mhfNo" class="form-label">글번호</label><!-- for는 아래 input의 id값과 동일시 하자 그럼 앨 찍어도 아래 인풋에 포커스가 간다 -->
		    <input type="text"class="form-control" name="mhfNo" id="writer" value="${mhfind.mhfNo}" readonly>
	  	</div>
		<div class="col-4 offset-md-2">
		    <label for="mhfWriter" class="form-label">글쓴이</label><!-- for는 아래 input의 id값과 동일시 하자 그럼 앨 찍어도 아래 인풋에 포커스가 간다 -->
		    <input type="text"class="form-control" name="mhfWriter" id="writer" value="${mhfind.mhfWriter}" readonly>
	  	</div>
		<div class="col-4 offset-md-2">
		    <label for="mhfTitle" class="form-label">제목</label>
		    <input type="text"class="form-control" name="mhfTitle" id="Title" value="${mhfind.mhfTitle}">
	  	</div>
		<div class="col-4 offset-md-2">
		    <label for="mhfContent" class="form-label">내용</label>
		    <input type="text"class="form-control" name="mhfContent" id="Content" value="${mhfind.mhfContent}">
	  	</div>
		<div class="col-4 offset-md-2">
		    <label for="mhfInfoDate" class="form-label">목격일</label>
		    <input type="date"class="form-control" name="mhfInfoDate" id="infoDate" value="${mhfind.mhfInfoDate}">
	  	</div>
		<div class="col-4 offset-md-2">
		    <label for="mhfSecretYn" class="form-label">비밀글</label>
		    <input type="text"class="form-control" name="mhfSecretYn" id="secret" value="${mhfind.mhfSecretYn}">
	  	</div>
		<div class="col-4 offset-md-2">
		    <label for="mhfGen" class="form-label">성별</label>
		    <input type="text"class="form-control" name="mhfGen" id="gen" value="${mhfind.mhfGen}">
	  	</div>
	  	<div class="col-8 offset-md-2">
		    <label for="mmNo" class="form-label"></label>
		    <input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${mhfind.mmNo}" />
	  	</div>
	  	<div class="col-8 offset-md-2">
		    <label for="mhfAddFile" class="form-label">파일</label>
		    <input type="file" class="form-control" name="mhfAddFile" id="mnAddFile" value="${mhifnd.mhfAddFile}">
	  	</div>
	  	<div class="col-8 text-center offset-md-2 text-center mt-3">
			<input type="submit" value="수정하기" class="btn btn-primary"/>
					&nbsp;&nbsp;
			<input type="button" value="목록보기" 
						onclick="location.href='mhfSelectList'" class="btn btn-primary"/>
	  	</div>
	</form>
</div><!-- content end  -->
