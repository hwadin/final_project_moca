<footer>
	<div class="d-flex bg-light h-100">
	
	</div>
</footer>
<script>
// 버튼 헤더 페이드 스크립트
$(function(){
	$("#btnHeader .btn").each(function(){
		$(this).on("mouseover", function(e){
			$(this).find("i").stop().fadeOut();
			$(this).find("p").stop().fadeIn();
		});
		$(this).on("mouseout", function(e){
			$(this).find("i").stop().fadeIn();
			$(this).find("p").stop().fadeOut();
		});
	});
});

// 스크롤 사이드바 페이드 스크립트
$(function(){
	if($(window).scrollTop()){
		$("#sidebar").stop().fadeIn();
	}
	$(window).scroll(function(){
		var scrollT = $(this).scrollTop();
		if(scrollT >= 300){
			$("#sidebar").stop().fadeIn();
		} else {
			$("#sidebar").stop().fadeOut();
		}
	});
});

// 각 헤더 버튼 클릭시 화면 이동 스크립트
// btnHeader.jsp 와 sidebar.jsp의 각 버튼에 data-location 속성에 각 메인 화면 경로 넣으면 됨
const contextPath = '${pageContext.request.contextPath}';
$("#btnHeader .btn").each(function(){
	$(this).on("click", function(){
		let loc = $(this).attr("data-location");
		location.href = contextPath + loc;
	});
});
// 사이드바 버튼 클릭시 화면 이동 스크립트
$("#sidebar .btn").each(function(){
	$(this).on("click", function(){
		let loc = $(this).attr("data-location");
		location.href = contextPath + loc;
	});
});

$(window).on('load',function(){
	console.log($("section").height());
	console.log($(window).height());
	if($("section").height() < $(window).height()){
		console.log("aa");
		$("section").css("min-height", $(window).height()-$("footer").height());
	}
});

$("#sideTopBtn").click(function(e){
	$('html').animate( { scrollTop : 0 }, 200, "linear" );	
});
</script>

</body>
