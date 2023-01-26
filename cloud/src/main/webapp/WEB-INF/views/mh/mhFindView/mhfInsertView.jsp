<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<div class="w3-content row" id="global-content">
	<form name="insertForm" action="mhfInsertProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	    <input type="hidden" name="mmNo" value="${sessionScope.mmNo}">
		<input type="hidden" name="mhfNo" value="${mhfind.mhfNo}">
		<input type="hidden" name="mhfWriter" id="writer" value="${sessionScope.userId}">
		<div class="col-12">
		    <label for="mhfTitle" class="form-label border-bottom border-2 border-danger border-opacity-25">제목</label>
		    <input type="text"class="form-control rounded-0" name="mhfTitle" id="title" >
	  	</div>
		<div class="col-5">
		    <label for="mhfGen" class="form-label border-bottom border-2 border-danger border-opacity-25">대상 성별</label>
		    <select class="form-control rounded-0" name="mhfGen" id="gen">
		    	<option value="">--선택하세요--</option>
		    	<option value="M">남자</option>
		    	<option value="F">여자</option>
		    </select>
	  	</div>
		<div class="col-6 offset-md-1">
		    <label for="mhfInfoDate" class="form-label border-bottom border-2 border-danger border-opacity-25">목격일</label>
		    <input type="date"class="form-control rounded-0" name="mhfInfoDate" id="infoDate">
	  	</div>
	  	<div class="col-5">
		    <label for="mprContent" class="form-label border-bottom border-2 border-danger border-opacity-25">지역</label>
		    <select class="form-control rounded-0" name="mhfLocalCode" id="localCode">
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
	     <div class="col-6 offset-md-1">
	       	<label for="zipcode" class="form-label border-bottom border-2 border-danger border-opacity-25 ">상세위치</label><br>
	       	<div class="row">
		       	<div class="col-9 p-0">
					<input type="text" class=" form-control rounded-0 inblock" name="mhfLocalDetail" id="addr1" readonly>
		       	</div>
		       	<div class="col-2 p-0">
					<input type="button" class=" btn btn-secondary rounded-0 float-start" id="btnZipcode" value="상세위치 찾기">
		       	</div>
	       	</div>
		</div>
		<div class="col-12">
		    <textarea class="form-control textEditor" name="mhfContent" id="content"></textarea>
	  	</div>
	  	<div class="col-12">
		    <input type="file" class="form-control rounded-0" name="mhfAddFile" id="mnAddFile">
	  	</div>
		
	  	<div class="col-12 text-center  text-center mt-3">
			<input type="submit" value="등록하기" class="btn btn-danger" id = "insert"/>
					&nbsp;&nbsp;
			<input type="button" value="목록보기" 
						onclick="location.href='mhfSelectList'" class="btn btn-danger"/>
	  	</div>
	  	
	</form>
</div><!-- content end  -->
