<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">게시글 쓰기</h2>
		</div>
	</div>
	<form name="insertForm" action="mhrInsertProcess" id="insertForm" 
	class="row g-3 border-primary" method="post" enctype="multipart/form-data">
	<div class="col-4 offset-md-2">
	    <label for="mhrWriter" class="form-label">글쓴이</label><!-- for는 아래 input의 id값과 동일시 하자 그럼 앨 찍어도 아래 인풋에 포커스가 간다 -->
	    <input type="text"class="form-control" name="mhrWriter" id="writer" placeholder="작성자를 입력해 주세요">
  	</div>
  	 	<div class="col-8 offset-md-2">
	    <label for="mhrMage" class="form-label">실종자 실종당시 나이</label>
	    <input class="form-control" name="mhrMage" id="mhrMage"  ></input>
  	</div>
  	<div class="col-4">
	    <label for="mhrage" class="form-label">실종자 현재 나이</label>
	    <input type="text"class="form-control" name="mhrage" id="mhrage" placeholder="비밀번호를 넣어주세요">
  	</div>
  	<div class="col-4">
	    <label for="mhrInfoDate" class="form-label">실종자 날자</label>
	    <input type="date" class="form-control" name="mhrInfoDate" id="infoDate">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrTitle" class="form-label">제목</label>
	    <input type="text"class="form-control" name="mhrTitle" id="title" placeholder="제목을 입력해주세요">
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrContent" class="form-label">내용</label>
	    <input class="form-control" name="mhrContent" id="content"  ></input>
  	</div>
 
  	<div class="col-8 offset-md-2">
	    <label for="mhrNation" class="form-label">국적</label>
	    <input class="form-control" name="mhrNation" id="mhrNation"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrIllCode" class="form-label">실종자 상태 코드</label>
	    <input class="form-control" name="mhrIllCode" id="mhrIllCode"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrStatusCode" class="form-label">실종 코드</label>
	    <input class="form-control" name="mhrStatusCode" id="mhrStatusCode"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrLocalCode" class="form-label">실종지역</label>
	    <input class="form-control" name="mhrLocalCode" id="localCode"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrName" class="form-label">실종자 이름</label>
	    <input class="form-control" name="mhrName" id="mhrName"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrGen" class="form-label">실종자 성별</label>
	    <input class="form-control" name="mhrGen" id="gen"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrHeight" class="form-label">실종자 키</label>
	    <input class="form-control" name="mhrHeight" id="mhrHeight"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrWeight" class="form-label">실종자 몸무게</label>
	    <input class="form-control" name="mhrWeight" id="mhrWeight"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrPhysical" class="form-label">실종자 체격</label>
	    <input class="form-control" name="mhrPhysical" id="mhrPhysical"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrFace" class="form-label">실종자 얼굴형</label>
	    <input class="form-control" name="mhrFace" id="mhrFace"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrHairColor" class="form-label">실종자 머리색상</label>
	    <input class="form-control" name="mhrHairColor" id="mhrHairColor"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrHair" class="form-label">실종자 머리길이</label>
	    <input class="form-control" name="mhrHair" id="mhrHair"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrWear" class="form-label">실종자 인상착의</label>
	    <input class="form-control" name="mhrWear" id="mhrWear"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mmNo" class="form-label">회원번호</label>
	    <input class="form-control" name="mmNo" id="mmNo"  ></input>
  	</div>
  	<div class="col-8 offset-md-2">
	    <label for="mhrAddFile" class="form-label">파일</label>
	    <input type="file" class="form-control" name="mhrAddFile" id="mnAddFile">
  	</div>
  	<div class="col-8 text-center offset-md-2 text-center mt-3">
		<input type="submit" value="등록하기" class="btn btn-primary" id = "insert"/>
				&nbsp;&nbsp;
		<input type="button" value="목록보기" 
					onclick="location.href='mhrSelectList'" class="btn btn-primary"/>
  	</div>
  	
	</form>
</div><!-- content end  -->
