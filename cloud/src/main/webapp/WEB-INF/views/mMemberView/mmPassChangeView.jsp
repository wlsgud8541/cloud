<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form class="my-5" id="passChangeForm" action="" method="post">
	<input type="hidden" id="mmId" name="mmId" value="${sessionScope.userId}">
	<div class="form-wrapper changePassword" style="margin-top: -190px;">
		<div class="fs-5 text-center pb-3 fw-bold">비밀번호 변경</div>
		<input class="form-field" type="password" id="mmPass" name="mmPass" placeholder="기존 비밀번호를 입력해주세요"/>
		<button class="button primary" type="submit" id="passCkBtn">비밀번호 확인</button>
	</div>
</form>