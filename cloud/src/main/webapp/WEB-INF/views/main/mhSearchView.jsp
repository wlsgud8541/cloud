<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<div class="pt-4">
	<div class="mt-4">
		<div class="border row">
			<div class="p-4 inblock">
				<div class="mb-4 inblock row">
					<div class="main_search">
						<label class="text-start fw-bold">대상</label>
						<select name="mhCode">
							<option value="">--선택하세요--</option>
							<option value="01">비장애아동(18세 미만)</option>
							<option value="02">장애인(지적.자폐성.정신)</option>
							<option value="03">치매환자</option>
							<option value="04">가출인</option>
							<option value="05">기타</option>
						</select>
					</div>
				</div>
				<div class="mb-4">
					<label class="categ">
						<b>성별</b>
					</label>
					<div class="checks col-lg-5 col-sm-4">
						<div class="checks col4">
							<input type="radio">
							<label class="checks "> 전체 </label>
						</div>
						<div class="checks col4">
							<input type="radio">
							<label class="checks "> 남자 </label>
						</div>
						<div class="checks col4">
							<input type="radio">
							<label class="checks "> 여자 </label>
						</div>
					</div>
					<div class="checks col-lg-5 col-sm-4">
						<label class=categ>
							<b>이름</b>
						</label>
						<div class="checks">
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="mb-4">
					<label class="categ">
						<b>발생일</b>
					</label>
					<div class="inblock col-lg-5 col-sm-4">
						<div class="inblock">
							<input type="date"  class="form-control">
						</div>	
							~
						<div class="inblock">
							<input type="date" class="form-control">
						</div>
					</div>
					<label class="categ">
						<b>당시나이</b>
					</label>
					<div class="inblock col-lg-5 col-sm-4">
						<div class="inblock">
							<input type="text" class="form-control">
						</div>
							~
						<div class="inblock">
							<input type="text"  class="form-control">
						</div>
					</div>
				</div>
				<div class="mb-4">
					<label class="categ">
						<b>신체특징</b>
					</label>
					<div class="checks col-lg-5 col-sm-4">
						<div class="checks">
							<input type="text" class="form-control">
						</div>
					</div>
					<label class=categ>
						<b>발생장소</b>
					</label>
					<div class="checks col-lg-5 col-sm-4">
						<div class="checks">
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="row inblock">
					<div class="col">	
						<a href="#"><button type="button" class="btn btn-lg btn-outline-secondary">검색</button></a>
					</div>
	            </div>
			</div>
		</div>
	</div>
</div>
<h3 class="text-success fw-bold mt-4">검색결과</h3>
<hr class="border border-success border-2 opacity-50">
<div>
	<div class="fs-2 fw-bold border-bottom border-danger border-4 d-inline-block"><a href="mhrSelectList">실종자 신고</a></div>
	<c:if test="${empty mhrSrch}">
		<div class="text-center fw-bold fw-3 mt-4"> 검색 결과가 없습니다.</div>
	</c:if>
	<c:if test="${not empty mhrSrch}">
	<div class="mt-4">
	<c:forEach var="mhrSrch" items="${mhrSrch}">
		<a href="mhrDetailView?mhrNo=${mhrSrch.mhrNo}&pageNum=1">${mhrSrch.mhrTitle}</a>||${mhrSrch.mhrContent}||${mhrSrch.mhrWriter }||<fmt:formatDate value="${mhrSrch.mhrRegDate }" pattern="yy-MM-dd"/> <br> <br>
	</c:forEach>
	</div>
	</c:if>
</div>