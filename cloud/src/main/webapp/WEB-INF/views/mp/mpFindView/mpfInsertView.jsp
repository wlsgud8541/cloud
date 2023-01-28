<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<form name="mpfInsert" action="mpfInsertProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${sessionScope.mmNo}">
	<input type="hidden" class="form-control" name="mpfRegDate" id="mpfRegDate">
	<input type="hidden" class="form-control" name="mpfWriter" id="writer" value="${sessionScope.userId} ">
	
	<div class="col-8 offset-md-2"> 
		<div class="row mb-2">
			<div class="col-12">
			    <label for="mpfTitle" class="form-label border-bottom border-2 border-primary border-opacity-25">제목</label>
		  		<input type="text"class="form-control rounded-0" name="mpfTitle" id="title">
		  	</div>
		</div>
		
		<div class="row mb-2">
			<div class="col-6">
			    <label for="mpfPetType" class="form-label border-bottom border-2 border-primary border-opacity-25">동물 종류</label>
			    <select class="form-control col-2 rounded-0" name="mpfPetType" id="pettype">
			    	<option value="0">--선택하세요--</option>
			    	<option value="01">강아지</option>
			    	<option value="02">고양이</option>
			    	<option value="03">기타(내용에 동물종류를 기재해주세요)</option>
			    </select>
		  	</div>
		 	<div class="col-6">
			    <label for="mpfInfoDate" class="form-label border-bottom border-2 border-primary border-opacity-25">발견 일시</label>
		   		<input type="date"class="form-control rounded-0" name="mpfInfoDate" id="infoDate">
		  	</div>
		</div>
		
		<div class="row mb-2">
		  	<div class="col-4">
			    <label for="mpfLocalCode" class="form-label border-bottom border-2 border-primary border-opacity-25">실종지역</label>
		  	 	<select class="form-control col-2 rounded-0" name="mpfLocalCode" id="localCode">
				   	<option value="0">--선택하세요--</option>
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
		  	<div class="col-8" style="margin-right: 0px; padding-right: 0px;">
		       	<label for="zipcode" class="form-label border-bottom border-2 border-primary border-opacity-25">상세위치</label><br>
				<div class="row">
					<div class="col-9">
						<input type="text" class="form-control rounded-0" name="mpfLocalDetail" id="addr1" readonly>
					</div>
					<div class="col-2" style="padding-left: 0px;">
						<input type="button" class="btn btn-secondary rounded-0" id="btnZipcode" value="상세위치 찾기"><br>
					</div>
				</div>
			</div>
	  	</div>
		
		<div class="col-12">
	  		<div class="">
			    <textarea class="form-control textEditor" name="mpfContent" id="content"></textarea>
	  		</div>
	  	</div>
	
	  	<div class="col-12">
		    <input type="file" class="form-control rounded-0" name="mpfAddFile" id="addFile" >
		</div>
	  	<div class="col-8 text-center offset-md-2 text-center mt-3">
			<input type="submit" value="등록하기" class="btn btn-primary" id="insert" />
			<input type="button" value="목록보기" onclick="location.href='mpfSelectList'" class="btn btn-primary"/>
	  	</div>
  	</div>
	</form>
</div><!-- content end  -->
