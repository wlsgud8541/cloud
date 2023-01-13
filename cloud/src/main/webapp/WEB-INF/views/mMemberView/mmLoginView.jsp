<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
	<body>
		<div class="root">
			<form class="my-5" id="loginForm" action="mmSelectLoginCheck" method="post">
			  <div class="signin-wrapper form active">
			    <div class="form-wrapper">
			      <div class="fs-5 text-center pb-3 fw-bold">Cloud</div>
			     
			      <input type="text" id="mmId" name="mmId" placeholder="ID" class="form-field" />
			      <input type="password" id="mmPass" name="mmPass" placeholder="Password" class="form-field"/>
			     
			      <button class="button primary" type="submit" id="btnLogin">로그인</button>
			      <button class="button secondary" type="button" id="btnJoin">회원가입</button> 
			   
			      <a href="#" id="GoogleLogin" class="text-center">
			   		  <img src="resources/image/login/GoogleLogin.png" id="GoogleLogin" class="SNSLogin">
			      </a>
			      <a href="https://kauth.kakao.com/oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code" class="text-center">
			   		  <img src="resources/image/login/KakaoLogin.png" id="KakaoLogin" class="SNSLogin" >
			      </a>
			      <a href="#" id="NaverLogin" class="text-center">
			    	  <img src="resources/image/login/NaverLogin.png" id="NaverLogin" class="SNSLogin">
			      </a>
			      </div>
			   </div>
			</form>
		</div>
	</body>
</html>