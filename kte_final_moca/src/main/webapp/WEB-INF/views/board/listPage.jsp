<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html lang='ko'>
<!-- 헤더에 제이쿼리, 부트스트랩, 우리가 개별 적용할 css를 위한 custom.css 파일까지 다 적용되어 있음 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	body{margin-top:20px;
background:#eee;
}
.review-list ul li .left span {
     width: 32px;
     height: 32px;
     display: inline-block;
}
 .review-list ul li .left {
     flex: none;
     max-width: none;
     margin: 0 10px 0 0;
}
 .review-list ul li .left span img {
     border-radius: 50%;
}
 .review-list ul li .right h4 {
     font-size: 16px;
     margin: 0;
     display: flex;
}
 .review-list ul li .right h4 .gig-rating {
     display: flex;
     align-items: center;
     margin-left: 10px;
     color: #ffbf00;
}
 .review-list ul li .right h4 .gig-rating svg {
     margin: 0 4px 0 0px;
}
 .country .country-flag {
     width: 16px;
     height: 16px;
     vertical-align: text-bottom;
     margin: 0 7px 0 0px;
     border: 1px solid #fff;
     border-radius: 50px;
     box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}
 .country .country-name {
     color: #95979d;
     font-size: 13px;
     font-weight: 600;
}
 .review-list ul li {
     border-bottom: 1px solid #dadbdd;
     padding: 0 0 30px;
     margin: 0 0 30px;
}
 .review-list ul li .right {
     flex: auto;
}
 .review-list ul li .review-description {
     margin: 20px 0 0;
}
 .review-list ul li .review-description p {
     font-size: 14px;
     margin: 0;
}
 .review-list ul li .publish {
     font-size: 13px;
     color: #95979d;
}

