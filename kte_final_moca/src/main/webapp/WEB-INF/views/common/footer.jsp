<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer>
	<div class="d-flex bg-light h-100">
	
	</div>
</footer>
<script>
// ë²í¼ í¤ë íì´ë ì¤í¬ë¦½í¸
/* $(function(){ */
	$("#btnHeader .btn").each(function(){
		$(this).on("mouseover", function(e){
			$(this).find("i").stop().fadeOut();
			$(this).find("p").stop().fadeIn();
		});
		$(this).on("mouseout", function(e){
			$(this).find("i").stop().fadeIn();
			$(this).find("p").stop().fadeOut();
		});
	});
/* }); */


// ì¤í¬ë¡¤ ì¬ì´ëë° íì´ë ì¤í¬ë¦½í¸
$(function(){
	if($(window).scrollTop()){
		$("#sidebar").stop().fadeIn();
	}
	$(window).scroll(function(){
		var scrollT = $(this).scrollTop();
		if(scrollT >= 300){
			$("#sidebar").stop().fadeIn();
		} else {
			$("#sidebar").stop().fadeOut();
		}
	});
});

// ê° í¤ë ë²í¼ í´ë¦­ì íë©´ ì´ë ì¤í¬ë¦½í¸
// btnHeader.jsp ì sidebar.jspì ê° ë²í¼ì data-location ìì±ì ê° ë©ì¸ íë©´ ê²½ë¡ ë£ì¼ë©´ ë¨
const contextPath = '${pageContext.request.contextPath}';
$("#btnHeader .btn").each(function(){
	$(this).on("click", function(){
		let loc = $(this).attr("data-location");
		location.href = contextPath + loc;
	});
});
// ì¬ì´ëë° ë²í¼ í´ë¦­ì íë©´ ì´ë ì¤í¬ë¦½í¸
$("#sidebar .btn").each(function(){
	$(this).on("click", function(){
		let loc = $(this).attr("data-location");
		location.href = contextPath + loc;
	});
});

$(window).on('load',function(){
	if($("section").height() < $(window).height()){
		$("section").css("min-height", $(window).height()-$("footer").height());
	}
});

$("#sideTopBtn").click(function(e){
	$('html').animate( { scrollTop : 0 }, 200, "linear" );	
});

<c:if test="${!empty sessionScope.memberInfo }">
let select = $("#inviteSelectList").clone();
getSearchBarInvitationList();
function getSearchBarInvitationList(){
	

	$.get("${pageContext.request.contextPath}/invitation/api/listByMember/${memberInfo.no}", function(data){
		select.find("select").empty();
		select.find("select").append(`<option selected>모임 선택하기</option>`);
		for(let i=0; i<data.length; i++){
			if(data[i].member_no == ${memberInfo.no}){
				let selectStr = `
					<option value="\${data[i].no}">\${data[i].title}</option>
				`;		
				select.find("select").append(selectStr);
			}
		}
	});
}

$("#headerSearchResult").on("click", ".headerSearchUserResult div:first-child", function(){
	if(select.is(":visible")){
		select.prev().removeClass("alert alert-secondary my-0 py-1");
		select.slideUp();
	} else {
		select.hide();
		select.insertAfter($(this));
		$(this).addClass("alert alert-secondary my-0 py-1");
		$(this).next().stop().slideDown();
	}
});

$("#headerSearchResult").on("click","button", function(){
	let selectedInvNo = $(this).prev().find("option:selected").val();
	let id = $(this).parent().prev().find("span").attr("data-member-id");
	
	$.post("${pageContext.request.contextPath}/invitation/api/sendInvite", {no : selectedInvNo, id : id}, function(result){
		if(result == ""){
			alert("존재하지 않는 아이디입니다.");
			return;
		}
		if(result == "DUPLICATED"){
			alert("이미 초대한 회원입니다.");
			return;
		}
		if(result == "FORBIDDEN"){
			alert("초대 권한이 없습니다.");
			return;
		}
		if(result == "SELFINVITED"){
			alert("자신을 초대할 수 없습니다.");
			return;
		}
		alert(result + " 님을 초대했습니다.");
		sendAlert(id);
	},"text");
});

</c:if>

