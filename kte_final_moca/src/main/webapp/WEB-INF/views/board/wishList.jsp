<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang='ko'>
<!-- 헤더에 제이쿼리, 부트스트랩, 우리가 개별 적용할 css를 위한 custom.css 파일까지 다 적용되어 있음 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	body{margin-top:20px;
background:#eee;
}
.review-list ul li .left span {
     width: 32px;
     height: 32px;
     display: inline-block;
}
 .review-list ul li .left {
     flex: none;
     max-width: none;
     margin: 0 10px 0 0;
}
 .review-list ul li .left span img {
     border-radius: 50%;
}
 .review-list ul li .right h4 {
     font-size: 16px;
     margin: 0;
     display: flex;
}
 .review-list ul li .right h4 .gig-rating {
     display: flex;
     align-items: center;
     margin-left: 10px;
     color: #ffbf00;
}
 .review-list ul li .right h4 .gig-rating svg {
     margin: 0 4px 0 0px;
}
 .country .country-flag {
     width: 16px;
     height: 16px;
     vertical-align: text-bottom;
     margin: 0 7px 0 0px;
     border: 1px solid #fff;
     border-radius: 50px;
     box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}
 .country .country-name {
     color: #95979d;
     font-size: 13px;
     font-weight: 600;
}
 .review-list ul li {
     border-bottom: 1px solid #dadbdd;
     padding: 0 0 30px;
     margin: 0 0 30px;
}
 .review-list ul li .right {
     flex: auto;
}
 .review-list ul li .review-description {
     margin: 20px 0 0;
}
 .review-list ul li .review-description p {
     font-size: 14px;
     margin: 0;
}
 .review-list ul li .publish {
     font-size: 13px;
     color: #95979d;
}

.review-section h4 {
     font-size: 20px;
     color: #222325;
     font-weight: 700;
}
 .review-section .stars-counters tr .stars-filter.fit-button {
     padding: 6px;
     border: none;
     color: #4a73e8;
     text-align: left;
}
 .review-section .fit-progressbar-bar .fit-progressbar-background {
     position: relative;
     height: 8px;
     background: #efeff0;
     -webkit-box-flex: 1;
     -ms-flex-positive: 1;
     flex-grow: 1;
     box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
     background-color: #ffffff;
    ;
     border-radius: 999px;
}
 .review-section .stars-counters tr .star-progress-bar .progress-fill {
     background-color: #ffb33e;
}
 .review-section .fit-progressbar-bar .progress-fill {
     background: #2cdd9b;
     background-color: rgb(29, 191, 115);
     height: 100%;
     position: absolute;
     left: 0;
     z-index: 1;
     border-radius: 999px;
}
 .review-section .fit-progressbar-bar {
     display: flex;
     align-items: center;
}
 .review-section .stars-counters td {
     white-space: nowrap;
}
 .review-section .stars-counters tr .progress-bar-container {
     width: 100%;
     padding: 0 10px 0 6px;
     margin: auto;
}
 .ranking h6 {
     font-weight: 600;
     padding-bottom: 16px;
}
 .ranking li {
     display: flex;
     justify-content: space-between;
     color: #95979d;
     padding-bottom: 8px;
}
 .review-section .stars-counters td.star-num {
     color: #4a73e8;
}
 .ranking li>span {
     color: #62646a;
     white-space: nowrap;
     margin-left: 12px;
}
 .review-section {
     border-bottom: 1px solid #dadbdd;
     padding-bottom: 24px;
     margin-bottom: 34px;
     padding-top: 64px;
}
 .review-section select, .review-section .select2-container {
     width: 188px !important;
     border-radius: 3px;
}
ul, ul li {
    list-style: none;
    margin: 0px;
}
.helpful-thumbs, .helpful-thumb {
    display: flex;
    align-items: center;
    font-weight: 700;
}
</style>
<section class="bg-light">
	<div class="container pt-3">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="row mt-5 mb-4">
					<div class="col mt-5">
<!-- 					페이지 제목 및 설명 헤더 부분(작성) -->
						<p class="text-center display-5">REVIEW</p>
						<p class="text-center lead">리뷰 만들기</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
				<div class="row mt-5">
					<div class="col">
						<hr />
<!-- 					페이지 소제목 부분(작성) -->
						<p class="lead"><i class="bi bi-chat-right-heart"></i> 리뷰 연습</p>
					</div>
				</div>
				
<!-- 			여기서부터 본문 영역 -->
		<div class= "row mt-5">
				<ul class="nav nav-tabs justify-content-center nav-pills nav-justified"
					 id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
							data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
							aria-selected="true">위치</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="myreview-tab" data-bs-toggle="tab"
							data-bs-target="#myreview" type="button" role="tab"
							aria-controls="myreview" aria-selected="false">메뉴</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="wishlist-tab" data-bs-toggle="tab"
							data-bs-target="#wishlist" type="button" role="tab"
							aria-controls="wishlist" aria-selected="false">리뷰</button>
					</li>
				</ul>
			</div>	
				<!-- 내용 -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="userinfo" role="tabpanel"
						aria-labelledby="userinfo-tab">
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
					<div class="tab-pane fade" id="myreview" role="tabpanel"
						aria-labelledby="myreview-tab">
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
		<div class="tab-pane fade" id="wishlist" role="tabpanel"
						aria-labelledby="wishlist-tab">
						<div class="row mt-5">
						</div>
						
					</div>
					</div>
<!-- 			row클래스로 하나의 행을 생성 -->
				
<!--			여기 위까지 본문 영역 -->
			</div>
			<div class="col-2">
<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
		</div>
	</div>
<!-- end of container -->
</section>
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
<script>
	/* $("#wishlist").click(function(){
		$.ajax({
			url:"${path}/board/wishlist",
			method:"POST",
			datatype:"text",
			
			
		});
	}); */
	
	
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>