<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

$(function(){
		
		$(".ct_list_pop td:nth-child(3)").bind("click",function(){
			var tranNo = $(this).find("input[name='tranNo']").val()
			var tranCode = $(this).find("input[name='tranCode']").val()
			if(tranCode != null && tranCode == "1"){
				self.location = "/purchase/updatePurchaseView?tranNo="+tranNo;
			}else if(tranCode == "2" || tranCode == "3"){
				self.location = "/purchase/getPurchase?tranNo="+tranNo;
			}
		});
		
			$(".ct_list_pop td:nth-child(11)").bind("click",function(){
				if($(this).text().trim() == "���ǵ���"){
					var tranNo = $(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='tranNo']").val() 
					var tranCode = $(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='tranCode']").val() 
					self.location = "/purchase/updateTranCode?tranNo="+tranNo+"&tranCode="+tranCode;
				}
			});
		
});


function fncList(currentPage){
	//document.getElementById("currentPage").value = currentPage;
	//document.detailForm.submit();
	$("#currentPage").val(currentPage);
	$("form").attr("method","post").attr("action","/purchase/listPurchase").submit();
}

function fncGetSearchList(){
	//document.detailForm.submit();
	$("form").attr("method","post").attr("action","/purchase/listPurchase").submit();
}


</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">
<!-- <form name="detailForm" action="/purchase/listPurchase" method="post"> -->
<form name="detailForm">

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
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
	<c:set var="i" value="${i+1}" />
	<tr class="ct_list_pop">
		<td align="center">
			${i}
		</td>
		<td></td>
		<td align="center">
		<input type="hidden" name="tranNo" value="${purchase.tranNo}">
		<input type="hidden" name="tranCode" value="${purchase.tranCode}">
		<c:choose>
			<c:when test="${!empty purchase.tranCode && purchase.tranCode==1}">
				<!--<a href="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}"></a>  -->
				${purchase.purchaseProd.prodName}
			</c:when>
			<c:otherwise>
				<!-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a> -->
				${purchase.purchaseProd.prodName}
			</c:otherwise>
		</c:choose>
		</td>
		<td></td>
		<td align="center">${purchase.purchaseProd.price}</td>
		<td></td>
		<td align="center">${purchase.purchaseProd.regDate}</td>
		<td></td>
		<td align="center">${!empty purchase.tranCode && purchase.tranCode==1 ? "���� ���ſϷ� �����Դϴ�." : "" }
								${!empty purchase.tranCode && purchase.tranCode==2 ? "���� ��� �� �����Դϴ�." : "" }
								${!empty purchase.tranCode && purchase.tranCode==3 ? "���� ��� �Ϸ� �����Դϴ�" : "" }
		
				</td>
		<td></td>
		<td align="center">
			<c:if test="${!empty purchase.tranCode && purchase.tranCode==2}">
			<!-- <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode}"></a> -->
			���ǵ���
			</c:if>
		</td>
	</tr>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>
	
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		 	<jsp:include page="../common/pageNavigator.jsp" />
		
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>