<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang='ko'>
<head>
 	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>

#searchForm {
	margin-top: 40px;
    padding: 15px 15px;
    text-align: center;
    border-radius: 12px;
    background-color: #f8f8f8;
    letter-spacing: -0.02em;
    color: #fff;
    background: #82b695;
    cursor:pointer;
}
   .bi-heart{
       font-size: 30px;
       line-height: 30px;
       color:crimson;
       cursor:pointer;
   }

   .bi-heart-fill{
       font-size: 30px;
       line-height: 30px;
       color:crimson;
       cursor:pointer;
   }
   
#mapinfo{
	border-radius : 20px;
	text-align:center;
	padding:3px 0;
	border: 2px solid green;
	width:210px;

	}  
</style>
</head>

<!-- 헤더에 제이쿼리, 부트스트랩, 우리가 개별 적용할 css를 위한 custom.css 파일까지 다 적용되어 있음 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section class="bg-light">
	<div class="container pt-3">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="row mt-5 mb-4">
					<div class="col mt-5">
<!-- 					페이지 제목 및 설명 헤더 부분(작성) -->
						<p class="text-center display-5">CAFE</p>
						<p class="text-center lead"> 마음에 드는 카페 찾고 할인 받으세요!</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
				<div class="row mt-5">
					<div class="col">
						<hr />
<!-- 					페이지 소제목 부분(작성) -->
						<p class="lead" style="font-size: 2rem; color: ;">
							<i class="bi bi-chat-right-heart"
							 style="font-size: 3rem; color: palevioletred;"></i>
						 카페 상세보기
					 	</p>
					</div>
				</div>
				
<!-- 			여기서부터 본문 영역 -->
<!-- 			row클래스로 하나의 행을 생성 -->
				<div id="cafedetail" class="row mt-2">
<!-- 				row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!-- 				한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
					
					<div class="col-6">
						<img src="${cafeVO.photo_url}"
							 class="img-thumbnail" />
					</div>
					<div class="col-6">	
						<span>
						<strong class="titDep5" style="font-size: 2rem; color: cadetblue;">${cafeVO.name}</strong>
						<div class="conUtil mt-3">
					<div>
					<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral; ">
						&#9200; ${cafeVO.start_date} 부터 ${cafeVO.end_date} 까지
					</span>
					</div>
					<div>
					<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral;  ">
					${cafeVO.start_time} ~ ${cafeVO.end_time} 사이 할인 진행중이예요 ! &#128149;
					 </span>
					</div>
							<span class="icoScore" title="평균 평점">
								<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i><span id="cafeDetailAvgStar"></span>
								<i title="리뷰 갯수"></i>
							</span>
							<span title="위치 정보"> ${cafeVO.addr_detail}</span>
						</div>
						<p class="txt">${cafeVO.content}</p>
						<p class="tagWrap">${cafeVO.tag}</p>
						<span class="flagWrap">${cafeVO.flag}</span>
						
				<div id="likecount" class="likeNum mt-5" title="좋아요 갯수">
					 <c:if test="${!empty sessionScope.memberInfo}">
						<i id="likeIcon" class="bi bi-heart">${cafeVO.likenum}</i>
					</c:if>
				</div>

<!--       카페 Q&A 게시판      -->
						<form id="searchForm">Notice & Event
							<input type="hidden" value="${cafeVO.no}" name="cafe_no" id="cafe_no" />
							<input type="hidden" value="${memberInfo.no}" name="member_no" id="member_no" />
						</form>	
						</span>
					</div>
				</div>
			<!-- 탭 메뉴 -->
			<div class= "row mt-5">
				<ul class="nav nav-tabs justify-content-center nav-pills nav-justified"
					 id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="locationinfo-tab" data-bs-toggle="tab"
							data-bs-target="#locationinfo" type="button" role="tab" aria-controls="locationinfo"
							aria-selected="true">위치</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="menu-tab" data-bs-toggle="tab"
							data-bs-target="#menu" type="button" role="tab"
							aria-controls="menu" aria-selected="false">메뉴</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="review-tab" data-bs-toggle="tab"
							data-bs-target="#review" type="button" role="tab"
							aria-controls="review" aria-selected="false">리뷰</button>
					</li>
				</ul>
			</div>	
