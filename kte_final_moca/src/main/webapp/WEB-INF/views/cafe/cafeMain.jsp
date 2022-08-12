<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
						<p class="text-center display-5">CAFE</p>
						<p class="text-center lead"> 마음에 드는 카페 찾고 할인 받으세요!</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
				<div class="row mt-5">
					<div class="col">
						<hr />
<!-- 					페이지 소제목 부분(작성) -->
						<p class="lead" style="font-size: 2rem; color: ;"><i class="bi bi-chat-right-heart" style="font-size: 3rem; color: palevioletred;"></i> 카페 목록</p>
					</div>
				</div>
				
<!-- 			여기서부터 본문 영역 -->
<!-- 			row클래스로 하나의 행을 생성 -->
				<div class="row mt-2">
<!-- 				row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!-- 				한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
					<div class="col-6">
					<a href="${path}/cafe/cafeDetail" style="text-decoration:none">
						<img src="https://static-file.jejupass.com/download/120160?width=500&amp;height=500" class="img-responsive img-thumbnail" />
						<span>
						<strong class="titDep5" style="font-size: 2rem; color: cadetblue;">투썸</strong>
						</a>
						<div class="conUtil">
							<span class="likeNum" title="좋아요 갯수"><i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">23</i></span>
							<span class="icoScore" title="평균 평점"><i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i>4.8<i title="리뷰 갯수">(367)</i></span>
							<span title="위치 정보">해운대구</span>
						</div>
						<p class="txt">해운대 해안도로의 오션뷰 카페. 테라스에서는 드넓은 정원과 바다 풍경이 펼쳐지고, 안에는 편안한 소파와 빈백 좌석들이 마련되어 있어요. 다양하고 맛있는 디저트가 있지만 커피와 함께하면 더욱 맛있는 커피콩빵은 이집만의 매력! </p>
						<p class="tagWrap"><span class="tag">#디저트카페</span> <span class="tag">#해운대카페</span> <span class="tag">#해운대오션뷰</span> </p>
						<span class="flagWrap">
							<span class="flag col24">기본음료_아메리카노</span><span class="flag col04">음료 변경 가능_2천원 할인</span>
						</span>
						</span>
					</div>
					<div class="col-6">
					<a href="${path}/cafe/cafeDetail" style="text-decoration:none">
						<img src="https://static-file.jejupass.com/download/120073?width=500&amp;height=500" class="img-thumbnail" />
						<span>
						<strong class="titDep5" style="font-size: 2rem; color: cadetblue;">투썸</strong>
						</a>
						<div class="conUtil">
							<span class="likeNum" title="좋아요 갯수"><i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">23</i></span>
							<span class="icoScore" title="평균 평점"><i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i>4.8<i title="리뷰 갯수">(367)</i></span>
							<span title="위치 정보">해운대구</span>
						</div>
						<p class="txt">해운대 해안도로의 오션뷰 카페. 테라스에서는 드넓은 정원과 바다 풍경이 펼쳐지고, 안에는 편안한 소파와 빈백 좌석들이 마련되어 있어요. 다양하고 맛있는 디저트가 있지만 커피와 함께하면 더욱 맛있는 커피콩빵은 이집만의 매력! </p>
						<p class="tagWrap"><span class="tag">#디저트카페</span> <span class="tag">#해운대카페</span> <span class="tag">#해운대오션뷰</span> </p>
						<span class="flagWrap">
							<span class="flag col24">기본음료_아메리카노</span><span class="flag col04">음료 변경 가능_2천원 할인</span>
						</span>
						</span>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-6">
					<a href="${path}/cafe/cafeDetail" style="text-decoration:none">
						<img src="https://static-file.jejupass.com/download/188916?width=500&amp;height=500" class="img-thumbnail" />
						<span>
						<strong class="titDep5" style="font-size: 2rem; color: cadetblue;">투썸</strong>
						</a>
						<div class="conUtil">
							<span class="likeNum" title="좋아요 갯수"><i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">23</i></span>
							<span class="icoScore" title="평균 평점"><i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i>4.8<i title="리뷰 갯수">(367)</i></span>
							<span title="위치 정보">해운대구</span>
						</div>
						<p class="txt">해운대 해안도로의 오션뷰 카페. 테라스에서는 드넓은 정원과 바다 풍경이 펼쳐지고, 안에는 편안한 소파와 빈백 좌석들이 마련되어 있어요. 다양하고 맛있는 디저트가 있지만 커피와 함께하면 더욱 맛있는 커피콩빵은 이집만의 매력! </p>
						<p class="tagWrap"><span class="tag">#디저트카페</span> <span class="tag">#해운대카페</span> <span class="tag">#해운대오션뷰</span> </p>
						<span class="flagWrap">
							<span class="flag col24">기본음료_아메리카노</span><span class="flag col04">음료 변경 가능_2천원 할인</span>
						</span>
						</span>
					</div>
					<div class="col-6">
					<a href="${path}/cafe/cafeDetail" style="text-decoration:none">
						<img src="https://static-file.jejupass.com/download/120164?width=500&amp;height=500" class="img-thumbnail" />
						<span>
						<strong class="titDep5" style="font-size: 2rem; color: cadetblue;">투썸</strong>
						</a>
						<div class="conUtil">
							<span class="likeNum" title="좋아요 갯수"><i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">23</i></span>
							<span class="icoScore" title="평균 평점"><i class="bi bi-star-fill" style="font-size: 1rem; color: gold;"></i>4.8<i title="리뷰 갯수">(367)</i></span>
							<span title="위치 정보">해운대구</span>
						</div>
						<p class="txt">해운대 해안도로의 오션뷰 카페. 테라스에서는 드넓은 정원과 바다 풍경이 펼쳐지고, 안에는 편안한 소파와 빈백 좌석들이 마련되어 있어요. 다양하고 맛있는 디저트가 있지만 커피와 함께하면 더욱 맛있는 커피콩빵은 이집만의 매력! </p>
						<p class="tagWrap"><span class="tag">#디저트카페</span> <span class="tag">#해운대카페</span> <span class="tag">#해운대오션뷰</span> </p>
						<span class="flagWrap">
							<span class="flag col24">기본음료_아메리카노</span><span class="flag col04">음료 변경 가능_2천원 할인</span>
						</span>
						</span>
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