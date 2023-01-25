<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">임시보호 게시판 수정</h2>
		</div>
	</div>
	<form name="mppUpdateProcess" action="mppUpdateProcess" id="mppUpdateForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${mpModify.mmNo}">
	<input type="hidden" class="form-control" name="mppNo" id="mppNo" value="${mpModify.mppNo}">
	<input type="hidden" class="form-control" name="pageNum" id="pageNum" value="${pageNum}">
	
	<div class="col-4 offset-md-2">
	    <label for="mppTitle" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mppTitle" id="title" value="${mpModify.mppTitle}">
  	</div>
  	<div class="col-5 offset-md-2">
	    <label for="mppContent" class="form-label">내용</label>
	    <textarea class="form-control textEditor" name="mppContent" id="content" >${mpModify.mppContent}</textarea>
  	</div>
  	<div class="col-2 offset-md-1">
	    <label for="mppInfoDate" class="form-label">실종 날짜</label>
	    <input type="date"class="form-control" name="mppInfoDate" id="infoDate" value='<fmt:formatDate value="${mpModify.mppInfoDate}" pattern="yyyy-MM-dd" />'>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppStatusCode" class="form-label">실종현황</label>
	    <select class="form-control col-2" name="mppStatusCode" id="mppStatusCode">
	    	<option value="01" ${mpModify.mppStatusCode == '01' ? 'selected' : ''}>실종</option>
	    	<option value="02" ${mpModify.mppStatusCode == '02' ? 'selected' : ''}>찾았어요!</option>
	    </select>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppContent" class="form-label">실종지역</label>
	    <select class="form-control col-2" name="mppLocalCode" id="localCode">
	    	<option value="">--선택하세요--</option>
	    	<option value="01" ${mpModify.mppLocalCode == '01' ? 'selected' : ''}>서울</option>
	    	<option value="02" ${mpModify.mppLocalCode == '02' ? 'selected' : ''}>경기</option>
	    	<option value="03" ${mpModify.mppLocalCode == '03' ? 'selected' : ''}>인천</option>
	    	<option value="04" ${mpModify.mppLocalCode == '04' ? 'selected' : ''}>대전</option>
	    	<option value="05" ${mpModify.mppLocalCode == '05' ? 'selected' : ''}>광주</option>
	    	<option value="06" ${mpModify.mppLocalCode == '06' ? 'selected' : ''}>대구</option>
	    	<option value="07" ${mpModify.mppLocalCode == '07' ? 'selected' : ''}>울산</option>
	    	<option value="08" ${mpModify.mppLocalCode == '08' ? 'selected' : ''}>부산</option>
	    	<option value="09" ${mpModify.mppLocalCode == '09' ? 'selected' : ''}>세종</option>
	    	<option value="10" ${mpModify.mppLocalCode == '10' ? 'selected' : ''}>강원</option>
	    	<option value="11" ${mpModify.mppLocalCode == '11' ? 'selected' : ''}>충북</option>
	    	<option value="12" ${mpModify.mppLocalCode == '12' ? 'selected' : ''}>충남</option>
	    	<option value="13" ${mpModify.mppLocalCode == '13' ? 'selected' : ''}>전북</option>
	    	<option value="14" ${mpModify.mppLocalCode == '14' ? 'selected' : ''}>전남</option>
	    	<option value="15" ${mpModify.mppLocalCode == '15' ? 'selected' : ''}>경북</option>
	    	<option value="16" ${mpModify.mppLocalCode == '16' ? 'selected' : ''}>경남</option>
	    	<option value="17" ${mpModify.mppLocalCode == '17' ? 'selected' : ''}>제주</option>
	    </select>
  	</div>
     <div class="col-5 offset-md-2">
       	<label for="zipcode" class="form-label">상세위치</label><br>
		<input type="text" class="form-control" name="mppLocalDetail" id="addr1" value="${mpModify.mppLocalDetail}" readonly>
		<input type="button" class="btn btn-secondary" id="btnZipcode" value="상세위치 찾기"><br>
	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppPetType" class="form-label">동물 종류</label>
	    <select class="form-control col-2" name="mppPetType" id="mppPetType">
	    	<option value="">--선택하세요--</option>
	    	<option value="01" ${mpModify.mppPetType == '01' ? 'selected' : ''}>강아지</option>
	    	<option value="02" ${mpModify.mppPetType == '02' ? 'selected' : ''}>고양이</option>
	    	<option value="03" ${mpModify.mppPetType == '03' ? 'selected' : ''}>기타(내용에 동물종류를 기재해주세요)</option>
	    </select>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mppGen" class="form-label">동물 성별</label>
	     <select class="form-control col-2" name="mppGen" id="gen">
	    	<option value="M " ${mpModify.mppGen == 'M ' ? 'selected' : ''}>수컷</option>
	    	<option value="F " ${mpModify.mppGen == 'F ' ? 'selected' : ''}>암컷</option>
    	</select>
  	</div>
  	<div class="col-8 offset-md-2">
		    <label for="mppAddFile" class="form-label">파 일</label>
		    <input type="file" class="form-control" name="mppAddFile"  id="addFile" >
		    <div class="text-secondary px-2">파일을 선택하지 않으면 기존에 선택된 파일이 유지됩니다.</div>
  		</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="수정하기" class="btn btn-primary" id="insert" />
		<input type="button" value="목록보기" onclick="location.href='mppSelectList'" class="btn btn-primary"/>
  	</div>
	</form>
</div><!-- content end  -->
