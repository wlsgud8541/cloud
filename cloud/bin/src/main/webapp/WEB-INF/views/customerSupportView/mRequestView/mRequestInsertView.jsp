<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">건의사항 게시판 글쓰기</h2>
		</div>
	</div>  
	<form name="mrInsertForm" action="mrInsertProcess" id="mrInsertForm" class="row g-3 border-primary" method="post">
	  	<!-- 테스트를 위한 임시 회원 번호 -->
	  	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value= 1>
	  	
	  	<div class="col-4 offset-md-2">
		    <label for="writer" class="form-label">글쓴이</label>
		    <input type="text" class="form-control" name="mreWriter"  id="mreWriter" placeholder="작성자를 입력해 주세요" value="로그인유저">
  		</div>
  		<div class="col-8 offset-md-2">
		    <label for="title" class="form-label">제 목</label>
		    <input type="text" class="form-control" name="mreTitle"  id="mreTitle">
  		</div>
		<div class="col-8 offset-md-2">
		    <label for="content" class="form-label">내 용</label>
		    <textarea class="form-control" name="mreContent" id="mreContent" rows="15" >※ 답변 대기/ 완료 카테고리에서 건의내용을 확인해보세요.
※ 웹사이트이용과 관련된 건의사항을 작성해주시기 바랍니다.
※ 건의 게시글 작성 시 하나의 게시글 당 하나의 건의사항을 작성해주시기 바랍니다.
※ [필수 기재사항] 누락 시 답변 대기 게시글로 선정되지 않을 수 있습니다. (작성 양식을 그대로 사용 부탁드립니다.)


[필수 기재 사항]
1) 건의 내용 : 

2) 건의 사유 : 

3) 개선 방안 : </textarea>
  		</div>	
  		<!-- <div class="col-8 offset-md-2">
		    <label for="title" class="form-label">파 일</label>
		    <input type="file" class="form-control" name="mnAddFile"  id="mnAddFile" >
  		</div> -->
  		<div class="col-8 offset-md-2 text-center mt-5">
		   <input type="submit" value="등록하기" class="btn btn-primary"/>&nbsp;&nbsp;
		   <input type="button" value="목록보기" onclick="location.href='mrSelectList'" class="btn btn-primary"/>
  		</div>	
	</form>
</div>    