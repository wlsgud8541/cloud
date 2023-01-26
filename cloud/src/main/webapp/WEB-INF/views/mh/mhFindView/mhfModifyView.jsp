<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<div class="w3-content row" id="global-content">
	<div class="row my-3 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold ">게시글 수정</h2>
			<p class="border border-bottom border-danger border-2" style="width: 150px; display: inline-block; margin-bottom: 0px;"></p>
		</div>
	</div>
	<form name="mhfUpdateProcess" action="mhfUpdateProcess" id="modifyForm" 
	class="row g-3 border-primary" method="post" enctype="multipart/form-data">
		<div class="col-12">
		    <label for="mhfTitle" class="form-label">제목</label>
		    <input type="text"class="form-control rounded-0" name="mhfTitle" id="Title" value="${mhfind.mhfTitle}">
	  	</div>
		<div class="col-5">
		    <label for="mhfGen" class="form-label">대상 성별</label>
		    <select class="form-control rounded-0" name="mhfGen" id="gen">
		    	<option value="">--선택하세요--</option>
		    	<option value="M" ${mhfind.mhfGen == 'M ' ? 'selected' : ''}>남자</option>
	    		<option value="F" ${mhfind.mhfGen == 'F ' ? 'selected' : ''}>여자</option>
		    </select>
	  	</div>
		<div class="col-6 offset-md-1">
		    <label for="mhfInfoDate" class="form-label">목격일</label>
		    <input type="date"class="form-control rounded-0" name="mhfInfoDate" id="infoDate" value='<fmt:formatDate value="${mhfind.mhfInfoDate}" pattern="yyyy-MM-dd"/>'>
	  	</div>
	  	<div class="col-5">
		    <label for="mprContent" class="form-label">지역</label>
		    <select class="form-control rounded-0" name="mhrLocalCode" id="localCode">
		    	<option value="01" ${mhfind.mhfLocalCode == '01' ? 'selected' : ''}>서울</option>
		    	<option value="02" ${mhfind.mhfLocalCode == '02' ? 'selected' : ''}>경기</option>
		    	<option value="03" ${mhfind.mhfLocalCode == '03' ? 'selected' : ''}>인천</option>
		    	<option value="04" ${mhfind.mhfLocalCode == '04' ? 'selected' : ''}>대전</option>
		    	<option value="05" ${mhfind.mhfLocalCode == '05' ? 'selected' : ''}>광주</option>
		    	<option value="06" ${mhfind.mhfLocalCode == '06' ? 'selected' : ''}>대구</option>
		    	<option value="07" ${mhfind.mhfLocalCode == '07' ? 'selected' : ''}>울산</option>
		    	<option value="08" ${mhfind.mhfLocalCode == '08' ? 'selected' : ''}>부산</option>
		    	<option value="09" ${mhfind.mhfLocalCode == '09' ? 'selected' : ''}>세종</option>
		    	<option value="10" ${mhfind.mhfLocalCode == '10' ? 'selected' : ''}>강원</option>
		    	<option value="11" ${mhfind.mhfLocalCode == '11' ? 'selected' : ''}>충북</option>
		    	<option value="12" ${mhfind.mhfLocalCode == '12' ? 'selected' : ''}>충남</option>
		    	<option value="13" ${mhfind.mhfLocalCode == '13' ? 'selected' : ''}>전북</option>
		    	<option value="14" ${mhfind.mhfLocalCode == '14' ? 'selected' : ''}>전남</option>
		    	<option value="15" ${mhfind.mhfLocalCode == '15' ? 'selected' : ''}>경북</option>
		    	<option value="16" ${mhfind.mhfLocalCode == '16' ? 'selected' : ''}>경남</option>
		    	<option value="17" ${mhfind.mhfLocalCode == '17' ? 'selected' : ''}>제주</option>
		    </select>
	  	</div>
	     <!-- <div class="col-6 offset-md-1 row">
	       	<label for="zipcode" class="form-label m-0">상세위치</label><br>
			<input type="text" class="col form-control rounded-0 inblock" name="mhrLocalDetail" id="addr1"readonly>
			<input type="button" class="col-3 btn btn-secondary rounded-0 float-start" id="btnZipcode" value="상세위치 찾기">
		</div> -->
		
