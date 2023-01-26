<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src = "../../../js/notice.js"></script>
<!-- content -->
<div class="row" id="global-content">
	<div class="row mt-5 mb-3 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">신고 게시판 작성</h2>
			<p class="border border-bottom border-primary border-2" style="width: 265px; display: inline-block; margin-bottom: 0px;"></p>
		</div>
	</div>
	<form name="mprInsert" action="mprInsertProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value=1>
	<input type="hidden" class="form-control" name="mprRegDate" id="mprRegDate">
	<input type="hidden" class="form-control" name="mprWriter" id="writer" value="${sessionScope.userId} ">
	
	<div class="col-8 offset-md-2">
		<div class="row mb-2">
			<div class="col-12">
			    <label for="mprTitle" class="form-label">제목</label>
			    <input type="text"class="form-control rounded-0" name="mprTitle" id="title">
		  	</div>
		</div>
		<div class="row mb-2">
			<div class="col-5">
			    <label for="mprPetType" class="form-label">동물 종류</label>
			    <select class="form-control col-2 rounded-0" name="mprPetType" id="mprPetType">
			    	<option value="">--선택하세요--</option>
			    	<option value="01">강아지</option>
			    	<option value="02">고양이</option>
			    	<option value="03">기타(내용에 동물종류를 기재해주세요)</option>
			    </select>
		  	</div>
		 	
		  	<div class="col-4">
			    <label for="mprGen" class="form-label">동물 성별</label>
			     <select class="form-control col-2 rounded-0" name="mprGen" id="gen">
			     	<option value="">--선택하세요--</option>
			    	<option value="M">수컷</option>
			    	<option value="F">암컷</option>
		    	</select>
		  	</div>
		
		  	<div class="col-3">
			    <label for="mprInfoDate" class="form-label">실종 날짜</label>
			    <input type="date"class="form-control rounded-0" name="mprInfoDate" id="infoDate">
		  	</div>
		</div>
		<div class="row mb-2">
		  	<div class="col-2">
			    <label for="mprStatusCode" class="form-label">실종현황</label>
			    <select class="form-control col-2 rounded-0" name="mprStatusCode" id="mprStatusCode">
			    	<option value="">--선택하세요--</option>
			    	<option value="01">실종</option>
			    	<option value="02">찾았어요!</option>
			    </select>
		  	</div>
		  	<div class="col-3">
			    <label for="mprContent" class="form-label">지역</label>
			    <select class="form-control col-2 rounded-0" name="mprLocalCode" id="localCode">
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
		  	 <div class="col-7">
		       	<label for="zipcode" class="form-label">상세위치</label><br>
				<div class="row">
					<div class="col-9">
						<input type="text" class="form-control rounded-0" name="mprLocalDetail" id="addr1" readonly>
					</div>
					<div class="col-2" style="padding-left: 0px;">
						<input type="button" class="btn btn-secondary pt-2 rounded-0" id="btnZipcode" value="상세위치 찾기"><br>
					</div>
				</div>
			</div>
	  	</div>
	  
	  	<div class="col-12">
	  		<div class="">
			    <textarea class="form-control textEditor" name="mprContent" id="content"></textarea>
	  		</div>
	  	</div>
	  	
	  	<div class="col-12">
		    <input type="file" class="form-control rounded-0" name="mprAddFile" id="addFile" >
		</div>
	  	<div class="col-8 text-center offset-md-2 text-center mt-3">
			<input type="submit" value="등록하기" class="btn btn-primary" id="insert" />
			<input type="button" value="목록보기" onclick="location.href='mprSelectList'" class="btn btn-primary"/>
	  	</div> 
  	</div>
	</form>
</div><!-- content end  -->
