<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="updatePurchase" action="/app/purchase/updatePurchaseView?tranNo=0" method="post">

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