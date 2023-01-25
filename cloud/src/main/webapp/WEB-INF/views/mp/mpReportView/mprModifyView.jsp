<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">신고 게시판 수정</h2>
		</div>
	</div>
	<form name="mprUpdateProcess" action="mprUpdateProcess" id="mprUpdateForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${mpModify.mmNo}">
	<input type="hidden" class="form-control" name="mprNo" id="mprNo" value="${mpModify.mprNo}">
	<input type="hidden" class="form-control" name="pageNum" id="pageNum" value="${pageNum}">
	
	<div class="col-4 offset-md-2">
	    <label for="mprTitle" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mprTitle" id="title" value="${mpModify.mprTitle}">
  	</div>
  	<div class="col-5 offset-md-2">
	    <label for="mprContent" class="form-label">내용</label>
	    <textarea class="form-control textEditor" name="mprContent" id="content" >${mpModify.mprContent}</textarea>
  	</div>
  	<div class="col-2 offset-md-1">
	    <label for="mprInfoDate" class="form-label">실종 날짜</label>
	    <input type="date" class="form-control" name="mprInfoDate" id="infoDate" value='<fmt:formatDate value="${mpModify.mprInfoDate}" pattern="yyyy-MM-dd" />'>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprStatusCode" class="form-label">실종현황</label>
	    <select class="form-control col-2" name="mprStatusCode" id="mprStatusCode">
	    	<option value="01" ${mpModify.mprStatusCode == '01' ? 'selected' : ''}>실종</option>
	    	<option value="02" ${mpModify.mprStatusCode == '02' ? 'selected' : ''}>찾았어요!</option>
	    </select>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprContent" class="form-label">지역</label>
	    <select class="form-control col-2" name="mprLocalCode" id="localCode">
	    	<option value="">--선택하세요--</option>
	    	<option value="01" ${mpModify.mprLocalCode == '01' ? 'selected' : ''}>서울</option>
	    	<option value="02" ${mpModify.mprLocalCode == '02' ? 'selected' : ''}>경기</option>
	    	<option value="03" ${mpModify.mprLocalCode == '03' ? 'selected' : ''}>인천</option>
	    	<option value="04" ${mpModify.mprLocalCode == '04' ? 'selected' : ''}>대전</option>
	    	<option value="05" ${mpModify.mprLocalCode == '05' ? 'selected' : ''}>광주</option>
	    	<option value="06" ${mpModify.mprLocalCode == '06' ? 'selected' : ''}>대구</option>
	    	<option value="07" ${mpModify.mprLocalCode == '07' ? 'selected' : ''}>울산</option>
	    	<option value="08" ${mpModify.mprLocalCode == '08' ? 'selected' : ''}>부산</option>
	    	<option value="09" ${mpModify.mprLocalCode == '09' ? 'selected' : ''}>세종</option>
	    	<option value="10" ${mpModify.mprLocalCode == '10' ? 'selected' : ''}>강원</option>
	    	<option value="11" ${mpModify.mprLocalCode == '11' ? 'selected' : ''}>충북</option>
	    	<option value="12" ${mpModify.mprLocalCode == '12' ? 'selected' : ''}>충남</option>
	    	<option value="13" ${mpModify.mprLocalCode == '13' ? 'selected' : ''}>전북</option>
	    	<option value="14" ${mpModify.mprLocalCode == '14' ? 'selected' : ''}>전남</option>
	    	<option value="15" ${mpModify.mprLocalCode == '15' ? 'selected' : ''}>경북</option>
	    	<option value="16" ${mpModify.mprLocalCode == '16' ? 'selected' : ''}>경남</option>
	    	<option value="17" ${mpModify.mprLocalCode == '17' ? 'selected' : ''}>제주</option>
	    </select>
  	</div>
     <div class="col-5 offset-md-2">
       	<label for="zipcode" class="form-label">상세위치</label><br>
		<input type="text" class="form-control" name="mprLocalDetail" id="addr1" value="${mpModify.mprLocalDetail}" readonly>
		<input type="button" class="btn btn-secondary" id="btnZipcode" value="상세위치 찾기"><br>
	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprPetType" class="form-label">동물 종류</label>
	    <select class="form-control col-2" name="mprPetType" id="mprPetType">
	    	<option value="">--선택하세요--</option>
	    	<option value="01" ${mpModify.mprPetType == '01' ? 'selected' : ''}>강아지</option>
	    	<option value="02" ${mpModify.mprPetType == '02' ? 'selected' : ''}>고양이</option>
	    	<option value="03" ${mpModify.mprPetType == '03' ? 'selected' : ''}>기타(내용에 동물종류를 기재해주세요)</option>
	    </select>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mprGen" class="form-label">동물 성별</label>
	     <select class="form-control col-2" name="mprGen" id="gen">
	     	<option value="">--선택하세요--</option>
	    	<option value="M " ${mpModify.mprGen == 'M ' ? 'selected' : ''}>수컷</option>
	    	<option value="F " ${mpModify.mprGen == 'F ' ? 'selected' : ''}>암컷</option>
    	</select>
  	</div>
  	<div class="col-8 offset-md-2">
		    <label for="mprAddFile" class="form-label">파 일</label>
		    <input type="file" class="form-control" name="mprAddFile"  id="addFile" value="${mpModify.mprAddFile}">
		    <input type="text" class="form-control" name="mprAddFile"  id="addFile" value="${mpModify.mprAddFile}">
		    <div class="text-secondary px-2">파일을 선택하지 않으면 기존에 선택된 파일이 유지됩니다.</div>
  		</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="수정하기" class="btn btn-primary" id="insert" />
		<input type="button" value="목록보기" onclick="location.href='mprSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
