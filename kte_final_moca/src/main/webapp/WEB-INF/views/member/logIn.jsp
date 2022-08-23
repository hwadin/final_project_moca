<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang='ko'>
<style>
	table {
    margin-left:auto; 
    margin-right:auto;
	margin-top:200px;
}
</style>
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
						<p class="text-center display-5">로그인</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
				<div class="row mt-5">
					<div class="col">
						<hr />
<!-- 					페이지 소제목 부분(작성) -->
					</div>
				</div>
			</div>
		</div>
	</div>
				
<!-- 	여기서부터 본문 영역 -->
<!-- 	row클래스로 하나의 행을 생성 -->
	<div class="row">
<!-- 	row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!-- 	한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
	<div class="col-12">
	<article>
		<form action="logInPost" method="POST">
			<table  class="text-center">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="id" id="id" required />
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pw" id="pw" required />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label>
							<input type="checkbox" name="useCookie" />
							자동 로그인
						</label>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" class="btn btn-success" value="로그인"/>
						<input type="button" class="btn btn-primary" onclick="location.href='signUpChoice';" value="회원가입"/>  
					</th>
				</tr>
			</table>
		</form>
	</article>
<div class="col-2">
<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
		</div>
	</div>
<!-- end of container -->
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>