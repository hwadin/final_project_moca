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
						<p class="text-center display-5">INVITATION</p>
						<p class="text-center lead">모임을 초대하고 관리해요</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
				<div class="row mt-5">
					<div class="col">
						<hr />
<!-- 					페이지 소제목 부분(작성) -->
						
					</div>
				</div>
				
<!-- 			여기서부터 본문 영역 -->
<!-- 			row클래스로 하나의 행을 생성 -->
				<div class="row">
<!-- 				row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!-- 				한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
					
					<div class="col-6">
						<div class="row" >
							<div class="col">
								<div class="d-flex justify-content-between mb-3">
									<p class="h2"><i class="bi bi-card-list"></i> 모임 목록 </p>
									<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal" data-bs-whatever="@nInvitation">+ 새 모임</button>
								</div>
								
								
								<div id="invitationList" class="list-group overflow-auto" style="max-height:400px">

								</div>
							</div>
						</div>
						<div class="row mt-5">
							<div class="col" >
								<div class="d-flex justify-content-between mb-3">
									<p class="h2"><i class="bi bi-people"></i> 모임 정보 </p>
									<button id="invParticipantBtn" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal" data-bs-whatever="@nMember">+ 초대하기</button>
								</div>
								<div id="participantListTitle" class="d-flex justify-content-between">
								
								</div>
								<div class="overflow-auto" style="max-height:300px">
								<table class="table align-middle text-center table-hover" >
								  <thead>
								    <tr>
								      <th scope="col">#</th>
								      <th scope="col">이름</th>
								      <th scope="col">상태</th>
								      <th scope="col">취소하기</th>
								    </tr>
								  </thead>
								  <tbody  id="participantList" >

								  </tbody>
								</table>
								</div>
								<div id="participantListFooter" class="d-flex justify-content-end">
								
								</div>
							</div>
						</div>
						
					</div>
					<div class="col-6">
						<p class="h2"><i class="bi bi-chat-dots"></i> 채팅</p>
						<div id="chatContainer">
							<div id="chatContentBox" class="overflow-auto border border-4 p-3 mt-4 mb-2" style="height:600px;">
								<div class="alert alert-warning text-break">
									선택된 모임이 없습니다.
								</div>
							</div>
							<div id="chatInputBox" class="border border-4 d-flex justify-content-between">
								<form>
									<textarea id="chatContent" disabled class="form-control" rows="2" cols="30" style="resize:none;" placeholder="메시지를 입력하세요"></textarea>
								</form>
								<button id="chatSubmitBtn" type="button" class="w-25 mb-0 p-0 btn btn-outline-warning border-warning border-2">전송</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form>
				          <div class="">
				          	<label for="recipient-name" class="col-form-label"></label>
				            <input type="text" id="modalValue" class="form-control" id="recipient-name">
				            <p id="modalResult" class="my-auto pt-2 text-end text-danger align-middle"></p>
				            <div id="modalAlert" class="alert" role="alert"></div>
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" id="modalCloseBtn" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				        <button type="button" id="modalSubmitBtn" class="btn btn-primary">등록</button>
				      </div>
				    </div>
				  </div>
				</div>
<!--			여기 위까지 본문 영역 -->
			</div>
			<script>
			let selectedInvNo = "";
			let selectedInvMemNo = "";
			let selectedInvName = "";
			let selectedInvCode = "";
			let selectedInvTitle = "";
			let loginMemberNo = ${sessionScope.memberInfo.no};
			
			var sock;
			
			function sendMessage() {
				let msg = {
						invite_code : selectedInvCode,
						member_no : loginMemberNo,
						message : $("#chatContent").val() 
				};
				
				sock.send(JSON.stringify(msg));
				$("#chatContent").val("");
			}
			
			function onMessage(msg) {
				var data = JSON.parse(msg.data);
				
				let str = ``;
				if(data.member_no == loginMemberNo){
					str = `
						<div class="alert alert-light text-end text-break">
							<strong>\${data.name}</strong>
							<p class="m-0">\${data.message}</p>
						</div>
					`; 
				} else {
					str = `
						<div class="alert alert-warning text-break">
							<strong>\${data.name}</strong>
							<p class="m-0">\${data.message}</p>
						</div>
					`; 
				}
				$("#chatContentBox").append(str);
				let scrollPoint = $("#chatContentBox").scrollTop() + $("#chatContentBox").children().last().offset().top;
				$("#chatContentBox").animate({scrollTop : scrollPoint },200);
				
			}
			
			function onClose(evt) {

				console.log("연결 종료");
			}
			function onOpen(evt) {
				
				let msg = {
						no : 0,
						invite_code : selectedInvCode,
						member_no : loginMemberNo,
						message : "OPENMESSAGE"
				};
				
				sock.send(JSON.stringify(msg));
				
				console.log("연결됨");
			}
			
