<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
<title>��ǰ �����ȸ</title>

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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
	<script type="text/javascript">

	function fncGetProductList(currentPage) {		
		$("#currentPage").val(currentPage)		
		$("form").attr("method","POST").attr("action","/product/listProduct?menu=${param.menu}").submit();		
	}
	
	$(function() {
		//$( "td.ct_btn01:contains('�˻�')").on("click", function(){
			$( "button.btn.btn-default").on("click", function(){
			fncGetProductList(1);
		});
	/* 	 $( ".ct_list_pop td:nth-child(3)").on("click", function() {			
			//self.location ="/product/getProduct?prodNo="+$(this).text().trim();
			self.location ="/product/getProduct?prodNo="+$(this).parent().attr("id").trim();
		}); */
		
		if(${param.menu == 'search'}){
		
		$(function() {
		$( "td:nth-child(2)").on("click" , function(){
			console.log('aaa');
			self.location ="/product/getProduct?prodNo="+$(this).parent().attr("id").trim();
		});
		
		$( "td:nth-child(2)").css("color", "blue");
				
		});
			 
		// $( ".ct_list_pop td:nth-child(3)").on("click", function() {

			$(function() {
						
		 $( "td:nth-child(5) > i").on("click", function() {
				console.log('ddd');
			 	
			 	if(${param.menu == 'search'}){			 		
			 	
			 	//var prodNo = $(this).parent().attr("id").trim();
			 	//var prodNo = $(this).parent().attr("id");
			 	var prodNo = $(this).next().val();
			 				 				 	
 			 	$.ajax(
			 			{
			 				url : "/product/json/getProduct/"+prodNo ,
			 				method : "GET" ,
			 				dataType : "json" ,
			 				headers : {
			 					"Accept" : "application/json" ,
			 					"Content-Type" : "application/json"
			 				},
			 				success : function(JSONData , status){
			 					
			 					var displayValue = "<h6>"
			 												+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
			 												+"��ǰ�� : "+JSONData.prodName+"<br/>"
			 												+"��ǰ�̹��� : "+JSONData.fileName+"<br/>"
			 												+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
			 												+"�������� : "+JSONData.prodDetail+"<br/>"
			 												+"���� : "+JSONData.price+"<br/>"
			 												+"������� : "+JSONData.regDateString+"<br/>"
			 												+"</h6>";
			 											
			 												console.log(displayValue);
			 											$("h6").remove();
			 										 	
			 										 	$("td[id='"+prodNo+"']").html(displayValue);
			 										 	//$("#"+prodNo+"").html(displayValue);
			 				}
			 			});
			 	}
			 });
			});
			 	}else{
			 		//self.location ="/product/updateProduct?prodNo="+$(this).parent().attr("id").trim()+"&menu=manage";
			 		$(function() {
			 			$( "td:nth-child(2)").on("click", function(){
			 				console.log('eeee');
			 				self.location ="/product/updateProduct?prodNo="+$(this).parent().attr("id").trim();
			 			});
			 			$( "td:nth-child(2)").css("color", "green");
			 			});
			 		}
			 		
		
		$( ".ct_list_pop td:nth-child(2)").css("color", "blue");
						
		$( ".ct_list_pop:nth-child(4n+2)").css("background-color","whitesmoke");
		
	});
</script>
</head>

<!-- <body bgcolor="#ffffff" text="#000000"> -->
<body>
	<jsp:include page="/layout/toolbar.jsp"/>
	
	<div class="container">
	
	<div class="page-header text-info">
		<h3>��ǰ�����ȸ</h3>
	</div>
	
	<div class="row">
		<div class="col-md-6 text-left">
			<p class="text-primary">
				��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage } ������
			</p>
		</div>
		
		<div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">		
				<div class="form-group">
				
			<select class="form-control" name="searchCondition">
				<option value="0" ${ !empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>��ǰ��ȣ</option>
				<option value="1" ${ !empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>��ǰ��</option>
				<option value="2" ${ !empty search.searchCondition && search.searchCondition == 2 ? "selected" : ""}>��ǰ����</option>
			</select>
			</div>
			
			<div class="form-group">
				<label class="sr-only" for="searchKeyword">�˻���</label>
				<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="�˻���" value="${ !empty search.searchKeyword ? search.searchKeyword : ''}" >
			</div>
			
			<button type="button" class="btn btn-default">�˻�</button>		
			
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			</form>
	</div>
</div>

	<table class="table table-hover table-striped">
	
		<thead>
			<tr>
				<th align="center">No</th>
				<th align="left">��ǰ��</th>
				<th align="center">����</th>
				<th align="center">�����</th>
				<th align="center">��������</th>
				<th align="center">�ǸŻ���</th>
			</tr>
			</thead>
	
		<tbody>
		
			<c:set var="i" value="0" />
			<c:forEach var="product" items="${list}">
				<c:set var="i" value="${i+1 }" />
				<tr>
				<tr class="ct_list_pop" id="${product.prodNo }">
				<td align="center">${i }</td>
				<td align="left">${product.prodName }</td>
				<td align="left">${product.price }</td>
				<td align="left">${product.regDate }</td>
				<td align="left">
					<i class="glyphicon glyphicon-ok" id="${product.prodNo }"></i>
				<input type="hidden" value="${product.prodNo }">
				<td align="left">${product.proTranCode }</td>				
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
	
	</div>	
  	<tr>
	<td colspan="11" id="${product.prodNo}" bgcolor="D6D7D6" height="1"></td>
	</tr>


	<jsp:include page="../common/pageNavigator_new2.jsp"/>




</body>
</html>
    