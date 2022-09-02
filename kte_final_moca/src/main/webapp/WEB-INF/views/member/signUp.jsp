<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang='ko'>
<style>
   table {
   max-width:500px;
    margin-left:auto; 
    margin-right:auto;
}

/*    .profile_url{
      width:100px;
      height:100px;
      border-radius:50px;
      border:1px solid #ccc;
      margin-right:100px;
   } */
   
   .text-danger{
   display:block;
   color:red;
   font-size:14px;
   }

</style>
<!-- 헤더에 제이쿼리, 부트스트랩, 우리가 개별 적용할 css를 위한 custom.css 파일까지 다 적용되어 있음 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section class="bg-light">
   <div class="container pt-3">
      <div class="row">
         <div class="col-2"></div>
         <div class="col-8">
            <div class="row mt-5 mb-4">
               <div class="col mt-5">
<!--    페이지 제목 및 설명 헤더 부분(작성) -->
                  <p class="text-center display-5">회원가입</p>
               </div>
            </div>
<%@ include file="/WEB-INF/views/common/btnHeader.jsp" %>
            <div class="row mt-5">
               <div class="col">
                  <hr />
<!--    페이지 소제목 부분(작성) -->
               </div>
            </div>
            
<!--          여기서부터 본문 영역 -->
<!--          row클래스로 하나의 행을 생성 -->
<div class="row">
<!--    row 클래스 내부에 col-숫자 로 본문 영역의 크기를 나눌 수 있음 -->
<!--    한 행은 12칸으로 나뉘며 col-숫자에서 숫자로 몇 칸을 차지할 지 결정(반드시 합이 12가 되어야 함) -->
   <div>
      <article>
         <form id="signUpForm" action="signUpPost" method="POST" enctype="multipart/form-data">
            <table class="table">
               <tr class="border-bottom">
                  <td class="align-middle">프로필 이미지</td>
                  <td style="text-align:center">
                     <img src="${path}/resources/img/profile.jpg" id="profile_url" class="rounded-circle profile_url_big"/>
                     <br/>
                     <input type="file" id="profileImage" name="profileImage" class="form-control" accept="image/*"/>
                  </td>
               </tr>
               <tr>
                  <td class="align-middle">아이디</td>
                  <td>
                     <input type="text" name="id" id="id" alt="아이디" class="form-control" required/>
                     <div class="result"></div>
                  </td>
               </tr>
               <tr>
                  <td class="align-middle">비밀번호</td>
                  <td>
                     <input type="password" name="pw" id="pw" class="form-control" alt="비밀번호" required/>
                     <div class="result"></div>
                  </td>
               </tr>
               <tr>
                  <td class="align-middle">비밀번호확인</td>
                  <td>
                     <input type="password" name="repw" id="repw" class="form-control" alt="비밀번호확인" required/>
                     <div class="result"></div>
                  </td>
               </tr>
               <tr>
                  <td class="align-middle">이름</td>
                  <td>
                     <input type="text" name="name" id="name" class="form-control" alt="이름" required/>
                  </td>
               </tr>
               <tr>
                  <td class="align-middle">나이</td>
                  <td>
                     <input type="text" name="age" class="form-control" alt="나이" required/>
                  </td>
               </tr>
               <tr>
                  <td class="align-middle">성별</td>
                  <td>
                     남<input type="radio" name="gender" alt="성별" value="남" required checked/>
                     여<input type="radio" name="gender" alt="성별" value="여" required/>
                  </td>
               </tr>
               <tr>
               <tr>
                  <td class="align-middle">주소</td>
                  <td>
                     <div class="d-flex">
                        <input type="text" name="post" id="post" class="form-control" placeholder="우편번호"/>
                        <input type="button" class="btn btn-outline-secondary" value="주소찾기" onclick="daumPostCode();"/>
                     </div>
                     	<input type="text" name="addr" id="addr" class="form-control" placeholder="주소"/>
                      	<input type="text" name="addr_detail" id="addr_detail" class="form-control" placeholder="상세주소"/>
                  </td>
               </tr>
               <tr>
                  <th colspan="2" class=" text-center">
                     <input type="submit" class="btn btn-primary" value="회원가입" id="join"/> 
                     <input type="button" class="btn btn-success" onclick="location.href='logIn';" value="로그인"/>  
                  </th>
               </tr>
            </table>
         </form>
      </article>
   </div>