<!-- 내용 입력 div -->
				<div class="tab-content" id="myTabContent">
	 	<!-- 위치 -->
					<div class="tab-pane fade show active" id="locationinfo" role="tabpanel"
						aria-labelledby="locationinfo-tab">
				<div class="row mt-5">
					<div class="col-12">
						<strong class="titDep5" style="font-size: 2rem;">
						<i class="bi bi-flag-fill" style="font-size: 2rem; color: darkgreen;"></i> 
						위치 </strong>
						<div id="map" class="row mt-3" style="height:500px">
					</div> 
					</div>
				</div>		
					</div>
		<!-- 메뉴 -->	
					<div class="tab-pane fade" id="menu" role="tabpanel" aria-labelledby="menu-tab">
					<div class="row mt-5">
						<strong class="titDep5" style="font-size: 2rem;"><i 
						class="bi bi-cart-plus-fill" style="font-size: 2rem; color: crimson;"></i>
						 메뉴
						</strong>
					</div>	
						<div id="menulist"  class="row mt-3"></div>
					</div>
		 <!--리뷰  -->
				<div class="tab-pane fade" id="review" role="tabpanel"
						aria-labelledby="review-tab">
						<div class="row mt-5">
							<strong class="titDep5" style="font-size: 2rem;"> <i
								class="bi bi-star-fill" style="font-size: 2rem; color: gold;"></i>
								리뷰
							</strong>
						</div>
						<div class="row my-3">
							<div class="col-6 text-center">
								<div class="row">
									<strong class="titDep5 display-4"  id="starAvg"></strong>
								</div>
								<div id="starContainer">
								<i class="bi bi-star-fill" style="font-size: 2rem; color: gold;"></i>
								<i class="bi bi-star-fill" style="font-size: 2rem; color: gold;"></i>
								<i class="bi bi-star-fill" style="font-size: 2rem; color: gold;"></i>
								<i class="bi bi-star-half" style="font-size: 2rem; color: gold;"></i>
								<i class="bi bi-star" style="font-size: 2rem; color: gold;"></i>
								</div>
							</div>
									
									
								<div  class="col-6">	
									<div class="row align-items-center">
										<div class="col-2 text-end">5점</div>
										<div class=" col-8 progress px-0">
											<div class="progress-bar bg-warning" id="5b" role="progressbar" style="width:0%" aria-valuenow="0"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="starCount col-2 text-start text-secondary" id="5">0</div>
									</div>
									
									<div class="row align-items-center">
										<div class="col-2 text-end">4점</div>
										<div class=" col-8 progress px-0">
											<div class="progress-bar bg-warning" id="4b" role="progressbar" style="width:0%" aria-valuenow="0"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="starCount col-2 text-start text-secondary" id="4">0</div>
									</div>
									
									<div class="row align-items-center">
										<div class="col-2 text-end">3점</div>
										<div class=" col-8 progress px-0">
											<div class="progress-bar bg-warning" id="3b" role="progressbar" style="width:0%" aria-valuenow="0"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="starCount col-2 text-start text-secondary" id="3">0</div>
									</div>
									
									<div class="row align-items-center">
										<div class="col-2 text-end">2점</div>
										<div class=" col-8 progress px-0">
											<div class="progress-bar bg-warning" id="2b" role="progressbar" style="width:0%" aria-valuenow="0"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="starCount col-2 text-start text-secondary" id="2">0</div>
									</div>
									
									<div class="row align-items-center">
										<div class="col-2 text-end">1점</div>
										<div class=" col-8 progress px-0">
											<div class="progress-bar bg-warning" id="1b" role="progressbar" style="width:0%" aria-valuenow="0"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="starCount col-2 text-start text-secondary" id="1">0</div>
									</div>
									</div>
					</div>
					
						<div id="chartContainer" class="my-5 border-bottom" >
						
						</div>
						<!-- 리뷰 작성 페이지 -->
				<div class="row border-bottom">
					<div class="col">
						<h3>전체 리뷰 : <span id="reviewCount"></span>개</h3>
						<span class="lead text-secondary">사장님 댓글 : <span id="ownerCount"></span>개</span>
						<div class="text-end border-bottom">
							<div class="btn-group btn-group-sm" role="group" aria-label="Basic radio toggle button group">
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
							  <label class="btn btn-outline-secondary" for="btnradio1">최신순</label>
							
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
							  <label class="btn btn-outline-secondary" for="btnradio2">별점높은순</label>
							
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
							  <label class="btn btn-outline-secondary" for="btnradio3">별점낮은순</label>
							</div>
						</div>
						<div id="reviewList"></div>
					</div>
				</div>
				</div>
				<div id="myfirstchart" style="height: 300px;"></div>
			</div>				