<!-- 		내용 -->
		<div class="col-12">
		    <textarea class="form-control textEditor" name="mhfContent" id="Content" >${mhfind.mhfContent}</textarea>
	  	</div>
<!-- 	  	파일 -->
	  	<div class="col-12">
		    <input type="file" class="form-control rounded-0" name="mhfAddFile" id="mnAddFile"value="${mhifnd.mhfAddFile}">
	  	</div>
	  	<div class="col-12 text-center  text-center mt-3">
			<input type="submit" value="수정하기" class="btn btn-danger" id = "insert"/>
					&nbsp;&nbsp;
			<input type="button" value="목록보기" 
						onclick="location.href='mhfSelectList'" class="btn btn-danger"/>
	  	</div>
	  	
	</form>
</div><!-- content end  -->




<%-- 


<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">게시글 수정</h2>
		</div>
	</div>
	<form name="mhfUpdateProcess" action="mhfUpdateProcess" id="modifyForm" 
	class="row g-3 border-primary" method="post" enctype="multipart/form-data">
		<div class="col-4 offset-md-2">
		    <label for="mhfTitle" class="form-label">제목</label>
		    <input type="text"class="form-control" name="mhfTitle" id="Title" value="${mhfind.mhfTitle}">
	  	</div>
		<div class="col-4 offset-md-2">
		    <label for="mhfContent" class="form-label">내용</label>
		    <input type="text"class="form-control" name="mhfContent" id="mhfContent" value="${mhfind.mhfContent}">
	  	</div>
		<div class="col-4 offset-md-2">
		    <label for="mhfInfoDate" class="form-label">목격일</label>
		    <input type="date"class="form-control" name="mhfInfoDate" id="infoDate" value='<fmt:formatDate value="${mhfind.mhfInfoDate}" pattern="yyyy-MM-dd"/>'>
	  	</div>
	  	<div class="col-8 offset-md-2">
	    <label for="mhfLocalCode" class="form-label">지역</label>
	    <select class="form-control col-2" name="mhfLocalCode" id="localCode">
	    	<option value="01" ${mhfind.mhfLocalCode == '01' ? 'selected' : ''}>서울</option>
	    	<option value="02" ${mhfind.mhfLocalCode == '02' ? 'selected' : ''}>경기</option>
	    	<option value="03" ${mhfind.mhfLocalCode == '03' ? 'selected' : ''}>인천</option>
	    	<option value="04" ${mhfind.mhfLocalCode == '04' ? 'selected' : ''}>대전</option>
	    	<option value="05" ${mhfind.mhfLocalCode == '05' ? 'selected' : ''}>광주</option>
	    	<option value="06" ${mhfind.mhfLocalCode == '06' ? 'selected' : ''}>대구</option>
	    	<option value="07" ${mhfind.mhfLocalCode == '07' ? 'selected' : ''}>울산</option>
	    	<option value="08" ${mhfind.mhfLocalCode == '08' ? 'selected' : ''}>부산</option>
	    	<option value="09" ${mhfind.mhfLocalCode == '09' ? 'selected' : ''}>세종</option>
	    	<option value="10" ${mhfind.mhfLocalCode == '10' ? 'selected' : ''}>강원</option>
	    	<option value="11" ${mhfind.mhfLocalCode == '11' ? 'selected' : ''}>충북</option>
	    	<option value="12" ${mhfind.mhfLocalCode == '12' ? 'selected' : ''}>충남</option>
	    	<option value="13" ${mhfind.mhfLocalCode == '13' ? 'selected' : ''}>전북</option>
	    	<option value="14" ${mhfind.mhfLocalCode == '14' ? 'selected' : ''}>전남</option>
	    	<option value="15" ${mhfind.mhfLocalCode == '15' ? 'selected' : ''}>경북</option>
	    	<option value="16" ${mhfind.mhfLocalCode == '16' ? 'selected' : ''}>경남</option>
	    	<option value="17" ${mhfind.mhfLocalCode == '17' ? 'selected' : ''}>제주</option>
	    </select>
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
</div><!-- content end  --> --%>
