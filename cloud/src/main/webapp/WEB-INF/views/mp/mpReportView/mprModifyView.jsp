<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<div class="row" id="global-content">
	<form name="mprUpdateProcess" action="mprUpdateProcess" id="insertForm" class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	
	<input type="hidden" class="form-control" name="mmNo" id="mmNo" value="${sessionScope.mmNo}">
	<input type="hidden" class="form-control" name="mprNo" id="mprNo" value="${mpModify.mprNo}">
	<input type="hidden" class="form-control" name="pageNum" id="pageNum" value="${pageNum}">
	<input type="hidden" class="form-control" name="mppWriter" id="writer" value="${sessionScope.userId} ">
	
	<div class="col-8 offset-md-2">
		<div class="row mb-2">
			<div class="col-12">
			    <label for="mprTitle" class="form-label border-bottom border-2 border-primary border-opacity-25">제목</label>
			    <input type="text"class="form-control rounded-0" name="mprTitle" id="title" value="${mpModify.mprTitle}">
		  	</div>
		</div>
		<div class="row mb-2">
			<div class="col-5">
			    <label for="mprPetType" class="form-label border-bottom border-2 border-primary border-opacity-25">동물 종류</label>
			    <select class="form-control col-2 rounded-0" name="mprPetType" id="pettype">
			    	<option value="0">--선택하세요--</option>
			    	<option value="01" ${mpModify.mprPetType == '01' ? 'selected' : ''}>강아지</option>
			    	<option value="02" ${mpModify.mprPetType == '02' ? 'selected' : ''}>고양이</option>
			    	<option value="03" ${mpModify.mprPetType == '03' ? 'selected' : ''}>기타(내용에 동물종류를 기재해주세요)</option>
			    </select>
		  	</div>
		  	<div class="col-4">
			    <label for="mprGen" class="form-label border-bottom border-2 border-primary border-opacity-25">동물 성별</label>
			     <select class="form-control rounded-0" name="mprGen" id="gen">
			    	<option value="0">--선택하세요--</option>
			    	<option value="M " ${mpModify.mprGen == 'M ' ? 'selected' : ''}>수컷</option>
			    	<option value="F " ${mpModify.mprGen == 'F ' ? 'selected' : ''}>암컷</option>
		    	</select>
		  	</div>
		  	<div class="col-3">
			    <label for="mprInfoDate" class="form-label border-bottom border-2 border-primary border-opacity-25">실종 날짜</label>
			    <input type="date" class="form-control rounded-0" name="mprInfoDate" id="infoDate" value='<fmt:formatDate value="${mpModify.mprInfoDate}" pattern="yyyy-MM-dd" />'>
		  	</div>
		</div>
	  	
	  	<div class="row mb-2">
		  	<div class="col-2">
			    <label for="mprStatusCode" class="form-label border-bottom border-2 border-primary border-opacity-25">실종현황</label>
			    <select class="form-control col-2 rounded-0" name="mprStatusCode" id="statuscode">
			    	<option value="0">--선택하세요--</option>
			    	<option value="01" ${mpModify.mprStatusCode == '01' ? 'selected' : ''}>실종</option>
			    	<option value="02" ${mpModify.mprStatusCode == '02' ? 'selected' : ''}>찾았어요!</option>
			    </select>
		  	</div>
		  	
		  	<div class="col-3">
			    <label for="mprContent" class="form-label border-bottom border-2 border-primary border-opacity-25">실종지역</label>
			    <select class="form-control col-2 rounded-0" name="mprLocalCode" id="localCode">
			    	<option value="0">--선택하세요--</option>
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
		  	 <div class="col-7">
		       	<label for="zipcode" class="form-label border-bottom border-2 border-primary border-opacity-25">상세위치</label><br>
		       	<div class="row">
					<div class="col-9">
						<input type="text" class="form-control rounded-0" name="mprLocalDetail" id="addr1" value="${mpModify.mprLocalDetail}" readonly>
					</div>
					<div class="col-2" style="padding-left: 0px;">
						<input type="button" class="btn btn-secondary rounded-0" id="btnZipcode" value="상세위치 찾기"><br>
					</div>
				</div>
				
			</div>
	  	</div>

	  	<div class="col-12">
	  		<div class="">
			    <textarea class="form-control textEditor" name="mprContent" id="content" >${mpModify.mprContent}</textarea>
	  		</div>
	  	</div>
	 
	  	<div class="col-12">
		    <input type="file" class="form-control rounded-0" name="mprAddFile" id="addFile">
		    <div class="text-secondary px-2">파일을 선택하지 않으면 기존에 선택된 파일이 유지됩니다.</div>
		</div>
	  	<div class="col-8 text-center offset-md-2 text-center mt-3">
			<input type="submit" value="수정하기" class="btn btn-primary" id="insert" />
			<input type="button" value="목록보기" onclick="location.href='mprSelectList'" class="btn btn-primary"/>
	  	</div>
  	</div>
	</form>
</div><!-- content end  -->
