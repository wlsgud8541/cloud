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
	<c:if test="mhrSelectlist">
	<div class="row p-4 text-center" style="background-color:#820101;">
		<div class="ms-5">
			<div class="col text-white fs-5">
				<a href="mhrSelectList"><span>실종자 신고게시판</span></a>&nbsp;|&nbsp;
				<a href="mprSelectList"><span>반려동물 목록신고게시판</span></a>&nbsp;|&nbsp;
				<a href="mppSelectList"><span>반려동물 임시보호게시판</span></a>&nbsp;|&nbsp;
				<a href="mnSelectList"><span>공지사항</span></a>&nbsp;|&nbsp;
				<a href="mqSelectList"><span>Q&A 게시판</span></a>&nbsp;|&nbsp;
				<a href="mrSelectList"><span>건의게시판</span></a>
			</div>
		</div>
	</div>
	</c:if>
	<div class="row p-4 text-center" style="background-color:#285430;">
		<div class="ms-5">
			<div class="col text-white fs-5">
				<a href="mhrSelectList"><span>실종자 신고게시판</span></a>&nbsp;|&nbsp;
				<a href="mprSelectList"><span>반려동물 목록신고게시판</span></a>&nbsp;|&nbsp;
				<a href="mppSelectList"><span>반려동물 임시보호게시판</span></a>&nbsp;|&nbsp;
				<a href="mnSelectList"><span>공지사항</span></a>&nbsp;|&nbsp;
				<a href="mqSelectList"><span>Q&A 게시판</span></a>&nbsp;|&nbsp;
				<a href="mrSelectList"><span>건의게시판</span></a>
			</div>
		</div>
	</div>
	<div>
	</div>
</div>
