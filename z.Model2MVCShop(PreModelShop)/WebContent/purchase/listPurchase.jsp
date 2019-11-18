<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">



<script type="text/javascript">
<!--
function fncList(currentPage){
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();
}

function fncGetSearchList(){
	document.detailForm.submit();
}

-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/app/purchase/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
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
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
	<c:set var="i" value="${i+1}" />
	<tr class="ct_list_pop">
		<td align="center">
			<a href="/app/purchase/getPurchase?tranNo=${purchase.tranNo}">${i}</a>
		</td>
		<td></td>
		<td align="center">
		<c:choose>
			<c:when test="${!empty purchase.tranCode && purchase.tranCode==1}">
				<a href="/app/purchase/updatePurchaseView?tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a>
			</c:when>
			<c:otherwise>
				<a href="/app/purchase/getPurchase?tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a>
			</c:otherwise>
		</c:choose>
		</td>
		<td></td>
		<td align="center">${purchase.purchaseProd.price}</td>
		<td></td>
		<td align="center">${purchase.purchaseProd.regDate}</td>
		<td></td>
		<td align="center">${!empty purchase.tranCode && purchase.tranCode==1 ? "현재 구매완료 상태입니다." : "" }
								${!empty purchase.tranCode && purchase.tranCode==2 ? "현재 배송 중 상태입니다." : "" }
								${!empty purchase.tranCode && purchase.tranCode==3 ? "현재 배송 완료 상태입니다" : "" }
		
		<%-- <c:choose>									
		<c:when test="${purchase.tranCode==0}">
			"현재구매완료상태 입니다."
		</c:when>
		<c:when test="${!empty purchase.tranCode && purchase.tranCode==1}">	
			"현재배송중상태 입니다."
		</c:when>
		<c:when test="${!empty purchase.tranCode && purchase.tranCode==2}">
			"현재배송완료상태 입니다."
		</c:when>
		</c:choose>
		--%>
				</td>
		<td></td>
		<td align="center">
			<c:if test="${!empty purchase.tranCode && purchase.tranCode==2}">
			<a href="/app/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode}">물건도착</a>
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

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>