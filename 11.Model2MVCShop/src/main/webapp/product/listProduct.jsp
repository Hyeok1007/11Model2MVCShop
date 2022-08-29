<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
<title>상품 목록조회</title>

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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
	<script type="text/javascript">

	function fncGetProductList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method","POST").attr("action","/product/listProduct?menu=${param.menu}").submit();
		
		/* if(param.menu == 'search') {
			$("form").attr("method","POST").attr("action","listProduct?menu=search").submit();
		}else{
			$("form").attr("method","POST").attr("action","listProduct?menu=manage").submit();
		} */
		
	}
	
	$(function() {
		$( "td.ct_btn01:contains('검색')").on("click", function(){
			fncGetProductList(1);
		});
	/* 	 $( ".ct_list_pop td:nth-child(3)").on("click", function() {			
			//self.location ="/product/getProduct?prodNo="+$(this).text().trim();
			self.location ="/product/getProduct?prodNo="+$(this).parent().attr("id").trim();
		}); */
		
	$(function() {
		$( "td:nth-child(2)").on("click" , function(){
			self.location ="/product/getProduct?prodNo="+$(this).parent().attr("id").trim();
		});
		
		$(function)
	})
	}
		
		
		 
		// $( ".ct_list_pop td:nth-child(3)").on("click", function() {

		 $( "td:nth-child(5) > i").on("click", function() {
				console.log('ddd');
			 	
			 	if(${param.menu == 'search'}){			 		
			 	
			 	var prodNo = $(this).parent().attr("id").trim();
			 				 				 	
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
			 												+"상품번호 : "+JSONData.prodNo+"<br/>"
			 												+"상품명 : "+JSONData.prodName+"<br/>"
			 												+"상품이미지 : "+JSONData.fileName+"<br/>"
			 												+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
			 												+"제조일자 : "+JSONData.prodDetail+"<br/>"
			 												+"가격 : "+JSONData.price+"<br/>"
			 												+"등록일자 : "+JSONData.regDateString+"<br/>"
			 												+"</h6>";
			 											
			 												console.log(displayValue);
			 											$("h6").remove();
			 										 	/* $("#"+prodNo+"").html(displayValue); */
			 										 	
			 										 	$("td[id='"+prodNo+"']").html(displayValue);
			 										 	//$("td[id='"+prodNo+"']").dialog(); 
			 				}
			 			}); 			 			
			 	}
			 	else{
			 		self.location ="/product/updateProduct?prodNo="+$(this).parent().attr("id").trim()+"&menu=manage";
			 		}
			 	});		
		
		$( ".ct_list_pop td:nth-child(2)").css("color", "blue");
						
		$( ".ct_list_pop:nth-child(4n+6)").css("background-color","whitesmoke");
		
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp"/>
	
	<div class="container">
	
	<div class="page-header text-info">
		<h3>상품목록조회</h3>
	</div>
	
	<div class="row">
		<div class="col-md-6 text-left">
			<p class="text-primary">
				전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage } 페이지
			</p>
		</div>
	
<%--  <form name="detailForm" action="/listProduct.do?menu=${param.menu }" method="post"> --%>
<%--  <form name="detailForm" action="/listProduct?menu=${param.menu }" method="post"> --%>
<%--  <form name="detailForm" action="/product/listProduct?menu=${param.menu }" method="post"> --%>


<%-- 
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01"><
			<c:if test="${param.menu == 'search'}">
				상품 목록조회
			</c:if>
			<c:if test="${param.menu == 'manage'}">
				상품관리
			</c:if>			
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table> --%>


		<div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">		
				<div class="form-group">
				
			<select class="form-control" name="searchCondition">
				<option value="0" ${ !empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>상품번호</option>
				<option value="1" ${ !empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>상품명</option>
				<option value="2" ${ !empty search.searchCondition && search.searchCondition == 2 ? "selected" : ""}>상품가격</option>
			</select>
			</div>
			
			<div class="form-group">
				<label class="sr-only" for="searchKeyword">검색어</label>
				<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어" value="${ !empty search.searchKeyword ? search.searchKeyword : ''}" >
			</div>
			
			<button type="button" class="btn btn-default">검색</button>		
			
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			</form>
	</div>
</div>

	<table class="table table-hover table-striped">
	
		<thead>
			<tr>
				<th align="center">No</th>
				<th align="left">상품명</th>
				<th align="center">가격</th>
				<th align="center">등록일</th>
				<th align="center">현재상태</th>
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
				</td>
			</tr>
			</c:forEach>

		</tbody>
	</table>
	
	</div>





<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage } 페이지
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}" />
	 <tr class="ct_list_pop" id="${ product.prodNo}">	
		<td align="center">${i}</td>
		<td></td>
		<c:if test="${param.menu == 'search'}">
	 		<td align="left">
	 			${product.prodName}
	 		</td>  
		</c:if>		
		<c:if test="${param.menu == 'manage'}">
			<td align="left">
			${product.prodName}
			</td>
			
		</c:if>
		<td></td>
		<td align="left">${product.price }</td>
		<td></td>
		<td align="left">${product.regDate }</td>
		<td></td>
		<td align="left">
			현재상태
		</td>
	<!-- </tr> --> --%>
	
 	<tr>
	<td colspan="11" id="${product.prodNo}" bgcolor="D6D7D6" height="1"></td>
	</tr>
	
	
<%-- 	</c:forEach> --%>

<!-- </table>	
</div> -->


<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>

		<jsp:include page="../common/pageNavigator.jsp"/>
		
	 	<c:if test="${resultPage.currentPage <= resultPage.pageUnit }">
				◀ 이전
		</c:if>
		
		<c:if test="${resultPage.currentPage > resultPage.pageUnit }">
			<a href="javascript:fncGetProductList('${ resultPage.currentPage-1}')">◀ 이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage }" step="1">
			<a href="javascript:fncGetProductList('${ i }');">${ i }</a>
		</c:forEach>
		
		<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
				이후 ▶
		</c:if>
		<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<a href="javascript:fncGetProductList('${resultPage.endUnitPage+1}')">이후 ▶</a>
		</c:if>
		

    	</td>
	</tr>
</table> --%>	
	<jsp:include page="../common/pageNavigator_new.jsp"/>
<!--  페이지 Navigator 끝 -->




</body>
</html>
    