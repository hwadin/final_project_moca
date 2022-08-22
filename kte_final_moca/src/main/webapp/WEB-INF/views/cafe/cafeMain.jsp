<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang='ko'>
	<!-- Required meta tags-->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Colrolib Templates">
	<meta name="author" content="colorlib.com">
	<meta name="keywords" content="Colrolib Templates">

	<!-- Vendor CSS-->
	<link href="${path}/resources/lib/searchBar/vendor/select2/select2.min.css" rel="stylesheet" />
	<link href="${path}/resources/lib/searchBar/vendor/datepicker/daterangepicker.css" rel="stylesheet"/>
	<link href="${path}/resources/lib/searchBar/vendor/datepicker/timepicker.css" rel="stylesheet"/>

	<!-- Main CSS-->
	<link href="${path}/resources/lib/searchBar/main.css" rel="stylesheet" />
	
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
		<hr/>	
<!-- searchBar -->
        <div class="wrapper mt-5">
            <div class="card-7">
 				<div class="card-body">
                    <form class="form" method="POST" action="#">
                        <div class="input--group input--large">
                            <label class="label">LOCATION</label>
                            <input class="input--style-1" type="text" placeholder="구를 입력하세요" name="going">
                        </div>
                        <div class="input--group input--medium">
                            <label class="label">DATE</label>
                            <input class="input--style-1" type="text" name="checkin" placeholder=" mm/dd/yyyy " id="input-start">
                        </div>
                        <div class="input--group input--medium">
                            <label class="label">TIME</label>
                            <input class="input--style-1" type="text" name="checkout" placeholder="    HH:mm   " id="input-end">
                        </div>
                        <button class="btn-submit" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </div>
<!-- 					페이지 소제목 부분(작성) -->
					</div>
						<p class="lead" style="font-size: 2rem; color: ;">
							<i class="bi bi-chat-right-heart" style="font-size: 3rem; color: palevioletred;"></i> 
						카페 목록
						</p>
					
				</div>
				
<!-- 			여기서부터 본문 영역 -->
<!-- 			row클래스로 하나의 행을 생성 -->
			<div id="cafelist" class="row mt-2">
<!-- 				row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!-- 				한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
<%-- 					<div class="col-6">
					<a href="${path}/cafe/cafeDetail" style="text-decoration:none">
						<img id="cafe_logo1" src="https://static-file.jejupass.com/download/120160?width=500&amp;height=500"
						 class="img-responsive img-thumbnail" />
						<strong class="titDep5" style="font-size: 2rem; color: cadetblue;">투썸</strong>
					</a>
						<div class="conUtil">
							<span class="likeNum" title="좋아요 갯수">
								<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">23</i>
							</span>
							<span class="icoScore" title="평균 평점">
								<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i>4.8<i title="리뷰 갯수">(367)</i>
							</span>
							<span title="위치 정보">해운대구</span>
						</div>
							<p class="txt">해운대 해안도로의 오션뷰 카페. 테라스에서는 드넓은 정원과 바다 풍경이 펼쳐지고,
											 안에는 편안한 소파와 빈백 좌석들이 마련되어 있어요.
											 다양하고 맛있는 디저트가 있지만 커피와 함께하면 더욱 맛있는 커피콩빵은 이집만의 매력!
						  	</p>
							<p class="tagWrap">
								<span class="tag">#디저트카페</span>
								<span class="tag">#해운대카페</span>
								<span class="tag">#해운대오션뷰</span>
							</p>
						<span class="flagWrap">
							<span class="flag col24">기본음료_아메리카노</span>
							<span class="flag col04">음료 변경 가능_2천원 할인</span>
						</span>
					</div> --%>
