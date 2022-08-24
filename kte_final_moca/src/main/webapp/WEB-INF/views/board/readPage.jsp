<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang='ko'>
<!-- 헤더에 제이쿼리, 부트스트랩, 우리가 개별 적용할 css를 위한 custom.css 파일까지 다 적용되어 있음 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	.uploadList{
		width:100%;
	}
	
	.uploadList li{
		text-align:center;
		display:inline-block;
		}
	
</style>
<!-- 토스트 에디터 CDN -->
  <script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
 <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" />
 
<script>
const Viewer = toastui.Editor;
</script>
 
<section class="bg-light">
	<div class="container pt-3">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="row mt-5 mb-4">
					<div class="col mt-5">
<!-- 					페이지 제목 및 설명 헤더 부분(작성) -->
						<p class="text-center display-5">NOTICE &amp; REVIEW</p>
						<p class="text-center lead">공지사항 &amp; 리뷰</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
				<div class="row mt-5">
					<div class="col">
						<hr />
<!-- 					페이지 소제목 부분(작성) -->
						<p class="lead"><i class="bi bi-chat-right-heart"></i> 게시판</p>
					</div>
				</div>
				
<!-- 			여기서부터 본문 영역 -->
	<!-- 게시글 정보 name : board -->

	
	<div class="row my-3">
		<span class="col-1 border-end">제목</span>
		<div class="col-11">
			<span>${board.title}</span>
		</div>
		<textarea hidden id="content"><c:out value="${board.content}" /></textarea>
	</div>
	<hr />
	<div class="row border mb-3">
    	<div class="col" id="viewer" style="min-height:500px"></div>
    </div>
	<%-- <!-- 첨부파일 -->
	<div>
		<ul class="uploadList">
			<c:if test="${!empty board.files}">
				<c:forEach var="file" items="${board.files}">
					<li data-src='${file}'>
						<c:choose>
							<c:when test="${fn:contains(file,'s_')}">
								<!-- 이미지 파일 -->
								<img src="${path}/displayFile?fileName=${file}"/>
								<div>
									<a href="${path}/displayFile?fileName=${fn:replace(file,'s_','')}">
									<!-- /2022/08/10/s_c4d14b86258445faaa9b471d61ae351f_java11vs17.PNG -->
									<!-- c4d14b86258445faaa9b471d61ae351f_java11vs17.PNG -->
									<!-- java11vs17.PNG -->
										${fn:substringAfter(fn:substringAfter(file,"s_"),'_')}
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<!-- 일반 파일 -->
								<img src="${path}/resources/img/file.png"/>
								<div>
									<a href="${path}/displayFile?fileName=${file}">
										${fn:substringAfter(file,'_')}
									</a>
								</div>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
			</c:if>
		</ul>
	</div> --%>
	
	<!-- 수정 삭제 답글 버튼 -->
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8 text-center">
<!-- 			<input type="button" id="modifyBtn" value="수정"/> -->
<!-- 			<input type="button" id="removeBtn" value="삭제"/> -->
			<button type="button" id="modifyBtn" class="btn btn-secondary" >수정</button>
			<button type="button" id="removeBtn" class="btn btn-danger" >삭제</button>
			<c:if test="${!empty memberInfo}">
				<c:if test="${memberInfo.name eq board.writer}">
					<!-- <input type="button" id="modifyBtn" value="수정"/>
					<input type="button" id="removeBtn" value="삭제"/> -->
				</c:if>
				<!-- <input type="button" id="replyBtn" value="REPLY"/> -->
			</c:if>
		</div>
		<div class="col-2  text-end">
			<a class="btn btn-warning" href="${path}/board/listPage?cafe_no=${board.cafe_no}">목록으로</a>
		</div>
	</div>
	
	<form id="readForm">
		<input type="hidden" name="no" value="${board.no}"/>
	</form>
<script>


const viewer = new Viewer({
    el: document.querySelector('#viewer'),
    viewer: true,
	height: '500px',
    initialValue: $("#content").text()
  });

	var formObj = $("#readForm");
	
	/* $("#replyBtn").click(function(){
		formObj.attr("action","replyRegister").submit();
	}); */
	
	$("#removeBtn").click(function(){
		var isDelete = confirm("게시글을 삭제하시겠습니까?");
		if(isDelete){
			var arr = [];
			$(".uploadList li").each(function(){
				var fileName = $(this).attr("data-src");
				arr.push(fileName);
			});
			console.log(arr);
			if(arr.length > 0){
				// $.post(url,parameters,callback함수)
				$.post("${path}/deleteAllFiles",
						{files : arr},
						function(result){
						alert(result);
				});
			}
			formObj.attr("action","remove");
			formObj.attr("method","POST");
			formObj.submit();
		}else{
			alert('삭제 요청이 취소되었습니다.');
		}
	});
	
	// 수정 페이지 이동
	$("#modifyBtn").click(function(){
		formObj.attr("action","modifyPage").submit();
	});
</script>
<!-- 			row클래스로 하나의 행을 생성 -->
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