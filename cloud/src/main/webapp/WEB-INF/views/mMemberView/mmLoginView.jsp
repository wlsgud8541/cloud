<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row my-5" id="global-content">
	<div class="col">
		<form class="my-5" id="loginForm" action="mmSelectLoginCheck" method="post">
			<h2 class="fw-bold">Cloud Login</h2>
			<fieldset>	
				<legend>Cloud Login</legend>
				<div id="login">
					<p>
						<label for="userId" class="labelStyle">아이디</label>
						<input type="text" id="mmId" name="mmId" />
					</p>
					<p>
						<label for="userPass" class="labelStyle">비밀번호</label>
						<input type="password" id="mmPass" name="mmPass"/>
					</p>
				</div>
					<input type="submit" value="로그인" id="btnLogin" />
				<p id="btn2">
					<input type="button" value="회원가입" id="btnJoin" />
					<input type="button" value="아이디/비밀번호 찾기" id="btnSearch" />
				</p>
			</fieldset>
		</form>
	</div>
</div>