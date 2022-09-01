<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang='ko'>
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
						<p class="text-center display-5">RESERVATION</p>
						<p class="text-center lead">일정을 비교하고 예약을 진행해요</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
		
<!-- 			여기서부터 본문 영역 -->
				<div class="row py-3 my-3 border rounded-3">
					<div class="col">
						<p class="align-middle mb-1"><small><a href="${path}/reservation/reservationMain">&lt; 돌아가기</a></small></p>
						<p class="h2"><i class="bi bi-card-checklist"></i> 지난 예약 목록</p>
						<!-- 예약 목록 컨테이너 -->
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">모임명</th>
						      <th scope="col">카페</th>
						      <th scope="col">예약일자</th>
						      <th scope="col">상태</th>
						      <th scope="col">비고</th>
						    </tr>
						  </thead>
						  <tbody id="reservListContainer">
						    <tr>
						      <td colspan="6">실시한 예약이 없습니다.</td>
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

<!--			여기 위까지 본문 영역 -->
			</div>
			<div class="col-2">
<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
		</div>
	</div>
	
	<!-- 리뷰 Modal -->
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="reviewModalLabel"><i class="bi bi-pencil"></i> 리뷰 작성</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <input type="hidden" value="" />
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button id="reviewSubmitBtn" type="button" class="btn btn-primary">작성 완료</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- end of container -->
</section>
<script>

let reservationListData;	// 예약 목록

getReservationList();

//예약 목록 중 하나 클릭했을 때
$("#reservListContainer").on("click", "tr", function(){
	let no = $(this).find("input").eq(0).val();
	let code = $(this).find("input").eq(1).val();
	getDetailReservation(no, code);
});

// 모달 창 hidden에 해당하는 카페 번호 등록해 줌
var reviewModal = document.getElementById('reviewModal')
reviewModal.addEventListener('show.bs.modal', function (event) {
  var button = event.relatedTarget;
  var recipient = button.getAttribute('data-bs-whatever');
  var cafeNoInput = reviewModal.querySelector('.modal-body input[type="hidden"]');
  cafeNoInput.value = recipient;
});


//자바스크립트 Date 객체를 년-월-일 시:분 형식으로 바꿔주는 함수	
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


function getReservationList(){
	/* 예약 목록을 읽어오는 함수, 컨트롤러부터 만들어야 함
		회원 번호 전달해야 함
		백에서는 회원번호로 모임코드 조회하고 그 코드에 해당하는 예약 테이블 조회
		참여자인 경우에도 보여야 하므로 참여자인 경우에는
		회원번호로 참여자 테이블 수락한 모임 코드 조회해서 해당하는 예약 테이블 조회 */
	$.get("${path}/reservation/api/pastReservList/${memberInfo.no}", function(data){
		$("#reservListContainer").empty();
		reservationListData = data;
		console.log(data);
		for(let i=0; i<data.length; i++){
			let acceptStr;
			let buttonStr=``;
			if(data[i].isAccepted == false){
				acceptStr = `
					<td><span class="text-warning">미수락</span></td>
				`;
			} else if(data[i].isExpired == false){
				acceptStr = `
					<td><span class="text-danger">미방문</span></td>
				`;
			} else {
				acceptStr = `
					<td><span class="text-success">완료됨</span></td>
				`;
				if(data[i].review_no == 0){
					buttonStr = `
						<button class="btn btn-sm btn-outline-success" type="button" data-bs-toggle="modal" data-bs-target="#reviewModal" data-bs-whatever="\${data[i].cafe_no}">리뷰작성</button>
					`;
				} else {
					buttonStr = `
						<button class="btn btn-sm btn-outline-primary" type="button">보기</button>
					`;
				}
			}
			
			// no는 예약 번호, code는 모임 코드
			let str = `
				<tr style="cursor:pointer;">
				  <input type="hidden" value="\${data[i].no}"/>
				  <input type="hidden" value="\${data[i].code}"/>
			      <th scope="row">\${i}</th>
			      <td>\${data[i].title}</td>
			      <td>\${data[i].cafe_name}</td>
			      <td>\${dateFormatter(new Date(data[i].time))}</td>
			      \${acceptStr}
			      <td class="py-1">\${buttonStr}</td>
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
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>