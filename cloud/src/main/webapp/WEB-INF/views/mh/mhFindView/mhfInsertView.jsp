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
	<form name="insertForm" action="mhfInsertProcess" id="insertForm" 
	class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	<div class="col-4 offset-md-2">
	    <label for="mhfWriter" class="form-label">글쓴이</label><!-- for는 아래 input의 id값과 동일시 하자 그럼 앨 찍어도 아래 인풋에 포커스가 간다 -->
	    <input type="text"class="form-control" name="mhfWriter" id="writer" placeholder="작성자를 입력해 주세요">
  	</div>
	<div class="col-4 offset-md-2">
	    <label for="mhfTitle" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mhfTitle" id="Title" placeholder="작성자를 입력해 주세요">
  	</div>
	<div class="col-4 offset-md-2">
	    <label for="mhfContent" class="form-label">내용</label>
	    <input type="text"class="form-control" name="mhfContent" id="Content" placeholder="작성자를 입력해 주세요">
  	</div>
	<div class="col-4 offset-md-2">
	    <label for="mhfInfoDate" class="form-label">목격일</label>
	    <input type="date"class="form-control" name="mhfInfoDate" id="infoDate">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprContent" class="form-label">지역</label>
	    <select class="form-control col-2" name="mhrLocalCode" id="localCode">
	    	<option value="">--선택하세요--</option>
	    	<option value="01">서울</option>
	    	<option value="02">경기</option>
	    	<option value="03">인천</option>
	    	<option value="04">대전</option>
	    	<option value="05">광주</option>
	    	<option value="06">대구</option>
	    	<option value="07">울산</option>
	    	<option value="08">부산</option>
	    	<option value="09">세종</option>
	    	<option value="10">강원</option>
	    	<option value="11">충북</option>
	    	<option value="12">충남</option>
	    	<option value="13">전북</option>
	    	<option value="14">전남</option>
	    	<option value="15">경북</option>
	    	<option value="16">경남</option>
	    	<option value="17">제주</option>
	    </select>
  	</div>
     <div class="col-5 offset-md-2">
       	<label for="zipcode" class="form-label">상세위치</label><br>
		<input type="text" class="form-control" name="mhrLocalDetail" id="addr1" readonly>
		<input type="button" class="btn btn-secondary" id="btnZipcode" value="상세위치 찾기"><br>
	</div>
	<div class="col-4 offset-md-2">
	    <label for="mhfSecretYn" class="form-label">비밀글</label>
	    <input type="text"class="form-control" name="mhfSecretYn" id="secret">
  	</div>
	<div class="col-4 offset-md-2">
	    <label for="mhfGen" class="form-label">성별</label>
	    <input type="text"class="form-control" name="mhfGen" id="gen">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mmNo" class="form-label">회원번호</label>
	    <input class="form-control" name="mmNo" id="mmNo"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhfAddFile" class="form-label">파일</label>
	    <input type="file" class="form-control" name="mhfAddFile" id="mnAddFile">
  	</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-primary" id = "insert"/>
				&nbsp;&nbsp;
		<input type="button" value="목록보기" 
					onclick="location.href='mhfSelectList'" class="btn btn-primary"/>
  	</div>
  	
	</form>
</div><!-- content end  -->
