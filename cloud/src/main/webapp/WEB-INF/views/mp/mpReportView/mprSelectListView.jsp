<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="w3-content">
	<!-- 상단 게시판 제목 -->
	<div class="textTop row" style="width: 1000px;">
   		<div class="col-4 fs-2 fw-bold border-bottom border-primary border-4 border-opacity-50 pb-3">
			실종 반려동물 신고
		</div>
		<div class="pt-4">
    		<div class="mt-4">
		        <form action="mprSelectList" id="searchForm"  method="post" class=" border row mt-4 ">
					<div class="p-4 inblock">
						<div class="mb-4 row">
							<label class="categ">
								<b class="border-bottom border-success border-2 opacity-75">동물종류</b>
							</label>
							<div class="checks col-lg-5 col-sm-4">
								<select name="mpType" class="bg-white border">
									<option value="">--선택하세요--</option>
									<option value="01">강아지</option>
									<option value="02">고양이</option>
									<option value="03">기타</option>
								</select>
							</div>
						</div>
						<div class="mb-4 row" >
							<label class="categ">
								<b class="border-bottom border-success border-2 opacity-75">성별</b>
							</label>
							<div class="checks col-lg-5 col-sm-4">
								<select name="mpGen" class="bg-white border">
									<option value="">--선택하세요--</option>
									<option value="M">수 컷</option>
									<option value="F">암 컷</option>
								</select>
							</div>
								<label class=categ>
									<b class="border-bottom border-success border-2 opacity-75">키워드</b>
								</label>
							<div class="checks col">
								<div class="checks schInput ">
									<input type="text" name="mpKeyword" class="bg-white border">
								</div>
							</div>
						</div>
						<div class="mb-4 row">
							<label class="categ">
								<b class="border-bottom border-success border-2 opacity-75">발생일</b>
							</label>
							<div class="inblock col-5 schInput search_date ">
								<input type="date" name="mpDate1"class="text-center bg-white border" style="padding: 0;">~<input type="date" name="mpDate2"class="text-center bg-white border" style="padding: 0;">
							</div>
							<label class=categ>
								<b class="border-bottom border-success border-2 opacity-75">발생장소</b>
							</label>
							<div class="checks col">
								<div class="checks">
									<select name="mpLocalCode" class="bg-white border">
										<option value="">--선택하세요--</option>
								    	<option value="01">서울</option>
								    	<option value="02">경기</option>
								    	<option value="03">인천</option>
								    	<option value="04">대전</option>
								    	<option value="05">광주</option>
								    	<option value="06">대구</option>
								    	<option value="07">울산</option>
								    	<option value="08">부산</option>
								    	<option value="09">세종</option>
								    	<option value="10">강원</option>
								    	<option value="11">충북</option>
								    	<option value="12">충남</option>
								    	<option value="13">전북</option>
								    	<option value="14">전남</option>
								    	<option value="15">경북</option>
								    	<option value="16">경남</option>
								    	<option value="17">제주</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="inblock text-end float-end">
							<button type="submit" class="btn btn-lg btn-outline-secondary rounded-0">검색</button>
			           </div>
					</div>
				</form>
      		</div>
	   	</div>
	</div>