<!--			여기 위까지 본문 영역 -->
				</div>
			<div class="col-2">
<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
		</div>
	</div>

<!-- end of container -->
</section>

<script type="text/javascript"
		 src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6534a2ce2eff7ef104f2b7a840e380f&libraries=services">
</script>

<script>
	//map 지도 객체 생성
 	var container = document.getElementById('map');
	
    // place 키워드로 위도, 경도 찾기
	var places = new kakao.maps.services.Places();
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var options = {
	        		center: new kakao.maps.LatLng(result[0].y, result[0].x),
	        		level: 0.5
	        	}; 
         	var map = new kakao.maps.Map(container, options); 
 			var markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x);
   			var marker = new kakao.maps.Marker({position: markerPosition});
   			 marker.setMap(map);
    		var infowindow = new kakao.maps.InfoWindow({
        		content: '<div id="mapinfo">'+result[0].address_name+'</div>'
    });
    infowindow.open(map, marker);
        }
	   $("#mapinfo").parent().parent().attr("style","cursor: default; position: absolute; background: rgb(255, 255, 255); border: 1px solid white; border-radius:25px; z-index: 0; display: block; width: 210px; height: 32px; left: 335px; top: 168px;");
    }
	places.keywordSearch('${cafeVO.name}', callback);

	// 좋아요 기능 구현
	var i = 0;
	var cno = ${cafeVO.no};
	var mno = 0;
	
	<c:if test="${!empty memberInfo}">
	mno = ${memberInfo.no};
	
	 $.get("${path}/cafe/api/cafeLike",{cno:${cafeVO.no},mno:${memberInfo.no}},function(data){
	      	console.log(data);
	      	if(data.like_check == 1 && data.cno == ${cafeVO.no}){
				console.log("이미 좋아요 눌렀거덩여?");
				$('#likeIcon').addClass('bi-heart-fill');
				$('#likeIcon').removeClass('bi-heart');
				
	      	}else{
	      		console.log("좋아요!");
				$('#likeIcon').addClass('bi-heart');
				$('#likeIcon').removeClass('bi-heart-fill');
				
	      	}
	}); 
	
 $('#likeIcon').on('click',function(){
		 let currentLikeNum = $("#likeIcon").text();
	 
	 $.ajax({
			url : "${path}/cafe/api/",
			method : "PATCH",
			data : {
				cno : cno,
				mno : mno
			},
			dataType : "text",
			success : function(result){
				console.log(result);
				if($('#likeIcon').hasClass("bi-heart-fill")){
					 $("#likeIcon").text(currentLikeNum - 1);
				 }else {
					 $("#likeIcon").text(Number(currentLikeNum) + 1);
				 }
				$('#likeIcon').toggleClass("bi-heart-fill bi-heart");
			}
			
		}); 
	 
  });
	</c:if>

	// Q&A 게시판 이동
	$("#searchForm").click(function(){
		location.href="${path}/board/listPage?cafe_no=${no}";		
	});

	
	// 메뉴 리스트
	var menulist = $("#menulist");
	var cafe_no = ${cafeVO.no};
	
	
	 $.get("${path}/cafe/api/cafeMenuList",{cafe_no:${cafeVO.no}},function(data){
		console.log(data); 
		for(var i=0; i<data.length; i++){
			var str = 
					`<div class="col-4 sm-4 mt-3">
							<img src="\${data[i].photo_url}"
								 class="img-thumbnail" />
								<span class="menu">\${data[i].name}</span>
								<span class="price"><del>\${data[i].price}</del></span>
								<span class="pricediscount" style="color:red;">\${data[i].discount}</span>
					</div>`;
				menulist.append(str);
		} 
});
		
	
	 
	 
	 
	 
	 
	
	/* 여기서부터 리뷰 스크립트 */
	
	
	
	function getReviewList(result){
		$("#reviewList").empty();
		for(var i=0; i<result.length;i++){
			if(result[i].depth == 0){
				var str = `
					<div class="mt-3 mb-4">
					<div class="d-flex justify-content-start align-items-center">
					<img class="rounded-circle replyProfile" src="${pageContext.request.contextPath}/\${result[i].profile_url}" />
					<span class="ms-2 lead">\${result[i].name} &gt;</span>
					</div>
					<div class="mt-2 text-secondary d-flex justify-content-between">
						<span>\${result[i].content}</span>
						<div>
							<i class="bi bi-star-fill" style="color: gold;"></i>
							<i class="bi bi-star-fill" style="color: gold;"></i>
							<i class="bi bi-star-fill" style="color: gold;"></i>
							<i class="bi bi-star-fill" style="color: gold;"></i>
							<i class="bi bi-star-fill" style="color: gold;"></i>
						</div>
					</div>
					<c:if test="${memberInfo.no == cafeVO.owner_no}">
					<div class="text-secondary text-sm d-flex justify-content-end">
						<a href="" class="btn text-secondary ">[답글]</a>
					</div>
					</c:if>
				</div>
				`;
			}else{
				var str = `
					<div class="ms-5 mt-3 mb-4 px-3 py-3 alert alert-secondary">
					<div class="d-flex justify-content-end align-items-center">
					<span class="me-2 lead">&lt; 사장님</span>
					<img class="rounded-circle replyProfile me-2" src="${pageContext.request.contextPath}/upload\profile\loen850@naver.com\KakaoTalk_20220617_120021184.jpg" />
					</div>
					<div class="mt-2 text-secondary d-flex justify-content-between">
						<span>\${result[i].content}</span>
					</div>
				</div>
				`;
			}
		$("#reviewList").append(str);
		}
	}
	

	function starDrawer(starAvg){
		
		let str = "";
		let cnt = 0;
		
		for(var i=1;i<=Math.floor(starAvg);i++){
			str += `<i class="bi bi-star-fill" style="font-size: 2rem; color: gold;"></i>`;
			cnt++;
		}
		
		if((Math.round(starAvg*10)/10 - Math.floor(starAvg)) >= 0.5){
			str += `<i class="bi bi-star-half" style="font-size: 2rem; color: gold;"></i>`;
			cnt++;
		}else {
			str += `<i class="bi bi-star" style="font-size: 2rem; color: gold;"></i>`;
			cnt++;
		}
		
		for(i=1;i<=5-cnt;i++){
			str += `<i class="bi bi-star" style="font-size: 2rem; color: gold;"></i>`;
		}
		return str;
	}
	
	
	/* $("#review-tab").on('click',function(){ */
		var cafe_no =  $("#cafe_no").val();
		console.log(cafe_no);
		
		
		$.ajax({
			type : "GET",
			url : "${path}/review/api/" + cafe_no,
			dataType : "json",
			success : function(result){
				console.log(result);
				getReviewList(result.list);
				$("#reviewCount").text(result.reviewCount);
				$("#ownerCount").text(result.ownerCount);
				$("#starAvg").text(Math.round(result.starAvg*10)/10);
				$("#cafeDetailAvgStar").text(Math.round(result.starAvg*10)/10);
				$("#cafeDetailAvgStar").next().text(`(\${result.reviewCount})`);
				let starCount = $(".starCount");
				starCount.each(function(){
					for(let j=0; j<result.starCount.length; j++){
						if($(this).attr("id") == result.starCount[j].criteria){
							$(this).text(result.starCount[j].score);
						}
					}
				});
				
				$("#starContainer").empty();
				$("#starContainer").append(starDrawer(result.starAvg));
				
				let progressBar = $(".progress-bar");
				progressBar.each(function(index,item){
					for(let j=0; j<result.starCount.length; j++){
						if(5-index == result.starCount[j].criteria){
							let percent = Math.ceil((result.starCount[j].score / result.reviewCount) * 100) ;
							$(this).attr("style","width:"+percent+"%");
							$(this).attr("aria-valuenow",percent);
						}
					}
				});
				if(result.monthCount.length == 0){
					result.monthCount = [{criteria : 0, score : 1}];
				}
				$("#myfirstchart").empty();

				let chart = new Morris.Line({
					  // ID of the element in which to draw the chart.
					  element: 'myfirstchart',
					  // Chart data records -- each entry in this array corresponds to a point on
					  // the chart.
					  
					  data: result.monthCount, 
					  // The name of the data record attribute that contains x-values.
					  xkey: 'criteria',
					  // A list of names of data record attributes that contain y-values.
					  ykeys: ['score'],
					  // Labels for the ykeys -- will be displayed when you hover over the
					  // chart.
					  labels: ['평점'],
					  
					  ymax:'auto[5]',
					  
					  ymin:'auto[1]',
					  hideHover: false,
					  lineColors: [ '#D3D3D3' ],
					  
					  pointFillColors:['#020715'],
					  
					  gridTextColor:['#000000'],
					  
					  parseTime:false
					  
					});
				
				
				$(function(){
					$("#myfirstchart").appendTo($("#chartContainer"));
				});
				
			}
		});
	/* }); */
	
</script>	


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>