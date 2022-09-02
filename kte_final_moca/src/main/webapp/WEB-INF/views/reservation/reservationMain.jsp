<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang='ko'>
<!-- 헤더에 제이쿼리, 부트스트랩, 우리가 개별 적용할 css를 위한 custom.css 파일까지 다 적용되어 있음 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href='${path}/resources/lib/fullCalendar/main.css' rel='stylesheet' />
<script src='${path}/resources/lib/fullCalendar/main.js'></script>

<section class="bg-light">
	<div class="container pt-3">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="row mt-5 mb-4">
					<div class="col mt-5">
<!-- 					페이지 제목 및 설명 헤더 부분(작성) -->
						<p class="text-center display-5">RESERVATION</p>
						<p class="text-center lead">일정을 비교하고 예약을 진행해요</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
			
<!-- 			여기서부터 본문 영역 -->
				<div class="row py-3 my-3 border rounded-3">
					<div class="col">
						<div class="d-flex justify-content-between">
							<p class="h2"><i class="bi bi-card-checklist"></i> 예약 목록</p>
							<p class="align-middle my-auto"><small><a href="${path}/reservation/pastReservation">지난 예약 보러가기 &gt;</a></small></p>
						</div>
						<!-- 예약 목록 컨테이너 -->
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">모임명</th>
						      <th scope="col">카페</th>
						      <th scope="col">예약일자</th>
						      <th scope="col">확정여부</th>
						      <th scope="col">취소</th>
						    </tr>
						  </thead>
						  <tbody id="reservListContainer">
						    <tr>
						      <td colspan="6">예약된 모임이 없습니다.</td>
						    </tr>
						  </tbody>
						</table>
						
						<!-- 예약 상세보기 컨테이너 -->
						<div class="accordion" id="reservationDetail">
							<h2 class="accordion-header" id="reservDetailHeader">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#reservDetailContent" aria-expanded="false" aria-controls="reservDetailContent">
						        예약 상세 보기 - 확인하고 싶은 예약을 선택하세요.
						      </button>
						    </h2>
						  
						</div>
					</div>
				</div>

				<div class="row py-3 my-3 border rounded-3" >
					<div class="col-6">
						<div class="mb-3">
							<p class="h2"><i class="bi bi-card-list"></i> 모임 목록</p>
						</div>
						
						<!-- 모임 목록 컨테이너 -->
						<select id="invitationSelectList" class="form-select">
							<option selected value="default">모임을 선택하세요.</option>
						</select>
						<div id="reservationAlert" class="mt-3 alert alert-warning">
							<i class="bi bi-exclamation-triangle-fill"></i> 우측에 표시된 인원으로 <strong>예약이 진행</strong>됩니다. 예약을 완료하기 전 빠진 인원이 있는지 확인해주세요.						
						</div>
					</div>
					<div class="col-6" >
						<p class="h2 "><i class="bi bi-people "></i> 참여자 목록</p>
						
						<!-- 참여자 목록 컨테이너 -->
						<ul id="acceptedParticipantList" class="list-group mt-3 mb-3 overflow-auto" >
							<li class="list-group-item">모임을 선택하세요.</li>
						</ul>
					</div>
				</div>
				
				<div class="row py-3 my-3 border rounded-3" >
					<div class="col d-flex justify-content-between">
						<p class="h2"><i class="bi bi-calendar-check"></i> 일자 선택<small class="fs-6 text-muted"> - 일정을 불러온 후 원하는 날짜의 빈 공간을 선택하세요.</small></p>
						<button id="drawCalendarBtn" type="button" class="alert-success alert mb-0 py-2">일정 불러오기</button>
					</div>
					
					<!-- 일정 컨테이너 -->
					<div id="calendar" class="mt-3" style="height:300px"></div>
				</div>
				
				<div id="calendarSelectedDate" class="row d-none-custom alert alert-warning py-1 mb-1"></div>

				<div class="row py-3 my-3 border rounded-3" >
					<div class="col-6 border-end">
						<p class="h2"><i class="bi bi-cup-straw"></i> 카페 찾기</p>
						<div class="mt-3 justify-content-between row">
							<div class="col-6 text-center">
								<label for="reservationTime" class="form-label">희망 시각</label>
								<input id="reservationTime" type="time" class="text-center form-control" value="14:00"/>
							</div>
							<div class="col-6 text-center">
								<label for="reservationLocation" class="form-label">지역</label>
								<input id="reservationLocation" type="text" class="form-control"/>
							</div>
						</div>
						<div id="reservCafeFindBtn" class="alert alert-success mt-2 mb-0 py-1 text-center" style="cursor:pointer">
							조건에 맞는 카페 찾아오기 <i class="bi bi-hand-index-thumb-fill"></i>
						</div>
						
						<!-- 카페 목록 컨테이너 -->
						<div id="reservCafeListContainer">
							
						</div>
						
						<div class="alert alert-warning py-0 text-center d-flex justify-content-between">
							<div id="reservCafePrevBtn" class="d-none-custom" style="cursor:pointer"><i class="bi bi-caret-left-fill"></i> 이전</div>
							<div id="reservCafeTotalCnt"> 원하는 날짜와 시각을 선택 후 찾아오기를 눌러주세요! </div>
							<div id="reservCafeNextBtn" class="d-none-custom" style="cursor:pointer">다음 <i class="bi bi-caret-right-fill"></i></div>
						</div>
					</div>
					
					<div class="col-6">
						<p class="h2"><i class="bi bi-cup-straw"></i> 메뉴 선택</p>
						
						<!-- 메뉴 컨테이너 -->
						<div id="reservCafeMenuContainer" class="border rounded-3 text-center overflow-auto" style="max-height : 300px">
							<div class="alert alert-warning mb-0">선택된 카페가 없습니다.</div>
						</div>
						
						<p class="h2 mt-3"><i class="bi bi-cup-straw"></i> 주문 목록</p>
						<table class="table table-sm">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">메뉴</th>
						      <th scope="col">적용가</th>
						      <th scope="col" style="width : 60px">수량</th>
						      <th scope="col">금액</th>
						    </tr>
						  </thead>
						  <tbody id="reservSelectedMenuContainer" class="align-middle">
						  	<tr>
						  		<td colspan="5">선택된 메뉴가 없습니다.</td>
						  	</tr>
						  </tbody>
						  <tfoot>
							  <tr>
							  	<th>총 금액</th>
							  	<td colspan="4" class="text-end">0</td>
						  	</tr>
						  	<tr >
						  		
						  	</tr>
						  </tfoot>
						</table>
						<div class="alert alert-warning d-flex justify-content-between">
							<div>
						  		<input id="dutchCheckBox" type="checkbox" value=true class="form-check-input ms-3" />
						  		<label class="ms-2 form-check-label" for="dutchCheckBox">
						  			더치페이 ?
						  		</label>
							</div>
							<div>
					  			<span id="priceByPerson"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col text-end">
						<button id="reservConfirmBtn" type="button" class="alert alert-success py-2">예약하기</button>
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
<script>
	
