<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link  rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- 메인페이지 -->
<div>
	<div class="row mt-5">
		<div class="col-7 me-4 bg-white p-4 shadow-sm rounded-4 ">
			<h3><b>실종자</b></h3>
			<div class=" border border-4 border-danger border-opacity-25 p-5 rounded-4">
			    <div class="swiper mySwiper ">
			      <div class="swiper-wrapper ">
			        <div class="swiper-slide">
			        	<div class="row">
				        	<div class="col shadow me-2 text-center"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/dndud.jpg">
				        		<div>정우영(32)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/wlsgud.jpg">
				        		<div>전진형(30)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/ruddnr.jpg">
				        		<div>김경욱(30)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/alsgur.jpg">
				        		<div>정민혁(27)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
			        	</div>
			        </div>
			        <div class="swiper-slide">
			        	<div class="row">
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/dndud.jpg">
				        		<div>정우영(32)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/wlsgud.jpg">
				        		<div>전진형(30)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/ruddnr.jpg">
				        		<div>김경욱(30)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/alsgur.jpg">
				        		<div>정민혁(27)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
			        	</div>
			        </div>
			        <div class="swiper-slide">
			        	<div class="row">
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/dndud.jpg">
				        		<div>정우영(32)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/wlsgud.jpg">
				        		<div>전진형(30)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/ruddnr.jpg">
				        		<div>김경욱(30)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
				        	<div class="col shadow me-2"style="width: 150px; height: 100%;">
				        		<img alt="" src="resources/image/main/alsgur.jpg">
				        		<div>정민혁(27)</div>
				        		<div>오늘</div>
				        		<div>학원</div>
				        	</div>
			        	</div>
			        </div>
			      </div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-button-prev"></div>
			      <div class="swiper-pagination"></div>
    </div>
    </div>	
	    </div>
		<div class="col-4  p-4 bg-white shadow-sm rounded-4">
			<h3><b>검색기능🔍</b></h3>	
			<div class="w3-light-gray p-4 main_Blist rounded-4">
				<div class="main_search">
				<label>분 류</label>
					<select>
						<option>실종자</option>
						<option>실종 반려동물</option>
					</select>
				</div>
				<div class="main_search">
					<label>이 름</label>
					<input type="text">
				</div>
				<div class="main_search">
					<label>성 별</label>
					<select>
						<option>남 자</option>
						<option>여 자</option>
					</select>
				</div>
				<div class="main_search search_date">
					<label class="">발생일</label>
					<input type="date">~<input type="date">
				</div>
				<div class="main_search">
					<label>발생지</label>
					<input type="text" >
				</div>
				<div class="main_search">
					<label>목격장소</label>
					<input type="text">
				</div>
				<div class="text-end mt-2">
					<button type="submit" class="btn btn-secondary">검 색</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-5 ">
		<div class="col-7 me-4 p-4 bg-white shadow-sm">
			<h3><b>실종 반려동물</b></h3>	
				<div class=" border border-4 border-primary border-opacity-25 p-5">
			    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
        	<div class="row">
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box1</div>
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box2</div>
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box3</div>
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box4</div>
        	</div>        	
        </div>
        <div class="swiper-slide">
        	<div class="row">
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box1</div>
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box2</div>
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box3</div>
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box4</div>
        	</div>        
        </div>
        <div class="swiper-slide">
        	<div class="row">
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box1</div>
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box2</div>
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box3</div>
	        	<div class="col  me-2"style="width: 150px; height: 200px;">box4</div>
        	</div>        
        </div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </div>
    </div>	
	    </div>
		<div class="col-4 p-4  bg-white shadow-sm">
			<h3><b>목격게시판(임시)</b></h3>
			<div>
				<ul class="border border-secondary p-2 ">
					<li>실종자
						<ul>
							<li>
							<c:forEach var="mainMhfList" items="${mainMhfList }">
							<a href="mhfDetailView?mhfNo=${mainMhfList.mhfNo}&pageNum=1">${mainMhfList.mhfTitle}</a>
							<fmt:formatDate value="${mainMhfList.mhfRegDate }" pattern="yy-MM-dd"/><br>
							</c:forEach>					
							</li>
						</ul>
					</li>
					<li>실종 반려동물
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
	</div>
	<div class="row mt-5">
		<div class="col-7 bg-white me-4 p-4 shadow-sm">
			<h3><b>통계그래프(임시)</b></h3>
			<div>
			  <canvas id="myChart"></canvas>
			</div>
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
 <!--    <script>
      var swiper = new Swiper(".mySwiper", {
        spaceBetween: 10,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      });
    </script> -->
<script>
      var swiper = new Swiper(".mySwiper", {
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        spaceBetween: 10,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        autoplay :{
        	delay:3000,
        	disableOnInteraction: false,
        }
      });
    </script>
    <script>
  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
<!-- <span>
	<img alt="" src="resources/image/main/mainTmp.jpg">
</span> -->