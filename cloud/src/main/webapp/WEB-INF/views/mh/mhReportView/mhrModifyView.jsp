<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- content -->
<div class="row w3-content" id="global-content">
	<form name="mhrUpdateProcess" action="mhrUpdateProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	<input type="hidden" name="mmNo" value="${sessionScope.mmNo}">
	<input type="hidden" name="mhrNo" value="${mhReport.mhrNo}">
	<input type="hidden" name="mhrWriter" id="writer" value="${sessionScope.userId}">
  	<div class="col-12">
	    <label for="mhrTitle" class="form-label border-bottom border-2 border-danger border-opacity-25" >제목</label>
	    <input type="text"class="form-control rounded-0" name="mhrTitle" id="title" value="${mhReport.mhrTitle}">
  	</div>
  	<div class="col-4">
	    <label for="mhrName" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 이름</label>
	    <input class="form-control rounded-0" name="mhrName " id="mhrName" value="${mhReport.mhrName}" ></input>
  	</div>
  	<div class="col-2">
	    <label for="mhrGen" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 성별</label>
	    <select class="form-control rounded-0" name="mhrGen" id="gen">
	    	<option value="">--선택하세요--</option>
		    	<option value="M" ${mhReport.mhrGen == 'M ' ? 'selected' : ''}>남자</option>
	    		<option value="F" ${mhReport.mhrGen == 'F ' ? 'selected' : ''}>여자</option>
	    </select>
  	</div>
 	<div class="col-3">
	    <label for="mhrMage" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 당시 나이</label>
	    <input class="form-control rounded-0" name="mhrMage" id="mhrMage" value="${mhReport.mhrMage}"></input>
  	</div>
  	<div class="col-3">
	    <label for="mhrage" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 현재 나이</label>
	    <input type="text"class="form-control rounded-0" name="mhrage" id="mhrage"value="${mhReport.mhrage}">
  	</div>
  	<div class="col-4">
	    <label for="mhrInfoDate" class="form-label border-bottom border-2 border-danger border-opacity-25">실종 날짜</label>
	    <input type="date" class="form-control rounded-0" name="mhrInfoDate" id="infoDate" value='<fmt:formatDate value="${mhReport.mhrInfoDate}" pattern="yyyy-MM-dd"/>'>
  	</div>
  	<div class="col-4">
	    <label for="mhrStatusCode" class="form-label border-bottom border-2 border-danger border-opacity-25">실종 상태</label>
	    <select class="form-control rounded-0" name="mhrStatusCode" id="mhrStatusCode"  >
	    	<option value="">--선택하세요--</option>
	    	<option value="01" ${mhReport.mhrStatusCode == '01' ? 'selected' : ''}>실종</option>
	    	<option value="02" ${mhReport.mhrStatusCode == '02' ? 'selected' : ''}>신고</option>
	    	<option value="03" ${mhReport.mhrStatusCode == '03' ? 'selected' : ''}>해결</option>
	    </select>
  	</div>
  	<div class="col-4">
	    <label for="mhrIllCode" class="form-label border-bottom border-2 border-danger border-opacity-25">대상 구분</label>
	    <select class="form-control rounded-0" name="mhrIllCode" id="mhrIllCode"  >
	    	<option value="">--선택하세요--</option>
			<option value="M" ${mhReport.mhrIllCode == '01' ? 'selected' : ''}>비장애아동(18세 미만)</option>
	    	<option value="F" ${mhReport.mhrIllCode == '02' ? 'selected' : ''}>장애인(지적.자폐성.정신)</option>
	    	<option value="F" ${mhReport.mhrIllCode == '03' ? 'selected' : ''}>치매환자</option>
	    	<option value="F" ${mhReport.mhrIllCode == '04' ? 'selected' : ''}>가출인</option>
	    	<option value="F" ${mhReport.mhrIllCode == '05' ? 'selected' : ''}>기타</option>
	    </select>
  	</div>
	<div class="col-2">
	    <label for="mhrNation" class="form-label border-bottom border-2 border-danger border-opacity-25">국적</label>
	    <select class="form-control rounded-0" name="mhrNation " id="mhrNation" onChange="this.selectedIndex = this.initialSelect;" onFocus="this.initialSelect = this.selectedIndex;">
	    	<option value="">--선택하세요--</option>
	    	<option value="local" ${mhReport.mhrNation =='local' ? 'selected' : '' }>내국인</option>
	    	<option value="foreign" ${mhReport.mhrNation == 'foreign' ? 'selected' : ''}>외국인</option>
	    </select>
  	</div>
  	<div class="col-3">
	    <label for="mhrLocalCode" class="form-label border-bottom border-2 border-danger border-opacity-25">실종 지역</label>
	    <select class="form-control rounded-0" name="mhrLocalCode" id="localCode">
	    	<option value="">--선택하세요--</option>
	    	<option value="01" ${mhReport.mhrLocalCode == '01' ? 'selected' : ''}>서울</option>
	    	<option value="02" ${mhReport.mhrLocalCode == '02' ? 'selected' : ''}>경기</option>
	    	<option value="03" ${mhReport.mhrLocalCode == '03' ? 'selected' : ''}>인천</option>
	    	<option value="04" ${mhReport.mhrLocalCode == '04' ? 'selected' : ''}>대전</option>
	    	<option value="05" ${mhReport.mhrLocalCode == '05' ? 'selected' : ''}>광주</option>
	    	<option value="06" ${mhReport.mhrLocalCode == '06' ? 'selected' : ''}>대구</option>
	    	<option value="07" ${mhReport.mhrLocalCode == '07' ? 'selected' : ''}>울산</option>
	    	<option value="08" ${mhReport.mhrLocalCode == '08' ? 'selected' : ''}>부산</option>
	    	<option value="09" ${mhReport.mhrLocalCode == '09' ? 'selected' : ''}>세종</option>
	    	<option value="10" ${mhReport.mhrLocalCode == '10' ? 'selected' : ''}>강원</option>
	    	<option value="11" ${mhReport.mhrLocalCode == '11' ? 'selected' : ''}>충북</option>
	    	<option value="12" ${mhReport.mhrLocalCode == '12' ? 'selected' : ''}>충남</option>
	    	<option value="13" ${mhReport.mhrLocalCode == '13' ? 'selected' : ''}>전북</option>
	    	<option value="14" ${mhReport.mhrLocalCode == '14' ? 'selected' : ''}>전남</option>
	    	<option value="15" ${mhReport.mhrLocalCode == '15' ? 'selected' : ''}>경북</option>
	    	<option value="16" ${mhReport.mhrLocalCode == '16' ? 'selected' : ''}>경남</option>
	    	<option value="17" ${mhReport.mhrLocalCode == '17' ? 'selected' : ''}>제주</option>
	    </select>
  	</div>
     <div class="col-7">
       	<label for="zipcode" class="form-label inblock border-bottom border-2 border-danger border-opacity-25 ">상세위치</label><br>
       	<div class="row">
	       	<div class="col-9 p-0">
				<input type="text" class="form-control  rounded-0" name="mhrLocalDetail" id="addr1" readonly value="${mhReport.mhrLocalDetail }">
	       	</div>
	       	<div class="col-3 p-0">
				<input type="button" class="btn btn-secondary rounded-0" id="btnZipcode" value="상세위치 찾기"><br>
       		</div>
       	</div>
	</div>
  	<div class="col-3">
	    <label for="mhrHeight" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 키</label>
	    <input class="form-control rounded-0" name="mhrHeight" id="mhrHeight" value="${mhReport.mhrHeight}" ></input>
  	</div>
  	<div class="col-3">
	    <label for="mhrWeight" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 몸무게</label>
	    <input class="form-control rounded-0" name="mhrWeight" id="mhrWeight"  value="${mhReport.mhrWeight}" ></input>
  	</div>
  	<div class="col-3">
	    <label for="mhrPhysical" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 체격</label>
	    <input class="form-control rounded-0" name="mhrPhysical" id="mhrPhysical" value="${mhReport.mhrPhysical}" ></input>
  	</div>
  	<div class="col-3">
	    <label for="mhrFace" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 얼굴형</label>
	    <input class="form-control rounded-0" name="mhrFace" id="mhrFace" value="${mhReport.mhrFace}" ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrHairColor" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 머리색상</label>
	    <input class="form-control rounded-0" name="mhrHairColor" id="mhrHairColor"  value="${mhReport.mhrHairColor}" ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrHair" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 머리길이</label>
	    <input class="form-control rounded-0" name="mhrHair" id="mhrHair" value="${mhReport.mhrHair}" ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrWear" class="form-label border-bottom border-2 border-danger border-opacity-25">실종자 인상착의</label>
	    <input class="form-control rounded-0" name="mhrWear" id="mhrWear" value="${mhReport.mhrWear}" ></input>
  	</div>
  	<div class="col-12">
	    <textarea class="form-control textEditor" name="mhrContent " id="content"  >${mhReport.mhrContent}</textarea>
  	</div>
<!--   	파일 -->
  	<div class="col-12">
	    <input type="file" class="form-control rounded-0" name="mhrAddFile" id="addFile" value="${mhReport.mhrAddFile}">
  	</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-danger" id = "insert"/>
				&nbsp;&nbsp;
		<input type="button" value="목록보기" 
					onclick="location.href='mhrSelectList'" class="btn btn-danger"/>
  	</div>
  	
	</form>
</div><!-- content end  -->