// 메뉴 툴팁 초기화	
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
});

// 필요한 전역 변수들
let cal;	// 달력 저장용 변수
let selectedInvNo;	// 선택된 모임 번호
let invitationListData;	// 모임 목록
let participantListData;	// 선택된 모임의 참여자 목록
let selectedDate;	// 선택된 예약 날짜
let reservationTime;	// 선택된 예약 시각
let reservationLocation;	// 예약 지역
let cafeListIndex = 0;	// 카페 목록 4개씩 출력하기 위한 인덱스 값(페이지)
let cafeList;	// 카페 목록
let selectedCafeNo;	// 선택된 카페 번호
let selectedCafeOnSale;	// 선택된 카페가 할인 중인지 확인한 변수
let selectedCafeMenuList;	// 선택된 카페 메뉴 목록
let selectedMenu = "";	// 선택된 메뉴
let menuClickCnt = 1;	// 선택 메뉴 표 그리기 위해 사용할 클릭 횟수
let isDutch = false; // 더치페이 선택 여부
let reservationListData;	// 예약 목록
let reservTotalPrice; // 총 가격

let tooltip;	// 마우스 올렸을 때 나오는 툴팁들 모아두는 변수

drawCalendar();
getReservationList();
// 날짜 선택하지 않았을 때 오늘 날짜로 기본값을 지정하기 위한 변수들 및 결과
let todayStr = new Date();
let year = todayStr.getFullYear();
let month = todayStr.getMonth() > 9 ? todayStr.getMonth()+1 : "0" + (todayStr.getMonth()+1);
let day = todayStr.getDate() > 9 ? todayStr.getDate() : "0" + todayStr.getDate();