// 				modal control
			var modal = document.getElementById('modal');
			var recipient;
			modal.addEventListener('show.bs.modal', function (event) {
			  // Button that triggered the modal
			  var button = event.relatedTarget;
			  // Extract info from data-bs-* attributes
			  recipient = button.getAttribute('data-bs-whatever');
			  // If necessary, you could initiate an AJAX request here
			  // and then do the updating in a callback.
			  //
			  // Update the modal's content.
			  var modalTitle = modal.querySelector('.modal-title');
			  var modalBodyInput = modal.querySelector('.modal-body input');
			  var modalLabel = modal.querySelector('.modal-body .col-form-label');
			  $("#modalAlert").removeClass("alert-success");
			  $("#modalAlert").removeClass("alert-danger");
			  $("#modalAlert").text("");
			  modalTitle.textContent = (recipient == "@nMember") ? "모임에 초대하기" : "새 모임 만들기";
			  modalLabel.textContent = (recipient == "@nMember") ? "추가할 회원의 아이디를 입력하세요." : "모임의 이름을 입력하세요.";
			  modalBodyInput.value = (recipient == "@nMember") ? "" : "새 모임";
			  modalBodyInput.focus();
			});
			
			$("#modalSubmitBtn").click(function(){
				if(recipient == "@nInvitation"){
					// 새 모임 만들기 ajax
					let title = $("#modalValue").val();
					let member_no = ${sessionScope.memberInfo.no};
					$.ajax({
						url : "${path}/invitation/api/",
						method : "POST",
						data : {
							member_no : member_no,
							title : title
						},
						dataType: "text",
						success : function(result){
							$("#modalCloseBtn").trigger("click");
							getInvitationList();
							getSearchBarInvitationList()
						}
					});
				} else {
					// 모임에 새 멤버 추가하기 ajax
					let id = $("#modalValue").val();
// 					대상에게 알림 전송
					
					if(selectedInvNo == ""){
						$("#modalAlert").removeClass("alert-success");
						$("#modalAlert").addClass("alert-danger");
						$("#modalAlert").text("모임을 먼저 선택하세요!");
						return;
					}
// 					$.post("${path}/invitation/api/sendInvite/", {no : selectedInvNo, id : id},"text", function(data){
// 						console.log(data);
// 					});
					$.ajax({
						url : "${path}/invitation/api/sendInvite/",
						method : "POST",
						data : {no : selectedInvNo, id : id},
						dataType: "text",
						success : function(result){
							if(result == ""){
								$("#modalAlert").removeClass("alert-success");
								$("#modalAlert").addClass("alert-danger");
								$("#modalAlert").text("존재하지 않는 아이디입니다.");
								return;
							}
							if(result == "DUPLICATED"){
								$("#modalAlert").removeClass("alert-success");
								$("#modalAlert").addClass("alert-danger");
								$("#modalAlert").text("이미 초대한 회원입니다.");
								return;
							}
							if(result == "FORBIDDEN"){
								$("#modalAlert").removeClass("alert-success");
								$("#modalAlert").addClass("alert-danger");
								$("#modalAlert").text("초대 권한이 없습니다.");
								return;
							}
							if(result == "SELFINVITED"){
								$("#modalAlert").removeClass("alert-success");
								$("#modalAlert").addClass("alert-danger");
								$("#modalAlert").text("자신을 초대할 수 없습니다.");
								return;
							}
							$("#modalAlert").removeClass("alert-danger");
							$("#modalAlert").addClass("alert-success");
							$("#modalAlert").text(result + " 님을 초대했습니다.");
							getParticipantList(selectedInvNo, selectedInvMemNo, selectedInvName);
							sendAlert(id);
						}
					});
				}
			});
			
			
			
			// 모임 리스트 불러오기 함수
			function getInvitationList(){
				$.get("${path}/invitation/api/listByMember/"+${sessionScope.memberInfo.no}, function(data){
// 	       			console.log(data);
					// 모임 목록 초기화(비우기)
	       			$("#invitationList").empty();
					
					// 모임 목록 그리기
	       			for(let i =0; i<data.length; i++){
	       				let status = "";
	       				
	       				// 모임 만든 사람 회원 번호와 로그인한 사용자의 회원 번호가 일치하지 않을 때
	       				// = 내가 만든 모임이 아닐 때
	       				// 수락 상태에 따라 참여 중 대기 중으로 표시, 거절하면 표시하지 않음
	       				if(data[i].member_no != ${sessionScope.memberInfo.no}){
	       					if(data[i].isAccepted == true || data[i].isAccepted == 1){ 
	       						status = `<span class="text-success">[참여 중] </span>`;	
	       					} else if (data[i].isAccepted == null){
	       						status = `<span class="text-warning">[대기 중] </span>`;
	       					} else {
	       						continue;
	       					}
	       				} 
	       				
	       				let str = `	       			
	       					<button type="button" class="d-flex justify-content-between list-group-item list-group-item-action" data-bs-toggle="button">
							   	<div class="me-auto">\${status} \${data[i].title}</div><span class="badge bg-danger rounded-pill"></span>
							   	<input type="hidden" id="input_code" name="code" value="\${data[i].code}" />
							   	<input type="hidden" id="input_no" name="no" value="\${data[i].no}" />
							   	<input type="hidden" id="input_member" name="member_no" value="\${data[i].member_no}" />
							   	<input type="hidden" id="input_name" name="name" value="\${data[i].name}" />
							</button>
	       				`;
	       				$("#invitationList").append(str);
	       			}
	       		});
			}
			
			// 최초 모임 목록 불러오기
			getInvitationList();
			
			function getParticipantList(no, member_no, name){
				// 모임 번호로 코드를 조회해서 tbl_invite_participant 테이블에서 해당 코드 데이터 불러오는 ajax
				$.get("${path}/invitation/api/listByCode/"+no, function(data){
// 					console.log(data);
					// 상세 정보 목록 초기화(비우기)
					$("#participantList").empty();
					$("#participantListTitle").empty();
					$("#participantListFooter").empty();
					// 초대를 아무도 안했을 때
					if(data.length == 0){
						let str = `
							<tr>
						      <th scope="row"></th>
						      <td colspan="3">초대 명단이 없습니다.</td>
						    </tr>
						`;							
						$("#participantList").append(str);
					}
					
					let delBtn = "";
					// 초대한 사람과 로그인한 사람이 다를 때(남이 보낸 초대)
					if(loginMemberNo != member_no){
						$("#invParticipantBtn").addClass("d-none-custom");
						let btns = `
							<button id="inviteAcceptBtn" class="btn btn-sm btn-success">수락</button>
						      <button id="inviteCancelBtn" class="btn btn-sm btn-danger">거절</button>
						`;
						for(let i=0; i<data.length; i++){
							if(data[i].participant_no == loginMemberNo){
								if(data[i].isAccepted == true || data[i].isAccepted == 1 ){
									btns = `
										<button id="inviteCancelBtn" class="btn btn-sm btn-danger">거절</button>
									`;
								}
							}
						}
						let str = `
							<span class="text-truncate">\${selectedInvTitle} - \${name}님의 초대</span><div class="text-end" style="min-width:86px;">\${btns}</div>
						`;							
						$("#participantListTitle").append(str);
					} else {
						$("#invParticipantBtn").removeClass("d-none-custom");
       					delBtn = `<button id="inviteDelBtn" class="ms-3 btn btn-outline-danger align-middle">모임 삭제
       								<input type="hidden" value="\${no}" />
       							</button>`;
       					let str = `
							<span class="text-truncate">\${selectedInvTitle}</span>
							<div class="text-end" style="min-width:86px;">
								<button id="inviteModifyBtn" class="btn btn-sm btn-warning">수정</button>
							</div>
						`;							
						$("#participantListTitle").append(str);
       				}
					
					let status = ``;
					let cancelBtn = ``;
					
					// 초대 받은 사람들 목록 출력
					for(let i=0; i<data.length; i++){
						if(data[i].isAccepted == null){
							status = `<i class="text-dark bi bi-three-dots"></i>`;
						} else if (data[i].isAccepted == true || data[i].isAccepted == 1 ){
							status = `<i class="text-success bi bi-check-lg"></i>`;
						} else if (data[i].isAccepted == false || data[i].isAccepted == 0 ){
							status = `<i class="text-danger bi bi-x-lg"></i>`;
						}
						
						// 내가 보낸 초대일 때는 취소 버튼 만들기, 아니면 없음
						if(loginMemberNo == member_no){
							cancelBtn = `<button class="master-cancel-btn btn btn-sm btn-danger">
											<i class="bi bi-x"></i>
											<input type="hidden" value="\${data[i].no}"/>
										</button>`;
						} else {
							cancelBtn = ``;
						}
						
						let str = `
							<tr>
						      <th scope="row">\${i+1}</th>
						      <td>\${data[i].name}</td>
						      <td>\${status}</td>
						      <td>\${cancelBtn}</td>
						    </tr>
						`;							
						$("#participantList").append(str);
					}
					
					if(delBtn != ""){
						let str = `
							\${delBtn}
						`;							
						$("#participantListFooter").append(str);
					}
					
				});
			}
			
			
			// 채팅창 불러오기
			function getChatter(no){
				$("#chatContentBox").empty();
				
				// 모임번호 no로 해당 채팅방의 채팅 내용 불러오는 ajax
				$.get("${path}/invitation/api/chat/"+no, function(data){
					if(typeof sock != "undefined"){
						sock.close();
					}
					for(let i=0; i<data.length; i++){
						let str = ``;
						if(data[i].member_no == loginMemberNo){
							str = `
								<div class="alert alert-light text-end text-break">
									<strong>\${data[i].name}</strong>
									<p class="m-0">\${data[i].message}</p>
								</div>
							`; 
						} else {
							str = `
								<div class="alert alert-warning text-break">
									<strong>\${data[i].name}</strong>
									<p class="m-0">\${data[i].message}</p>
								</div>
							`; 
						}
						$("#chatContentBox").append(str);
						
					}
					if(typeof data == "string" && data=="" ){
						$("#chatInputBox textarea").attr("disabled", "disabled");
					} else {
						$("#chatInputBox textarea").removeAttr("disabled");
						
					}
					
					if($("#chatContentBox").children().length>0){
						let scrollPoint = $("#chatContentBox").scrollTop() + $("#chatContentBox").children().last().offset().top;
						$("#chatContentBox").animate({scrollTop : scrollPoint },0);
					}
					
					sock = new SockJS('${path}/chat');
					sock.onmessage = onMessage;
					sock.onclose = onClose;
					sock.onopen = onOpen;
					
				});
			}
			
			
			// 모임 목록 클릭했을 때 하단에 모임 정보 출력
			$("#invitationList").on("click", "button", function(){
				// 클릭한 모임만 액티브 설정
				$("#invitationList button").each(function(){
					$(this).removeClass("active");
				});
				$(this).addClass("active");
				
// 				console.log($(this).find("input").val());
				// 필요한 변수값 가져오기
				var no = $(this).find("#input_no").val();	// 모임 번호
				var member_no = $(this).find("#input_member").val();	// 모임 만든 사람 회원 번호
				var name = $(this).find("#input_name").val();	// 모임 만든 사람 이름
				var title = $(this).find("div").text();
				var code = $(this).find("#input_code").val();
				selectedInvNo = no;
				selectedInvMemNo = member_no;
				selectedInvName = name;
				selectedInvTitle = title;
				selectedInvCode = code;
				getParticipantList(no, member_no, name);
				getChatter(no);
			});
			
			
			// 상세 목록에서 취소하기 버튼 눌렀을 때 삭제하는 이벤트
			$("#participantList").on("click", "button", function(){
				// tbl_invite_participant에서 no값으로 삭제하는 ajax 처리
				let confirmResult = confirm("정말로 취소하시겠습니까?");
				if(confirmResult){
					let no = $(this).find("input").val();
					$.ajax({
						url: "${path}/invitation/api/participant/"+no,
						method : "DELETE",
						dataType : "text",
						success : function(){
							getParticipantList(selectedInvNo, selectedInvMemNo, selectedInvName);
						}
					});
				}
			});
			
			// 초대 받은 모임에서 수락, 거절 이벤트
			$("#participantListTitle").on("click","button", function(){
				let url = "";
				let id = $(this).attr("id");
				if(id == "inviteCancelBtn"){
					url = "${path}/invitation/api/participant/cancel";
					let confirmResult = confirm("정말로 거절하시겠습니까? 거절 시 상대방이 다시 초대해야 합니다.");
					if(!confirmResult){
						return;
					}
				} else if(id == "inviteAcceptBtn"){
					url = "${path}/invitation/api/participant/accept";
				} else if(id == "inviteModifyBtn"){
					let title = $("#participantListTitle").find("span").text();
					modifyTitle(title);
					return;
				} else if(id == "inviteModifyAcceptBtn"){
					url = "${path}/invitation/api/invitation";
					let title = $("#participantListTitle").find("input").val();
					$.ajax({
						url : url,
						method : "PATCH",
						data : {
							no : selectedInvNo,
							title : title
						},
						dataType: "text",
						success : function(result){
							getInvitationList();
							$("#participantList").empty();
							$("#participantListTitle").empty();
							$("#participantListFooter").empty();
						}
					});
					return;
				} else if(id == "inviteModifyCancelBtn"){
					getParticipantList(selectedInvNo, selectedInvMemNo, selectedInvName);
					return;
				}
				$.ajax({
					url : url,
					method : "PATCH",
					data : {
						inv_no : selectedInvNo,
						participant_no : loginMemberNo
					},
					dataType: "text",
					success : function(result){
						getInvitationList();
						$("#participantList").empty();
						$("#participantListTitle").empty();
						getAlert();
					}
				});
			});
			
			function modifyTitle(title){
				$("#participantListTitle").empty();
				let btns = `
					<button id="inviteModifyAcceptBtn" class="btn btn-sm btn-warning">확인</button>
				    <button id="inviteModifyCancelBtn" class="btn btn-sm btn-danger">취소</button>
				`;
				let str = `
					<input class="form-control me-3" type="text" value="\${title}" />
					<div class="text-end" style="min-width:86px;">\${btns}</div>
					`;
				$("#participantListTitle").append(str);
			}
// 			$("#inviteCancelBtn").click(function(){
// 				$.ajax({
// 					url : "${path}/invitation/api/participant/cancel",
// 					method : "PATCH",
// 					data : {
// 						inv_no : selectedInvNo,
// 						participant_no : loginMemberNo
// 					},
// 					dataType: "text",
// 					success : function(result){
// 						getInvitationList();
// 						$("#participantList").empty();
// 					}
// 				});
// 			});

			// 모임 삭제 이벤트 
			$("#participantListFooter").on("click", "button", function(){
				let confirmResult = confirm("정말로 삭제하시겠습니까?");
				if(confirmResult){
					let no = $(this).find("input").val();
					$.ajax({
						url: "${path}/invitation/api/invitation/"+no,
						method : "DELETE",
						dataType : "text",
						success : function(){
							getInvitationList();
							$("#participantList").empty();
							$("#participantListTitle").empty();
							$("#participantListFooter").empty();
						}
					});
				}
			});
			
			$("#chatSubmitBtn").click(function(){
				sendMessage();
			});
			
			$("#chatInputBox").on("keyup",function(key){
				if(key.keyCode == 13){
					sendMessage();
				}
			});
			</script>
			<div class="col-2">
<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
		</div>
	</div>
<!-- end of container -->
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>