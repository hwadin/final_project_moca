<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
									<button class="btn btn-success">+ 새 모임</button>
								</div>
								
								
								<div class="list-group">
									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action active" aria-current="true">
									   	<div class="me-auto">초대제목1</div><span class="badge bg-danger rounded-pill">14</span>
									  </button>
									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action">
									  	<div class="me-auto"><span class="text-success">[참여 중] </span>초대제목2</div><span class="badge bg-danger rounded-pill">5</span>
									  </button>
									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action">
									  	<div class="me-auto"><span class="text-warning">[대기 중] </span>초대제목3</div><span class="badge bg-danger rounded-pill"></span>
									  </button>
									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action">
									  	<div class="me-auto">초대제목4</div><span class="badge bg-danger rounded-pill">9</span>
									  </button>
									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action">
									  	<div class="me-auto">초대제목4</div><span class="badge bg-danger rounded-pill">9</span>
									  </button>
									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action">
									  	<div class="me-auto">초대제목4</div><span class="badge bg-danger rounded-pill">9</span>
									  </button>
									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action">
									  	<div class="me-auto">초대제목4</div><span class="badge bg-danger rounded-pill">9</span>
									  </button>
									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action">
									  	<div class="me-auto">초대제목4</div><span class="badge bg-danger rounded-pill">9</span>
									  </button>
									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action">
									  	<div class="me-auto">초대제목4</div><span class="badge bg-danger rounded-pill">9</span>
									  </button>
									  <button type="button" class="d-flex justify-content-between list-group-item list-group-item-action">
									  	<div class="me-auto">초대제목4</div><span class="badge bg-danger rounded-pill">9</span>
									  </button>
								</div>
							</div>
						</div>
						<div class="row mt-5">
							<div class="col">
								<div class="d-flex justify-content-between mb-3">
									<p class="lead"><i class="bi bi-chat-right-heart"></i> 모임 정보 </p>
									<button class="btn btn-success">+ 초대하기</button>
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
<!--			여기 위까지 본문 영역 -->
			</div>
			<div class="col-2">
<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
		</div>
	</div>
<!-- end of container -->
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>