selectedDate = year + "-" + month + "-" + day;


// 모임 목록 선택하면 작동하는 이벤트
$("#invitationSelectList").on("change", function(){
	selectedInvNo = $("#invitationSelectList option:selected").val();
	getParticipantList();
});
	
// 일정 불러오기 버튼 클릭하면 작동하는 이벤트
$("#drawCalendarBtn").on("click", function(){
	drawCalendar();
	getParticipantSchedule();
});

// 카페 불러오기 버튼 클릭하면 작동하는 이벤트
$("#reservCafeFindBtn").on("click",function(){
	cafeListIndex = 0;
	getTargetCafeList();
});

// 카페 목록 다음 버튼
$("#reservCafeNextBtn").on("click", function(){
	cafeListIndex += 4;
	drawCafeList();
});

// 카페 목록 이전 버튼
$("#reservCafePrevBtn").on("click", function(){
	cafeListIndex -= 4;
	drawCafeList();
});

// 카페 목록에서 카페를 선택했을 때
$("#reservCafeListContainer").on("click", ".card", function(){
	selectedCafeNo = $(this).find("input").val();
	selectedCafeOnSale = $(this).find("input:nth-child(2)").val();
	getSelectedCafeMenuList();
	$("#reservSelectedMenuContainer").empty();
	$("#reservSelectedMenuContainer").append(`<tr><td colspan="5">선택된 메뉴가 없습니다.</td></tr>`);
	selectedMenu = "";
	menuClickCnt = 1;
});

// 메뉴를 클릭했을 때
$("#reservCafeMenuContainer").on("click", "button", function(){
	let index = $(this).find("input").val();
	if(selectedMenu == ""){
		$("#reservSelectedMenuContainer").empty();
	}
	selectedMenu = selectedCafeMenuList[index];
	let selectedMenuList = $("#reservSelectedMenuContainer").find("input[type='hidden']");
	for(let i=0; i<selectedMenuList.length; i++){
		if(selectedMenuList[i].value == selectedMenu.no){
			let currentAmount =$("#reservSelectedMenuContainer").find(`input[value='\${selectedMenu.no}']`).parent().next().next().find("input").val();
			$("#reservSelectedMenuContainer").find(`input[value='\${selectedMenu.no}']`).parent().next().next().find("input").val(Number(currentAmount) + 1);
			$("#reservSelectedMenuContainer").find(`input[value='\${selectedMenu.no}']`).parent().next().next().find("input").change();
			$("#dutchCheckBox").change();
			return;
		}
	}
	
	let str = `
		<tr>
	      <th scope="row">\${menuClickCnt}</th>
	      <td>\${selectedMenu.name}<input type="hidden" value="\${selectedMenu.no}" /></td>
	      <td>\${selectedCafeOnSale == 'y' ? numberWithCommas(selectedMenu.discount) : numberWithCommas(selectedMenu.price)}</td>
	      <td><input type="number" class="form-control px-1" value=1 /></td>
	      <td>\${selectedCafeOnSale == 'y' ? numberWithCommas(selectedMenu.discount) : numberWithCommas(selectedMenu.price)} 
	      </td>
	    </tr>
	`;
	$("#reservSelectedMenuContainer").append(str);
	$("#reservSelectedMenuContainer").find(`input[value='\${selectedMenu.no}']`).parent().next().next().find("input").change();
	menuClickCnt++;
});

