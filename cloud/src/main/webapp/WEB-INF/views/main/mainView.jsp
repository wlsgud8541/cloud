<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 메인페이지 -->
<div>
	<div class="row mt-5">
		<div class="col-7 me-4 bg-white p-4 shadow-sm">
			여긴 실종자 사진 리스트 
		</div>
		<div class="col-4 bg-white p-4 shadow-sm">
			검색기능🔍		
		</div>
	</div>
	<div class="row mt-5 ">
		<div class="col-7 me-4 p-4 bg-white shadow-sm">
			여긴 반려동물 사진 리스트
		</div>
		<div class="col-4 p-4  bg-white shadow-sm">
			<h3><b>목격게시판(임시)</b></h3>
			<ul class="border border-secondary p-2 ">
				<li>사람
					<ul>
						<li>
						<c:forEach var="mainMhfList" items="${mainMhfList }">
						<a href="mhfDetailView?mhfNo=${mainMhfList.mhfNo}&pageNum=1">${mainMhfList.mhfTitle}</a>
						<fmt:formatDate value="${mainMhfList.mhfRegDate }" pattern="yy-MM-dd"/><br>
						</c:forEach>					
						</li>
					</ul>
				</li>
				<li>동물
					<ul>
						<li>
						<c:forEach var="mainMpfList" items="${mainMpfList }">
						<a href="mpfSelectDetail?mpfNo=${mainMpfList.mpfNo }&pageNum=1">${mainMpfList.mpfTitle}</a>
						<fmt:formatDate value="${mainMpfList.mpfRegDate }" pattern="yy-MM-dd"/><br>
						</c:forEach>					
						</li>
					</ul>
				</li>
			</ul>		
		</div>
	</div>
	<div class="row mt-5">
		<div class="col-7 bg-white me-4 p-4 shadow-sm">
		여긴 그래프
		</div>
		<div class="col-4 bg-white p-4 shadow-sm">
			<h3><b>공지사항(임시)</b></h3>
			<ul class="border border-secondary p-2 main_Blist">
			<c:forEach var="mainMnList" items="${mainMnList }">
				<li class="">
					<a href="mnSelectDetail?mnNo=${mainMnList.mnNo}&pageNum=1">${mainMnList.mnTitle}</a>
					<span>
						<fmt:formatDate value="${mainMnList.mnRegDate }" pattern="yy-MM-dd"/> <br>
					</span>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
</div>
<!-- <span>
	<img alt="" src="resources/image/main/mainTmp.jpg">
</span> -->