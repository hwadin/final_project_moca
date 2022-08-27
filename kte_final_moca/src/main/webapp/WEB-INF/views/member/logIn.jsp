<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang='ko'>
<style>
	table {
    margin-left:auto; 
    margin-right:auto;
}
</style>
<!-- 헤더에 제이쿼리, 부트스트랩, 우리가 개별 적용할 css를 위한 custom.css 파일까지 다 적용되어 있음 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section class="bg-light">
	<div class="container pt-3">
		<div class="row ">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="row mt-5 mb-4">
					<div class="col mt-5">
<!-- 					페이지 제목 및 설명 헤더 부분(작성) -->
						<p class="text-center display-5">LOGIN</p>
						<p class="text-center lead">로그인</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>

				<!-- 	여기서부터 본문 영역 -->
<!-- 	row클래스로 하나의 행을 생성 -->
				<div style="width:300px; margin-top:100px;" class="py-5 top-50 start-50 translate-middle position-absolute border-top border-secondary row mx-auto">
<!-- 	row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!-- 	한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
					<div class="col w-100" >
						<form  action="logInPost" method="POST">
							<div class="row border-bottom pb-2 mb-3" >
								<input type="text" name="id" class="px-2 form-control-plaintext" required placeholder="이메일 아이디"/></div>
							<div class="row border-bottom pb-2 mb-1" >
								<input type="password" name="pw" class="px-2 form-control-plaintext" required placeholder="비밀번호"/></div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="useCookie" name="useCookie" />
								<label class="form-check-label" for="useCookie">자동 로그인</label>
							</div>
							<div class="row mb-2 mt-5">
								<button type="submit" class="btn btn-dark w-100" id="login">LOGIN</button>
							</div>
							<div class="row">
								<button type="button" id="joinBtn" class="btn btn-outline-dark w-100">JOIN</button>
							</div>
						</form>
					</div>
					
				</div>
				
				<div id="joinChoice" style="width:300px; margin-top:265px;" class="d-none-custom top-50 start-50 translate-middle position-absolute row mx-auto">
					<div class="d-flex p-0">
						<div class="col-6 ps-0 pe-1">
							<button type="button" class=" w-100 btn btn-outline-secondary" onclick="location.href='ownerSignUp';">사업자용</button>
						</div>
						<div class="col-6 pe-0 ps-1">
							<button type="button" class="w-100 btn btn-secondary" onclick="location.href='signUp';">일반회원용</button>
						</div>
<!-- 								<input type="submit" class="btn btn-outline-warning text-dark" id="signUpbtn" onclick="location.href='ownerSignUp';" value="사업자용 회원가입"/>  -->
<!-- 								<input type="button" class="btn btn-outline-info text-dark" id="signUpbtn" onclick="location.href='signUp';" value="일반회원용 회원가입"/> -->
					</div>
				</div>
			<script>
				$("#joinBtn").click(function(){
					$("#joinChoice").fadeToggle();
				})
				
				
				
			</script>
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