<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">QNA 게시판 글쓰기</h2>
		</div>
	</div>  
	 <form name="mqInsertForm" action="mqInsertProcess" id="mqInsertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	  	<!-- 테스트를 위한 임시 회원 번호 -->
	  	<input type="hidden" class="form-control" name="mqWriter" id="mqWriter" value="${sessionScope.userId}">
	  	
  		<div class="col-8 offset-md-2">
		    <label for="title" class="form-label">제 목</label>
		    <input type="text" class="form-control" name="mqTitle" id="mqTitle" >
  		</div>
		<div class="col-8 offset-md-2">
		    <label for="content" class="form-label">내 용</label>
		    <textarea class="form-control" name="mqContent" id="mqContent" rows="10"></textarea>
  		</div>	
  		<div class="col-8 offset-md-2 text-center mt-5">
		   <input type="submit" value="등록하기" class="btn btn-primary"/>&nbsp;&nbsp;
		   <input type="button" value="목록보기" onclick="location.href='mqSelectList'" class="btn btn-primary"/>
  		</div>	
	</form>
</div>    