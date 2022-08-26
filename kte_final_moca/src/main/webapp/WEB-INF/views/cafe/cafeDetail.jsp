<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang='ko'>
<head>

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
							<span class="icoScore" title="평균 평점">
								<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i>4.8
								<i title="리뷰 갯수">(367)</i>
							</span>
							<span title="위치 정보">${cafeVO.addr_detail}</span>
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
							<input type="hidden" value="${cafe_no}" name="cafe_no">
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
						<div id="map" class="row" style="height:500px">
					</div> 
					</div>
				</div>		
					</div>
		<!-- 메뉴 -->	
					<div class="tab-pane fade" id="menu" role="tabpanel"
						aria-labelledby="menu-tab">
						<div class="row mt-5">
						<strong class="titDep5" style="font-size: 2rem;">
						<i class="bi bi-cart-plus-fill" style="font-size: 2rem; color: crimson;"></i>
							 메뉴</strong>
							<div class="col-sm-4">
							<img src="https://static-file.jejupass.com/download/85011?width=300&amp;height=300"
								 class="img-thumbnail" />
								<span class="menu">아메리카노</span>
					<!-- pricediscount는 현재시각에 할인율 겹치는 가격으로 보여주기  -->
								<span class="price"><del>5,000원</del></span>
								<span class="pricediscount" style="color:red;">4,000원</span>
							</div>
							<div class="col-sm-4">
							<img src="https://static-file.jejupass.com/download/85011?width=300&amp;height=300"
								 class="img-thumbnail" />
								<span class="menu">카페 라떼</span>
								<span class="price"><del>5,500원</del></span>
								<span class="pricediscount" style="color:red;">5,000원</span>
							</div>
							<div class="col-sm-4">
							<img src="https://static-file.jejupass.com/download/85011?width=300&amp;height=300"
								 class="img-thumbnail" />
								<span class="menu">바닐라 라떼</span>
								<span class="price"><del>6,000원</del></span>
								<span class="pricediscount" style="color:red;">5,500원</span>
							</div>
						</div>
					</div>
		 <!--리뷰  -->
				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
				
				
				</div>
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
					 /* 좋아요 수를 줄이고, 좋아요 테이블에서도 삭제 ajax */
				 }else {
					 $("#likeIcon").text(Number(currentLikeNum) + 1);
				 }
				$('#likeIcon').toggleClass("bi-heart-fill bi-heart");
			}
			
		}); 
	 
  });
	</c:if>

	
	$("#searchForm").click(function(){
		location.href="${path}/board/listPage?cafe_no=${no}";		
	});

</script>	


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>