
<div class="row">
	<div class="col-6">
		<a href="${path}/cafe/cafeDetail" style="text-decoration: none"> 
		<img src="https://static-file.jejupass.com/download/120160?width=500&amp;height=500"
			class="img-responsive img-thumbnail" /> 
			
			<strong	class="titDep5" style="font-size: 2rem; color: cadetblue;">투썸</strong>
		</a>
		
		<div class="conUtil">
			<span class="likeNum" title="좋아요 갯수">
				<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">23</i>
			</span>
			
			<span class="icoScore" title="평균 평점">
				<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;">4.8</i>
				<i title="리뷰 갯수">(367)</i>
			</span> 
			<span title="위치 정보">해운대구</span>
		</div>
		
		<p class="txt">
			해운대 해안도로의 오션뷰 카페. 테라스에서는 드넓은 정원과 바다 풍경이 펼쳐지고, 안에는
			편안한 소파와 빈백 좌석들이 마련되어 있어요. 다양하고 맛있는 디저트가 있지만 커피와 함께하면 더욱 맛있는 커피콩빵은
			이집만의 매력!
		</p>
		
		<p class="tagWrap">
			<span class="tag">#디저트카페</span> 
			<span class="tag">#해운대카페</span> 
			<span class="tag">#해운대오션뷰</span>
		</p>
		
		<span class="flagWrap"> 
			<span class="flag col24">기본음료_아메리카노</span>
			<span class="flag col04">음료 변경 가능_2천원 할인</span>
		</span> 
		img, 
		title, 
		likeNum, 
		score, 
		reviewCnt, 
		location, 
		overview, 
		tags, 
		item, 
		content
		
		ajax 특정 object 를 넘겨 받는데
		이 정보를 다 가진 객체였으면 좋겠다.
		
		CafeMainDto.java 
		field
		
		String imgPath;
		String title;
		Integer likeCnt;
		Integer score;
		Integer reviewCnt;
		String location;
		String overview;
		List<tag> tags;
		Item item; or String item;
		String content; 
		ajax 
 		
		
	</div>
</div>