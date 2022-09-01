<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="com.model2.mvc.common.Page"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model2.mvc.service.domain.Purchase" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<%
	List<Purchase> list = (ArrayList<Purchase>)request.getAttribute("list");
	Page resultPage = (Page)request.getAttribute("resultPage");
	Search search = (Search)request.getAttribute("search");
		for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i).toString());
		}
		
		System.out.println(resultPage.toString());
		System.out.println(search.getPageSize());
	
	
%>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetUserList() {
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listUser.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü <%=resultPage.getTotalCount() %> �Ǽ�, ���� <%=resultPage.getCurrentPage() %> ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	
	<% for(int i=list.size()-1;i>=0;i--){ %>
	<tr class="ct_list_pop">
		<td align="center">
			<a href="/getPurchase.do?tranNo=<%=list.get(i).getTranNo() %>"><%=i+1 %></a>
		</td>
		<td></td>
		<td align="left">
			<a href="/getUser.do?userId=<%=list.get(i).getBuyer().getUserId() %>"><%=list.get(i).getBuyer().getUserId()%></a>
		</td>
		<td></td>
		<td align="left"><%=list.get(i).getReceiverName()%></td>
		<td></td>
		<td align="left"><%=list.get(i).getReceiverPhone() %></td>
		<td></td>
		<td align="left">
			<% if(list.get(i).getTranCode().trim().equals("1")) { %>
				���� ���ſϷ� �����Դϴ�.
			<%}else if(list.get(i).getTranCode().trim().equals("2")) {%>
				���� ����� �����Դϴ�.
			<%}else { %>
				���� ��ۿϷ� �����Դϴ�.
			<% } %>
		</td>
		<td></td>
		<% if(list.get(i).getTranCode().trim().equals("2")) { %>
			<td align="left"><<a href="/updateTranCode.do?tranNo=<%=list.get(i).getTranNo() %>&tranCode=3">���ǵ���</a></td>
		<% } %>
	</tr>
	<% } %>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		 
			<% if(resultPage.getBeginUnitPage() != 1) { %>
				<a href="/listPurchase.do?page=<%=resultPage.getBeginUnitPage()-1 %>">����&nbsp;</a> 
		 	<% } %>
		 	
		 	<% for(int i=0;i<resultPage.getPageUnit();i++) { %>
				<% if(resultPage.getBeginUnitPage() <= resultPage.getEndUnitPage()) { %>		 		
					<a href="/listPurchase.do?page=<%=resultPage.getBeginUnitPage()+i %>"><%=resultPage.getBeginUnitPage()+i %></a> 
		 	<%} %>
		 <%} %>
		 
		 <% if(resultPage.getEndUnitPage() != resultPage.getMaxPage()) {%>
			<a href="/listPurchase.do?page=<%=resultPage.getEndUnitPage()+1 %>">&nbsp;����</a>
		<%} %> 
		
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>