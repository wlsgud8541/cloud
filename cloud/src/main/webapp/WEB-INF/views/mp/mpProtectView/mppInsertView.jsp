<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- content -->
<div class="row" id="global-content">
	<form name="mppInsert" action="mppInsertProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${sessionScope.mmNo}">
	<input type="hidden" class="form-control" name="mppRegDate" id="mppRegDate">
	<input type="hidden" class="form-control" name="mppWriter" id="writer" value="${sessionScope.userId} ">
	
	<div class="col-8 offset-md-2">
		<div class="row mb-2">
			<div class="col-12">
			    <label for="mppTitle" class="form-label border-bottom border-2 border-primary border-opacity-25">제목</label>
			    <input type="text"class="form-control rounded-0" name="mppTitle" id="title">
		  	</div>
		</div>
		<div class="row mb-2">
			<div class="col-5">
			    <label for="mppContent" class="form-label border-bottom border-2 border-primary border-opacity-25">동물 종류</label>
			    <select class="form-control col-2 rounded-0" name="mppPetType" id="pettype">
			    	<option value="0">--선택하세요--</option>
			    	<option value="01">강아지</option>
			    	<option value="02">고양이</option>
			    	<option value="03">기타(내용에 동물종류를 기재해주세요)</option>
			    </select>
		  	</div>
		 	
		  	<div class="col-4">
			    <label for="mppLocalCode" class="form-label border-bottom border-2 border-primary border-opacity-25">동물 성별</label>
			    <select class="form-control col-2 rounded-0" name="mppGen" id="gen">
			   		<option value="0">--선택하세요--</option>
			    	<option value="M">수컷</option>
			    	<option value="F">암컷</option>
		    	</select>
		  	</div>
		
		  	<div class="col-3">
			    <label for="mppInfoDate" class="form-label border-bottom border-2 border-primary border-opacity-25">임시보호 날짜</label>
		 	    <input type="date"class="form-control rounded-0" name="mppInfoDate" id="infoDate">
		  	</div>
		</div>
		
		<div class="row mb-2">
		  	<div class="col-2">
			    <label for="mppStatusCode" class="form-label border-bottom border-2 border-primary border-opacity-25">실종현황</label>
			    <select class="form-control col-2 rounded-0" name="mppStatusCode" id="statuscode">
			    	<option value="0">--선택하세요--</option>
			    	<option value="01">실종</option>
			    	<option value="02">찾았어요!</option>
			    </select>
		  	</div>
		  	<div class="col-3">
			    <label for="mppContent" class="form-label border-bottom border-2 border-primary border-opacity-25">실종지역</label>
			    <select class="form-control col-2 rounded-0" name="mppLocalCode" id="localCode">
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
		  	 <div class="col-7">
		       	<label for="zipcode" class="form-label border-bottom border-2 border-primary border-opacity-25">상세위치</label><br>
		       	<div class="row">
					<div class="col-9">
						<input type="text" class="form-control rounded-0" name="mppLocalDetail" id="addr1" readonly>
					</div>
					<div class="col-2" style="padding-left: 0px;">
						<input type="button" class="btn btn-secondary rounded-0" id="btnZipcode" value="상세위치 찾기"><br>
					</div>
				</div>
			</div>
	  	</div>
	  	
		<div class="col-12">
	  		<div class="">
			    <textarea class="form-control textEditor" name="mppContent" id="content"></textarea>
	  		</div>
	  	</div>
	 
	  	<div class="col-12">
		    <input type="file" class="form-control rounded-0" name="mppAddFile" id="addFile" >
		</div>
	  	<div class="col-8 text-center offset-md-2 text-center mt-3">
			<input type="submit" value="등록하기" class="btn btn-primary" id="insert" />
			<input type="button" value="목록보기" onclick="location.href='mppSelectList'" class="btn btn-primary"/>
	  	</div>
  	</div>
	</form>
</div><!-- content end  -->
