<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Ȯ��� ����� script
<script src="http://code.jquery.com/jqeury-2.1.4.min.js"></script>
<script type="text/javascript">

$(function(){
	//$("form").attr("action","/purchase/updatePurchaseView?tranNo=0").attr("method","post").submit();
});

</script>
 -->
</head>

<body>

<!-- <form name="updatePurchase" action="/purchase/updatePurchaseView?tranNo=0" method="post"> -->
<form name="updatePurchase">

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${property.purchaseProd.prodNo}</td>
		
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${property.buyer.userId}</td>
		
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
		
			${property.paymentOption}
		
		</td>
		
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${property.receiverName}</td>
		
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${property.receiverPhone}</td>
		
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${property.dlvyAddr}</td>
		
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${property.dlvyRequest}</td>
		
	</tr>
	<tr>
		<td>����������</td>
		<td>${property.dlvyDate}</td>
		
	</tr>
</table>
</form>

</body>
</html>    