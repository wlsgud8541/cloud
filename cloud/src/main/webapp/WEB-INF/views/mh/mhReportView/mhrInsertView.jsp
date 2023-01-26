<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<div class="row w3-content" id="global-content">
	<div class="row my-3 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">실종자 신고</h2>
			<p class="border border-bottom border-danger border-2" style="width: 150px; display: inline-block; margin-bottom: 0px;"></p>
		</div>
	</div>
	<form name="insertForm" action="mhrInsertProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	<input type="hidden" name="mmNo" value="${sessionScope.mmNo}">
	<input type="hidden" name="mhrNo" value="${mhReport.mhrNo}">
	<input type="hidden" name="mhrWriter" id="writer" value="${sessionScope.userId}">
  	<div class="col-12">
	    <label for="mhrTitle" class="form-label border-bottom border-2 border-danger border-opacity-25">제목</label>
	    <input type="text"class="form-control rounded-0" name="mhrTitle" id="title">
  	</div>
  	<div class="col-4">
	    <label for="mhrName" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 이름</label>
	    <input class="form-control rounded-0" name="mhrName " id="mhrName"  ></input>
  	</div>
 	<div class="col-4">
	    <label for="mhrMage" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 당시 나이</label>
	    <input class="form-control rounded-0" name="mhrMage" id="mhrMage" ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrage" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 현재 나이</label>
	    <input type="text"class="form-control rounded-0" name="mhrage" id="mhrage">
  	</div>
  	<div class="col-4">
	    <label for="mhrGen" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 성별</label>
	    <select class="form-control rounded-0" name="mhrGen" id="gen"  >
	    	<option value="">--선택하세요--</option>
	    	<option value="M">남자</option>
	    	<option value="Y">여자</option>
	    </select>
  	</div>
  	<div class="col-4">
	    <label for="mhrInfoDate" class="form-label border-bottom border-2 border-danger border-opacity-25">실종 날짜</label>
	    <input type="date" class="form-control rounded-0" name="mhrInfoDate" id="infoDate">
  	</div>
  	<div class="col-4">
	    <label for="mhrIllCode" class="form-label border-bottom border-2 border-danger border-opacity-25">대상 구분</label>
	    <select class="form-control rounded-0" name="mhrIllCode" id="mhrIllCode"  >
	    	<option value="">--선택하세요--</option>
			<option value="01">비장애아동(18세 미만)</option>
			<option value="02">장애인(지적.자폐성.정신)</option>
			<option value="03">치매환자</option>
			<option value="04">가출인</option>
			<option value="05">기타</option>
	    </select>
  	</div>
  	<div class="col-5">
	    <label for="mhrLocalCode" class="form-label border-bottom border-2 border-danger border-opacity-25">실종 지역</label>
	    <select class="form-control rounded-0" name="mhrLocalCode" id="localCode">
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
     <div class="col-6 row offset-md-1"> 
       	<label for="zipcode" class="form-label inblock border-bottom border-2 border-danger border-opacity-25 ">상세위치</label><br>
		<input type="text" class="form-control col rounded-0" name="mhrLocalDetail" id="addr1" readonly>
		<input type="button" class="btn btn-secondary col-3 rounded-0" id="btnZipcode" value="상세위치 찾기"><br>
	</div>
  	<div class="col-4">
	    <label for="mhrStatusCode" class="form-label border-bottom border-2 border-danger border-opacity-25">실종 상태</label>
	    <select class="form-control rounded-0" name="mhrStatusCode" id="mhrStatusCode"  >
	    	<option value="">--선택하세요--</option>
	    	<option value="01">실종</option>
	    	<option value="02">신고</option>
	    	<option value="03">해결</option>
	    </select>
  	</div>
	<div class="col-4">
	    <label for="mhrNation" class="form-label border-bottom border-2 border-danger border-opacity-25">국적</label>
	    <select class="form-control rounded-0" name="mhrNation " id="mhrNation"  >
	    	<option value="">--선택하세요--</option>
	    	<option value="local">내국인</option>
	    	<option value="foreign">외국인</option>
    	</select>
  	</div>
  	<div class="col-4">
	    <label for="mhrHeight" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 키</label>
	    <input class="form-control rounded-0" name="mhrHeight" id="mhrHeight"  ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrWeight" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 몸무게</label>
	    <input class="form-control rounded-0" name="mhrWeight" id="mhrWeight"  ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrPhysical" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 체격</label>
	    <input class="form-control rounded-0" name="mhrPhysical" id="mhrPhysical"  ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrFace" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 얼굴형</label>
	    <input class="form-control rounded-0" name="mhrFace" id="mhrFace"  ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrHairColor" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 머리색상</label>
	    <input class="form-control rounded-0" name="mhrHairColor" id="mhrHairColor"  ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrHair" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 머리길이</label>
	    <input class="form-control rounded-0" name="mhrHair" id="mhrHair"  ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrWear" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 인상착의</label>
	    <input class="form-control rounded-0" name="mhrWear" id="mhrWear"  ></input>
  	</div>
  	<div class="col-12">
	    <textarea class="form-control textEditor" name="mhrContent " id="content"  ></textarea>
  	</div>
<!--   	파일 -->
  	<div class="col-12">
	    <input type="file" class="form-control rounded-0" name="mhrAddFile" id="mnAddFile">
  	</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-danger" id="insert"/>
				&nbsp;&nbsp;
		<input type="button" value="목록보기" 
					onclick="location.href='mhrSelectList'" class="btn btn-danger"/>
  	</div>
  	
	</form>
</div><!-- content end  -->