// 가격표 값 변화 이벤트
$("#reservSelectedMenuContainer").on("change", "input[type='number']", function(){
	$(this).parent().next().text(numberWithCommas($(this).val()*$(this).parent().prev().text().replaceAll(",","")));
	/* $("#reservSelectedMenuContainer").next().find("td").text(numberWithCommas(Number($("#reservSelectedMenuContainer").next().find("td").text().replaceAll(",","")) + Number($(this).parent().prev().text().replaceAll(",","")))); */
	let totalPrice = 0;
	$("#reservSelectedMenuContainer").find("td:last-child").each(function(){
		totalPrice += Number($(this).text().replaceAll(",",""));
	});
	$("#reservSelectedMenuContainer").next().find("td").text(numberWithCommas(totalPrice));
	reservTotalPrice = $("#reservSelectedMenuContainer").next().find("td").text().replaceAll(",","");
});

// 더치페이 체크 변경 이벤트
$("#dutchCheckBox").on("change", function(){
	if($(this).is(':checked')){
		$("#priceByPerson").text("인당 금액 : " + numberWithCommas(Math.round(Number($("#reservSelectedMenuContainer").next().find("td").text().replaceAll(",","")) / (Number($("#acceptedParticipantList").find("li").length)+1))));
		isDutch = "true";
		console.log(isDutch);
	} else {
		$("#priceByPerson").text("");
		isDutch = "false";
	}
});

// 예약 완료 버튼 눌렀을 때
$("#reservConfirmBtn").on("click", function(){
	if(typeof selectedInvNo != "undefined" && typeof selectedCafeNo != "undefined" && selectedMenu != ""){
		setReservation();
	} else {
		alert("충분한 예약 내용을 입력하지 않았습니다.");
	}
});

// 예약 목록 중 하나 클릭했을 때
$("#reservListContainer").on("click", "tr", function(){
	let no = $(this).find("input").eq(0).val();
	let code = $(this).find("input").eq(1).val();
	getDetailReservation(no, code);
});

