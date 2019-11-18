<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<html>
<head>
	<title>${!empty menu && menu=="manage" ? "��ǰ ����" : "��ǰ �����ȸ"}</title>
	
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
<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/app/product/listProduct?menu=${menu}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
					
					
					${!empty menu && menu=="manage" ? "��ǰ ����" : "��ǰ �����ȸ"}
					
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
			
				<option value="0" ${!empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${!empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${!empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
		
			</select>
			<input type="text" name="searchKeyword"  value="${!empty search.searchKeyword && search.searchKeyword != null ? search.searchKeyword : ""}"
										class="ct_input_g" style="width:200px; height:19px" />
		</td>
				
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetSearchList();">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
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
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
		
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">

	<c:set var="i" value="${i+1}" />
	<tr class="ct_list_pop">
		<td align="center">${i}</td>
		<td></td>
		<td align="center">
		<c:if test="${!empty product.tranCode && menu==\"manage\"}">
			<c:choose>
				<c:when test="${product.flag==\"0\"}">
					<a href="/app/product/updateProductView?prodNo=${product.prodNo}&menu=${menu}&work=0">${product.prodName}</a>
				</c:when>
				<c:when test="${product.tranCode==1 || product.tranCode==2}">
					<a href="/app/purchase/getPurchase?tranNo=${product.tranNo}&menu=${menu}">${product.prodName}</a>
				</c:when>
				<c:when test="${product.tranCode==3}">
					<a href="/app/product/getProduct?prodNo=${product.prodNo}&menu=${menu}&work=0">${product.prodName}</a>
				</c:when>
			</c:choose>
		</c:if>
		<c:if test="${menu==\"search\"}">
			<a href="/app/product/getProduct?prodNo=${product.prodNo}&menu=${menu}">${product.prodName}</a>
		</c:if>
		</td>
		<td></td>
		<td align="center">${product.price}
		</td>
		<td></td>
		<td align="center">${product.regDate}
		</td>
		<td></td>
		<td align="center">
									${dupl}
						<c:choose>
							<c:when test="${product.flag==\"0\" && menu==\"search\"}">				
								<a href="/app/user/insertCart?prodNo=${product.prodNo}">īƮ�� �ֱ�</a>	
									<c:if test="${!empty dupl && dupl==\"success\"}">
										<a href="/app/user/getCartList?prodNo=${product.prodNo}">�߰�����!�ٷ� Ȯ��</a>	
									</c:if>
									<c:if test="${!empty dupl && dupl==\"dupl\"}">
										<a href="/app/user/getCartList?prodNo=${product.prodNo}">�ߺ���ǰ!����Ʈ Ȯ��</a>
									</c:if>							
							</c:when>
							 
							<c:when test="${!empty product.tranCode && menu==\"manage\"}">
								${empty product.tranCode || product.tranCode=="" ? "�Ǹ���" : "" }
								${product.tranCode==1 ? "���ſϷ�" : "" }
								${product.tranCode==2 ? "�����" : "" }
								${product.tranCode==3 ? "��ۿϷ�" : "" }
							</c:when>
						</c:choose>
						
						<c:if test="${!empty product.tranCode && product.tranCode==1}">
									<a href="/app/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=${product.tranCode}">����ϱ�</a>
								</c:if>		
							
		</td>	
	</tr>
		
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
		</c:forEach>
</table>

<%--  PageNavigation Start... --%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		  <input type="hidden" id="currentPage" name="currentPage" value="1"/>
			
			<%--  
			<c:choose>
			<c:when test="${ resultPage.currentPage <= resultPage.pageUnit }">
				�� ����
			</c:when>
			<c:when test="${ resultPage.currentPage > resultPage.pageUnit }">
				<a href="javascript:fncGetProductList('${resultPage.currentPage-1}')">�� ����</a>
			</c:when>
			</c:choose>
			
		
			<c:forEach var="i" begin="${resultPage.beginUnitPage}" step="1" end="${resultPage.endUnitPage}">
				<a href="javascript:fncGetProductList('${i}')">${i}</a>
			</c:forEach>
			
			<c:choose>
			<c:when test="${ resultPage.endUnitPage >= resultPage.maxPage }">
				���� ��
			</c:when>
			<c:when test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<a href="javascript:fncGetProductList('${resultPage.endUnitPage+1}')">���� ��</a>
			</c:when>
			</c:choose>
			--%> 
			  
			<jsp:include page="../common/pageNavigator.jsp" />
			
						
			
				
		
    	</td>
	</tr>
</table>
<%-- PageNavigation End... --%>

</form>



</body>
</html>
   