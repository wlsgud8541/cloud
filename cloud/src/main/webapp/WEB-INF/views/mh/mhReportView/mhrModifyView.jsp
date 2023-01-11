<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<form name = "mhrUpdateProcess" action = "mhrUpdateProcess" id = "modifyForm" enctype="multipart/form-data"
method="post">
    <input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${mhReport.mmNo}" readonly>
 	<div class="col-8 offset-md-2">
	    <label for="mhrNo" class="form-label">글번호</label>
	    <input type="text" class="form-control" name="mhrNo" id="mhrNo" value="${mhReport.mhrNo}" readonly>
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrTitle" class="form-label">제목</label>
	    <input type="text" class="form-control" name="mhrTitle" id="mhrTitle" value="${mhReport.mhrTitle}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrContent" class="form-label">내용</label>
	    <input type="text" class="form-control" name="mhrContent" id="mhrContent" value="${mhReport.mhrContent}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrName" class="form-label">실종자 이름</label>
	    <input type="text" class="form-control" name="mhrName" id="mhrName"  value="${mhReport.mhrName}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrMage" class="form-label">실종 당시 나이</label>
	    <input type="text" class="form-control" name="mhrMage" id="mhrMage" value="${mhReport.mhrMage}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrage" class="form-label">현재나이</label>
	    <input type="text" class="form-control" name="mhrage" id="mhrage" value="${mhReport.mhrage}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrInfoDate" class="form-label">실종일</label>
	     <input type="date" class="form-control" id ="infoDate" name="mhrInfoDate" value="${mhReport.mhrInfoDate}"/>
  	</div>	
 	<div class="col-8 offset-md-2">
	    <label for="mhrRegDate" class="form-label">작성일</label>
	     <input type="text" class="form-control" id ="mhrRegDate" name="mhrRegDate" value="${mhReport.mhrRegDate}" pattern="yyyy-MM-dd" readonly/>
  	</div>	
 	<div class="col-8 offset-md-2">
	    <label for="mhrNation" class="form-label">국적</label>
	    <input type="text" class="form-control" name="mhrNation" id="mhrNation" value="${mhReport.mhrNation }" readonly>
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrIllCode" class="form-label">실종자코드값</label>
	    <input type="text" class="form-control" name="mhrIllCode" id="mhrIllCode" value="${mhReport.mhrIllCode}" readonly>
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrStatusCode" class="form-label">실종자 상태 코드</label>
	    <input type="text" class="form-control" name="mhrStatusCode" id="mhrStatusCode" value="${mhReport.mhrStatusCode}" readonly>
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrLocalCode" class="form-label">실종자 지역 코드</label>
	    <input type="text" class="form-control" name="mhrLocalCode" id="mhrLocalCode" value="${mhReport.mhrLocalCode}" readonly>
  	</div>
 
 	<div class="col-8 offset-md-2">
	    <label for="mhrGen" class="form-label">실종자 성별</label>
	    <input type="text" class="form-control" name="mhrGen" id="mhrGen" value="${mhReport.mhrGen}" readonly>
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrHeight" class="form-label">실종자 키</label>
	    <input type="text" class="form-control" name="mhrHeight" id="mhrHeight" value="${mhReport.mhrHeight}" >
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrWeight" class="form-label">실종자 몸무게</label>
	    <input type="text" class="form-control" name="mhrWeight" id="mhrWeight" value="${mhReport.mhrWeight}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrPhysical" class="form-label">실종자 체격</label>
	    <input type="text" class="form-control" name="mhrPhysical" id="mhrPhysical" value="${mhReport.mhrPhysical}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrFace" class="form-label">실종자 얼굴형</label>
	    <input type="text" class="form-control" name="mhrFace" id="mhrFace" value="${mhReport.mhrFace}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrHairColor" class="form-label">실종자 두발색상</label>
	    <input type="text" class="form-control" name="mhrHairColor" id="mhrHairColor" value="${mhReport.mhrHairColor}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrHair" class="form-label">실종자 두발형태</label>
	    <input type="text" class="form-control" name="mhrHair" id="mhrHair" value="${mhReport.mhrHair}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrWear" class="form-label">실종자 착의의상</label>
	    <input type="text" class="form-control" name="mhrWear" id="mhrWear" value="${mhReport.mhrWear}">
  	</div>
 	<div class="col-8 offset-md-2">
	    <label for="mhrAddFile" class="form-label">첨부파일</label>
	    <input type="file" class="form-control" name="mhrAddFile" id="mhrWear" value="${mhReport.mhrAddFile}">
  	</div>
  	
  	<input type="submit" value="수정하기" class="btn">
</form>
</body>
