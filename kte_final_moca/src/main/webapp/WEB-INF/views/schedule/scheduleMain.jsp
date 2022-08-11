<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang='ko'>

<!-- 헤더에 제이쿼리, 부트스트랩, 우리가 개별 적용할 css를 위한 custom.css 파일까지 다 적용되어 있음 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href='${pageContext.request.contextPath}/resources/lib/fullCalendar/main.css' rel='stylesheet' />
    <script src='${pageContext.request.contextPath}/resources/lib/fullCalendar/main.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          timeZone : 'local',
          customButtons: {
        	    myCustomButton: {
        	      text: 'custom!',
        	      click: function() {
        	        alert('clicked the custom button!');
        	      }
        	    }
       	  },
       	  headerToolbar: {
       	    left: 'dayGridMonth,dayGridWeek,listDay',
       	    center: 'title',
       	    right: 'today prev,next'
       	  },
       	  locale : 'ko',
       	  themeSystem : 'bootstrap5',
	      dateClick: function(info) {
// 	       	    alert('Clicked on: ' + info.dateStr);
// 	       	    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
// 	       	    alert('Current view: ' + info.view.type);
	       	    // change the day's background color just for fun
	       	    console.log(info.dateStr);
	       	    $("#myPop #start_date").val(info.dateStr).attr("readonly", "readonly");
	       	 	$("#myPop #end_date").val(info.dateStr);
	       	    pop(info.jsEvent.pageX, info.jsEvent.pageY, $("#myPop"));
// 	       	    info.dayEl.style.backgroundColor = 'red';
	       	  },
	      googleCalendarApiKey: 'AIzaSyAGPf1yW8M9XzGKy_llS0jrWKVoVvMYdsg',
	      eventSources: [
	    		{
		          googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
		          color : '#ed6f63',
		          textColor : '#2D2926'
		       	},
		       	{
		       		events:	function(info, successCallback, failureCallback){
			       		$.get("${pageContext.request.contextPath}/schedule/api/scheduleList",{member_no:1}, function(data){
			       			successCallback(data);
			       		});
			       	}
		       	}
        	],
	      eventClick: function(info) {
	            info.jsEvent.preventDefault(); // don't let the browser navigate
	        }
       	  
       	  
        });
        var now = new Date();
        console.log(now);
        console.log(calendar.formatIso(now));
        calendar.render();
  
      });

    </script>
<section class="bg-light">
	<div class="container pt-3">
		<div class="row">
			<div class="col-2">
			<!-- 팝업 -->
            <div id="myPop" class="d-none-custom border border-secondary border-3 rounded bg-light position-absolute p-3">
              <div class="text-end row">
                <div class="col-2"></div>
                <div class="col-8">
                <p class="text-center h5 border-bottom border-dark pb-3">새 일정</p>
              </div>
                <div class="col-2"><button class="close-pop btn btn-outline-danger strong border-2"><i class="bi bi-x-lg"></i></button></div>
              </div>
                
   
              <div class="row pt-3">
                <div class="col-2">
                  <p class="h5">제목</p>
                </div>
                <div class="col-10">
                  <input type="text" id="title" class="form-control w-100">
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-2">
                  <p class="h5">상세</p>
                </div>
                <div class="col-10">
                  <input type="text" id="detail" class="form-control w-100">
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-2">
                  <p class="h5">시작</p>
                </div>
                <div class="col-5">
                  <input type="date" id="start_date" class="form-control w-100">
                </div>
                <div class="col-5">
                  <input type="time" id="start_time" class="form-control w-100" value="00:00">
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-2">
                  <p class="h5">끝</p>
                </div>
                <div class="col-5">
                  <input type="date" id="end_date" class="form-control w-100">
                </div>
                <div class="col-5">
                  <input type="time" id="end_time" class="form-control w-100" value="23:59">
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-6">
                  <label><input type="checkbox" id="allDay" class="align-middle form-check-input"> <span class="align-middle">하루 종일</span></label>
                </div>
                <div class="text-end col-3">
                  <button type="button" class="w-100 btn btn-success">등록</button>
                </div>
                <div class="text-end col-3">
                  <button type="button" class="close-pop w-100 btn btn-danger">닫기</button>
                </div>
              </div>
            </div>
            <!-- 팝업 끝 -->
			</div>
			<div class="col-8">
				<div class="row mt-5 mb-4">
					<div class="col mt-5">
<!-- 					페이지 제목 및 설명 헤더 부분(작성) -->
						<p class="text-center display-5">SCHEDULE</p>
						<p class="text-center lead">일정을 등록하고 관리하세요!</p>
					</div>
				</div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
				<div class="row mt-5">
					<div class="col">
						<hr />
<!-- 					페이지 소제목 부분(작성) -->
						<p class="lead"><i class="bi bi-chat-right-heart"></i> 내 일정</p>
					</div>
				</div>
				
<!-- 			여기서부터 본문 영역 -->
<!-- 			row클래스로 하나의 행을 생성 -->
				<div class="row">
<!-- 				row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!-- 				한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
					
					<div class="col">
						<div id="calendar"></div>
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
<script>
function pop(x, y, myPop){
	myPop.removeAttr("style");
	y -= myPop.height();
	let popW = myPop.width();
	if(x + popW >= $(window).width()){
		myPop.offset({top: y, left : x-popW});
	} else {
	  myPop.offset({top: y, left: x});
	}
	myPop.stop().fadeIn();
}

$("#allDay").change(function(){
	if(this.checked){
		$("#end_date").attr("disabled", "disabled");
		$("#end_date").val($("#start_date").val());
		$("#end_time").attr("disabled", "disabled");
		$("#end_time").val("23:59");
	} else{
		$("#end_date").removeAttr("disabled");
		$("#end_time").removeAttr("disabled");
	}
});

$(".close-pop").click(function(){
	$("#myPop").stop().fadeOut(function(){
		$("#myPop").offset({top:0, left:0});
	});
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>