<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang='ko'>
<!-- 헤더에 제이쿼리, 부트스트랩, 우리가 개별 적용할 css를 위한 custom.css 파일까지 다 적용되어 있음 -->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
 <!-- morrils.js -->
   	 <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
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
				<%@ include file="/WEB-INF/views/common/btnHeader.jsp"%>
				<div class="row mt-5">
					<div class="col">
						<hr />
						<!-- 					페이지 소제목 부분(작성) -->
						<p class="lead">
							<i class="bi bi-chat-right-heart"></i> 리뷰 연습
						</p>
					</div>
				</div>

				<!-- 			여기서부터 본문 영역 -->
				<div class="row mt-5">
					<ul
						class="nav nav-tabs justify-content-center nav-pills nav-justified"
						id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="userinfo-tab"
								data-bs-toggle="tab" data-bs-target="#userinfo" type="button"
								role="tab" aria-controls="userinfo" aria-selected="true">위치</button>
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
					<div class="tab-pane fade show active" id="userinfo"
						role="tabpanel" aria-labelledby="userinfo-tab">
						<div class="row mt-5">
							<div class="col-12">
								<strong class="titDep5" style="font-size: 2rem;"> <i
									class="bi bi-flag-fill"
									style="font-size: 2rem; color: darkgreen;"></i> 위치
								</strong>
								<div id="map" class="row" style="height: 500px"></div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="myreview" role="tabpanel"
						aria-labelledby="myreview-tab">
						<div class="row mt-5">
							<strong class="titDep5" style="font-size: 2rem;"> <i
								class="bi bi-cart-plus-fill"
								style="font-size: 2rem; color: crimson;"></i> 메뉴
							</strong>
							<div class="col-sm-4">
								<img
									src="https://static-file.jejupass.com/download/85011?width=300&amp;height=300"
									class="img-thumbnail" /> <span class="menu">아메리카노</span>
								<!-- pricediscount는 현재시각에 할인율 겹치는 가격으로 보여주기  -->
								<span class="price"><del>5,000원</del></span> <span
									class="pricediscount" style="color: red;">4,000원</span>
							</div>
							<div class="col-sm-4">
								<img
									src="https://static-file.jejupass.com/download/85011?width=300&amp;height=300"
									class="img-thumbnail" /> <span class="menu">카페 라떼</span> <span
									class="price"><del>5,500원</del></span> <span
									class="pricediscount" style="color: red;">5,000원</span>
							</div>
							<div class="col-sm-4">
								<img
									src="https://static-file.jejupass.com/download/85011?width=300&amp;height=300"
									class="img-thumbnail" /> <span class="menu">바닐라 라떼</span> <span
									class="price"><del>6,000원</del></span> <span
									class="pricediscount" style="color: red;">5,500원</span>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="wishlist" role="tabpanel"
						aria-labelledby="wishlist-tab">
						<div class="row mt-5">
							<strong class="titDep5" style="font-size: 2rem;"> <i
								class="bi bi-star-fill" style="font-size: 2rem; color: gold;"></i>
								리뷰
							</strong>
						</div>
						<div class="row my-3">
							<div class="col-6 text-center">
								<div class="row">
									<strong class="titDep5 display-4" >3.8</strong>
								</div>
								<i class="bi bi-star-fill" style="font-size: 2rem; color: gold;"></i>
								<i class="bi bi-star-fill" style="font-size: 2rem; color: gold;"></i>
								<i class="bi bi-star-fill" style="font-size: 2rem; color: gold;"></i>
								<i class="bi bi-star-half" style="font-size: 2rem; color: gold;"></i>
								<i class="bi bi-star" style="font-size: 2rem; color: gold;"></i>
							</div>
									
									
								<div class="col-6">	
									<div class="row align-items-center">
										<div class="col-2 text-end">5점</div>
										<div class=" col-8 progress px-0">
											<div class="progress-bar bg-warning" role="progressbar" style="width: 100%" aria-valuenow="100"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="col-2 text-start text-secondary">3,253</div>
									</div>
									
									<div class="row align-items-center">
										<div class="col-2 text-end">4점</div>
										<div class=" col-8 progress px-0">
											<div class="progress-bar bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="col-2 text-start text-secondary">553</div>
									</div>
									
									<div class="row align-items-center">
										<div class="col-2 text-end">3점</div>
										<div class=" col-8 progress px-0">
											<div class="progress-bar bg-warning" role="progressbar" style="width: 50%" aria-valuenow="50"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="col-2 text-start text-secondary">66</div>
									</div>
									
									<div class="row align-items-center">
										<div class="col-2 text-end">2점</div>
										<div class=" col-8 progress px-0">
											<div class="progress-bar bg-warning" role="progressbar" style="width: 25%" aria-valuenow="25"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="col-2 text-start text-secondary">13</div>
									</div>
									
									<div class="row align-items-center">
										<div class="col-2 text-end">1점</div>
										<div class=" col-8 progress px-0">
											<div class="progress-bar bg-warning" role="progressbar" style="width: 0%" aria-valuenow="0"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="col-2 text-start text-secondary">0</div>
									</div>
									</div>
					</div>
					
						<div id="chartContainer" class="my-5 border-bottom" >
						
						</div>
						<!-- 리뷰 작성 페이지 -->
				<div class="row border-bottom">
					<div class="col">
						<h3>최근 리뷰 : 3364개</h3>
						<span class="lead text-secondary">사장님 댓글 : 687개</span>
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
						
						<div class="mt-3 mb-4">
							<div class="d-flex justify-content-start align-items-center">
							<img class="rounded-circle replyProfile" src="${pageContext.request.contextPath}/upload\profile\id123@naver.com\KakaoTalk_20220617_120021184.jpg" />
							<span class="ms-2 lead">정대fan ></span>
							</div>
							<div class="mt-2 text-secondary d-flex justify-content-between">
								<span>정대오빠 어디있어?</span>
								<div>
									<i class="bi bi-star-fill" style="color: gold;"></i>
									<i class="bi bi-star-fill" style="color: gold;"></i>
									<i class="bi bi-star-fill" style="color: gold;"></i>
									<i class="bi bi-star-fill" style="color: gold;"></i>
									<i class="bi bi-star-fill" style="color: gold;"></i>
								</div>
							</div>
							<div class="text-secondary text-sm d-flex justify-content-end">
								<a href="" class="btn text-secondary ">[답글]</a>
							</div>
						</div>
						<div class="ms-5 mt-3 mb-4 px-3 py-3 alert alert-secondary">
							<div class="d-flex justify-content-end align-items-center">
							<span class="me-2 lead">&lt; 사장님</span>
							<img class="rounded-circle replyProfile me-2" src="${pageContext.request.contextPath}/upload\profile\id123@naver.com\KakaoTalk_20220617_120021184.jpg" />
							</div>
							<div class="mt-2 text-secondary d-flex justify-content-between">
								<span>정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?</span>
							</div>
						</div>
						
						<div class="mt-3 mb-4">
							<div class="d-flex justify-content-start align-items-center">
							<img class="rounded-circle replyProfile" src="${pageContext.request.contextPath}/upload\profile\id123@naver.com\KakaoTalk_20220617_120021184.jpg" />
							<span class="ms-2 lead">정대fan &gt;</span>
							</div>
							<div class="mt-2 text-secondary d-flex justify-content-between">
								<span>정대오빠 어디있어?</span>
								<div>
									<i class="bi bi-star-fill" style="color: gold;"></i>
									<i class="bi bi-star-fill" style="color: gold;"></i>
									<i class="bi bi-star-fill" style="color: gold;"></i>
									<i class="bi bi-star-fill" style="color: gold;"></i>
									<i class="bi bi-star-fill" style="color: gold;"></i>
								</div>
							</div>
						</div>
						
						<div class="ms-5 mt-3 mb-4 px-3 py-3 alert alert-secondary">
							<div class="d-flex justify-content-end align-items-center">
							<span class="me-2 lead">&lt; 사장님</span>
							<img class="rounded-circle replyProfile me-2" src="${pageContext.request.contextPath}/upload\profile\id123@naver.com\KakaoTalk_20220617_120021184.jpg" />
							</div>
							<div class="mt-2 text-secondary d-flex justify-content-between">
								<span>정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?정대오빠 어디있어?</span>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div id="myfirstchart" style="height: 300px;"></div>
				<!-- 			row클래스로 하나의 행을 생성 -->
	
	
				<!--			여기 위까지 본문 영역 -->
			</div>
			</div>
			<div class="col-2">
				<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
			</div>
			
		</div>
	</div>
	<!-- end of container -->
</section>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	/* $("#wishlist").click(function(){
		$.ajax({
			url:"${path}/board/wishlist",
			method:"POST",
			datatype:"text",
			
			
		});
	}); */
	
	let chart = new Morris.Line({
		  // ID of the element in which to draw the chart.
		  element: 'myfirstchart',
		  // Chart data records -- each entry in this array corresponds to a point on
		  // the chart.
		  data: [
		    { month: '8월', value: 3.2 },
		    { month: '9월', value: 3.7 },
		    { month: '10월', value: 4.4 },
		    { month: '11월', value: 4.9 },
		    { month: '12월', value: 4.5 }
		  ],
		  // The name of the data record attribute that contains x-values.
		  xkey: 'month',
		  // A list of names of data record attributes that contain y-values.
		  ykeys: ['value'],
		  // Labels for the ykeys -- will be displayed when you hover over the
		  // chart.
		  labels: ['Value'],
		  
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

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>