<%-- 					
					<div class="col-6">
					<a href="${path}/cafe/cafeDetail" style="text-decoration:none">
						<img id="cafe_logo" src="https://static-file.jejupass.com/download/120073?width=500&amp;height=500" class="img-thumbnail" />
						<strong class="titDep5" style="font-size: 2rem; color: cadetblue;">투썸</strong>
					</a>
						<div class="conUtil">
							<span class="likeNum" title="좋아요 갯수">
								<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">23</i>
							</span>
							<span class="icoScore" title="평균 평점">
								<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i>4.8<i title="리뷰 갯수">(367)</i>
							</span>
							<span title="위치 정보">해운대구</span>
						</div>
						<p class="txt">해운대 해안도로의 오션뷰 카페. 테라스에서는 드넓은 정원과 바다 풍경이 펼쳐지고,
						 안에는 편안한 소파와 빈백 좌석들이 마련되어 있어요. 다양하고 맛있는 디저트가 있지만 커피와 함께하면 더욱 맛있는 커피콩빵은 이집만의 매력!
						 </p>
						<p class="tagWrap">
							<span class="tag">#디저트카페</span>
							<span class="tag">#해운대카페</span>
							<span class="tag">#해운대오션뷰</span> 
						</p>
						<span class="flagWrap">
							<span class="flag col24">기본음료_아메리카노</span>
							<span class="flag col04">음료 변경 가능_2천원 할인</span>
						</span>
					</div>
				</div>
				
				<div class="row mt-4">
					<div class="col-6">
					<a href="${path}/cafe/cafeDetail" style="text-decoration:none">
						<img id="cafe_logo" src="https://static-file.jejupass.com/download/188916?width=500&amp;height=500" class="img-thumbnail" />
						<strong class="titDep5" style="font-size: 2rem; color: cadetblue;">투썸</strong>
						</a>
						<div class="conUtil">
							<span class="likeNum" title="좋아요 갯수">
								<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">23</i></span>
							<span class="icoScore" title="평균 평점">
								<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i>4.8<i title="리뷰 갯수">(367)</i></span>
							<span title="위치 정보">해운대구</span>
						</div>
						<p class="txt">해운대 해안도로의 오션뷰 카페. 테라스에서는 드넓은 정원과 바다 풍경이 펼쳐지고,
						 안에는 편안한 소파와 빈백 좌석들이 마련되어 있어요. 다양하고 맛있는 디저트가 있지만 커피와 함께하면 더욱 맛있는 커피콩빵은 이집만의 매력! </p>
						<p class="tagWrap">
							<span class="tag">#디저트카페</span>
							<span class="tag">#해운대카페</span>
							<span class="tag">#해운대오션뷰</span>
						</p>
						<span class="flagWrap">
							<span class="flag col24">기본음료_아메리카노</span>
							<span class="flag col04">음료 변경 가능_2천원 할인</span>
						</span>
					</div>
					
					<div class="col-6">
					<a href="${path}/cafe/cafeDetail" style="text-decoration:none">
						<img id="cafe_logo" src="https://static-file.jejupass.com/download/120164?width=500&amp;height=500" class="img-thumbnail" />
						<strong class="titDep5" style="font-size: 2rem; color: cadetblue;">투썸</strong>
						</a>
						<div class="conUtil">
							<span class="likeNum" title="좋아요 갯수">
								<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">23</i></span>
							<span class="icoScore" title="평균 평점">
								<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i>4.8<i title="리뷰 갯수">(367)</i></span>
							<span title="위치 정보">해운대구</span>
						</div>
						<p class="txt">해운대 해안도로의 오션뷰 카페. 테라스에서는 드넓은 정원과 바다 풍경이 펼쳐지고,
						 안에는 편안한 소파와 빈백 좌석들이 마련되어 있어요. 다양하고 맛있는 디저트가 있지만 커피와 함께하면 더욱 맛있는 커피콩빵은 이집만의 매력! </p>
						<p class="tagWrap">
							<span class="tag">#디저트카페</span>
							<span class="tag">#해운대카페</span>
							<span class="tag">#해운대오션뷰</span>
						 </p>
						<span class="flagWrap">
							<span class="flag col24">기본음료_아메리카노</span>
							<span class="flag col04">음료 변경 가능_2천원 할인</span>
						</span>
					</div>
				</div> --%>
<%-- 				<form id="readForm">
					<input type="hidden" name="ownerno" value="${cafe.owner_no}"/>
				</form> --%>
				
<!--			여기 위까지 본문 영역 -->
			</div>
		</div>
			<div class="col-2">
<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
		</div>
	</div>
<!-- end of container -->
</section>
<script>


let cafelist = $("#cafelist");

$.get("${path}/cafe/api/cafeList",{owner_no:2}, function(data){
	console.log(data);
	for(var i=0; i<data.length; i++){
		var str = 
			`<div class="col-6">
		<a href="${path}/cafe/cafeDetail" style="text-decoration:none">
		<img id="cafe_logo" src="\${data[i].photo_url}" class="img-thumbnail" />
		<strong class="title" style="font-size: 2rem; color: cadetblue;">\${data[i].name}</strong>
		</a>
		<div class="conUtil">
			<span class="likeNum" title="좋아요 갯수">
				<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">\${data[i].likenum}</i></span>
			<span class="icoScore" title="평균 평점">
				<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i>4.8<i title="리뷰 갯수">(367)</i></span>
			<span title="위치 정보">\${data[i].addr_detail}</span>
		</div>
		<p class="txt">\${data[i].content}</p>
		<p class="tagWrap">
			<span class="tag">\${data[i].tag}</span>
		 </p>
		<span class="flagWrap">
			<span class="flag">\${data[i].flag}</span>
		</span>
	</div>`;
		cafelist.append(str);
	}
});



</script>
    <!-- Jquery JS-->
    <script src="${path}/resources/lib/searchBar/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="${path}/resources/lib/searchBar/vendor/select2/select2.min.js"></script>
    <script src="${path}/resources/lib/searchBar/vendor/jquery-validate/jquery.validate.min.js"></script>
    <script src="${path}/resources/lib/searchBar/vendor/bootstrap-wizard/bootstrap.min.js"></script>
    <script src="${path}/resources/lib/searchBar/vendor/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="${path}/resources/lib/searchBar/vendor/datepicker/moment.min.js"></script>
    <script src="${path}/resources/lib/searchBar/vendor/datepicker/daterangepicker.js"></script>
    <script src="${path}/resources/lib/searchBar/vendor/datepicker/timepicker.js"></script>
	 <!-- Main JS-->
    <script src="${path}/resources/lib/searchBar/global.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>