</div>
<!-- 여기 위까지 본문 영역 -->
</div>
<div class="col-2">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


   function daumPostCode(){
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
               // 예제를 참고하여 다양한 활용법을 확인해 보세요.
               
               var fullAddr = "";    // 최종 주소
               var extraAddr = ""; // 조합형 주소
               var postCode = "";   // 우편번호
               
               // 사용자가 선택한 타입이 지번인지 도로명 주소인지 확인
               if(data.userSelectedType == "R"){
                  // 도로명 주소
                  fullAddr = data.roadAddress;
                  
                  // 법정 동명
                  if(data.bname !== ''){
                     extraAddr += data.bname;
                  }
                  
                  if(data.buildingName !== ''){
                     extraAddr += extraAddr !== '' ? ', '+data.buildingName : data.buildingName;
                  }
                  
                  fullAddr += (extraAddr !== '') ? '('+extraAddr+')' : '';
               }else{
                  // 지번 주소
                  fullAddr = data.jibunAddress;
               }
               
               // 우편번호
               postCode = data.zonecode;
               
               // 입력 필드에 값 넣기
               $("#post").val(postCode);
               $("#addr").val(fullAddr);
               $("#addr_detail").focus();
           }
       }).open();
   }

   var imgTemp = $(".profile_url").attr("src");
   $("#profileImage").on("change",function(){
      var files = $(this)[0].files[0];
      if(files != null && files.type.startsWith("image/")){
         var path = window.URL.createObjectURL(files);
         $("#profile_url").attr("src",path);
      }else{
         alert("이미지를 선택해 주세요.");
      }
   });
   
   $("#id").focus();
   
   $("#signUpForm").validate({
      onkeyup : function(el){
         $(el).valid();
      },
      rules : {
         id : {
            required : true,
            email : true,
            remote : {
               type : "GET",
               url : "${path}/member/idCheck"
            }
         },
         pw : {
            required : true,
            minlength : 8,
            maxlength : 20
         },
         repw : {
            required : true,
            minlength : 8,
            maxlength : 20,
            equalTo : "#pw"
         },
         name : {
            required : true,
            rangelength : [2,6]
         }
      },
      
      messages : {
         id : {
            required : "아이디를 작성해 주세요.",
            email : "이메일 형식으로 작성해 주세요.",
            remote : "이미 존재하는 아이디 입니다."
         },
         pw : {
            required : "비밀번호를 작성해 주세요.",
            minlength : "비밀번호는 최소 8자리 입니다.",
            maxlength : "최대 20자리만 가능합니다."
         },
         repw : {
            required : "비밀번호를 작성해 주세요.",
            minlength : "비밀번호는 최소 8자리 입니다.",
            maxlength : "최대 20자리만 가능합니다.",
            equalTo : "비밀번호가 일치하지 않습니다."
         },
         name : {
            required : "이름을 입력해 주세요",
            rangelength : "2~6자 이내로 작성해주세요."
         
      }
   },
   errorClass : "text-danger",
   errorElement : "span",
   errorPlacement : function(error,element){
      if(element.prop("type") === 'checkbox'){
         element.removeClass("text-danger");
         error.insertAfter(element.parent());
      }else{
         error.insertAfter(element);
      }
   },
   debug : false,
   submitHandler : function(form){
      $(form).submit();
   }
});

      
</script>
<script>

</script>

<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
         </div>
      </div>
   </div>
<!-- end of container -->
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>