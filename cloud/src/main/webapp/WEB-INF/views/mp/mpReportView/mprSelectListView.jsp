<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class=" pt-5">
	<!-- 상단 게시판 제목 -->
	<div class="textTop row">
   		<h3 style="color: #5F8D4E;">실종 반려동물 신고 게시판</h3>
		<div class="pt-4">
      <div class="mt-4">
         <div class="border row">
            <div class="p-4 inblock">
               <div class="mb-4 inblock row">
                  <form class="mprSelectList" action="mprSelectList" id="searchForm" method="post">
					<div class="">
						<div class="main_search">
							<label class="text-start">성 별</label>
							<select name="mpGen">
								<option value="">--선택하세요--</option>
								<option value="M">수 컷</option>
								<option value="F">암 컷</option>
							</select>
						</div>
						<div class="main_search">
							<label class="text-start">동물종류</label>
							<select name="mpType">
								<option value="">--선택하세요--</option>
								<option value="01">강아지</option>
								<option value="02">고양이</option>
								<option value="03">기타</option>
							</select>
						</div>
						<div class="main_search">
							<label class="text-start">키워드</label>
							<input type="text" name="mpKeyword">
						</div>
						<div class="main_search search_date">
							<label class="text-start">발생일</label>
							<input type="date" name="mpDate1" class="p-4">~<input type="date" name="mpDate2">
						</div>
						<div class="main_search">
							<label class="text-start">발생지</label>
							<select name="mpLocalCode">
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
					<div class="text-end mt-1 color text-danger">
						<small>※ 입력란이 채워지지 않을 시 전체를 검색합니다. ※&nbsp;&nbsp;&nbsp;</small>
						<button type="submit" class="btn btn-secondary">검 색</button>
					</div>
				</form>
               <div class="row inblock">
                            <div class="col">
                              <a href="#"><button type="button" class="btn btn-lg btn-outline-secondary float ">검색</button></a>
                            </div>
		                </div>
		              </div>
		            </div>
		         </div>
      </div>
      <hr style="color:#285430; height:30px;">
   </div>
		
		<div class="col board-bottom text-end">
			<a href="mprInsert" class="btn btn-secondary posiRight my-2">글쓰기</a>
			<br>
		</div>
	</div>
		<!-- 게시판 리스트 -->
		<div>
			<div class="row">
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
										<div class=""><fmt:formatDate value="${mprSelectList.mprRegDate}" pattern="yy-MM-dd" /></div>
									
									<div class=""><b>실종위치</b></div>
									<div class="text-truncate">${mprSelectList.mprLocalDetail}</div>
									
									<div class=" "><b>실종현황</b></div>
									<c:if test="${mprSelectList.mprStatusCode == 01}">
										<div class="text-danger">실종</div>
									</c:if>
									<c:if test="${mprSelectList.mprStatusCode == 02}">
										<div class="text-primary">찾았어요!</div>
									</c:if>
							</div>
					</div	>
					</c:forEach>
				</div>
				<!-- 하단 리스트 -->
			<div class="cl-pagination-wrap mt-5">
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
									<li class="page-item active text-success" aria-current="page"><b>${i}</b></li>
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
			<div class="board-bottom">
				<a href="mprInsert" class="btn btn-outline-primary posiRight my-2">글쓰기</a>
				<br>
			</div>
		</div>
</div>