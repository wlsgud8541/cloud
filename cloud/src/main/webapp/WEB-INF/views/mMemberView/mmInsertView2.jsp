<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%String mmUseUserInfoYn = request.getParameter("mmUseUserInfoYn"); %>

<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row my-3 text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">Cloud 회원가입</h2>
			</div>
		</div>
		<form action="mmInsertJoin" name="insertJoin" method="POST" id="insertJoin">
		<input type="hidden" id="idCheckFlag" value="N">
		<input type="hidden" id="mmUseUserInfoYn" name="mmUseUserInfoYn" value="<%= mmUseUserInfoYn %>">
			<div class="row mt-5 mb-3">
				<div class="col-8 offset-2">				
					<label for="name" class="form-label">* 이 름 : </label>
					<input type="text" class="form-control" name="mmName" id="name">
					<div class="nameCheck"></div>
				</div>				
			</div>
			<div class="row my-3">
				<div class="col-2 offset-2">				
					<label for="gen" class="form-label">* 성 별 : </label>
				</div>
				<div class="col-1">
					<input type="radio" name="mmGen" value="M" checked>
				</div>
				<div class="col-1">
					<p>남</p>
				</div>
				<div class="col-1">
					<input type="radio" name="mmGen" value="F">
				</div>
				<div class="col-1">
					<p>여</p>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="id" class="form-label">* 아이디 : </label>
					<div class="row">
						<div class="col-6">
							<input type="text" class="form-control" name="mmId" id="id">
						</div>
						<div class="col-4">
							<input type="button" class="btn btn-warning" id="idCheckBtn" value="중복확인">
						</div>
					</div>
					<div class="idForm"></div>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="pass1" class="form-label">* 비밀번호 : </label>
					<input type="password" class="form-control" name="mmPass" id="pass1">					
					<div class="passCheck1"></div>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="pass2" class="form-label">* 비밀번호 확인 : </label>
					<input type="password" class="form-control" name="checkPass" id="pass2">
					<div class="passCheck2"></div>
				</div>
			</div>
			<div class="row mt-5 mb-3">
				<div class="col-8 offset-2">				
					<label for="name" class="form-label">* 생년월일 : </label>
					<input type="date" class="form-control" name="mmBirth" id="birth">
				</div>				
			</div>			
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="zipcode" class="form-label">* 우편번호 : </label>
					<div class="row">
						<div class="col-4">
							<input type="text" class="form-control" name="mmZipCode" id="zipcode" maxlength="5" disabled>
						</div>
						<div class="col-4">
							<input type="button" class="btn btn-warning" id="btnZipcode" value="우편번호 찾기">
						</div>
					</div>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="addr1" class="form-label">* 자택주소 : </label>
					<input type="text" class="form-control" name="mmAddr1" id="addr1" disabled>
				</div>	
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="addr2" class="form-label">상세주소 : </label>				
					<input type="text" class="form-control" name="mmAddr2" id="addr2">
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="emailId" class="form-label">* 이 메 일 : </label>
					<div class="row">
						<div class="col-md-4">
							<input type="text" class="form-control" name="emailId" id="emailId">
						</div> 
						@ 
						<div class="col-md-4">
							<input type="text" class="form-control" name="emailDomain" id="emailDomain">
						</div>
						<div class="col-md-3">
							<select class="form-select" name="selectDomain" id="selectDomain">
								<option value="직접입력">직접입력</option>
								<option value="naver.com">네이버</option>
								<option value="daum.net">다음</option>
								<option value="google.com">구글</option>
							</select>
						</div>
					</div>
				</div>	
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="emailCheck" class="form-label">* 이 메 일 인 증 번 호 : </label>
					<div class="row">
						<div class="col-md-3">
							<input type="text" class="form-control" id="emailCheck">
						</div>
						<div class="col-md-3 emailCheck">
							<input type="button" class="btn btn-warning" id="emailSendBtn" value="이메일 인증하기">
						</div>
					</div>
				</div>
			</div>			
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="mobile2" class="form-label">* 전 화 번 호 : </label>
					<div class="row">
						<div class="col-md-2">
							<select class="form-select" name="tel1" id="tel1">
								<option value="010">010</option>
							</select>
						</div>-
						<div class="col-md-2">
							<input type="text" class="form-control" name="tel2" id="tel2" maxlength="4">
						</div>-
						<div class="col-md-2">
							<input type="text" class="form-control" name="tel3" id="tel3" maxlength="4">
						</div>
						<div class="col-md-2 telCheck">
							<input type="button" class="btn btn-warning" id="SMSsendBtn" value="인증번호 전송">
						</div>
					</div>
				</div>
			</div>			
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="telCheck" class="form-label">* 인 증 번 호 : </label>
					<div class="row">
						<div class="col-md-3">
							<input type="text" class="form-control" id="telCheck">
						</div>
					</div>
				</div>
			</div>			
			<div class="row mb-3 mt-5">				
				<div class="col-8 offset-2">
					<input type="submit" value="가입하기" class="btn btn-primary">
				</div>
			</div>
		</form>
	</div>
</div>
