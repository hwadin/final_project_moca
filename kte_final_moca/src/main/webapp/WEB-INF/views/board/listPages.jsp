<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
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
				
<!-- 			여기서부터 본문 영역 -->
<!-- 			row클래스로 하나의 행을 생성 -->

				<div class="row">
<!-- 				row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!-- 				한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
						<div class="col text-end">
		<a href="${pageContext.request.contextPath}">메인으로</a>
						<select id="pageNumSelect" 
										name="perPageNum">
									<option value="${pm.cri.perPageNum}">${pm.cri.perPageNum}개씩 보기</option>
									<option value="10">10개씩 보기</option>
									<option value="15">15개씩 보기</option>
									<option value="20">20개씩 보기</option>
								</select>
				</div>
				</div>
					<div class="row">
								<table class="table">
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
											<a href="readPage${pm.makeQuery(pm.cri.page)}&bno=${sb.no}">${sb.title}</a>
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
				
				<div class="row">
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
						<form id="searchForm">
							<!-- grid 12개로 나눔 -->
							<div class="col-md-8">
								<select name="searchType">
									<option ${pm.cri.searchType == null ? 'selected' : ''} value="n">----------------</option>
									<option ${pm.cri.searchType == 'title' ? 'selected' : ''} value="title">제목</option>
									<option ${pm.cri.searchType == 'content' ? 'selected' : ''} value="content">내용</option>
									<option ${pm.cri.searchType == 'writer' ? 'selected' : ''} value="writer">작성자</option>
									<option ${pm.cri.searchType == 'tc' ? 'selected' : ''} value="tc" >제목 &amp; 내용</option>
									<option ${pm.cri.searchType == 'cw' ? 'selected' : ''} value="cw">CONTENT &amp; 작성자</option>
									<option ${pm.cri.searchType == 'tcw' ? 'selected' : ''} value="tcw">제목 &amp; 내용 &amp; 작성자</option>
								</select>
									<input type="text" name="keyword" value="${pm.cri.keyword}"/>
									<input type="submit" value="검색"/>
									<input id="newBtn" type="button" value="글쓰기"/>
							</div>
						</form>
					</div>
				</div>
					</div>
				</div>
				
<!--			여기 위까지 본문 영역 -->
			</div>
			<div class="col-2">
<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			</div>
			<div class="row">
	<div class="col-2"></div>
					<div class="col-8">
						<hr />
<!-- 					페이지 소제목 부분(작성) -->
						<p class="lead"><i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i> 리뷰</p>
					</div>
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
		location.href = "register";
	});
</script>
</html>