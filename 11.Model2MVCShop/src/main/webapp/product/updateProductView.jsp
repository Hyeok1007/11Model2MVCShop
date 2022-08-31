<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="com.model2.mvc.service.domain.Product"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<title>상품정보수정</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>

<script src="../javascript/calendar.js"></script>
<script type="text/javascript">
	function fncUpdateProduct() {
		//Form 유효성 검증
		/* var name = document.detailForm.prodName.value;
		var detail = document.detailForm.prodDetail.value;
		var manuDate = document.detailForm.manuDate.value;
		var price = document.detailForm.price.value; */

		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		//	document.detailForm.action = '/updateProduct.do';
		//	document.detailForm.action = '/product/updateProduct';
		//	document.detailForm.submit();

		$("form").attr("method", "POST").attr("action",
				"/product/updateProduct").submit();
	}

	$(function() {
		$("td.ct_btn01:contains('수정')").on("click", function() {
			alert($("td.ct_btn01:contains('수정')").html());
			fncUpdateProduct();
		});
	});

	$(function() {

		//$("td.ct_btn01:contains('취소')").on("click", function() {
		$("a[href='#']").on("click", function() {
			history.go(-1);
		});
	});
</script>
</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
		<div class="page-header text-center">
			<h3 class="text-info">상품정보수정</h3>
		</div>
		
		<form class="form-horizontal">
			
			<div class="form-group">
		    	<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명<img
					src="/images/ct_icon_red.gif" width="7" height="7"
					align="absmiddle" /></label>
		    	<div class="col-sm-4">
		      		<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" placeholder="상품명은 필수입니다">
		    		</div>
		 	 </div>
		 	 
		 	 <div class="form-group">
		    	<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보<img
					src="/images/ct_icon_red.gif" width="7" height="7"
					align="absmiddle" /></label>
		    	<div class="col-sm-4">
		      		<%-- <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }" placeholder="상품상세정보는 필수입니다"> --%> 
		      		 <textarea class="form-control" id="prodDetail" rows="3" placeholder="상품상세정보는 필수입니다"></textarea>
		    	</div>
		  	</div>
		  	
		  	<div class="form-group">
		    	<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자<img
					src="/images/ct_icon_red.gif" width="7" height="7"
					align="absmiddle" /></label>
		    	<div class="col-sm-4">
		      		<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자는 필수입니다" value="${product.manuDate }">
		      		<img src="../images/ct_icon_date.gif" width="15" height="15"
					onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
		    	</div>
		 	</div>
		 	
		 	<div class="form-group">
		    	<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가 격<img
					src="/images/ct_icon_red.gif" width="7" height="7"
					align="absmiddle" /></label>
		    	<div class="col-sm-4">
		      		<input type="text" class="form-control" id="price" name="price" placeholder="가격은 필수입니다" value="${product.price }">
		    	</div>
		 	</div>
		 	
		 	<div class="form-group">
			 	<label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>	
			 	<div class="col-sm-4">	    	
		      		<input type="file" class="form-control" id="fileName" name="fileName">
		    	</div>
		 	</div>
		 	
		 	 <div class="form-group">
		  	  <div class="col-sm-offset-4  col-sm-4 text-center">
		    	<button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  	<a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    	</div>
		  </div>
		</form>
		

		<%-- <input type="hidden" name="prodNo" value="${product.prodNo }" /> --%>

			
		</div>
		<!--  화면구성 div Start //////// -->
	

</body>
</html>