<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="root mt-5">
	    <form action="mmInsertJoin" name="insertJoin" method="POST" id="insertJoin">
		<input type="hidden" id="idCheckFlag" value="N">
		<input type="hidden" id="mmUseUserInfoYn" name="mmUseUserInfoYn" value="${member.mmUseUserInfoYn}">
        	<div class=" join-wrapper">
            	<h2 class="text-center"><b>Cloud 회원가입</b></h2>
            	<div class=joinForm>
	            	<div class="joinGroup">
			            <label for="id" class="joinTitle"><b>아이디</b></label>
			            <input type="text" placeholder="*아이디" class="join-field" name="mmId"  id="id" />
			            <input type="button" class="btn btn-warning" id="idCheckBtn" value="중복확인">
			            <div class="idForm"></div>
			           
			            <label for="password" class="joinTitle"><b>비밀번호</b></label>
		           		<input  type="password" placeholder="*비밀번호" class="join-field" name="mmPass" id="pass1" />
		           		<div class="passCheck1" ></div>
			           
			            <label for="password"  class="joinTitle"><b>비밀번호 확인</b></label>
		            	<input  type="password" placeholder="*비밀번호 확인" class="join-field" name="checkPass" id="pass2" />
		            	<div class="passCheck2"></div>
	            	</div> 
	            	<div class="joinGroup">
			            <label for="name" class="joinTitle"><b>이름</b></label>
			            <input type="text" class="join-field" name="mmName" id="name" />
						<div class="nameCheck"></div>
			            
			            <label for="date" class="joinTitle"><b>생년월일</b></label>
		           		<input type="date" placeholder="" class="join-field" name="mmBirth" id="birth" />
			            
			            <label  class="joinTitle"><b>성별</b></label>
			            <select class="join-field" name="mmGen">
			            	<option value="default">성별</option>
			            	<option value="M" selected>남자</option>
			            	<option value="F">여자</option>
			            </select>
			          
			            <label for="email" class="joinTitle"><b>이메일</b></label><br>
			            <span>
							<input type="text" class="mail-field" name="emailId" id="emailId">
						</span> 
						@
						<span>
							<input type="text" class="mail-field" name="emailDomain" id="emailDomain">
						</span>
						<span>
							<select class="mail-field" name="selectDomain" id="selectDomain">
								<option value="직접입력">직접입력</option>
								<option value="naver.com">네이버</option>
								<option value="daum.net">다음</option>
								<option value="gmail.com">구글</option>
							</select>
						</span>
							
						<label for="emailCheck" class="joinTitle">이메일 인증번호</label>
						<span class="row">
							<span class="col-md-3">
								<input type="text" class="mail-field" id="emailCheck">
							</span>
							<span class="col-md-3 emailCheck">
								<button type="button" class="secondary" id="emailSendBtn">이메일 인증번호 전송</button>
							</span>
						</span>
	            	</div>
	            	
	            	<div class="joinGroup">
			        	<label for="zipcode" class="joinTitle">우편번호</label><br>
						<input type="text" class="mail-field" name="mmZipCode" id="zipcode" maxlength="5" readonly>&nbsp;&nbsp;
						<input type="button" class="btn btn-secondary" id="btnZipcode" value="우편번호 찾기"><br>
						<label for="addr1" class="joinTitle">자택주소</label>
						<input type="text" class="join-field" name="mmAddr1" id="addr1" readonly>
						<label for="addr2" class="joinTitle">상세주소</label>				
						<input type="text" class="join-field" name="mmAddr2" id="addr2">
					</div>
	            	<div class="joinGroup">
			            <label for="mobile2" class="joinTitle"><b>전화번호</b></label><br>
						<select class="mail-field" name="tel1" id="tel1">
							<option value="010">010</option>
						</select>-
						<input type="text" class="mail-field" name="tel2" id="tel2" maxlength="4">-
						<input type="text" class="mail-field" name="tel3" id="tel3" maxlength="4">
						
						<label for="telCheck" class="joinTitle">인증번호 : </label>
						<input type="text" class="mail-field" id="telCheck">
						<div class="telCheck inblock">
							<input type="button" class="btn btn-secondary" id="SMSsendBtn" value="인증번호 전송">&nbsp;&nbsp;
						</div>
	            	</div>
           		</div>
           		
            	<div class="text-center mt-5">
          			<button type="submit" class="button primary" id="#">가입하기</button>
            	</div>
          </div>
        </form>
   </div>
