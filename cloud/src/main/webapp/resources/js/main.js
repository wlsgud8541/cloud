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

  $.ajax({
  	url : "myChartAjax",
  	datatype : "json",
  	success : function(result){
  		
  		new Chart(ctx, {
		    type: 'bar',
		    data: {
		      labels: ['서울', '경기', '인천', '대전', '광주', '대구', '울산', '부산', '세종', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주'],
		      datasets: [
			      {
			        label: '실종자',
			        data: [result.mhGrph[0].code01
			        	   ,result.mhGrph[0].code02
			        	   ,result.mhGrph[0].code03
			        	   ,result.mhGrph[0].code04
			        	   ,result.mhGrph[0].code05
			        	   ,result.mhGrph[0].code06
			        	   ,result.mhGrph[0].code07
			        	   ,result.mhGrph[0].code08
			        	   ,result.mhGrph[0].code09
			        	   ,result.mhGrph[0].code10
			        	   ,result.mhGrph[0].code11
			        	   ,result.mhGrph[0].code12
			        	   ,result.mhGrph[0].code13
			        	   ,result.mhGrph[0].code14
			        	   ,result.mhGrph[0].code15
			        	   ,result.mhGrph[0].code16
			        	   ,result.mhGrph[0].code17
			        	   ],
			        borderWidth: 1,
			      	borderColor:'#ff6787',
			      	backgroundColor:'#ffb1c1'
			      },
			      {
			      	label: '실종 반려동물',
			      	data: [result.mpGrph[0].code01
			        	   ,result.mpGrph[0].code02
			        	   ,result.mpGrph[0].code03
			        	   ,result.mpGrph[0].code04
			        	   ,result.mpGrph[0].code05
			        	   ,result.mpGrph[0].code06
			        	   ,result.mpGrph[0].code07
			        	   ,result.mpGrph[0].code08
			        	   ,result.mpGrph[0].code09
			        	   ,result.mpGrph[0].code10
			        	   ,result.mpGrph[0].code11
			        	   ,result.mpGrph[0].code12
			        	   ,result.mpGrph[0].code13
			        	   ,result.mpGrph[0].code14
			        	   ,result.mpGrph[0].code15
			        	   ,result.mpGrph[0].code16
			        	   ,result.mpGrph[0].code17
			        	   ],
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
  	},
  	error : function(){
  		alert("그래프 생성 도중 오류가 발생했습니다. 관리자에 문의해주세요.");
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
	$('.mpSearch').css('display','none');
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

