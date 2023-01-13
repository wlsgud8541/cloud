<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<!-- header  -->
<div class="header fixed-top">
	<div class="row headerMain border-bottom bg-white">  
		<div class="col text-center">
        	 <a href="main"><img src="resources/image/main/cloudLogo.png" style="width: 130px;"></a>
     	</div>
     	<div class="search_wrap text-center">
         <input type="text" class="search_bar rounded-pill ps-4 pe-5">
         <button type="button" class="btn">검색</button> 
     	</div>
		<c:if test="${empty sessionScope.userId }">
		<div class="col text-start pt-4 ps-5">
			<ul class="nowLogin">
				<li><a href="loginView" class="login">로그인</a></li>
				<li><a href="mmInsertJoin1" class="join">회원가입</a></li>
			</ul>
		</div>
		</c:if>
		<c:if test="${not empty sessionScope.userId }">
		<div class="col text-start pt-4 ps-5">
			<ul class="nowLogin">
				<li class="user"><span><b>${sessionScope.userId}</b>님</span><br><span>로그인하셨습니다.</span></li>
				<li><a href="mmSelectMyPage?mmNo=${sessionScope.mmNo}" class="myPage">마이페이지</a></li>
				<li><a href="mmLogout" class="logout">로그아웃</a></li>
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
						<li><a href="#">사이트 목적</a></li>
						<li><a href="#">제휴 사이트</a></li>
					</ul>
				</li>
				<li class="menu1"><a href="#">실종자신고</a>
					<ul>
						<li><a href="mhrSelectList">실종자 정보</a></li>
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
