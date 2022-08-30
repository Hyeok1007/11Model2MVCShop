<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

  <div class="bs-example" data-example-id="simple-carousel">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox" style="width:80%; height:500px">
        <div class="item active">
          <img src="/images/uploadFiles/쇼핑몰.jpg" alt="">
        </div>
        <div class="item">
          <img src="/images/uploadFiles/쇼핑몰2.jpg" alt="Second slide">
        </div>
        <div class="item">
          <img data-src="holder.js/900x500/auto/#555:#333/text:Third slide" alt="Third slide">
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div><!-- /example -->
  

	<h3><i class="glyphicon glyphicon-star"></i>HIT 상품<i class="glyphicon glyphicon-star"></i> </h3> 
	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        <div class="row">
                
  		<div class="col-xs-6 col-md-4">  	 	
 	  	  <a href="/product/getProduct?prodNo=10000" class="thumbnail">
    	  <img src="/images/uploadFiles/AHlbAAAAtBqyWAAA.jpg" alt="...">
 	   	</a>
 	   	</div>
 	   	<div class="col-xs-6 col-md-4">
 	   <a href="/product/getProduct?prodNo=${product.prodNo}" class="thumbnail">
      <img src="/images/uploadFiles/AHlbAAAAve37LwAD.jpg" alt="...">
 	   </a>
 	   </div>
 	   <div class="col-xs-6 col-md-4">
 	   <a href="/product/getProduct?prodNo=10001" class="thumbnail">
      <img src="/images/uploadFiles/BHlbAAAAvetFNwAA.jpg" alt="...">
 	   </a>
	  </div>  
	</div>
   </div>

</body>

</html>