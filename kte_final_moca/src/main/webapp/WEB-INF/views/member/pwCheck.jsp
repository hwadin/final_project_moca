<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang='ko'>
<style>
	table {
    margin-left:auto; 
    margin-right:auto;
    margin-top:150px;
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
						<p class="text-center display-5">CAFE</p>
						<p class="text-center lead">비밀번호 확인</p>
					</div>
				</div>
				
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
						<hr />
<!-- 					페이지 소제목 부분(작성) -->
<!-- 			여기서부터 본문 영역 -->
<!-- 			row클래스로 하나의 행을 생성 -->
<div class="row">
<!--    row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!--    한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
 <div class="col=12">
      <article>
         <form id="pwCheckForm" action="pwCheckPost" method="POST">
            <table class="table-primary">
               <tr>
                  <td>비밀번호</td>
                  <td>
                     <input type="password" name="pw" id="pw" alt="비밀번호" required/>
                     <input type="submit" class="btn btn-primary" value="확인" id="check"/> 
                  </td>
               </tr>
            </table>
         </form>
      </article>
   </div>
</div>
<!--			여기 위까지 본문 영역 -->
			</div>
			<div class="col-2">
<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
		</div>
	
<c:if test="${!empty msg}">
 <script>
 	alert('${msg}');
 </script>
</c:if>
<!-- end of container -->
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>