// 예약 취소 버튼 클릭 이벤트
$("#reservListContainer").on("click", "button", function(){
	let confirmResult = confirm("정말로 취소하시겠습니까?");
	if(confirmResult){
		let no = $(this).parent().parent().find("input").eq(0).val();
		let code = $(this).parent().parent().find("input").eq(1).val();
		cancelReservation(no, code);
	} else {
		return;
	}
});


	// 자바스크립트 Date 객체를 년-월-일 시:분 형식으로 바꿔주는 함수	
	function dateFormatter(date){
		let year = date.getFullYear();
		let month = date.getMonth() > 9 ? date.getMonth()+1 : "0" + (date.getMonth()+1);
		let day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
		let hour = date.getHours();
		let minute = date.getMinutes() > 9 ? date.getMinutes() : "0" + date.getMinutes();
		
		return year + "-" + month + "-" + day + " " + hour + ":" + minute;
	}

	// 숫자 3자리 마다 콤마찍기
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	// 모임 목록 읽어오기 함수
	function getInvitationList(){
		/* 사용자의 모임 목록 읽어와서 select 태그에 option으로 추가
		select id : invitationSelectList, 요청 url : {path}/invitation/api/listByMember/회원번호
		받아온 데이터를 반복문으로 option으로 그려 넣기, value값은 모임의 모임번호 등록 */
		$.get("${path}/invitation/api/listByMember/${memberInfo.no}", function(data){
			invitationListData = data;
			for(let i=0; i<data.length; i++){
				if(data[i].member_no == ${memberInfo.no} && data[i].isReserve != true){
					let str = `
						<option value=\${data[i].no}>\${data[i].title}</option>
					`;
					$("#invitationSelectList").append(str);
				}
			}
		});
	}
	
	// 참여자 목록 읽어오기 함수
	function getParticipantList(){
		/* 선택된 모임의 모임 번호로 참여자 목록 읽어와서 ul에 li로 추가
		ul id : acceptedParticipantList, 요청 url : {path}/invitation/api/listByCode/모임번호
		받아온 데이터를 반복문으로 li로 그려 넣기, 이 때 isAccepted가 true이거나 1인 사용자만 그리기 */
		if(selectedInvNo == "default"){
			return;
		}
		$.get("${path}/invitation/api/listByCode/"+selectedInvNo, function(data){
			participantListData = data;
			let acceptFlag = 0;
			$("#acceptedParticipantList").empty();
			if(data.length == 0){
				let str = `
					<div class="alert alert-warning">초대한 인원이 없습니다.</div>
				`;
				$("#acceptedParticipantList").append(str);
				return;
			}
			for(let i=0; i<data.length; i++){
				if(data[i].isAccepted == true || data[i].isAccepted == 1){
					let str = `
						<li class="list-group-item">\${data[i].name}</li>
					`;
					$("#acceptedParticipantList").append(str);
					acceptFlag = 1;
				}
			}
			
			if(acceptFlag == 0){
				let str = `
					<div class="alert alert-warning">초대를 수락한 참여자가 없습니다.</div>
				`;
				$("#acceptedParticipantList").append(str);
			}
		});
	}
	
	// 달력 그리기 함수
	function drawCalendar(){
		let calendarEl = document.getElementById('calendar');
		cal = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridWeek',
			timeZone : 'local',
			locale : 'ko',
			themeSystem : 'bootstrap5',
			headerToolbar : {
				start : 'prev',
				center : '',
				end : 'next'
			},
			height: 350,
			eventDidMount: function(info) {
				let formattedDate =
	        	tooltip = new bootstrap.Tooltip(info.el, {
		            title: `종료 : \${info.event.end == null ? "하루 종일" : cal.formatDate(info.event.end,{
						hour : '2-digit',
						minute : '2-digit'
					}) }`,
		            placement: 'top',
		            trigger: 'hover',
		            container: 'body'
	          	}); 
	        },
			dateClick: function(info) {
		       	    cal.unselect();
		       	    cal.select(info.dateStr);
		       	    selectedDate = info.dateStr;
		       	    $("#calendarSelectedDate").text("선택한 날짜 : " + selectedDate);
		       	 	$("#calendarSelectedDate").stop().fadeIn();
			},
			googleCalendarApiKey: 'AIzaSyAGPf1yW8M9XzGKy_llS0jrWKVoVvMYdsg',
			eventSources: [
				{
					googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
					color : '#ed6f63',
					textColor : '#2D2926'
				}
			],
	        eventClick: function(info) {
		            info.jsEvent.preventDefault(); // don't let the browser navigate
		        }
		});
	    cal.render();
	}
	
	// 참여자 일정 읽어오기 함수
	function getParticipantSchedule(){
		/* 다음 단계로 진행된 모임의 수락한 참여자 목록에 해당하는 스케쥴 읽어와서 fullCalendar 그리기
		멤버 번호로 찾는 요청 처리가 있으나, 참여자 전체 인원(참여자+본인)에 해당하는 일정을 모두
		받아오는 백엔드 구축을 따로 하는 것이 나을 듯
		각 참여자 및 주최자의 회원 번호를 전달해야 함*/
   		$.get("${path}/schedule/api/scheduleList", {member_no : ${memberInfo.no}}, function(data){
   			cal.addEventSource(data);
   		});
   		for(let i=0; i<participantListData.length; i++){
			if(participantListData[i].isAccepted == true || participantListData[i].isAccepted == 1){
				$.get("${path}/schedule/api/scheduleList", {member_no : participantListData[i].participant_no}, function(data){
		   			cal.addEventSource(data);
		   		});
			}
		}	
   		
	}
	
	// 카페 목록 조건에 맞게 가져오기 함수
	function getTargetCafeList(){
		/* 통합 일정에서 특정 날짜를 선택하고, 시간대와 지역을 입력하면 해당하는 카페 목록을 받아올 함수
		백엔드 부분은 화진과 논의 */
		reservationTime = $("#reservationTime").val();
		reservationLocation = $("#reservationLocation").val();
		
		let selectedDateTime = selectedDate + " " + reservationTime;
		let now = new Date();
		
		if(new Date(selectedDateTime) < now){
			alert("예약할 수 없는 날짜입니다.");
			return;
		}
		$.get("${path}/reservation/api/cafeList", {time : selectedDateTime, location : reservationLocation}, function(data){
			cafeList = data;
			$("#reservCafeTotalCnt").text("총 " + data.length + "개의 결과");
			drawCafeList();
		});
	}
	
	// 카페 목록 그리기 함수
	function drawCafeList(){
		if(cafeListIndex+4 < cafeList.length){
			$("#reservCafeNextBtn").removeClass("d-none-custom");
		} else {
			$("#reservCafeNextBtn").addClass("d-none-custom");
		}
		
		if(cafeListIndex > 0){
			$("#reservCafePrevBtn").removeClass("d-none-custom");
		} else {
			$("#reservCafePrevBtn").addClass("d-none-custom");
		}
		
		$("#reservCafeListContainer").empty();
		for(let i=cafeListIndex; i<cafeListIndex+4; i++){
			if(i >= cafeList.length){
				break;
			}
			let str = `
				<div class="card my-3 pe-2" >
				  <input type="hidden" value="\${cafeList[i].no}"/>
				  <input type="hidden" value="\${cafeList[i].onsale}"/>
				  <div class="row my-auto align-items-center" style="height:100px; cursor:pointer" >
				    <div class="col-3 pe-0">
				      <img style="height:100px;width:100px;" src="\${cafeList[i].photo_url}" class="py-auto img-fluid rounded-start" alt="...">
				    </div>
				    <div class="col-9 mh-100">
				      <div class="card-body py-1 px-0 " >
				      	<div class="d-flex justify-content-between">
				        	<span class="card-title h5">\${cafeList[i].name}</span><small class="text-danger">\${cafeList[i].onsale == 'y'? "할인 중" : ""}</small>
				        	<div>
				        		<span class="text-danger"><i class="bi bi-heart-fill">\${cafeList[i].likenum}</i></span>&nbsp;
				        		<span class="text-warning"><i class="bi bi-star-fill">\${Math.round(cafeList[i].star*10)/10}</i></span>
				        	</div>
				        </div>
				        <div class="card-text text-truncate">
				        	\${cafeList[i].content}
			        	</div>
			        	<div class="cart-text text-truncate">
			        		<small>\${cafeList[i].tag}</small>
			        	</div>
				      </div>
				    </div>
				  </div>
				</div>
			`;
			$("#reservCafeListContainer").append(str);
		}
	}
	
	// 선택된 카페 메뉴 목록 가져오기 함수
	function getSelectedCafeMenuList(){
		/* 카페를 선택하면 해당 카페의 메뉴 목록을 가져와서 그리는 함수
		백엔드 부분은 화진과 논의 */
		$.get("${path}/cafe/api/cafeMenuList", {cafe_no : selectedCafeNo}, function(data){
			selectedCafeMenuList = data;
			$("#reservCafeMenuContainer").empty();
			for(let i=0; i<data.length; i++){
				let priceStr;
				
				if(selectedCafeOnSale == 'y'){
					priceStr = `
						<span class='text-decoration-line-through' >\${data[i].price}</span>
						<span class="text-danger">\${data[i].discount}</span>
					`;
				} else {
					priceStr = `
						<span class='' >\${data[i].price}</span>
					`;
				}
				
				let str=`
					<button type="button" class="menu-btn-custom m-3 rounded-3 btn btn-outline-dark" data-bs-toggle="tooltip" data-bs-html="true" 
							title="<img class='reserv-cafe-menu-img-custom' src='\${data[i].photo_url}'/>">
					  <input type="hidden" value="\${i}" />
					  \${data[i].name}<br/>
					  <small>
						  \${priceStr}
					  </small>
					</button>
				`;
				$("#reservCafeMenuContainer").append(str);
			}
			var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
			  return new bootstrap.Tooltip(tooltipTriggerEl)
			});
		});
	}
	
	function setReservation(){
		/* 예약을 등록하는 함수, 컨트롤러부터 만들어야 함
			선택된 모임의 모임코드, 선택된 카페의 카페 번호, 선택한 시각, 더치 여부 데이터 전달해야 함*/
		let invitationCode;
		
		for(let i=0; i<invitationListData.length; i++){
			if(invitationListData[i].no == selectedInvNo){
				invitationCode = invitationListData[i].code;
			}
		}
		
		// 예약 데이터 생성
		let reservation = {
				invite_code : invitationCode,
				cafe_no : selectedCafeNo,
				time : selectedDate + " " + reservationTime,
				dutch : isDutch,
				totalPrice : reservTotalPrice
		};
		console.log(reservation);
		
		// 메뉴 데이터 생성
		let selectedMenuTable = $("#reservSelectedMenuContainer").children();
		
		reservation.reservationMenu = new Array();
		
		for(let i=0; i < selectedMenuTable.length; i++){
			let menu = {
					menu_no : selectedMenuTable.eq(i).find("input[type='hidden']").val(),
					amount : selectedMenuTable.eq(i).find("input[type='number']").val()
			};
			reservation.reservationMenu.push(menu);
		}
		
		$.ajax({
			url : "${path}/reservation/api/regist", 
			type : "POST",
			data : JSON.stringify(reservation) ,
			headers : {"Content-Type":"application/json;charset=utf-8"},
			success : function(data){
				console.log(data);
				alert("예약이 완료되었습니다.");
				location.href='${path}/reservation/reservationMain';
			}
		});
	}
	
	function getReservationList(){
		/* 예약 목록을 읽어오는 함수, 컨트롤러부터 만들어야 함
			회원 번호 전달해야 함
			백에서는 회원번호로 모임코드 조회하고 그 코드에 해당하는 예약 테이블 조회
			참여자인 경우에도 보여야 하므로 참여자인 경우에는
			회원번호로 참여자 테이블 수락한 모임 코드 조회해서 해당하는 예약 테이블 조회 */
		$.get("${path}/reservation/api/reservList/${memberInfo.no}", function(data){
			$("#reservListContainer").empty();
			reservationListData = data;
			console.log(data);
			for(let i=0; i<data.length; i++){
				let acceptStr;
				
				if(data[i].isRejected == true){
					acceptStr = `
						<td><span class="text-danger">거절됨</span></td>
					`;
				} else if(data[i].isAccepted == true){
					acceptStr = `
						<td><span class="text-success">확정</span></td>
					`;
				} else {
					acceptStr = `
						<td><span class="text-warning">대기 중</span></td>
					`;
				}
				
				let str = `
					<tr style="cursor:pointer;">
					  <input type="hidden" value="\${data[i].no}"/>
					  <input type="hidden" value="\${data[i].code}"/>
				      <th scope="row">\${i+1}</th>
				      <td>\${data[i].title}</td>
				      <td>\${data[i].cafe_name}</td>
				      <td>\${dateFormatter(new Date(data[i].time))}</td>
				      \${acceptStr}
				      <td><button class="btn-close"></button></td>
				    </tr>
				`;
				
				$("#reservListContainer").append(str);
			}
		});
	}
	
	function getDetailReservation(no, code){
		$.get("${path}/reservation/api/detail", {no : no, code : code}, function(data){
			
			$("#reservationDetail").empty();
			
			let selectedReservation;
			for(let i=0; i<reservationListData.length; i++){
				if(reservationListData[i].no == no){
					selectedReservation = reservationListData[i];
					break;
				}
			}
			let participantsStr = ``;
			
			for(let i=0; i<data.participants.length; i++){
				participantsStr += `
					<li class="list-group-item border-0"><i class="bi bi-dot"></i> \${data.participants[i]}</li>
				`;
			}
			
			let menusStr = ``;
			
			for(let i=0; i<data.menus.length; i++){
				menusStr += `
					<tr>
				      <th scope="row">\${i+1}</th>
				      <td>\${data.menus[i].name}</td>
				      <td>\${numberWithCommas(data.menus[i].price)}</td>
				      <td>\${numberWithCommas(data.menus[i].discount)}</td>
				      <td>\${data.menus[i].amount}</td>
				    </tr>
				`;
			}
			
			let dutchStr = `
				<tr>
					<td colspan="5">인당 가격 : \${numberWithCommas(Math.round(selectedReservation.totalPrice/(Number(data.participants.length+1))))} 원</td>
				</tr>
			`;
			
			let str = `
				<div class="accordion-item">
				    <h2 class="accordion-header" id="reservDetailHeader">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#reservDetailContent" aria-expanded="false" aria-controls="reservDetailContent">
				        예약 상세 보기 - \${selectedReservation.title}
				      </button>
				    </h2>
				    <div id="reservDetailContent" class="accordion-collapse collapse" aria-labelledby="reservDetailHeader" data-bs-parent="#reservationDetail">
				      <div class="accordion-body">
				      	<div class="d-flex justify-content-between">
				      		<p class="h2 mb-3">[ <span>\${selectedReservation.title}</span> ] 상세 정보</p>
				      		<p class="text-muted fs-6"> <span>\${selectedReservation.member_name}</span> 님의 모임</p>
				      	</div>
						<div class="row">
							<div class="col-6 border-end">
								<div class="alert alert-warning py-1 border-2 h5 mb-1"> 예약 일자</div>
								<div class="my-3 ps-3"><i class="bi bi-dot"></i> \${dateFormatter(new Date(selectedReservation.time))}</div>
								
								<div class="alert alert-warning py-1 border-2 h5 mb-1"> 참여자</div>
								<ul id="reservDetailParticipantList" class="list-group mb-3 overflow-auto">
									\${participantsStr}
								</ul>
								
								<div class="alert alert-warning py-1 border-2 h5 mb-1"> 더치 여부</div>
								<div class="my-3 ps-3"><i class="bi bi-dot"></i> \${selectedReservation.isDutch == true ? "예" : "아니오"}</div>
							</div>
							<div class="col-6">
								<div class="alert alert-warning py-1 border-2 h5 mb-1"> 카페</div>
								<div class="my-3 ps-3">
									<i class="bi bi-dot"></i> \${selectedReservation.cafe_name}(\${selectedReservation.addr} \${selectedReservation.addr_detail}) <a href="${path}/cafe/cafeDetail/\${selectedReservation.cafe_no}"><i class="bi bi-arrow-up-right-square-fill"></i></a>
								</div>
																		
								<div class="alert alert-warning py-1 border-2 h5 mb-1"> 주문 목록</div>
								<table class="table table-sm">
								  <thead>
								    <tr>
								      <th scope="col">#</th>
								      <th scope="col">메뉴</th>
								      <th scope="col">가격</th>
								      <th scope="col">할인가</th>
								      <th scope="col">수량</th>
								    </tr>
								  </thead>
								  <tbody>
								    \${menusStr}
								  </tbody>
								  <tfoot>
								  	<tr>
									  	<th>총 금액</th>
									  	<td colspan="4" class="text-end"> \${numberWithCommas(selectedReservation.totalPrice)} 원</td>
								  	</tr>
								  	\${selectedReservation.isDutch == true ? dutchStr : ""}
								  </tfoot>
								</table>
							</div>
						</div>
				      </div>
				    </div>
				  </div>
			`;
			$("#reservationDetail").append(str);
			
		});
	}
	
	function cancelReservation(no, code){
		/* 예약을 취소하는 함수, 컨트롤러부터 만들어야 함
			취소 대상 예약의 예약 번호 전달해야 함*/
		$.ajax({
			url : "${path}/reservation/api/delete",
			type : "DELETE",
			data : {no : no, code : code},
			success : function(data){
				console.log(data);
				alert("예약이 취소되었습니다.");
				location.href='${path}/reservation/reservationMain';
			}
		});
	}
	
	
	getInvitationList();
	
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>