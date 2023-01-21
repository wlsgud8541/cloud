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
                  <div class="checks">
                     <div class="categ">
                        <b>동물종류</b>
                     </div>
                     <div class="checks col2">
                        <input type="radio">
                        <label> 전체 </label>
                     </div>
                     <div class="checks col2">
                        <input type="radio">
                        <label> 강아지 </label>
                     </div>
                     <div class="checks col2">
                        <input type="radio">
                        <label> 고양이 </label>
                     </div>
                     <div class="checks col2">
                        <input type="radio">
                        <label> 기타 </label>
                     </div>
                  </div>
               </div>
               <div class="mb-4">
                  <label class="categ">
                     <b>성별</b>
                  </label>
                  <div class="checks col-lg-5 col-sm-4">
                     <div class="checks col4">
                        <input type="radio">
                        <label class="checks "> 수컷 </label>
                     </div>
                     <div class="checks col4">
                        <input type="radio">
                        <label class="checks "> 암컷 </label>
                     </div>
                  </div>
                  <div class="checks col-lg-5 col-sm-4">
                     <label class=categ>
                        <b>제목</b>
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
                     <b>작성자</b>
                  </label>
                  <div class="inblock col-lg-5 col-sm-4">
                     <div class="inblock">
                        <input type="text" name="keyWord" value="${keyWord}" class="form-control">
                     </div>
                  </div>
               </div>
               <div class="mb-4">
                  <label class="categ">
                     <b>실종위치</b>
                  </label>
                  <div class="checks col-lg-5 col-sm-4">
                     <div class="checks">
                        <input type="text" class="form-control" placeholder="예)관악구">
                     </div>
                  </div>
                  <label class=categ>
                     <b>내용</b>
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
									<li class="page-item"><a class="page-link" href="mprSelectList?pageNum=${ i }">${i}</a></li>
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