.review-section h4 {
     font-size: 20px;
     color: #222325;
     font-weight: 700;
}
 .review-section .stars-counters tr .stars-filter.fit-button {
     padding: 6px;
     border: none;
     color: #4a73e8;
     text-align: left;
}
 .review-section .fit-progressbar-bar .fit-progressbar-background {
     position: relative;
     height: 8px;
     background: #efeff0;
     -webkit-box-flex: 1;
     -ms-flex-positive: 1;
     flex-grow: 1;
     box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
     background-color: #ffffff;
    ;
     border-radius: 999px;
}
 .review-section .stars-counters tr .star-progress-bar .progress-fill {
     background-color: #ffb33e;
}
 .review-section .fit-progressbar-bar .progress-fill {
     background: #2cdd9b;
     background-color: rgb(29, 191, 115);
     height: 100%;
     position: absolute;
     left: 0;
     z-index: 1;
     border-radius: 999px;
}
 .review-section .fit-progressbar-bar {
     display: flex;
     align-items: center;
}
 .review-section .stars-counters td {
     white-space: nowrap;
}
 .review-section .stars-counters tr .progress-bar-container {
     width: 100%;
     padding: 0 10px 0 6px;
     margin: auto;
}
 .ranking h6 {
     font-weight: 600;
     padding-bottom: 16px;
}
 .ranking li {
     display: flex;
     justify-content: space-between;
     color: #95979d;
     padding-bottom: 8px;
}
 .review-section .stars-counters td.star-num {
     color: #4a73e8;
}
 .ranking li>span {
     color: #62646a;
     white-space: nowrap;
     margin-left: 12px;
}
 .review-section {
     border-bottom: 1px solid #dadbdd;
     padding-bottom: 24px;
     margin-bottom: 34px;
     padding-top: 64px;
}
 .review-section select, .review-section .select2-container {
     width: 188px !important;
     border-radius: 3px;
}
ul, ul li {
    list-style: none;
    margin: 0px;
}
.helpful-thumbs, .helpful-thumb {
    display: flex;
    align-items: center;
    font-weight: 700;
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
						<p class="lead"><i class="bi bi-chat-right-heart" style="color : red;"></i> 공지사항</p>
					</div>
				</div>
				<div class="row justify-content-between">
					<div class="col-2">
					<select id="pageNumSelect" class="form-select form-select-sm" aria-label=".form-select-sm example"
										name="perPageNum">
									<option value="${pm.cri.perPageNum}" selected>${pm.cri.perPageNum}개씩 보기</option>
									<option value="10">10개씩 보기</option>
									<option value="15">15개씩 보기</option>
									<option value="20">20개씩 보기</option>
									</select>
									</div>
									<div class="col-2">
									<input class="form-control btn btn-primary btn-sm"  id="newBtn" type="button" value="글쓰기"/>
									
									</div>
				</div>
<!-- 			여기서부터 본문 영역 -->
<!-- 			row클래스로 하나의 행을 생성 -->

				<div class="row">
<!-- 				row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!-- 				한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
				</div>
					<div class="row">
								<table class="table text-center table-hover">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>카테고리</td>
							<td>작성자</td>
							<td>등록시간</td>
							<td>조회수</td>
						</tr>
						<c:choose>
							<c:when test="${!empty list}">
								<jsp:useBean id="n" class="java.util.Date" />
								<f:formatDate var="now" value="${n}" pattern="yyyy-MM-dd"/>
								<c:forEach var="sb" items="${list}">
									<tr>
										<td>${sb.no}</td>
										<td>
											<a href="readPage${pm.makeQuery(pm.cri.page)}&no=${sb.no}">${sb.title}</a>
										</td>
										<td>${sb.category}</td>
										<td>${sb.writer}</td>
										<td>
											<f:formatDate var="reg" pattern="yyyy-MM-dd" value="${sb.regdate}"/>
											<c:choose>
												<c:when test="${now eq reg}">
													<f:formatDate value="${sb.regdate}" pattern="HH:mm"/>
												</c:when>
												<c:otherwise>
													${reg}
												</c:otherwise>
											</c:choose>
										</td>
										<td>${sb.viewcnt}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr><td colspan="5">게시물이 존재 하지 않습니다.</td></tr>
							</c:otherwise>
						</c:choose>
					</table>
					</div>
					
					<form id="searchForm">
				<input type="hidden" value="${cafe_no}" name="cafe_no">
						<div class="col text-end">
				</div>
							<!-- grid 12개로 나눔 -->
								<div class="row justify-content-center">
							<div class="col-3">
								<select class="form-select" name="searchType">
									<option ${pm.cri.searchType == null ? 'selected' : ''} value="n">선택</option>
									<option ${pm.cri.searchType == 'category' ? 'selected' : ''} value="c">카테고리</option>
									<option ${pm.cri.searchType == 'title' ? 'selected' : ''} value="t">제목</option>
									<option ${pm.cri.searchType == 'writer' ? 'selected' : ''} value="w">작성자</option>
									<option ${pm.cri.searchType == 'ct' ? 'selected' : ''} value="ct" >카테고리 &amp; 제목</option>
									<option ${pm.cri.searchType == 'cw' ? 'selected' : ''} value="cw">카테고리 &amp; 작성자</option>
									<option ${pm.cri.searchType == 'ctw' ? 'selected' : ''} value="ctw">카테고리 &amp; 제목 &amp; 작성자</option>
								</select>
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="keyword" value="${pm.cri.keyword}"/>
								</div>
								<div class="col-1">
									<input class="btn btn-warning"  type="submit" value="검색"/>
								</div>
							</div>
						</form>
				
				<div class="row mt-3">
					<!-- 페이징 블럭 출력 -->
					<div class="col">
						<ul class="pagination justify-content-center">
							<c:if test="${pm.first}">
								<li class="page-item">
									<a class="page-link" href="listPage${pm.makeQuery(1)}">&laquo;&laquo;</a>
								</li>
							</c:if>
							<c:if test="${pm.prev}">
								<li class="page-item">
									<a class="page-link" href="listPage${pm.makeQuery(pm.startPage-1)}">&laquo;</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" 
											   end="${pm.endPage}">
								<li ${pm.cri.page == i ? 'class="page-item active"' : ''} class="page-item">
									<a class="page-link" href="listPage${pm.makeQuery(i)}">${i}</a>
									<%-- <a href="listPage?page=${i}&perPageNum=${pm.cri.perPageNum}&searchType=${pm.cri.searchType}...">${i}</a> --%>
								</li>
							</c:forEach>
							<c:if test="${pm.next}">
								<li class="page-item">
									<a class="page-link" href="listPage${pm.makeQuery(pm.endPage+1)}">&raquo;</a>
								</li>
							</c:if>
							<c:if test="${pm.last}">
								<li class="page-item">
									<a class="page-link" href="listPage${pm.makeQuery(pm.maxPage)}">&raquo;&raquo;</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
				<div>
					<!-- 검색  -->
					<!-- 한행을 표시 -->
					<div>
					</div>
				</div>
					</div>
			<div class="col-2">
				<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
				</div>
				
<!--			여기 위까지 본문 영역 -->
			</div>
			<div class="row">
	<div class="col-2"></div>
				</div>
					<div class="col-2"></div>
</section>
		</div>
<!-- end of container -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script>
	var result = '${result}';
	if(result != ''){
		alert(result);
	}
	
	// searchForm
	$("#pageNumSelect").on('change',function(){
		$("#searchForm").submit();
	});
	
	$("#newBtn").click(function(){
		location.href="register?cafe_no="+${cafe_no};		
	});
	
	/* $("#newBtn").click(function(){
		$.ajax({
			type : "POST",
			url : "register",
			dataType : "text",
			data : {
				commentAuth : auth,
				commentText : text
			},
			success : function(result){
				alert(result);
				listPage(page);
			}
		});
	}); */
</script>
</html>