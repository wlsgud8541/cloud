<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">공지사항 게시판 수정하기</h2>
		</div>
	</div>  
	<form name="mnUpdateForm" action="mnUpdateProcess" id="mnUpdateForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	  	<!-- 테스트를 위한 임시 회원 번호 -->
	  	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${sessionScope.mmNo}">
		<input type="hidden" class="form-control" name="mnNo" value="${mnotice.mnNo}">
		<input type="hidden" class="form-control" name="pageNum" value="${pageNum}">
	  	
	  	<div class="col-4 offset-md-2">
		    <label for="writer" class="form-label">글쓴이</label>
		    <input type="text" class="form-control" name="mnWriter"  id="mnWriter" placeholder="작성자를 입력해 주세요" value="${sessionScope.userId}">
  		</div>
  		<div class="col-8 offset-md-2">
		    <label for="title" class="form-label">제 목</label>
		    <input type="text" class="form-control" name="mnTitle"  id="mnTitle" value="${mnotice.mnTitle}">
  		</div>
		<div class="col-8 offset-md-2">
		    <label for="content" class="form-label">내 용</label>
		    <textarea class="form-control" name="mnContent" id="mnContent" rows="10">${mnotice.mnContent}</textarea>
  		</div>	
  		<div class="col-8 offset-md-2">
		    <label for="title" class="form-label">파 일</label>
		    <input type="file" class="form-control" name="mnAddFile"  id="mnAddFile" >
  		</div>
  		<div class="col-8 offset-md-2">
		    <label for="title" class="form-label">상단고정 여부</label>
		    <input type="radio" name="mnFixTopYn" id="mnFixTopYn_1" value="N" ${fn:trim(mnotice.mnFixTopYn) == 'N' ? 'checked' : '' } /> 미고정
		    <input type="radio" name="mnFixTopYn" id="mnFixTopYn_2" value="Y" ${fn:trim(mnotice.mnFixTopYn) == 'Y' ? 'checked' : '' } /> 고정
  		</div>
  		<div class="col-8 offset-md-2 text-center mt-5">
		   <input type="submit" value="수정하기" class="btn btn-primary"/>&nbsp;&nbsp;
		   <input type="button" value="목록보기" onclick="location.href='mnSelectList?pageNum=${pageNum}'" class="btn btn-primary"/>
  		</div>	
	</form>
</div>    