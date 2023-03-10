<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<div class="row" id="global-content">
	 <form name="mnInsertForm" action="mnInsertProcess" id="insertForm" class="row g-3 border-success" method="post" enctype="multipart/form-data">
	<!-- <form name="mnInsertForm" action="mnInsertProcess" id="mnInsertForm" class="row g-3 border-success" method="post"> -->
	  	<!-- 테스트를 위한 임시 회원 번호 -->
	  	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${sessionScope.mmNo}">
	    <input type="hidden" class="form-control" name="mnWriter" id="writer" placeholder="작성자를 입력해 주세요" value="${sessionScope.userId}">
	  	
  		<div class="col-8 offset-md-2">
		    <label for="title" class="form-label">제 목</label>
		    <input type="text" class="form-control" name="mnTitle" id="title" >
  		</div>
		<div class="col-8 offset-md-2">
		    <label for="content" class="form-label">내 용</label>
		    <textarea class="form-control textEditor" name="mnContent" id="content" rows="10"></textarea>
  		</div>	
  		<div class="col-8 offset-md-2">
		    <input type="file" class="form-control" name="mnAddFile" id="addFile" >
  		</div>
  		<div class="col-8 offset-md-2">
		    <label for="title" class="form-label">상단고정 여부</label>
		    <input type="radio" name="mnFixTopYn" id="fixTopYn" value="N" checked> 미고정
		    <input type="radio" name="mnFixTopYn" id="fixTopYn" value="Y"> 고정
  		</div>
  		<div class="col-8 offset-md-2 text-center mt-5">
		   <input type="submit" id="insert" value="등록하기" class="btn btn-success"/>&nbsp;&nbsp;
		   <input type="button" value="목록보기" onclick="location.href='mnSelectList'" class="btn btn-success"/>
  		</div>	
	</form>
</div>    