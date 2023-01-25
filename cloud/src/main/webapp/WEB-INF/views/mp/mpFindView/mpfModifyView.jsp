<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">목격 게시판 수정</h2>
		</div>
	</div>
	<form name="mpfUpdateProcess" action="mpfUpdateProcess" id="mpfUpdateForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${mpModify.mmNo}">
	<input type="hidden" class="form-control" name="mpfNo" id="mpfNo" value="${mpModify.mpfNo}">
	<input type="hidden" class="form-control" name="pageNum" id="pageNum" value="${pageNum}">
	
	<div class="col-5 offset-md-2">
	    <label for="mpfTitle" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mpfTitle" id="title" value="${mpModify.mpfTitle}">
  	</div>
  	<div class="col-5 offset-md-2">
	    <label for="mpfContent" class="form-label">내용</label>
	    <textarea class="form-control textEditor" name="mpfContent" id="content">${mpModify.mpfContent}</textarea>
  	</div>
  	<div class="col-2 offset-md-1">
	    <label for="mpfInfoDate" class="form-label">발견 일시</label>
	    <input type="date"class="form-control" name="mpfInfoDate" id="infoDate" value='<fmt:formatDate value="${mpModify.mpfInfoDate}" pattern="yyyy-MM-dd" />'>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfLocalCode" class="form-label">지역</label>
	    <select class="form-control col-2" name="mpfLocalCode" id="localCode">
	    	<option value="01" ${mpModify.mpfLocalCode == '01' ? 'selected' : ''}>서울</option>
	    	<option value="02" ${mpModify.mpfLocalCode == '02' ? 'selected' : ''}>경기</option>
	    	<option value="03" ${mpModify.mpfLocalCode == '03' ? 'selected' : ''}>인천</option>
	    	<option value="04" ${mpModify.mpfLocalCode == '04' ? 'selected' : ''}>대전</option>
	    	<option value="05" ${mpModify.mpfLocalCode == '05' ? 'selected' : ''}>광주</option>
	    	<option value="06" ${mpModify.mpfLocalCode == '06' ? 'selected' : ''}>대구</option>
	    	<option value="07" ${mpModify.mpfLocalCode == '07' ? 'selected' : ''}>울산</option>
	    	<option value="08" ${mpModify.mpfLocalCode == '08' ? 'selected' : ''}>부산</option>
	    	<option value="09" ${mpModify.mpfLocalCode == '09' ? 'selected' : ''}>세종</option>
	    	<option value="10" ${mpModify.mpfLocalCode == '10' ? 'selected' : ''}>강원</option>
	    	<option value="11" ${mpModify.mpfLocalCode == '11' ? 'selected' : ''}>충북</option>
	    	<option value="12" ${mpModify.mpfLocalCode == '12' ? 'selected' : ''}>충남</option>
	    	<option value="13" ${mpModify.mpfLocalCode == '13' ? 'selected' : ''}>전북</option>
	    	<option value="14" ${mpModify.mpfLocalCode == '14' ? 'selected' : ''}>전남</option>
	    	<option value="15" ${mpModify.mpfLocalCode == '15' ? 'selected' : ''}>경북</option>
	    	<option value="16" ${mpModify.mpfLocalCode == '16' ? 'selected' : ''}>경남</option>
	    	<option value="17" ${mpModify.mpfLocalCode == '17' ? 'selected' : ''}>제주</option>
	    </select>
  	</div>
     <div class="col-5 offset-md-2">
       	<label for="zipcode" class="form-label">상세위치</label><br>
		<input type="text" class="form-control" name="mpfLocalDetail" id="addr1" value="${mpModify.mpfLocalDetail}" readonly>
		<input type="button" class="btn btn-secondary" id="btnZipcode" value="상세위치 찾기"><br>
	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mpfPetType" class="form-label">동물 종류</label>
	    <select class="form-control col-2" name="mpfPetType" id="mpfPetType">
	    	<option value="">--선택하세요--</option>
	    	<option value="01" ${mpModify.mpfPetType == '01' ? 'selected' : ''}>강아지</option>
	    	<option value="02" ${mpModify.mpfPetType == '02' ? 'selected' : ''}>고양이</option>
	    	<option value="03" ${mpModify.mpfPetType == '03' ? 'selected' : ''}>기타(내용에 동물종류를 기재해주세요)</option>
	    </select>
  	</div>
  	<div class="col-8 offset-md-2">
		    <label for="mpfAddFile" class="form-label">파 일</label>
		    <input type="file" class="form-control" name="mpfAddFile"  id="addFile" >
		    <div class="text-secondary px-2">파일을 선택하지 않으면 기존에 선택된 파일이 유지됩니다.</div>
  		</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="수정하기" class="btn btn-primary" id="insert" />
		<input type="button" value="목록보기" onclick="location.href='mpfSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
