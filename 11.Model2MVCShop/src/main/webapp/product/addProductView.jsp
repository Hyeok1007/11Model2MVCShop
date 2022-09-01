<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
	
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
   
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
        
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">  
  	<!--  	jQuery UI toolTip ��� JS -->
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <!-- <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }            
        
    </style>
    
<script type="text/javascript">


/*  $( function() {
    $("#datepicker").on("click", function(){
    	alert("aqeq");	
    });    
  }); */
  
  /* $(function(){
	  $("#datepicker").datepicker();
	  	console.log($.datepicker());
  }); */
  
  $( function() {
	  $("#datepicker").on("click", function(){
		  alert($.datepicker());
	  });
  });


	function fncAddProduct() {
		//Form ��ȿ�� ����
		/* 	var name = document.detailForm.prodName.value;
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
		////////////////////////////////////////////////////
		//document.detailForm.action = '/addProduct.do';
		///////////////////////////////////////////////////

		// 		document.detailForm.action = '/product/addProduct';		
		// 		document.detailForm.submit(); 

		$("form").attr("method", "POST").attr("action", "/product/addProduct")
				.submit();
	}


	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			//alert($("td.ct_btn01:contains('���')").html());
			fncAddProduct();
		});
	});

	// 	 function resetData() {
	// 		document.detailForm.reset();
	// 	} 

	$(function() {

		$("a[href='#']").bind("click", function() {
			$("form")[0].reset();
		});
	});

</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<h1 class="bg-primary text-center">�� ǰ �� ��</h1>
		
		<form class="form-horizontal">
		
			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ���� �ʼ��Դϴ�">
				</div>					
			</div>
			
			
		
			<div class="form-group">
				<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ���� �ʼ��Դϴ�">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="manuDate1" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
				<div class="col-sm-4">
				<input class="form-control" id="datepicker" name="manuDate" value="" />
				</div>			    
			</div>
			
			
			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price" placeholder="������ �ʼ��Դϴ�">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="prodRule" class="col-sm-offset-1 col-sm-3 control-label">��ǰ ī�װ�</label>
				<div class="col-sm-4">
					<select class="form-control">
  					<option>����/������</option>
  					<option>��ǰ</option>
  					<option>����/���׸���</option>
					<option>������/����/�ڵ���</option>
					<option>��Ÿ</option>
				</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="fileNamee" name="fileName">
				</div>		
			</div>
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
			</div>
		</form>	
		</div>
		
</body>
</html>