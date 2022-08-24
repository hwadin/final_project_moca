<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8"/>
    <title></title>
    <style>
    </style>
<!-- BootStrap icon font css(<i>) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <!-- BootStrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">

    <!-- BootStrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js" ></script>
    
    <!-- validation -->
   	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
   	 
    <script>

    </script>
</head>
<body>
    <header>
        <!-- start of Navigation Bar -->
        <nav class="navbar  fixed-top navbar-expand-md navbar-light bg-light">
            <div class="container-fluid ps-5 pe-5">
              <!-- Brand Name(navbar-brand) -->
              <a class="navbar-brand" href="${path}"><p class="h3"> MoCa</p> </a>

              <!-- start of nav bar content -->
              <div class="collapse navbar-collapse">
                <!-- area of nav bar menus -->
                <ul class="navbar-nav me-auto  mb-lg-0">
                </ul>

                <!-- search bar -->
                <form class="d-flex">
                    <div class="input-group">
                        <input class="form-control " type="search" placeholder="Search" aria-label="Search">
                        <button class="input-group-text btn btn-outline-success me-3" type="submit"><i class="bi bi-search "></i></button>
                    </div>
                </form>

                <!-- icons and user -->
                <button type="button" class=" btn btn-outline-secondary btn-sm rounded-circle me-3  position-relative">
                  <i class="bi bi-bell"></i>
                  <!-- alert badge -->
                  <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle"></span>
                    <span class="visually-hidden">New alerts</span>
                </button>
                <!-- drop down 해야되는곳 -->
                <div class="dropdown">
                  	<a class="btn btn-secondary rounded-circle me-2" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                  	<i class="bi bi-person-fill "></i>
                	</a>
                	<div class="dropdown-menu" aria-labelledby="dropdownMenuLink" id="dropdown">
					    <li><a class="dropdown-item" href="#">회원정보수정</a></li>
					    <li><a class="dropdown-item" href="member/logOut">로그아웃</a></li>
					    <li><a class="dropdown-item" href="#">회원탈퇴</a></li>
					 </div>
                </div>
                <c:choose>
                	<c:when test="${!empty sessionScope.memberInfo}">
                	<label>${memberInfo.name}</label>
                	</c:when>
            		<c:otherwise>

            			<a href="${pageContext.request.contextPath}/member/logIn" class="small "><strong>Login First</strong></a>
                		

            		</c:otherwise>
            	</c:choose>
              </div>
              <!-- end of nav bar content -->
              </div>
          </nav>
          <!-- end of Navigation Bar -->
    </header>
    