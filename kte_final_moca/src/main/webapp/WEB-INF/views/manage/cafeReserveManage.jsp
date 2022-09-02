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
						<p class="text-center display-5">CAFE MANAGEMENT</p>
						<p class="text-center lead">카페 예약 관리</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
<!-- 			여기서부터 본문 영역 -->
				<div class="row py-3 my-3 border rounded-3">
					<div class="col">
							<p class="h2"><i class="bi bi-card-checklist"></i> 예약 목록</p>
							
						<!-- 예약 목록 컨테이너 -->
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">예약자</th>
						      <th scope="col">예약일자</th>
						      <th scope="col">금액</th>
						      <th scope="col">예약</th>
						      <th scope="col">실시</th>
						      <th scope="col">거절</th>
						    </tr>
						  </thead>
						  <tbody id="reservListContainer">
						    <tr>
						      <td colspan="7">예약된 모임이 없습니다.</td>
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

$("#reservListContainer").on("click", "button", function(){
	let role = $(this).attr("data-manage-role");
	let reserv_no = $(this).parent().parent().find("input").eq(0).val();
	let url ;
	if(role == "accept"){
		url = "${path}/manage/api/cafe/accept/"+reserv_no;
	} else if (role == "expire") {
		url = "${path}/manage/api/cafe/expire/"+reserv_no;
	} else if (role == "reject") {
		url = "${path}/manage/api/cafe/reject/"+reserv_no;
	}
	
	$.ajax({
		url : url,
		type : "PATCH",
		success : function(data){
			console.log(data);
		}
	});
	
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
	$.get("${path}/reservation/api/manageReservList/${memberInfo.no}", function(data){
		$("#reservListContainer").empty();
		reservationListData = data;
		console.log(data);
		for(let i=0; i<data.length; i++){
			let acceptStr=``;
			let expireStr=``;
			let rejectStr=`
				<button class="btn-close" type="button" data-bs-whatever="\${data[i].no}" data-manage-role="reject"></button>
			`;
			
			if(data[i].isRejected == true){
				rejectStr = `
					<span class="text-danger">거절됨</span>
				`;
			} else if(data[i].isAccepted == false){
				acceptStr = `
					<button type="button" class="btn btn-sm btn-success" data-manage-role="accept">수락</button>
				`;
			} else if(data[i].isExpired == false){
				acceptStr = `
					<span class="text-success">수락됨</span>
				`;
				expireStr = `
					<button type="button" class="btn btn-sm btn-success" data-manage-role="expire">완료</button>
				`;
			} else {
				rejectStr = ``;
				acceptStr = `
					<span class="text-success">수락됨</span>
				`;
				expireStr = `
					<span class="text-success">완료됨</span>
				`;
				
			}
			
			// no는 예약 번호, code는 모임 코드
			let str = `
				<tr style="cursor:pointer;">
				  <input type="hidden" value="\${data[i].no}"/>
				  <input type="hidden" value="\${data[i].code}"/>
			      <th scope="row">\${i+1}</th>
			      <td>\${data[i].member_name} 외 \${data[i].participant_count}명</td>
			      <td>\${dateFormatter(new Date(data[i].time))}</td>
			      <td>\${numberWithCommas(data[i].totalPrice)} 원</td>
			      <td>\${acceptStr}</td>
			      <td>\${expireStr}</td>
			      <td>\${rejectStr}</td>
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