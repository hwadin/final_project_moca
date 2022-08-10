<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
	<div>
		<div>
			<div>
				<div>
					<h3>SEARCH LIST PAGE - ${pm.totalCount}</h3>
					<div>
						<a href="${pageContext.request.contextPath}">HOME</a>
						<a href="<c:url value='/'/>">HOME</a>
					</div>
				</div>
				<div>
					<!-- 검색  -->
					<!-- 한행을 표시 -->
					<div>
						<form id="searchForm">
							<!-- grid 12개로 나눔 -->
							<div class="col-md-3">
								<select name="searchType">
									<option ${pm.cri.searchType == null ? 'selected' : ''} value="n">----------------</option>
									<option ${pm.cri.searchType == 'title' ? 'selected' : ''} value="title">TITLE</option>
									<option ${pm.cri.searchType == 'content' ? 'selected' : ''} value="content">CONTENT</option>
									<option ${pm.cri.searchType == 'writer' ? 'selected' : ''} value="writer">WRITER</option>
									<option ${pm.cri.searchType == 'tc' ? 'selected' : ''} value="tc" >TITLE &amp; CONTENT</option>
									<option ${pm.cri.searchType == 'cw' ? 'selected' : ''} value="cw">CONTENT &amp; WRITER</option>
									<option ${pm.cri.searchType == 'tcw' ? 'selected' : ''} value="tcw">TITLE &amp; CONTENT &amp; WRITER</option>
								</select>
							</div>
							<div>
								<input type="text" name="keyword" value="${pm.cri.keyword}"/>
							</div>
							<div>
								<div>
									<input type="submit" value="SEARCH"/>
								</div>
								<div>
									<input id="newBtn" type="button" value="NEW"/>
								</div>
							</div>
							<div>
								<select id="pageNumSelect" 
										name="perPageNum">
									<option value="${pm.cri.perPageNum}">${pm.cri.perPageNum}개씩 보기</option>
									<option value="10">10개씩 보기</option>
									<option value="15">15개씩 보기</option>
									<option value="20">20개씩 보기</option>
								</select>
							</div>
						</form>
					</div>
				</div>
				<div class="box-body">
					<!-- 게시글 목록 출력 -->
					<table>
						<tr>
							<td>BNO</td>
							<td>TITLE</td>
							<td>WRITER</td>
							<td>REGDATE</td>
							<td>VIEWCNT</td>
						</tr>
						<c:choose>
							<c:when test="${!empty list}">
								<jsp:useBean id="n" class="java.util.Date" />
								<f:formatDate var="now" value="${n}" pattern="yyyy-MM-dd"/>
								<c:forEach var="sb" items="${list}">
									<tr>
										<td>${sb.bno}</td>
										<td>
											<a href="readPage${pm.makeQuery(pm.cri.page)}&bno=${sb.bno}">${sb.title}</a>
										</td>
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
				<div class="box-footer">
					<!-- 페이징 블럭 출력 -->
					<div>
						<ul>
							<c:if test="${pm.first}">
								<li>
									<a href="listPage${pm.makeQuery(1)}">&laquo;&laquo;</a>
								</li>
							</c:if>
							<c:if test="${pm.prev}">
								<li>
									<a href="listPage${pm.makeQuery(pm.startPage-1)}">&laquo;</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" 
											   end="${pm.endPage}">
								<li ${pm.cri.page == i ? 'class=active' : ''}>
									<a href="listPage${pm.makeQuery(i)}">${i}</a>
									<%-- <a href="listPage?page=${i}&perPageNum=${pm.cri.perPageNum}&searchType=${pm.cri.searchType}...">${i}</a> --%>
								</li>
							</c:forEach>
							<c:if test="${pm.next}">
								<li>
									<a href="listPage${pm.makeQuery(pm.endPage+1)}">&raquo;</a>
								</li>
							</c:if>
							<c:if test="${pm.last}">
								<li>
									<a href="listPage${pm.makeQuery(pm.maxPage)}">&raquo;&raquo;</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
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







