<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 메인페이지 -->
<%-- 
<div class="row bodyBg">
	<div class="col-4   shadow-sm">
	메인 화면 테스트<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	</div>
	<div class="col-4   shadow-sm">
	메인 화면 테스트<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	</div>
	<div class="col-4   shadow-sm">
	메인 화면 테스트<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	</div>
</div>
<div class="row ">
	<div class="col-4   shadow-sm">
	메인 화면 테스트<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	</div>
	<div class="col-4   shadow-sm">
	메인 화면 테스트<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	</div>
	<div class="col-4   shadow-sm">
		<ul>
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
<div class="row ">
	<div class="col-4   shadow-sm">
	메인 화면 테스트<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	</div>
	<div class="col-4   shadow-sm">
	메인 화면 테스트<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	<br>메인 화면 테스트<br>메인 화면 테스트
	</div>
	<div class="col-4  shadow-sm">

		<c:forEach var="mainMnList" items="${mainMnList }">
		<a href="mnSelectDetail?mnNo=${mainMnList.mnNo}&pageNum=1">${mainMnList.mnTitle}</a>
		<fmt:formatDate value="${mainMnList.mnRegDate }" pattern="yy-MM-dd"/> <br>
		</c:forEach>
	</div>
</div>
 --%>
<span>
	<img alt="" src="resources/image/main/mainTmp.jpg">
</span>