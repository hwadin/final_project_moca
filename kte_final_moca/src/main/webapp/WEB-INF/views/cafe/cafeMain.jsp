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

	<!-- Icons font CSS-->
    <link href="${path}/resources/lib/searchBar/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet">
    <link href="${path}/resources/lib/searchBar/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
		
	<!-- Vendor CSS-->
	<link href="${path}/resources/lib/searchBar/vendor/select2/select2.min.css" rel="stylesheet" />
	<link href="${path}/resources/lib/searchBar/vendor/datepicker/timepicker.css" rel="stylesheet"/>
	<link href="${path}/resources/lib/searchBar/vendor/datepicker/daterangepicker.css" rel="stylesheet"/>

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
                    <form class="form" id="cafesearchlist" method="GET" action="${path}/cafe/api/cafeSearchList">
                        <div class="input--group input--large">
                            <label class="label">LOCATION</label>
                            <input class="input--style-1" type="text" placeholder="구를 입력하세요" id="insertlocation" >
                        </div>
                        <div class="input--group input--medium">
                            <label class="label">START DATE</label>
                            <input class="input--style-1" type="text" name="startdate" placeholder=" yyyy/mm/dd " id="input-start" >
                        </div>
                        <div class="input--group input--medium">
                            <label class="label">END DATE</label>
                            <input class="input--style-1" type="text" name="enddate" placeholder=" yyyy/mm/dd " id="input-end" >
                        </div>
                        <div class="input--group input--medium">
                            <label class="label">TIME</label>
                            <input class="input--style-1" type="text" name="time"  placeholder="  HH:mm  " id="input--time" style="width:130px">
                        </div>
                        <button data-id="false" id="submit" class="btn-submit" type="button">Search</button>
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

// timepicker
$(function() {
    $("#input--time").timepicker({
        timeFormat: 'HH:mm',
	    interval: 60,
        startTime: '08:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true,
        pick12HourFormat: false
    });
});

let index = 0;
let cafelist = $("#cafelist");
	
