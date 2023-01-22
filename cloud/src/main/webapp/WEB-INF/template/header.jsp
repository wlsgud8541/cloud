<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<!-- header  -->
<div class="header fixed-top">
	<div class="row headerMain border-bottom bg-white">  
		<div class="col-4 ps-5 pe-0 text-center">
        	 <a href="main"><img src="resources/image/main/cloudLogo.png" style="width: 130px;"></a>
     	</div>
     	<form action="search" method="post" class="col-5 search_wrap text-center">
	        <input type="text" class="search_bar rounded-pill ps-4 pe-5" id = "uSearch">
	        <button type="submit" class="btn btn-outline-secondary" id="uSearchbtn">검색</button> 
     	</form>
		<c:if test="${empty sessionScope.userId }">
		<div class="col-3 text-center pt-4 ps-5">
			<ul class="nowLogin">
				<li><a href="loginView" class="login">로그인</a></li>
				<li><a href="mmInsertJoin1" class="join">회원가입</a></li>
			</ul>
		</div>
		</c:if> 
		<c:if test="${not empty sessionScope.userId }">
		<div class="col-3 text-start pt-4 ps-5">
			<ul class="nowLogin">
				<li class="user"><span><b>${sessionScope.userId}</b>님</span><br><span>로그인하셨습니다.</span></li>
				<li><a href="mmSelectMyPage?mmNo=${sessionScope.mmNo}" class="myPage">마이페이지</a></li>
				<c:if test="${empty sessionScope.kakaoLogin and empty sessionScope.naverLogin }">
					<li><a href="mmLogout" class="logout">로그아웃</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.kakaoLogin}">
					<li><a href="https://kauth.kakao.com/oauth/logout?client_id=e46c1c647457913d7dbf891555db0996&logout_redirect_uri=http://localhost:8080/cloud/mmLogout" class="logout">로그아웃</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.naverLogin}">
					<li><a href="mmLogout" class="logout">로그아웃</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>
	</div>
	
	<div class="row fs-5 text-center" >
<!-- 	style="background-color:#285430;" -->
		<div class="col navi_wrap">
			<ul class="underline-hover">
				<li class="menu1"><a href="#">사이트소개</a>
					<ul>
						<li><a href="introduceSiteView">사이트 소개</a></li>
						<li><a href="relationSiteView">관련 사이트</a></li>
					</ul>
				</li>
				<li class="menu1"><a href="#">실종자신고</a>
					<ul>
						<li><a href="mhiSelectList">실종자 정보</a></li>
						<li><a href="mhrSelectList">실종자 신고</a></li>
						<li><a href="mhfSelectList">실종자 목격</a></li>
					</ul>
				</li>
				<li class="menu1"><a href="#">반려동물신고</a>
					<ul>
						<li><a href="mprSelectList">실종 반려동물 신고</a></li>
						<li><a href="mppSelectList">실종 반려동물 임시보호</a></li>
						<li><a href="mpfSelectList">실종 반려동물 목격</a></li>
					</ul>
				</li>
				<li class="menu1"><a href="#">고객지원</a>
					<ul>
						<li><a href="mnSelectList">공지사항</a></li>
						<li><a href="mqSelectList">Q&A</a></li>
						<li><a href="mrSelectList">건의사항</a></li>
					</ul>
				</li>
				<li class="menu1"><a href="#">실시간서비스</a>
					<ul>
						<li><a href="realTimeMhInfo">실시간 동선체크</a></li>
						<li><a href="realTimeMpInfo">반려동물 실시간 동선체크</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
