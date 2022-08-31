<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="com.model2.mvc.service.domain.Product"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<title>��ǰ��������</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
		//Form ��ȿ�� ����
		/* var name = document.detailForm.prodName.value;
		var detail = document.detailForm.prodDetail.value;
		var manuDate = document.detailForm.manuDate.value;
		var price = document.detailForm.price.value; */

		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();

		if (name == null || name.length < 1) {
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		//	document.detailForm.action = '/updateProduct.do';
		//	document.detailForm.action = '/product/updateProduct';
		//	document.detailForm.submit();

		$("form").attr("method", "POST").attr("action",
				"/product/updateProduct").submit();
	}

	$(function() {
		$("td.ct_btn01:contains('����')").on("click", function() {
			alert($("td.ct_btn01:contains('����')").html());
			fncUpdateProduct();
		});
	});

	$(function() {

		//$("td.ct_btn01:contains('���')").on("click", function() {
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
			<h3 class="text-info">��ǰ��������</h3>
		</div>
		
		<form class="form-horizontal">
			
			<div class="form-group">
		    	<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��<img
					src="/images/ct_icon_red.gif" width="7" height="7"
					align="absmiddle" /></label>
		    	<div class="col-sm-4">
		      		<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" placeholder="��ǰ���� �ʼ��Դϴ�">
		    		</div>
		 	 </div>
		 	 
		 	 <div class="form-group">
		    	<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������<img
					src="/images/ct_icon_red.gif" width="7" height="7"
					align="absmiddle" /></label>
		    	<div class="col-sm-4">
		      		<%-- <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }" placeholder="��ǰ�������� �ʼ��Դϴ�"> --%> 
		      		 <textarea class="form-control" id="prodDetail" rows="3" placeholder="��ǰ�������� �ʼ��Դϴ�"></textarea>
		    	</div>
		  	</div>
		  	
		  	<div class="form-group">
		    	<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������<img
					src="/images/ct_icon_red.gif" width="7" height="7"
					align="absmiddle" /></label>
		    	<div class="col-sm-4">
		      		<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="�������ڴ� �ʼ��Դϴ�" value="${product.manuDate }">
		      		<img src="../images/ct_icon_date.gif" width="15" height="15"
					onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
		    	</div>
		 	</div>
		 	
		 	<div class="form-group">
		    	<label for="price" class="col-sm-offset-1 col-sm-3 control-label">�� ��<img
					src="/images/ct_icon_red.gif" width="7" height="7"
					align="absmiddle" /></label>
		    	<div class="col-sm-4">
		      		<input type="text" class="form-control" id="price" name="price" placeholder="������ �ʼ��Դϴ�" value="${product.price }">
		    	</div>
		 	</div>
		 	
		 	<div class="form-group">
			 	<label for="price" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>	
			 	<div class="col-sm-4">	    	
		      		<input type="file" class="form-control" id="fileName" name="fileName">
		    	</div>
		 	</div>
		 	
		 	 <div class="form-group">
		  	  <div class="col-sm-offset-4  col-sm-4 text-center">
		    	<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  	<a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    	</div>
		  </div>
		</form>
		

		<%-- <input type="hidden" name="prodNo" value="${product.prodNo }" /> --%>

			
		</div>
		<!--  ȭ�鱸�� div Start //////// -->
	

</body>
</html>