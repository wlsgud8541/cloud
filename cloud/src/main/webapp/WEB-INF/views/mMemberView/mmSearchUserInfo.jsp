<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:if test="${type == 'id'}">
			<div class="form-wrapper container" style="width: 600px; height: 300px;">
				<div class="fs-3 text-center pt-4 pb-4 fw-bold">Cloud 아이디 찾기</div>
				<div class="userInfoSearch">
					<div class="pt-3">
						<input type="text" id="searchIdEmail" name="searchIdEmail" placeholder="가입 시 등록하신 이메일을 입력해주세요." class="form-field" style="width: 300px;"/>
						<button class="button secondary" type="button" id="btnSearch" style="width: 150px;" data-type="id">인증번호 발송</button> 
					</div>
					<div class="pt-1">
						<input type="text" id="searchIdCheckNum" name="searchIdCheckNum" placeholder="인증번호 입력" class="form-field" style="width: 300px;"/>
						<button class="button secondary" type="button" id="checkNum" style="width: 150px;" data-type="id">인증번호 확인</button>
					</div>
				</div>
			</div>	
		</c:if>
		<c:if test="${type == 'pass'}">
			<div class="form-wrapper container" style="width: 600px; height: 350px;">
				<div class="fs-3 text-center pt-4 pb-4 fw-bold">Cloud 비밀번호 찾기</div>
				<div class="userInfoSearch">
					<div class="pt-3"> 
						<input type="text" id="searchPassId" name="searchPassId" placeholder="가입 시 등록하신 아이디를 입력해주세요." class="form-field" style="width: 300px;"/>
					</div>
					<div class="pt-1">
						<input type="text" id="searchPassEmail" name="searchPassEmail" placeholder="가입 시 등록하신 이메일을 입력해주세요." class="form-field" style="width: 300px;"/>
						<button class="button secondary" type="button" id="btnSearch" style="width: 150px;" data-type="pass">인증번호 발송</button> 
					</div>
					<div class="pt-1">
						<input type="text" id="searchPassCheckNum" name="searchPassCheckNum" placeholder="인증번호 입력" class="form-field" style="width: 300px;"/>
						<button class="button secondary" type="button" id="checkNum" style="width: 150px;" data-type="pass">인증번호 확인</button>
					</div>
				</div>
			</div>
		</c:if>
	
