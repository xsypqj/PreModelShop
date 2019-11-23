<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>PreMade Model Shop</title>

	<link href="/css/left.css" rel="stylesheet" type="text/css">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		
		$( function(){
			// ����������ȸ		
			$( ".Depth03:contains('����������ȸ')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
			});
			// ȸ��������ȸ
			$( ".Depth03:contains('ȸ��������ȸ')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
			});
			// �ǸŻ�ǰ���
			$( ".Depth03:contains('�ǸŻ�ǰ���')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","../product/addProductView.jsp");
			});
			// �ǸŻ�ǰ����
			$( ".Depth03:contains('�ǸŻ�ǰ����')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage");
			});
			// �� ǰ �� ��
			$( ".Depth03:contains('�� ǰ �� ��')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=search");
			}); 
			// �����̷���ȸ
			$( ".Depth03:contains('�����̷���ȸ')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
			});
			// ��ٱ�����ȸ
			$( ".Depth03:contains('��ٱ�����ȸ')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getCartList");
			});
			// �ֱ� �� ��ǰ
			$( ".Depth03:contains('�ֱ� �� ��ǰ')" ).bind( 'click', function(){
				popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
			});
			// name00
			$( "#name00" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo=${lankList[0]}&menu=search");
			});
			// name01
			$( "#name01" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo=${lankList[1]}&menu=search");
			});
			// name02
			$( "#name02" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo=${lankList[2]}&menu=search");
			});
			// name03
			$( "#name03" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo=${lankList[3]}&menu=search");
			});
			// name04
			$( "#name04" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo=${lankList[4]}&menu=search");
			});
			
		});
		
	</script>
	
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
		<tr>
		<c:if test="${!empty user}">
		<tr>
		<td class="Depth03">
			<!-- <a href="/user/getUser?userId=${user.userId}" target="rightFrame"></a> -->
			����������ȸ
		</td>
		</tr>
		</c:if>	
		<c:if test="${!empty user.role && user.role==\"admin\"}">	
		<tr>
		<td class="Depth03" >
			<!-- <a href="/user/listUser" target="rightFrame"></a> -->
			ȸ��������ȸ
		</td>
		</tr>
		</c:if>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>
<c:if test="${user.role==\"admin\"}">
<!--menu 02 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159">
		<tr>
			<td class="Depth03">
				<!-- <a href="../product/addProductView.jsp" target="rightFrame"></a> -->
				�ǸŻ�ǰ���
			</td>
		</tr>
			<td class="Depth03">
				<!-- <a href="/product/listProduct?menu=manage" target="rightFrame"></a> -->
				�ǸŻ�ǰ����
			</td>
		</tr>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>
</c:if>
<!--menu 03 line-->
<tr>
<td valign="top">
	<table  border="0" cellspacing="0" cellpadding="0" width="159">
		<tr>
			<td class="Depth03">
				<!-- <a href="/product/listProduct?menu=search" target="rightFrame"></a> -->
				�� ǰ �� ��
			</td>
		</tr>
		<c:if test="${!empty user}">
			<c:if test="${user.role==\"user\"}">
		<tr>
			<td class="Depth03">
				<!-- <a href="/purchase/listPurchase" target="rightFrame"></a> -->
				�����̷���ȸ
			</td>
		</tr>
		<tr>
			<td class="Depth03">
				<!-- <a href="/user/getCartList" target="rightFrame"></a> -->
				��ٱ�����ȸ
			</td>
		</tr>
			</c:if>
		</c:if>
		<tr>
		<td class="DepthEnd">&nbsp;</td>
		</tr>
		<tr>
			<td class="Depth03">
				<!-- <td class="Depth03"><a href="javascript:history()"></a> -->
				�ֱ� �� ��ǰ
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
		<!-- <a href="/product/getProduct?prodNo=${lankList[0]}&menu=search" target="rightFrame"></a> -->
		<!-- <a href="/product/getProduct?prodNo=${lankList[1]}&menu=search" target="rightFrame"></a> -->
		<!-- <a href="/product/getProduct?prodNo=${lankList[2]}&menu=search" target="rightFrame"></a> -->
		<!-- <a href="/product/getProduct?prodNo=${lankList[3]}&menu=search" target="rightFrame"></a> -->
		<!-- <a href="/product/getProduct?prodNo=${lankList[4]}&menu=search" target="rightFrame"></a> -->
		<tr><td class="Depth03" id="name00">1  ${lankProdNameList[0]}</td></tr>
		<tr><td class="Depth03" id="name01">2  ${lankProdNameList[1]}</td></tr>
		<tr><td class="Depth03" id="name02">3  ${lankProdNameList[2]}</td></tr>
		<tr><td class="Depth03" id="name03">4  ${lankProdNameList[3]}</td></tr>
		<tr><td class="Depth03" id="name04">5  ${lankProdNameList[4]}</td></tr>
	</c:if>
</table>
<hr/>
</body>
</html>