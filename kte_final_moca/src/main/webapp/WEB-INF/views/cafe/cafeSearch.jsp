<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <div class="wrapper mt-5">
            <div class="card-7">
 				<div class="card-body">
                    <form class="form" id="cafesearchlist" method="GET" action="${path}/cafe/api/cafeSearchList">
                        <div class="input--group input--large">
                            <label class="label">LOCATION</label>
                            <input class="input--style-1" type="text" placeholder="구를 입력하세요" id="insertlocation">
                        </div>
                        <div class="input--group input--medium">
                            <label class="label">START DATE</label>
                            <input class="input--style-1" type="text" name="startDate" placeholder="yyyy/mm/dd" id="input-start">
                        </div>
                        <div class="input--group input--medium">
                            <label class="label">END DATE</label>
                            <input class="input--style-1" type="text" name="endDate" placeholder="yyyy/mm/dd" id="input-end" >
                        </div>
                        <div class="input--group input--medium">
                            <label class="label">TIME</label>
                            <input class="input--style-1" type="text" name="time"  placeholder="  HH:mm  " id="input--time" style="width:130px">
                        </div>
                        <button data-id="false" id="submit" class="btn-submit" type="button">Search</button>
                    </form>
                </div>
            </div>
        </div>
        
        
      ----------------------------------------------------------------------------------  

<script>

   // LOCATION 카페 검색 리스트

      let addr_detail = "${cafeVO.addr_detail}";
      index =0; 

      function getcafesearchlist(){
     	
     	 let insertlocation = $("#insertlocation").val();
     		$.get("${path}/cafe/api/cafeSearchList",
     			{addr_detail:insertlocation,index:index},
     			function(data){
     			console.log("search result : " + data);
     		for(var i=0; i<data.length; i++){			
     			if(insertlocation == data[i].addr_detail){
     				var str = 
     					`<div class="col-6 mt-3">
     				<a href="${path}/cafe/cafeDetail/\${data[i].no}" style="text-decoration:none">
     				<img src="\${data[i].photo_url}" class="img-thumbnail" />
     				<strong class="title" style="font-size: 2rem; color: cadetblue;">
     				\${data[i].name}
     				</strong>
     				<div>
     				<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral; ">
     					&#9200; \${data[i].start_date} 부터 \${data[i].end_date} 까지
     				</span>
     				</div>
     				<div>
     				<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral;  ">
     				\${data[i].start_time} ~ \${data[i].end_time} 사이 할인 진행중이예요 ! &#128149;
     				 </span>
     				</div>
     				</a>
     				<div class="conUtil mt-2">
     					<span class="likeNum" title="좋아요 갯수">
     						<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">
     						\${data[i].likenum}</i>
     					</span>
     					<span class="icoScore" title="평균 평점">
     						<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;">
     						</i>4.8<i title="리뷰 갯수"></i>(367)
     					</span>
     					<span title="위치 정보">
     					\${data[i].addr_detail}</span>
     				</div>
     				<p class="txt">\${data[i].content}</p>
     				<p class="tagWrap">
     					<span class="tag">\${data[i].tag}</span>
     				 </p>
     				<span class="flagWrap">
     					<span class="flag">\${data[i].flag}</span>
     				</span>
     			</div>`;
     				cafelist.append(str);
     				}
     			}
     		});
     } 
        $("#submit").on('click',function(){ 
     	   index = 0;
     	   cafelist.empty();
     	   if($("#insertlocation").val()=="" ){
     		   getCafeList();
     		   $(this).attr("data-id", "false");
     		   return;
     	   }
     	   $(this).attr("data-id", "true");
     	   let btnid = $(this).attr("data-id");
     	   console.log(btnid);
     	   getcafesearchlist();
     	}); 

       	
     // DATE 카페 검색 리스트

      let start_date = "${cafeScheduleVO.start_date}";
     let end_date = "${cafeScheduleVO.end_date}";

     index=0;
     

      $("#submit").on('click',function(){ 

     function getcafesearchlistbydate(){
     	let input_start =$("#input-start").val();
     	let input_end = $("#input-end").val();
     	$.get("${path}/cafe/api/cafeSearchByDate",
     			{start_date:input_start,end_date:input_end,index:index},
     		function(data){
     		cafelist.empty();
     		for(var i=0; i<data.length; i++){
     		if(input_start <= data[i].start_date && input_end <= data[i].end_date){
     			console.log("data: " + JSON.stringify(data));
     			var str = 
     				`<div class="col-6 mt-3">
     			<a href="${path}/cafe/cafeDetail/\${data[i].no}" style="text-decoration:none">
     			<img src="\${data[i].photo_url}" class="img-thumbnail" />
     			<strong class="title" style="font-size: 2rem; color: cadetblue;">
     			\${data[i].name}
     			</strong>
     			<div>
     			<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral; ">
     				&#9200; \${data[i].start_date} 부터 \${data[i].end_date} 까지
     			</span>
     			</div>
     			<div>
     			<span class="dcschedule " style="font-size: 1.1rem; color: lightcoral;  ">
     			\${data[i].start_time} ~ \${data[i].end_time} 사이 할인 진행중이예요 ! &#128149;
     			 </span>
     			</div>
     			 </a>
     			<div class="conUtil mt-2">
     				<span class="likeNum" title="좋아요 갯수">
     					<i class="bi bi-heart-fill" style="font-size: 1rem; color: indianred;">
     					\${data[i].likenum}</i>
     				</span>
     				<span class="icoScore" title="평균 평점">
     					<i class="bi bi-star-fill" style="font-size: 1rem; color: gold;">
     					</i>4.8<i title="리뷰 갯수"></i>(367)
     				</span>
     				<span title="위치 정보">
     				\${data[i].addr_detail}</span>
     			</div>
     			<p class="txt">\${data[i].content}</p>
     			<p class="tagWrap">
     				<span class="tag">\${data[i].tag}</span>
     			 </p>
     			<span class="flagWrap">
     				<span class="flag">\${data[i].flag}</span>
     			</span>
     		</div>`;
     			cafelist.append(str);
     			}
     		}
     	});	
     }
     		getcafesearchlistbydate(); 
     });


 



</script>
</body>
</html>