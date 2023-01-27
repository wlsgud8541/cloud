<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row my-3 text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">Cloud 회원가입</h2>
			</div>
		</div>
		<div class="row mt-5 mb-3">
			<div class="col-8 offset-2">
				<div class="row">
					<label class="form-label">개인정보 수집 및 이용 동의</label>
				</div>
				
				<form action="mmInsertJoin2" id="mmInsertJoin2Form" method="post">
					<!-- 카카오  -->
					<input type="hidden" id="kakaoId" name="kakaoId" value="${kakaoId}">
					<input type="hidden" id="kakaoEmail" name="kakaoEmail" value="${kakaoEmail}">
					<input type="hidden" id="kakaoGender" name="kakaoGender" value="${kakaoGender}">
					
					<!-- 네이버 -->
					<%-- <input type="text" id="id" name="id" value="${id}"> --%>
					<input type="hidden" id="naverId" name="naverId" value="${naverId}">
					<input type="hidden" id="naverGender" name="naverGender" value="${naverGender}">
					<input type="hidden" id="naverEmail" name="naverEmail" value="${naverEmail}">
					<input type="hidden" id="naverMobile" name="naverMobile" value="${naverMobile}">
					<input type="hidden" id="naverName" name="naverName" value="${naverName}">
					<input type="hidden" id="naverBirthyear" name="naverBirthyear" value="${naverBirthyear}">
					<input type="hidden" id="naverBirthday" name="naverBirthday" value="${naverBirthday}">
					
					<div class="row">
						<textarea readonly rows="15">
『개인정보보호법』 제15조 법규에 의거하여 Cloud는 고객님의 개인정보 수집 및 활용에 대해 개인정보 수집 및 활용 동의서를 받고 있습니다.
개인정보 제공자가 동의한 내용 외의 다른 목적으로 활용하지 않으며, 제공된 개인정보의 이용을 거부하고자할 때에는 개인정보 관리책임자를 통해 열람, 정정 혹은 삭제를 요구할 수 있습니다.

※ 제공된 개인정보는 ○○주식회사의 아래 항목에 제한된 범위에서만 활용됩니다. 
							
[개인정보 수집 항목]			
필수항목 : 성명, 주소, 휴대전화번호
선택항목 : 생년월일, 이메일 주소

[개인정보 이용목적]
- Cloud 서비스 이용에 따른 본인 확인 절차에 이용
- 새로운 서비스 및 행사 정보 등의 안내
- 신규 서비스 개발을 위한 방문 고객 분석자료 작성에 이용
- 소비자 기본법 제 52조에 의거한 소비자 위해 정보 수집
							
「개인정보보호법」제15조 법규에 의거하여 상기 본인은 위와 같이 개인정보 수집 및 활용에 동의함.
						</textarea>
					</div>
					<div class="row mt-5">
						<div class="col-1 offset-2">
							<input type="radio" id="mmUseUserInfoYn" name="mmUseUserInfoYn" value="Y" checked="checked">
						</div>
						<div class="col-3">
							<p>동의함</p>
						</div>
						<div class="col-1">
							<input type="radio" id="mmUseUserInfoYn" name="mmUseUserInfoYn" value="N">
						</div>
						<div class="col-3">
							<p>동의하지 않음</p>
						</div>
					</div>
					<div class="row mb-3 mt-5 text-center">				
						<input type="button" value="다음" id="insertContinue" class="btn btn-primary">
					</div>
				</form>
			</div>				
		</div>
	</div>
</div>
