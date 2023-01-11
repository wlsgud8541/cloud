<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- header  -->
<div class="header">
	<div class="row">  
		<div class="col-4 text-center">
			<a href="main"><img src="resources/image/main/cloudLogo.png" style="width: 130px;"></a>
		</div>
		<div class="col-4 pt-5 text-center" style="position:relative;">
			<input type="text" class="rounded-pill ps-4 pe-5" style="width:100%;height:45px;border:2px solid #285430;">
<!-- 			<button type="button" style="border:none;background-color:transparent; position:absolute; top: 14px; left: 472px;"><img alt="" src="resources/image/main/mainSearch.png"class="rounded-circle"></button>  -->
		</div>
		<div class="col-4 row pt-5">
			<c:if test="${empty sessionScope.userId }">
			<div class="col text-end">
				<a href="loginView"><img src="resources/image/main/login.png" style="width:80px;"><br>로그인</a>
			</div>
			<div class="col text-start">
				<a href="mmInsertJoin1"><img alt="" src="resources/image/main/join.png"style="width:80px;"><br>회원가입</a>
			</div>
			</c:if>
			<c:if test="${not empty sessionScope.userId }">
			<div class="col text-end">
				<span><b>${sessionScope.userId }</b>님 로그인하셨습니다.</span>
				<a href="#"><img src="resources/image/main/logout.png" style="width:80px;"><br>로그아웃</a>
			</div>
			<div class="col text-start">
				<a href="mmSelectMyPage?mmNo=${sessionScope.mmNo}"><img alt="" src="resources/image/main/mPage.png"style="width:80px;"><br>마이페이지</a>
			</div>
			</c:if>
		</div>
	</div>
	<div class="row fs-5 text-center" style="background-color:#285430;">
		<div class="col ">
			<ul class="navi">
				<li><a href="#">사이트소개</a>
					<ul>
						<li><a href="#">사이트 목적</a></li>
						<li><a href="#">제휴 사이트</a></li>
					</ul>
				</li>
				<li><a href="mhrSelectList">실종자신고</a>
					<ul>
						<li><a href="mhrSelectList">실종자 정보</a></li>
						<li><a href="mhrSelectList">실종자 신고</a></li>
						<li><a href="mhrSelectList">실종자 목격</a></li>
					</ul>
				</li>
				<li><a href="mprSelectList">반려동물신고</a>
					<ul>
						<li><a href="mprSelectList">실종 반려동물 신고</a></li>
						<li><a href="mppSelectList">실종 반려동물 임시보호</a></li>
						<li><a href="mprSelectList">실종 반려동물 목격</a></li>
					</ul>
				</li>
				<li><a href="mnSelectList">고객지원</a>
					<ul>
						<li><a href="mnSelectList">공지사항</a></li>
						<li><a href="mqSelectList">Q&A</a></li>
						<li><a href="mrSelectList">건의사항</a></li>
					</ul>
				</li>
				<li><a href="#">실시간서비스</a>
					<ul>
						<li><a href="#">실시간 동선체크</a></li>
						<li><a href="#">반려동물 실시간 동선체크</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
</div>