$("#headerSearchBtn").click(function(){
	let keyword = $(this).prev().val();

	$("#headerSearchResult").empty();

	if(keyword == ""){
		$("#headerSearchResult").append(`<li><span class="dropdown-item">검색 내용을 입력하세요.</span></li>`);
		return;
	}
	
	$.get("${pageContext.request.contextPath}/search/api/", {keyword : keyword}, function(data){
		
		/* 사용자 검색 데이터 작성 */
		$("#headerSearchResult").append(`<li id="headerSearchUserTitle"><span class="dropdown-item fw-bold alert alert-success my-0 py-0"><i class="bi bi-caret-down"></i> 사용자 검색 결과 </span></li>`);
		
		if(data.member.length != 0){
			/* 사용자 검색 데이터가 있을 때 */
			let mem = data.member;
			for(let i =0; i<mem.length; i++){
				let profile = ``;
				
				if(mem[i].profile_url == null){
					profile = `<i class="bi bi-person-fill "></i>`;
				} else {
					profile = `<img class="rounded-circle search-profile" src="${pageContext.request.contextPath}/\${mem[i].profile_url}" />`;
				}
				
				let memStr = `
					<li class="headerSearchUserResult">
						<div class="dropdown-item text-truncate">
							\${profile}
							<span data-member-id="\${mem[i].id}">\${mem[i].name}(\${mem[i].id})</span>
						</div>
					</li>
				`;
				$("#headerSearchResult").append(memStr);
			}
		} else {
			/* 사용자 검색 데이터가 없을 때 */
			$("#headerSearchResult").append(`<li><span class="dropdown-item">검색 결과가 없습니다.</span></li>`);
		}
		
		/* 구분선 그리기 */
		$("#headerSearchResult").append(`<li><hr class="dropdown-divider"></li>`);
		
		/* 카페 검색 데이터 작성 */
		$("#headerSearchResult").append(`<li id="headerSearchCafeTitle"><span class="dropdown-item fw-bold alert alert-warning my-0 py-0"><i class="bi bi-caret-down"></i> 카페 이름 검색 결과 </span></li>`);
		
		if(data.cafe.length != 0){
			/* 카페 검색 데이터가 있을 때 */
			let cafe = data.cafe;
			for(let i =0; i<cafe.length; i++){
				let cafeStr = `
					<li>
						<div class="dropdown-item d-flex justify-content-between">
							<div class="text-truncate">
								<img class="rounded-circle search-profile" src="\${cafe[i].photo_url}" />
								<span>\${cafe[i].name}</span>
							</div>
							<a href="${pageContext.request.contextPath}/cafe/cafeDetail/\${cafe[i].no}" class="btn btn-sm text-primary">보기</a>
						</div>
					</li>
				`;
				$("#headerSearchResult").append(cafeStr);
			}
		} else {
			/* 카페 검색 데이터가 없을 때 */
			$("#headerSearchResult").append(`<li><span class="dropdown-item">검색 결과가 없습니다.</span></li>`);
		}
		
	});
});

 
/* 로그인 했을 때 알림 읽어오고 알림 표시한 후 웹소켓 연결 */
<c:if test="${!empty sessionScope.memberInfo}">

var alertSock;
alertSock = new SockJS('${pageContext.request.contextPath}/alert');
alertSock.onmessage = onAlertMessage;
alertSock.onclose = onAlertClose;
alertSock.onopen = onAlertOpen;

var toastElList = [].slice.call(document.querySelectorAll('.toast'))
var toastList = toastElList.map(function (toastEl) {
  return new bootstrap.Toast(toastEl,{autohide:true, delay:5000});
});
let toast = $("#liveToast");
console.log(toastList[0]);


function sendAlert(id) {
	let msg = {
			no : ${sessionScope.memberInfo.no},
			id : id
	};
	
	alertSock.send(JSON.stringify(msg));
}

function onAlertMessage(msg) {
	getAlert();
	toastList[0].show();
}

function onAlertClose(evt) {

	console.log("알림 연결 종료");
}
function onAlertOpen(evt) {
	
	let msg = {id:"${sessionScope.memberInfo.id}",message:"OPENALERTSESSION"};
	
	alertSock.send(JSON.stringify(msg));
	
	console.log("알림 연결");
}



function getAlert(){
	$.get("${pageContext.request.contextPath}/alert/${sessionScope.memberInfo.id}",function(data){
		if(data.invitationAlert.length == 0 ){
			$("#headerAlertRedDot").addClass("d-none-custom");
			$("#headerAlertList").empty();
			let str = `
				<li><span class="dropdown-item">알림이 없습니다.</span></li>
			`;
			$("#headerAlertList").append(str);
		} else {
			$("#headerAlertRedDot").removeClass("d-none-custom");
			$("#headerAlertList").empty();
			
			let str = `
				<li><span class="dropdown-item">받은 알림 <i class="bi bi-caret-down-fill"></i></span></li>
			`;
			$("#headerAlertList").append(str);
			
			for(let i=0; i<data.invitationAlert.length; i++){
				str = `
					<li>
						<a href="${pageContext.request.contextPath}/invitation/invitationMain" class="alert alert-warning mb-0 py-2 text-truncate dropdown-item">대기 중인 초대 - \${data.invitationAlert[i].title}</a>
					</li>
				`;
				$("#headerAlertList").append(str);
			}
		}
		
	} );
}

$("#headerAlertBtn").click(function(){
	getAlert();
})

getAlert();
</c:if>
</script>

</body>