</div>
		<div class="col-10">
			<div class="row board-bottom text-end" style="position: relative; left: 100px;">
				<div class="col-11"></div>
				<div class="col-1" style="position: relative; right:25px;">
					<a href="mprInsert" class="btn btn-secondary posiRight my-2">글쓰기</a>
				</div>
			</div>
		</div>
		
		<!-- 게시판 리스트 -->
		<div style="position: relative; left: 100px;">
			<div class="row">
				<c:if test="${empty mprSelectList}">
					<div class="text-center fw-bold fw-3 mt-4" style="position: relative; right: 100px;"> 검색 결과가 없습니다.</div>
				</c:if>
				<c:if test="${not empty mprSelectList}">
					<c:forEach var="mprSelectList" items="${mprSelectList}" varStatus="status">
						<div class="col-3 row p-3">
								<div class="row picBoard p-0">
								<c:if test="${mprSelectList.mprAddFile != null}">
									<a href="mprSelectDetail?mprNo=${mprSelectList.mprNo}&pageNum=${mprModel.currentPage}">
										<img src="fileDownload?fileName=${mprSelectList.mprAddFile}" style="width: 150px; height: 200px;" >
									</a>
								</c:if>
								<c:if test="${mprSelectList.mprAddFile == null}">
									<a href="mprSelectDetail?mprNo=${mprSelectList.mprNo}&pageNum=${mprModel.currentPage}">
										<img src="resources/image/main/cloudLogo.png" style="width: 150px; height: 200px;" >
									</a>
								</c:if>
								</div>
								<div class="col-6">
										<div class=" "><b>성 별</b></div>
										<c:if test="${mprSelectList.mprGen == 'M '}">
											<div class="">수컷</div>
										</c:if>
										<c:if test="${mprSelectList.mprGen == 'F '}">
											<div class="">암컷</div>
										</c:if>
										
										<div class=" "><b>동물종류</b></div>
										<c:if test="${mprSelectList.mprPetType == 01}">
											<div class="">강아지</div>
										</c:if>
										<c:if test="${mprSelectList.mprPetType == 02}">
											<div class="">고양이</div>
										</c:if>
										<c:if test="${mprSelectList.mprPetType == 03}">
											<div class="">기타</div>
										</c:if>
										
										<div class=" "><b>실종일시</b></div>
											<div class=""><fmt:formatDate value="${mprSelectList.mprInfoDate}" pattern="yy-MM-dd" /></div>
										
										<div class=""><b>실종위치</b></div>
										<div class="text-truncate">${mprSelectList.mprLocalDetail}</div>
								</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-10">
				<div class="row board-bottom text-end" style="position: relative; left: 100px;">
					<div class="col-10"></div>
					<div class="col-1" style="position: relative; right:25px;">
						<a href="mprInsert" class="btn btn-outline-primary posiRight my-2">글쓰기</a>
					</div>
				</div>
			</div>
			 
			<!-- 하단 리스트 -->
			<div class="cl-pagination-wrap mt-5" style="position: relative; right: 100px;">
				<div class="col">
					<nav aria-label="Page navigation">
						<ul class="cl-pagination justify-content-center">
							<!-- 이젠 페이지 그룹 -->
							<c:if test="${ mprModel.startPage > mprModel.pageGroup }">
								<li class="prev"><a class="page-link"
									href="mprSelectList?pageNum=1">&lt;&lt;</a>
								</li>
							</c:if>
							<c:if test="${mprModel.startPage > mprModel.pageGroup }">
								<li class="prev"><a class="page-link"
									href="mprSelectList?pageNum=${ mprModel.startPage - mprModel.pageGroup }">&lt;</a>
								</li>
							</c:if>
							<!-- 페이지 그룹 -->
							<c:forEach var="i" begin="${mprModel.startPage}" end="${mprModel.endPage}">
								<c:if test="${i == mprModel.currentPage }">
									<li class="page-item active text-primary" aria-current="page"><b>${i}</b></li>
								</c:if>
								<c:if test="${i != mprModel.currentPage }">
									<li class="page-item"><a class="page-link" href="mprSelectList?pageNum=${i}&mpGen=${mprModel.mpGen}&mpType=${mprModel.mpType}&mpKeyword=${mprModel.mpKeyword}&mpDate1=${mprModel.mpDate1}&mpDate2=${mprModel.mpDate2}&mpLocalCode=${mprModel.mpLocalCode}">${i}</a></li>
								</c:if>
							</c:forEach>
							<!-- 다음페이지 그룹 -->
							<c:if test="${ mprModel.endPage < mprModel.pageCount }">
								<li class="next"><a class="page-link" href="mprSelectList?pageNum=${ mprModel.startPage + mprModel.pageGroup }">&gt;</a>
								</li>
							</c:if>
							<c:if test="${ mprModel.endPage < mprModel.pageCount }">
								<li class="next"><a class="page-link" href="mprSelectList?pageNum=${mprModel.pageCount}">&gt;&gt;</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
