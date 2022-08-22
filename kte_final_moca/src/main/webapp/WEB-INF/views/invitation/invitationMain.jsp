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
						<div class="row" style="height:500px">
							<div class="col">
								<div class="d-flex justify-content-between mb-3">
									<p class="lead"><i class="bi bi-chat-right-heart"></i> 모임 목록 </p>
									<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal" data-bs-whatever="@nInvitation">+ 새 모임</button>
								</div>
								
								
								<div id="invitationList" class="list-group">
<!-- 									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action active" aria-current="true"> -->
<!-- 									   	<div class="me-auto">초대제목1</div><span class="badge bg-danger rounded-pill">14</span> -->
<!-- 									  </button> -->
<!-- 									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action"> -->
<!-- 									  	<div class="me-auto"><span class="text-success">[참여 중] </span>초대제목2</div><span class="badge bg-danger rounded-pill">5</span> -->
<!-- 									  </button> -->
<!-- 									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action"> -->
<!-- 									  	<div class="me-auto"><span class="text-warning">[대기 중] </span>초대제목3</div><span class="badge bg-danger rounded-pill"></span> -->
<!-- 									  </button> -->
								</div>
							</div>
						</div>
						<div class="row mt-5">
							<div class="col">
								<div class="d-flex justify-content-between mb-3">
									<p class="lead"><i class="bi bi-chat-right-heart"></i> 모임 정보 </p>
									<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal" data-bs-whatever="@nMember">+ 초대하기</button>
								</div>
								<table class="table align-middle text-center table-hover">
								  <thead>
								    <tr>
								      <th scope="col">#</th>
								      <th scope="col">이름</th>
								      <th scope="col">상태</th>
								      <th scope="col">취소하기</th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <th scope="row">1</th>
								      <td>하옥형</td>
								      <td><i class="text-danger bi bi-x-lg"></i></td>
								      <td><button class="btn btn-sm btn-danger"><i class="bi bi-x"></i></button></td>
								    </tr>
								    <tr>
								      <th scope="row">2</th>
								      <td>송화진</td>
								      <td><i class="text-success bi bi-check-lg"></i></td>
								      <td><button class="btn btn-sm btn-danger"><i class="bi bi-x"></i></button></td>
								    </tr>
								    <tr>
								      <th scope="row">3</th>
								      <td>이주명</td>
								      <td><i class="text-dark bi bi-three-dots"></i></td>
								      <td><button class="btn btn-sm btn-danger"><i class="bi bi-x"></i></button></td>
								    </tr>
								  </tbody>
								</table>
							</div>
						</div>
						
					</div>
					<div class="col-6">
						<p class="lead"><i class="bi bi-chat-right-heart"></i> 채팅</p>
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
				            <p id="modalResult" class="text-end"></p>
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
			  
			  modalTitle.textContent = (recipient == "@nMember") ? "모임에 초대하기" : "새 모임 만들기";
			  modalLabel.textContent = (recipient == "@nMember") ? "추가할 회원의 아이디를 입력하세요." : "모임의 이름을 입력하세요.";
			  modalBodyInput.value = (recipient == "@nMember") ? "" : "새 모임";
			  modalBodyInput.focus();
			});
			
			$("#modalSubmitBtn").click(function(){
				console.log(recipient);
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
						}
					});
				} else {
					// 모임에 새 멤버 추가하기 ajax
				}
			});
			
			// 모임 리스트 불러오기 함수
			function getInvitationList(){
				$.get("${path}/invitation/api/listByMember/"+${sessionScope.memberInfo.no}, function(data){
	       			console.log(data);
	       			$("#invitationList").empty();
	       			for(let i =0; i<data.length; i++){
	       				let status = "";
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
						  </button>
	       				`;
	       				$("#invitationList").append(str);
	       			}
	       		});
			}
			
			getInvitationList();
			
			$("#invitationList").on("click", "button", function(){
				$("#invitationList button").each(function(){
					$(this).removeClass("active");
				});
				$(this).addClass("active");
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