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
</script>

</body>
