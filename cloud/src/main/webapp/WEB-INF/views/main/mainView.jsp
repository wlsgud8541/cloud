<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="resources/js/main.js"></script>

<!-- 메인페이지 -->
<div>
	<div class="row mt-5">
		<div class="col-7 me-4 bg-white p-4 shadow-sm  ">
			<h3>
				<b>실종 반려동물</b>
			</h3>
			<div class=" border border-4 border-primary border-opacity-25 p-3">
				<div class="swiper mySwiper ">
					<div class="swiper-wrapper ">
						<div class="swiper-slide">
							<div class="inblock">
								<c:forEach var="mainMhiList" items="${mainMhiList}"
									varStatus="status">
									<c:if test="${status.index < 4}">
										<div class="inblock me-2 text-center"
											style="width: 150px; height: 100%;">
											<c:if test="${mainMhiList.mhiMsspsnIdntfccd != null}">
												<a href="mprSelectDetail?mprNo=${mainMhiList.mhiNo}&pageNum=1" class="inblock"> 
													<img src="fileDownload?fileName=${mainMhiList.mhiMsspsnIdntfccd}" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<c:if test="${mainMhiList.mhiMsspsnIdntfccd == null}">
												<a href="mprSelectDetail?mprNo=${mainMhiList.mhiNo}&pageNum=1" class="inblock"> 
												<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<div>
												${mainMhiList.mhiNm}(${mainMhiList.mhiAgeNow})
											</div>
											<div>
												<fmt:formatDate value="${mainMhiList.mhiOccrde }" pattern="yy-MM-dd" />
											</div>
											<div>
												<c:if test="${mainMhiList.mprLocalCode == 01 }">서울</c:if>
												<c:if test="${mainMhiList.mprLocalCode == 02 }">경기</c:if>
												<c:if test="${mainMhiList.mprLocalCode == 03 }">인천</c:if>
												<c:if test="${mainMhiList.mprLocalCode == 04 }">대전</c:if>
												<c:if test="${mainMhiList.mprLocalCode == 05 }">광주</c:if>
												<c:if test="${mainMhiList.mprLocalCode == 06 }">대구</c:if>
												<c:if test="${mainMhiList.mprLocalCode == 07 }">울산</c:if>
												<c:if test="${mainMhiList.mprLocalCode == 08 }">부산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 09 }">세종</c:if>
												<c:if test="${mainMprList.mprLocalCode == 10 }">강원</c:if>
												<c:if test="${mainMprList.mprLocalCode == 11 }">충북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 12 }">충남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 13 }">전북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 14 }">전남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 15 }">경북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 16 }">경남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 17 }">제주</c:if>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="inblock">
								<c:forEach var="mainMprList" items="${mainMprList}"
									varStatus="status">
									<c:if test="${4 <= status.index and status.index < 8}">
										<div class="inblock me-2 text-center"
											style="width: 150px; height: 100%;">
											<c:if test="${mainMprList.mprAddFile != null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="fileDownload?fileName=${mainMprList.mprAddFile}" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<c:if test="${mainMprList.mprAddFile == null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<div>
												<c:if test="${mainMprList.mprPetType == 01 }">강아지</c:if>
												<c:if test="${mainMprList.mprPetType == 02 }">고양이</c:if>
												<c:if test="${mainMprList.mprPetType == 03 }">기타</c:if>
											</div>
											<div>
												<fmt:formatDate value="${mainMprList.mprInfoDate }" pattern="yy-MM-dd" />
											</div>
											<div>
												<c:if test="${mainMprList.mprLocalCode == 01 }">서울</c:if>
												<c:if test="${mainMprList.mprLocalCode == 02 }">경기</c:if>
												<c:if test="${mainMprList.mprLocalCode == 03 }">인천</c:if>
												<c:if test="${mainMprList.mprLocalCode == 04 }">대전</c:if>
												<c:if test="${mainMprList.mprLocalCode == 05 }">광주</c:if>
												<c:if test="${mainMprList.mprLocalCode == 06 }">대구</c:if>
												<c:if test="${mainMprList.mprLocalCode == 07 }">울산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 08 }">부산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 09 }">세종</c:if>
												<c:if test="${mainMprList.mprLocalCode == 10 }">강원</c:if>
												<c:if test="${mainMprList.mprLocalCode == 11 }">충북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 12 }">충남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 13 }">전북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 14 }">전남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 15 }">경북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 16 }">경남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 17 }">제주</c:if>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="inblock">
								<c:forEach var="mainMprList" items="${mainMprList}"
									varStatus="status">
									<c:if test="${8 <= status.index and status.index < 12}">
										<div class="inblock me-2 text-center"
											style="width: 150px; height: 100%;">
											<c:if test="${mainMprList.mprAddFile != null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="fileDownload?fileName=${mainMprList.mprAddFile}" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<c:if test="${mainMprList.mprAddFile == null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<div>
												<c:if test="${mainMprList.mprPetType == 01 }">강아지</c:if>
												<c:if test="${mainMprList.mprPetType == 02 }">고양이</c:if>
												<c:if test="${mainMprList.mprPetType == 03 }">기타</c:if>
											</div>
											<div>
												<fmt:formatDate value="${mainMprList.mprInfoDate }" pattern="yy-MM-dd" />
											</div>
											<div>
												<c:if test="${mainMprList.mprLocalCode == 01 }">서울</c:if>
												<c:if test="${mainMprList.mprLocalCode == 02 }">경기</c:if>
												<c:if test="${mainMprList.mprLocalCode == 03 }">인천</c:if>
												<c:if test="${mainMprList.mprLocalCode == 04 }">대전</c:if>
												<c:if test="${mainMprList.mprLocalCode == 05 }">광주</c:if>
												<c:if test="${mainMprList.mprLocalCode == 06 }">대구</c:if>
												<c:if test="${mainMprList.mprLocalCode == 07 }">울산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 08 }">부산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 09 }">세종</c:if>
												<c:if test="${mainMprList.mprLocalCode == 10 }">강원</c:if>
												<c:if test="${mainMprList.mprLocalCode == 11 }">충북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 12 }">충남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 13 }">전북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 14 }">전남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 15 }">경북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 16 }">경남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 17 }">제주</c:if>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="inblock">
								<c:forEach var="mainMprList" items="${mainMprList}"
									varStatus="status">
									<c:if test="${12 <= status.index and status.index < 16}">
										<div class="inblock me-2 text-center"
											style="width: 150px; height: 100%;">
											<c:if test="${mainMprList.mprAddFile != null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="fileDownload?fileName=${mainMprList.mprAddFile}" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<c:if test="${mainMprList.mprAddFile == null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<div>
												<c:if test="${mainMprList.mprPetType == 01 }">강아지</c:if>
												<c:if test="${mainMprList.mprPetType == 02 }">고양이</c:if>
												<c:if test="${mainMprList.mprPetType == 03 }">기타</c:if>
											</div>
											<div>
												<fmt:formatDate value="${mainMprList.mprInfoDate }" pattern="yy-MM-dd" />
											</div>
											<div>
												<c:if test="${mainMprList.mprLocalCode == 01 }">서울</c:if>
												<c:if test="${mainMprList.mprLocalCode == 02 }">경기</c:if>
												<c:if test="${mainMprList.mprLocalCode == 03 }">인천</c:if>
												<c:if test="${mainMprList.mprLocalCode == 04 }">대전</c:if>
												<c:if test="${mainMprList.mprLocalCode == 05 }">광주</c:if>
												<c:if test="${mainMprList.mprLocalCode == 06 }">대구</c:if>
												<c:if test="${mainMprList.mprLocalCode == 07 }">울산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 08 }">부산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 09 }">세종</c:if>
												<c:if test="${mainMprList.mprLocalCode == 10 }">강원</c:if>
												<c:if test="${mainMprList.mprLocalCode == 11 }">충북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 12 }">충남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 13 }">전북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 14 }">전남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 15 }">경북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 16 }">경남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 17 }">제주</c:if>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>

					<div class="swiper-button-next"></div>
					<!-- 			       -->
					<div class="swiper-button-prev"></div>
					<!-- 			      -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
		<div class="col-4  p-4 bg-white shadow-sm">
			<h3>
				<b>실종자/반려동물 검색</b>
			</h3>
			<div class="w3-light-gray p-4 main_Blist mhpSearch text-center">
				<div class="main_search ">
					<label class="text-start">분 류</label> <select id="search">
						<option value="mh">실종자</option>
						<option value="mp">실종 반려동물</option>
					</select>
				</div>
				<form class="mhSearch" action="mhSearch" method="post">
					<div class="mhSearch">
						<div class="main_search">
							<label class="text-start">이 름</label> <input type="text"
								name="mhName" value="${mhName}">
						</div>
						<div class="main_search">
							<label class="text-start">대 상</label> <select name="mhCode">
								<option value="">--선택하세요--</option>
								<option value="01">비장애아동(18세 미만)</option>
								<option value="02">장애인(지적.자폐성.정신)</option>
								<option value="03">치매환자</option>
								<option value="04">가출인</option>
								<option value="05">기타</option>
							</select>
						</div>
						<div class="main_search">
							<label class="text-start">성 별</label> <select name="mhGen">
								<option value="">--선택하세요--</option>
								<option value="M">남 자</option>
								<option value="F">여 자</option>
							</select>
						</div>
						<div class="main_search search_date">
							<label class="text-start">발생일</label> <input type="date"
								name="mhInfoDate1" class="text-center" style="padding: 0;">~<input
								type="date" name="mhInfoDate2" class="text-center"
								style="padding: 0;">
						</div>
						<div class="main_search ">
							<label class="text-start">발생지</label> <select name="mhrLocalCode">
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
					<div class="text-end mt-4 color text-danger">
						<small>※ 입력란이 채워지지 않을 시 전체를 검색합니다. ※&nbsp;&nbsp;&nbsp;</small>
						<button type="submit" class="btn btn-secondary">검 색</button>
					</div>
				</form>


				<form class="mpSearch" action="mpSearch">
					<div class="">
						<!-- 						<div class="main_search"> -->
						<!-- 						<label class="text-start">분 류</label> -->
						<!-- 							<select id="search"> -->
						<!-- 								<option value="mh">실종자</option> -->
						<!-- 								<option value="mp">실종 반려동물</option> -->
						<!-- 							</select> -->
						<!-- 						</div> -->
						<div class="main_search">
							<label class="text-start">성 별</label> <select name="mpGen">
								<option value="">--선택하세요--</option>
								<option value="M">수 컷</option>
								<option value="F">암 컷</option>
							</select>
						</div>
						<div class="main_search">
							<label class="text-start">동물종류</label> <select name="mpType">
								<option value="">--선택하세요--</option>
								<option value="01">강아지</option>
								<option value="02">고양이</option>
								<option value="03">기타</option>
							</select>
						</div>
						<div class="main_search">
							<label class="text-start">키워드</label> <input type="text"
								name="mpKeyword">
						</div>
						<div class="main_search search_date">
							<label class="text-start">발생일</label> <input type="date"
								name="mpDate1" class="text-center" style="padding: 0;">~<input
								type="date" name="mpDate2" class="text-center"
								style="padding: 0;">
						</div>
						<div class="main_search">
							<label class="text-start">발생지</label> <select name="mpLocalCode">
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
			</div>
		</div>
	</div>
	<div class="row mt-4 ">
		<div class="col-7 me-4 bg-white p-4 shadow-sm  ">
			<h3>
				<b>실종 반려동물</b>
			</h3>
			<div class=" border border-4 border-primary border-opacity-25 p-3">
				<div class="swiper mySwiper ">
					<div class="swiper-wrapper ">
						<div class="swiper-slide">
							<div class="inblock">
								<c:forEach var="mainMprList" items="${mainMprList}"
									varStatus="status">
									<c:if test="${status.index < 4}">
										<div class="inblock me-2 text-center"
											style="width: 150px; height: 100%;">
											<c:if test="${mainMprList.mprAddFile != null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="fileDownload?fileName=${mainMprList.mprAddFile}" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<c:if test="${mainMprList.mprAddFile == null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
												<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<div>
												<c:if test="${mainMprList.mprPetType == 01 }">강아지</c:if>
												<c:if test="${mainMprList.mprPetType == 02 }">고양이</c:if>
												<c:if test="${mainMprList.mprPetType == 03 }">기타</c:if>
											</div>
											<div>
												<fmt:formatDate value="${mainMprList.mprInfoDate }" pattern="yy-MM-dd" />
											</div>
											<div>
												<c:if test="${mainMprList.mprLocalCode == 01 }">서울</c:if>
												<c:if test="${mainMprList.mprLocalCode == 02 }">경기</c:if>
												<c:if test="${mainMprList.mprLocalCode == 03 }">인천</c:if>
												<c:if test="${mainMprList.mprLocalCode == 04 }">대전</c:if>
												<c:if test="${mainMprList.mprLocalCode == 05 }">광주</c:if>
												<c:if test="${mainMprList.mprLocalCode == 06 }">대구</c:if>
												<c:if test="${mainMprList.mprLocalCode == 07 }">울산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 08 }">부산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 09 }">세종</c:if>
												<c:if test="${mainMprList.mprLocalCode == 10 }">강원</c:if>
												<c:if test="${mainMprList.mprLocalCode == 11 }">충북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 12 }">충남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 13 }">전북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 14 }">전남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 15 }">경북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 16 }">경남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 17 }">제주</c:if>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="inblock">
								<c:forEach var="mainMprList" items="${mainMprList}"
									varStatus="status">
									<c:if test="${4 <= status.index and status.index < 8}">
										<div class="inblock me-2 text-center"
											style="width: 150px; height: 100%;">
											<c:if test="${mainMprList.mprAddFile != null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="fileDownload?fileName=${mainMprList.mprAddFile}" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<c:if test="${mainMprList.mprAddFile == null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<div>
												<c:if test="${mainMprList.mprPetType == 01 }">강아지</c:if>
												<c:if test="${mainMprList.mprPetType == 02 }">고양이</c:if>
												<c:if test="${mainMprList.mprPetType == 03 }">기타</c:if>
											</div>
											<div>
												<fmt:formatDate value="${mainMprList.mprInfoDate }" pattern="yy-MM-dd" />
											</div>
											<div>
												<c:if test="${mainMprList.mprLocalCode == 01 }">서울</c:if>
												<c:if test="${mainMprList.mprLocalCode == 02 }">경기</c:if>
												<c:if test="${mainMprList.mprLocalCode == 03 }">인천</c:if>
												<c:if test="${mainMprList.mprLocalCode == 04 }">대전</c:if>
												<c:if test="${mainMprList.mprLocalCode == 05 }">광주</c:if>
												<c:if test="${mainMprList.mprLocalCode == 06 }">대구</c:if>
												<c:if test="${mainMprList.mprLocalCode == 07 }">울산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 08 }">부산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 09 }">세종</c:if>
												<c:if test="${mainMprList.mprLocalCode == 10 }">강원</c:if>
												<c:if test="${mainMprList.mprLocalCode == 11 }">충북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 12 }">충남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 13 }">전북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 14 }">전남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 15 }">경북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 16 }">경남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 17 }">제주</c:if>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="inblock">
								<c:forEach var="mainMprList" items="${mainMprList}"
									varStatus="status">
									<c:if test="${8 <= status.index and status.index < 12}">
										<div class="inblock me-2 text-center"
											style="width: 150px; height: 100%;">
											<c:if test="${mainMprList.mprAddFile != null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="fileDownload?fileName=${mainMprList.mprAddFile}" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<c:if test="${mainMprList.mprAddFile == null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<div>
												<c:if test="${mainMprList.mprPetType == 01 }">강아지</c:if>
												<c:if test="${mainMprList.mprPetType == 02 }">고양이</c:if>
												<c:if test="${mainMprList.mprPetType == 03 }">기타</c:if>
											</div>
											<div>
												<fmt:formatDate value="${mainMprList.mprInfoDate }" pattern="yy-MM-dd" />
											</div>
											<div>
												<c:if test="${mainMprList.mprLocalCode == 01 }">서울</c:if>
												<c:if test="${mainMprList.mprLocalCode == 02 }">경기</c:if>
												<c:if test="${mainMprList.mprLocalCode == 03 }">인천</c:if>
												<c:if test="${mainMprList.mprLocalCode == 04 }">대전</c:if>
												<c:if test="${mainMprList.mprLocalCode == 05 }">광주</c:if>
												<c:if test="${mainMprList.mprLocalCode == 06 }">대구</c:if>
												<c:if test="${mainMprList.mprLocalCode == 07 }">울산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 08 }">부산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 09 }">세종</c:if>
												<c:if test="${mainMprList.mprLocalCode == 10 }">강원</c:if>
												<c:if test="${mainMprList.mprLocalCode == 11 }">충북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 12 }">충남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 13 }">전북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 14 }">전남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 15 }">경북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 16 }">경남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 17 }">제주</c:if>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="inblock">
								<c:forEach var="mainMprList" items="${mainMprList}"
									varStatus="status">
									<c:if test="${12 <= status.index and status.index < 16}">
										<div class="inblock me-2 text-center"
											style="width: 150px; height: 100%;">
											<c:if test="${mainMprList.mprAddFile != null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="fileDownload?fileName=${mainMprList.mprAddFile}" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<c:if test="${mainMprList.mprAddFile == null}">
												<a href="mprSelectDetail?mprNo=${mainMprList.mprNo}&pageNum=1" class="inblock"> 
													<img src="resources/image/main/cloudLogo.png" style="width: 90px; height: 120px;">
												</a>
											</c:if>
											<div>
												<c:if test="${mainMprList.mprPetType == 01 }">강아지</c:if>
												<c:if test="${mainMprList.mprPetType == 02 }">고양이</c:if>
												<c:if test="${mainMprList.mprPetType == 03 }">기타</c:if>
											</div>
											<div>
												<fmt:formatDate value="${mainMprList.mprInfoDate }" pattern="yy-MM-dd" />
											</div>
											<div>
												<c:if test="${mainMprList.mprLocalCode == 01 }">서울</c:if>
												<c:if test="${mainMprList.mprLocalCode == 02 }">경기</c:if>
												<c:if test="${mainMprList.mprLocalCode == 03 }">인천</c:if>
												<c:if test="${mainMprList.mprLocalCode == 04 }">대전</c:if>
												<c:if test="${mainMprList.mprLocalCode == 05 }">광주</c:if>
												<c:if test="${mainMprList.mprLocalCode == 06 }">대구</c:if>
												<c:if test="${mainMprList.mprLocalCode == 07 }">울산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 08 }">부산</c:if>
												<c:if test="${mainMprList.mprLocalCode == 09 }">세종</c:if>
												<c:if test="${mainMprList.mprLocalCode == 10 }">강원</c:if>
												<c:if test="${mainMprList.mprLocalCode == 11 }">충북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 12 }">충남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 13 }">전북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 14 }">전남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 15 }">경북</c:if>
												<c:if test="${mainMprList.mprLocalCode == 16 }">경남</c:if>
												<c:if test="${mainMprList.mprLocalCode == 17 }">제주</c:if>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>

					<div class="swiper-button-next"></div>
					<!-- 			       -->
					<div class="swiper-button-prev"></div>
					<!-- 			      -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
		<div class="col-4 p-4  bg-white shadow-sm">
			<h3>
				<b>목격게시판</b>
			</h3>
			<div class="tab">
				<ul class="tabnav">
					<li><a href="#tab1">실종자</a></li>
					<li><a href="#tab2">실종 반려동물</a></li>
				</ul>
				<div class="tabcontent">
					<div id="tab1">
						<table class="table table-hover">
							<c:forEach var="mainMhfList" items="${mainMhfList }">
								<tr>
									<td><a
										href="mhfDetailView?mhfNo=${mainMhfList.mhfNo}&pageNum=1">${mainMhfList.mhfTitle}</a></td>
									<td><fmt:formatDate value="${mainMhfList.mhfRegDate }"
											pattern="yy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</table>
						<a href="mhfSelectList"><i class="xi-plus-thin"></i></a>
					</div>
					<div id="tab2">
						<table class="table table-hover">
							<c:forEach var="mainMpfList" items="${mainMpfList }">
								<tr>
									<td><a
										href="mpfSelectDetail?mpfNo=${mainMpfList.mpfNo }&pageNum=1">${mainMpfList.mpfTitle}</a></td>
									<td><fmt:formatDate value="${mainMpfList.mpfRegDate }"
											pattern="yy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</table>
						<a href="mpfSelectList"><i class="xi-plus-thin"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col-7 bg-white me-4 p-4 shadow-sm">
			<h3>
				<b>통계그래프</b>
			</h3>
			<div style="with: auto;">
				<canvas id="myChart"></canvas>
			</div>
		</div>
		<div class="col-4 bg-white p-4 shadow-sm">
			<h3>
				<b>공지사항</b>
			</h3>
			<div class=" notice_main p-3">
				<table class="table table-hover">
					<c:forEach var="mainMnList" items="${mainMnList }">
						<tr class="">
							<td><a
								href="mnSelectDetail?mnNo=${mainMnList.mnNo}&pageNum=1">${mainMnList.mnTitle}</a></td>
							<td><fmt:formatDate value="${mainMnList.mnRegDate }"
									pattern="yy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
				<a href="mnSelectList"><i class="xi-plus-thin"></i></a>
			</div>
		</div>
	</div>
</div>

<!-- <span>
	<img  src="resources/image/main/mainTmp.jpg">
</span> -->