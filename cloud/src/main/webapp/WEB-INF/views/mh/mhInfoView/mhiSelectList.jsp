<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>


<div>
	<!-- 상단 게시판 제목 -->
	<div class="textTop row">
   		<h3 class="col-3 fs-2 fw-bold border-bottom border-danger border-4 border-opacity-50 ">실종자 정보</h3>
	</div>
		<!-- 게시판 리스트 -->
		<div>
			<div class="row mt-4">
					<c:forEach var="jMap" items="${jMap}" varStatus="status">
					<div class="col-3 row p-3">
							<div class="row picBoard p-0">
							<c:if test="${jMap.mhiMsspsnIdntfccd != null}">
								<a href='https://www.safe182.go.kr/home/lcm/lcmMssGet.do?gnbMenuCd=014000000000&lnbMenuCd=014001000000&rptDscd=2&msspsnIdntfccd=${jMap.mhiMsspsnIdntfccd}'>
									<img style='width:150px;height:200px;' width='96' height='128' border='0' src='https://www.safe182.go.kr/api/lcm/imgView.do?msspsnIdntfccd=${jMap.mhiMsspsnIdntfccd}'/>
								</a>
							</c:if>
							<c:if test="${jMap.mhiMsspsnIdntfccd == null}">
								<a href="https://www.safe182.go.kr">
									<img src="resources/image/main/cloudLogo.png" style="width: 150px; height: 200px;" >
								</a>
							</c:if>
							</div>
							<div class="col-6">
									<div class=" "><b>이름(나이) / 성별</b></div>
									<c:if test="${fn:trim(jMap.mhiSexdstnDscd) == 'M'}">
										<div class="">${jMap.mhiNm}(${jMap.mhiAge}) / 남자</div>
									</c:if>
									<c:if test="${fn:trim(jMap.mhiSexdstnDscd) == 'F'}">
										<div class="">${jMap.mhiNm}(${jMap.mhiAge}) / 여자</div>
									</c:if>
									<div class=" "><b>대상구분</b></div>
									<c:if test="${fn:trim(jMap.mhiWritngTrgetDscd) == '010'}">
										<div class="text-truncate">비장애아동(18세 미만)</div>
									</c:if>
									<c:if test="${fn:trim(jMap.mhiWritngTrgetDscd) == '020'}">
										<div class="">가출인</div>
									</c:if>
									<c:if test="${fn:trim(jMap.mhiWritngTrgetDscd) == '060'
												or fn:trim(jMap.mhiWritngTrgetDscd) == '061'
												or fn:trim(jMap.mhiWritngTrgetDscd) == '062'}">
										<div class="text-truncate">장애인(지적.자폐성.정신)</div>
									</c:if>
									<c:if test="${fn:trim(jMap.mhiWritngTrgetDscd) == '070'}">
										<div class="">치매환자</div>
									</c:if>
									<c:if test="${fn:trim(jMap.mhiWritngTrgetDscd) =='080'}">
										<div class="">기타</div>
									</c:if>
									
									<div class=" "><b>실종일시</b></div>
										<div class="">${fn:substring(jMap.mhiOccrde,2,4)}-${fn:substring(jMap.mhiOccrde,4,6)}-${fn:substring(jMap.mhiOccrde,6,8)}</div>
									
									<div class=""><b>실종위치</b></div>
									<div class="text-truncate">${jMap.mhiOccrAdres}</div>
							</div>
					</div	>
					</c:forEach>
					<div class="text-end mt-2 opacity-50">
						<span class="fw-bold text-secondary">[자료출처 : 경찰청]</span>
					</div>
				</div>
				<!-- 하단 리스트 -->
			<div class="cl-pagination-wrap mt-5">
				<div class="col">
					<nav aria-label="Page navigation">
						<ul class="cl-pagination justify-content-center">
							<!-- 이젠 페이지 그룹 -->
							<c:if test="${ startPage > pageGroup }">
								<li class="prev"><a class="page-link"
									href="mhInfo?pageNum=1">&lt;&lt;</a>
								</li>
							</c:if>
							<c:if test="${startPage > pageGroup }">
								<li class="prev"><a class="page-link"
									href="mhInfo?pageNum=${startPage - pageGroup }">&lt;</a>
								</li>
							</c:if>
							<!-- 페이지 그룹 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage }">
									<li class="page-item active text-danger	" aria-current="page"><b>${i}</b></li>
								</c:if>
								<c:if test="${i != currentPage }">
									<li class="page-item"><a class="page-link" href="mhInfo?pageNum=${i}">${i}</a></li>
								</c:if>
							</c:forEach>
							<!-- 다음페이지 그룹 -->
							<c:if test="${endPage < pageCount}">
								<li class="next"><a class="page-link" href="mhInfo?pageNum=${startPage + pageGroup }">&gt;</a>
								</li>
							</c:if>
							<c:if test="${endPage < pageCount }">
								<li class="next"><a class="page-link" href="mhInfo?pageNum=${pageCount}">&gt;&gt;</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
</div>

