<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/register.jsp</title>
<style>
	.fileDrop{
		width:100%;
		height:150px;
		border:1px solid gray;
		background-color:lightgray;
		margin:auto;
	}
</style>
</head>
<body>
	<h1>
		<a href="${pageContext.request.contextPath}">메인으로</a>
	</h1>
	<h3>REGISTER BOARD</h3>
	<form id="registerForm" action="register" method="POST">
		<input type="hidden" name="uno" value="${userInfo.uno}"/>
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					${sessionScope.userInfo.uname}
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" rows="30" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" id="saveBtn" value="등록"/>
				</th>
			</tr>
		</table>
		<div>
			<label>FILE DROP HERE</label>
			<div class="fileDrop">
				
			</div>
		</div>
		<div>
			<ul class="uploadList">
			
			</ul>
		</div>
	</form>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
// dragenter dragover , drop
	$(".fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	
	var contextPath = '${pageContext.request.contextPath}';
	
	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
		var files = e.originalEvent.dataTransfer.files;
		console.log(files);
		
		var maxSize = 10485760;
		var fileSize = 0;
		var formData = new FormData();
		
		for(var i=0; i<files.length; i++){
			fileSize += files[i].size;
			if(fileSize > maxSize){
				alert("업로드 할 수 없는 크기입니다. 10MB 이하만 가능합니다.");
				return false;
			}
			formData.append("file",files[i]);
		} // end for
		console.log("server upload 실행");
		$.ajax({
			type : "POST",
			url : contextPath+'/uploadfile',
			data : formData,
			processData : false,
			contentType : false,
			dataType : "json",
			success : function(result){
				console.log(result);
				for(var i=0; i < result.length; i++){
					var fileInfo = getFileInfo(result[i]);
					console.log(fileInfo);
					var html = "<li>";
					html += "<img src='"+fileInfo.imgSrc+"' alt='attachment' />";
					html +="<div>"
					html +="<a href='"+fileInfo.getLink+"' >"
					html += fileInfo.fileName;
					html +="</a>"
					html +="</div>";
					html +="<div>";
					html +="<a href='"+fileInfo.fullName+"' class='delBtn'>X</a>";
					html +="</div>";
					html +="</li>";
					$(".uploadList").append(html);
				}
			},
			error : function(res){
				alert(res.responseText);
			}
		}); // ajax end
	}); // drop event end

	function getFileInfo(fullName){
		var imgSrc, fileName, getLink;
		// 이미지 인지 확인
		if(fullName.indexOf("s_") >= 0){
			// 이미지 파일
			imgSrc = contextPath+"/displayFile?fileName="+fullName;
			// 다운로드 요청
			getLink = contextPath+"/displayFile?fileName="+fullName.replace("s_","");
		}else{
			// 일반 파일
			imgSrc = contextPath+"/resources/img/file.png";
			// 다운로드 요청
			getLink = contextPath+"/displayFile?fileName="+fullName;
		}
		// 업로드 원본파일 이름
		fileName = fullName.substr(fullName.lastIndexOf("_")+1);
		return {
			fileName : fileName,
			imgSrc : imgSrc,
			fullName : fullName,
			getLink : getLink
		};
	}
	
	$(".uploadList").on("click",".delBtn",function(e){
		e.preventDefault();
		var target = $(this);
		$.ajax({
			type : "POST",
			url : contextPath+"/deleteFile",
			data : {
				fileName : target.attr("href")
			},
			success : function(data){
				console.log(data);
				// closest : 가장 가까운
				target.closest("li").remove();
			}
		});
	});
	
	// 게시글 등록
	$("#saveBtn").click(function(){
		var str = "";
		var fileList = $(".uploadList .delBtn");
		$(fileList).each(function(index){
			// this == .delBtn
			var fullName = $(this).attr("href");
			str += "<input type='hidden' name='files["+index+"]' value='"+fullName+"' />";
		});
		$("#registerForm").append(str);
		$("#registerForm").submit();
	});
</script>
</body>
</html>












