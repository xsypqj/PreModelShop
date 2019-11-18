<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="com.model2.mvc.service.user.domain.*" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	User vo=(User)session.getAttribute("user");

	String role="";

	if(vo != null) {
		role=vo.getRole();
	}
%>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function history(){
	popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}
</script>
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
		<tr>
		<%
			if(vo != null){
		%>
		<tr>
		<td class="Depth03">
			<a href="/app/user/getUser?userId=<%=vo.getUserId() %>" target="rightFrame">����������ȸ</a>
		</td>
		</tr>
		<%
			}
		%>
		<%
			if(role.equals("admin")){
		%>
		<tr>
		<td class="Depth03" >
			<a href="/app/user/listUser" target="rightFrame">ȸ��������ȸ</a>
		</td>
		</tr>
		<%
			}
		%>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>

	<%
		if(role.equals("admin")){
	%>
<!--menu 02 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159">
		<tr>
			<td class="Depth03">
				<a href="../product/addProductView.jsp;" target="rightFrame">�ǸŻ�ǰ���</a>
			</td>
		</tr>
		<td class="Depth03">
				<a href="/app/product/listProduct?menu=manage" target="rightFrame">�ǸŻ�ǰ����</a>
			</td>
		</tr>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>
	<%
				}
	%>

<!--menu 03 line-->
<tr>
<td valign="top">
	<table  border="0" cellspacing="0" cellpadding="0" width="159">
		<tr>
			<td class="Depth03">
				<a href="/app/product/listProduct?menu=search" target="rightFrame">�� ǰ �� ��</a>
			</td>
		</tr>
		<%
			if(vo != null){
				if(role.equals("user")){
		%>
		<tr>
			<td class="Depth03">
				<a href="/app/purchase/listPurchase" target="rightFrame">�����̷���ȸ</a>
			</td>
		</tr>
		<tr>
			<td class="Depth03">
				<a href="/app/user/getCartList" target="rightFrame">��ٱ�����ȸ</a>
			</td>
		</tr>
		<%
				}
			}
		%>
		<tr>
		<td class="DepthEnd">&nbsp;</td>
		</tr>
		<tr>
			<td class="Depth03">
				<a href="javascript:history()">�ֱ� �� ��ǰ</a>
			</td>
		</tr>
	</table>
</td>
</tr>

</table>
<br/><br/><br/>
<hr/>
<table> 
		<tr><td class="Depth03"><center><h3>�α��ǰ����</h3></center></td>
	<c:if test="${lankList != null && lankProdNameList != null}">	
		<tr><td class="Depth03"><a href="/app/product/getProduct?prodNo=${lankList[0]}&menu=search" target="rightFrame">1  ${lankProdNameList[0]}</a></td></tr>
		<tr><td class="Depth03"><a href="/app/product/getProduct?prodNo=${lankList[1]}&menu=search" target="rightFrame">2  ${lankProdNameList[1]}</a></td></tr>
		<tr><td class="Depth03"><a href="/app/product/getProduct?prodNo=${lankList[2]}&menu=search" target="rightFrame">3  ${lankProdNameList[2]}</a></td></tr>
		<tr><td class="Depth03"><a href="/app/product/getProduct?prodNo=${lankList[3]}&menu=search" target="rightFrame">4  ${lankProdNameList[3]}</a></td></tr>
		<tr><td class="Depth03"><a href="/app/product/getProduct?prodNo=${lankList[4]}&menu=search" target="rightFrame">5  ${lankProdNameList[4]}</a></td></tr>
	</c:if>
</table>
<hr/>
</body>
</html>