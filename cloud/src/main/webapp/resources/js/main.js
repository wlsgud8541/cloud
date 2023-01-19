$(function(){
// 사진 슬라이드
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
        	delay:3500,
        	disableOnInteraction: false,
        }
      });
 
// 그래프     
  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['서울', '경기', '인천', '대전', '광주', '대구', '울산', '대구', '부산', '세종', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주'],
      datasets: [
	      {
	        label: '실종자',
	        data: [12, 19, 3, 5, 2, 3, 19, 3, 5, 2, 3, 19, 3, 5, 2, 3, 3, 12],
	        borderWidth: 1,
	      	borderColor:'#ff6787',
	      	backgroundColor:'#ffb1c1'
	      },
	      {
	      	label: '실종 반려동물',
	      	data: [23,24,19, 3, 5, 2, 3, 19,1,2,42,10,11,21,14,15,24,19],
	      	borderWidth: 1,
	      	borderColor:'#4babed',
	      	backgroundColor:'#9ad0f5'
	      }
      ]
    },	
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  
//탭메뉴
	$('.tabcontent > div').hide();
	$('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	}).filter(':eq(0)').click();

//메인화면 소검색
	$('.mpSearch').hide();
	$("#search").on("change",function(){
		var searchVal = $("#search option:selected").val();
		console.log("searchVal : "+searchVal);
	
		if(searchVal == 'mh'){
			$('.mpSearch').hide();
			$('.mhSearch').fadeIn();
		}
		if(searchVal == 'mp'){
			$('.mhSearch').hide();
			$('.mpSearch').fadeIn();
		}
	});
	
});