function getCafeList(){
	$.get("${path}/cafe/api/cafeList",
		{index:index},
		function(data){
		for(var i=0; i<data.length; i++){
			var saleStr ="";
			if(new Date(data[i].start_date) <= new Date(today) && new Date(data[i].end_date) >= new Date(today)){
				saleStr = `
					<div>
					<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral; ">
						&#9200; \${data[i].start_date} 부터 \${data[i].end_date} 까지
					</span>
					</div>
					<div>
					<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral;  ">
					\${data[i].start_time} ~ \${data[i].end_time} 사이 할인 진행중이예요 ! &#128149;
					 </span>
					</div>
				`;	
			}
			
			var str =
				`<div class="col-6 mt-3">
			<a href="${path}/cafe/cafeDetail/\${data[i].no}"
			style="text-decoration:none" id="cafeName">
			<img src="\${data[i].photo_url}" class="img-thumbnail" />
			<strong class="title" style="font-size: 2rem; color: cadetblue;">
			\${data[i].name}
			</strong>
			\${saleStr}
			</a>
			<div class="conUtil mt-2">
				<span class="likeNum" title="좋아요 갯수">
					<i class="bi bi-heart-fill" style="font-size: 1.1rem; color: indianred;">
					\${data[i].likenum}</i>
				</span>
				<span class="icoScore" title="평균 평점">
					<i class="bi bi-star-fill" style="font-size: 1.1rem; color: gold;">
					</i>4.8<i title="리뷰 갯수"></i>(367)
				</span>
				<span title="위치 정보">
				\${data[i].addr_detail}</span>
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
}
getCafeList();

//무한스크롤 기능

$(function(){
	var page =1;
	$(window).scroll(function(){
	let $window = $(this);
 	let scrollTop = $(window).scrollTop();
	let windowHeight = $(window).height();
	let documentHeight = $(document).height();
 	if(scrollTop + windowHeight+1 >= documentHeight){
		index +=4;
		console.log("getCafeList 호출 index : " + index);
		let btnid = $("#submit").attr("data-id");
		if(btnid=="true"){
			getCafeSearchList();
		} else {
			getCafeList();
		}
 	}
 }) 
});		


let insertlocation = $("#insertlocation").val(); 
let input_start = $("#input-start").val(); 
let input_end = $("#input-end").val(); 
let input_time = $("#input--time").val(); 

$("#submit").click(function(){
	index = 0;
	cafelist.empty();
	
	insertlocation = $("#insertlocation").val();
	input_start = $("#input-start").val(); 
	input_end = $("#input-end").val(); 
	input_time = $("#input--time").val();
	
    if(insertlocation=="" && input_start =="" && input_time==""){
	   getCafeList();
	   // 클릭했는데 아무것도 없을 때
	   $(this).attr("data-id", "false");
	   return;
	   }
    	// 그 외
	   $(this).attr("data-id", "true");
	   let btnid = $(this).attr("data-id");
	   console.log(btnid);
	   getCafeSearchList();
});


let addr_detail = "${cafeVO.addr_detail}";
let start_date = "${cafeScheduleVO.start_date}";
let end_date = "${cafeScheduleVO.end_date}";
let start_time = "${cafeScheduleVO.start_time}"
let end_time = "${cafeScheduleVO.end_time}"

let todayStr = new Date();
let year = todayStr.getFullYear();
let month = todayStr.getMonth() > 9 ? todayStr.getMonth()+1 : "0" + (todayStr.getMonth()+1);
let day = todayStr.getDate() > 9 ? todayStr.getDate() : "0" + todayStr.getDate();

let today = year + "/" + month + "/" + day;


function getCafeSearchList(){	

	// location 검색
	if(insertlocation !="" && input_start == ""){
	  	 $.get("${path}/cafe/api/searchListbyLo",
			{addr_detail:insertlocation,index:index},
			function(data){
				console.log("search result : " + data);
				for(var i=0; i<data.length; i++){
				// location 검색	
					if(insertlocation == data[i].addr_detail){
						var saleStr ="";
						if(new Date(data[i].start_date) <= new Date(today) && new Date(data[i].end_date) >= new Date(today)){
							saleStr = `
								<div>
								<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral; ">
									&#9200; \${data[i].start_date} 부터 \${data[i].end_date} 까지
								</span>
								</div>
								<div>
								<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral;  ">
								\${data[i].start_time} ~ \${data[i].end_time} 사이 할인 진행중이예요 ! &#128149;
								 </span>
								</div>
							`;	
						}
						
						var status = 
								`<div class="col-6 mt-3">
							<a href="${path}/cafe/cafeDetail/\${data[i].no}" style="text-decoration:none">
							<img src="\${data[i].photo_url}" class="img-thumbnail" />
							<strong class="title" style="font-size: 2rem; color: cadetblue;">
							\${data[i].name}
							</strong>
							\${saleStr}
							</a>
							<div class="conUtil mt-2">
								<span class="likeNum" title="좋아요 갯수">
									<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">
									\${data[i].likenum}</i>
								</span>
								<span class="icoScore" title="평균 평점">
									<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;">
									</i>4.8<i title="리뷰 갯수"></i>(367)
								</span>
								<span title="위치 정보">
								\${data[i].addr_detail}</span>
							</div>
							<p class="txt">\${data[i].content}</p>
							<p class="tagWrap">
								<span class="tag">\${data[i].tag}</span>
							 </p>
							<span class="flagWrap">
								<span class="flag">\${data[i].flag}</span>
							</span>
							</div>`;
			 				cafelist.append(status);
					}
				}// for문 끝
			}
		);
	} else if(insertlocation == "" && input_start !=""){
		// date로 검색 (location값 비어있을 때)
		$.get("${path}/cafe/api/searchListbyDt",
				{start_date:input_start,end_date:input_end,
				start_time:input_time,index:index},
				function(data){
				for(var i=0; i<data.length; i++){
					console.log(data);
					var saleStr ="";
					if(new Date(data[i].start_date) <= new Date(today) && new Date(data[i].end_date) >= new Date(today)){
						saleStr = `
							<div>
							<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral; ">
								&#9200; \${data[i].start_date} 부터 \${data[i].end_date} 까지
							</span>
							</div>
							<div>
							<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral;  ">
							\${data[i].start_time} ~ \${data[i].end_time} 사이 할인 진행중이예요 ! &#128149;
							 </span>
							</div>
						`;	
					}
				var sttr =
						`<div class="col-6 mt-3">
					<a href="${path}/cafe/cafeDetail/\${data[i].no}" style="text-decoration:none">
					<img src="\${data[i].photo_url}" class="img-thumbnail" />
					<strong class="title" style="font-size: 2rem; color: cadetblue;">
					\${data[i].name}
					</strong>
						\${saleStr}
					</a>
					<div class="conUtil mt-2">
						<span class="likeNum" title="좋아요 갯수">
							<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">
							\${data[i].likenum}</i>
						</span>
						<span class="icoScore" title="평균 평점">
							<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;">
							</i>4.8<i title="리뷰 갯수"></i>(367)
						</span>
						<span title="위치 정보">
						\${data[i].addr_detail}</span>
					</div>
					<p class="txt">\${data[i].content}</p>
					<p class="tagWrap">
						<span class="tag">\${data[i].tag}</span>
					 </p>
					<span class="flagWrap">
						<span class="flag">\${data[i].flag}</span>
					</span>
					</div>`;
	 				cafelist.append(sttr);	
				}//for문 끝	
			}
	 	);
	} else {
// 		날짜와 지역 모두로 검색
		$.get("${path}/cafe/api/searchListbyLD",
			{addr_detail:insertlocation,
			 start_date:input_start,end_date:input_end,
			 start_time:input_time,index:index},
			function(data){
			for(var i=0; i<data.length; i++){
				console.log(data);
				var sr =
					`<div class="col-6 mt-3">
				<a href="${path}/cafe/cafeDetail/\${data[i].no}" style="text-decoration:none">
				<img src="\${data[i].photo_url}" class="img-thumbnail" />
				<strong class="title" style="font-size: 2rem; color: cadetblue;">
				\${data[i].name}
				</strong>
				<div>
				<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral; ">
					&#9200; \${data[i].start_date} 부터 \${data[i].end_date} 까지
				</span>
				</div>
				<div>
				<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral;  ">
				\${data[i].start_time} ~ \${data[i].end_time} 사이 할인 진행중이예요 ! &#128149;
				 </span>
				</div>
				</a>
				<div class="conUtil mt-2">
					<span class="likeNum" title="좋아요 갯수">
						<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">
						\${data[i].likenum}</i>
					</span>
					<span class="icoScore" title="평균 평점">
						<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;">
						</i>4.8<i title="리뷰 갯수"></i>(367)
					</span>
					<span title="위치 정보">
					\${data[i].addr_detail}</span>
				</div>
				<p class="txt">\${data[i].content}</p>
				<p class="tagWrap">
					<span class="tag">\${data[i].tag}</span>
				 </p>
				<span class="flagWrap">
					<span class="flag">\${data[i].flag}</span>
				</span>
				</div>`;
 				cafelist.append(sr);	
				}
			 }
		 );
	}
}


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