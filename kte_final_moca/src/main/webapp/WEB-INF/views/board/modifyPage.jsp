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
	.fileDrop{
		width:100%;
		height:150px;
		border:1px solid gray;
		background-color:lightgray;
	}

	.uploadList{
		width:100%;
	}
	
	.uploadList li{
		text-align:center;
		display:inline-block;
		padding:20px;
		list-style:none;
	}
</style>
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
						<p class="lead"><i class="bi bi-chat-right-heart"></i> 카페 목록</p>
					</div>
				</div>
				
<!-- 			여기서부터 본문 영역 -->
<!-- 			row클래스로 하나의 행을 생성 -->
				<h2>
	</h2>
	<form id="modifyForm" action="modifyPage" method="POST">
		<%-- <input type="hidden" name="no" value="${memberInfo.no}"/> --%>
		<input type="hidden" name="no" value="${board.no}" />
		<div class="row justify-content-center">
		<div class="col-10">
		<table class="table text-center">
			<tr>
				<td class="align-middle">제목</td>
				<td><input  class="form-control" type="text" name="title" value="${board.title}" required/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					${sessionScope.memberInfo.name}
				</td>
			</tr>
			<tr>
				<td class="align-middle">내용</td>
				<td>
					<textarea class="form-control" name="content" rows="20" cols="50">${board.content}</textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" id="saveBtn" value="등록" class="btn btn-primary"/>
				</th>
			</tr>
		</table>
		</div>
	</div>
	<div class="row text-end">
		<a href="${path}/board/readPage">목록</a>
	</div>
	<hr/>
		<%-- <div>
			<label>FILE DROP HERE</label>
			<div class="fileDrop">
				
			</div>
		</div>
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
							&nbsp;&nbsp;
							<a href="${file}" class="delBtn">[삭제]</a>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>--%>
	</form>
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
	$(".fileDrop").on("dragenter dragover",function(e){
		e.preventDefault();
	});
	$(".fileDrop").on("drop",function(e){
		e.preventDefault();
		var files = e.originalEvent.dataTransfer.files;
		var formData = new FormData();
		for(var i = 0; i < files.length; i++){
			formData.append("file",files[i]);
		}
		
		$.ajax({
			type : "POST",
			url : "${path}/uploadfile",
			data : formData,
			processData : false,
			contentType : false,
			dataType : "json",
			success : function(data){
				$(data).each(function(){
					console.log(this);
					var fileInfo = getFileInfo(this);
					var html = "<li>";
					html += "<img src='"+fileInfo.imgSrc+"' alt='upload image'>";
					html += "<div>";
					html += "<a href='"+fileInfo.getLink+"'>";
					html += fileInfo.fileName;
					html += "</a>&nbsp;&nbsp;";
					html += "<a href='"+this+"' class='delBtn'>[삭제]</a>"
					html += "</div>";
					html += "</li>";
					$(".uploadList").append(html);
				});
			}
		});
	});
	
	var arr = [];
	$(".uploadList").on("click",".delBtn",function(e){
		e.preventDefault();
		var fileLink = $(this).attr("href");
		arr.push(fileLink);
		$(this).closest("li").remove();
		console.log(arr);
	});
	
	$("#saveBtn").click(function(){
		/* var str = "";
		$(".uploadList .delBtn").each(function(index){
			var fullName = $(this).attr("href");
			str += "<input type='hidden' name='files["+index+"]' value='"+fullName+"' />";
		});
		$("#modifyForm").append(str);
		
		$.post(
			contextPath+"/deleteAllFiles",
			{files : arr},
			function(result){
				alert(result);
		}); */
		$("#modifyForm").submit();
	});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>