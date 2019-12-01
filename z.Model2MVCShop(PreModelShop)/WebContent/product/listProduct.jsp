<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>${!empty menu && menu=="manage" ? "��ǰ ����" : "��ǰ �����ȸ"}</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	
	function fncList(currentPage){
		//document.getElementById("currentPage").value = currentPage;
		//document.detailForm.submit();
		$("#currentPage").val(currentPage);
		$("form").attr("method","POST").attr("action","/product/listProduct").submit();
	}
	
	function fncGetSearchList(){
		fncList(1);
	}
	
	$(function(){
		
		$(".ct_btn01:contains('�˻�')").bind("click",function(){
			fncGetSearchList();
		});
		$("input[name='searchKeyword']").keydown(function(key){
			
			if(key.keyCode == 13){
				fncGetSearchList();
			}
		});
			
		$(".ct_list_pop td:nth-child(3)").bind("click",function(){
			
			if($("#menu").val() != null && $("#menu").val()=="manage" ){
				if($(this).children("#flag").val()== 0 ){
					self.location = "/product/updateProductView?prodNo="+$(this).children("#prodNo").val()+"&menu="+$("#menu").val()+"&work=0";
				}
				if($(this).children("#tranCode").val() == "1" || $(this).children("#tranCode").val() == "2"){
					self.location = "/purchase/getPurchase?tranNo="+$(this).children("#tranNo").val()+"&menu="+$("#menu").val();
				}
				if($(this).children("#tranCode").val() == "3"){
					//self.location = "/product/getProduct?prodNo="+$(this).children("#prodNo").val()+"&menu="+$("#menu").val()+"&work=0";
					$.ajax(
							{
								url : "/product/json/getProduct" ,
								method : "POST" ,
								data : JSON.stringify({
											prodNo : $(this).children("#prodNo").val() ,
											menu : $("#menu").val() ,
											work : "0"
										}) ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json" ,
									"Content-Type" : "application/json" 
								} ,
								success : function(JSONData, status){
									var imageFile = "";
									for(var i=0; i<JSONData.imageFile.length; i++){
									imageFile += '<img src = "/images/uploadFiles/'+JSONData.imageFile[i]+'" width = "100">&nbsp'
									}
									var displayValue = "<h4>"
														+"��ǰ��ȣ : "+JSONData.product.prodNo+"<br/>"
														+"�� ǰ �� : "+JSONData.product.prodName+"<br/>"
														+"��ǰ�̹��� : <br/>"
														+imageFile
														+"<br/>��ǰ������ : "+JSONData.product.prodDetail+"<br/>"
														+"�������� : "+JSONData.product.manuDate+"<br/>"
														+"��    �� : "+JSONData.product.price+"<br/>"
														+"������� : "+JSONData.product.regDate;
									$("h4").remove();
									$("#"+JSONData.product.prodName+"").html(displayValue);
								}//end of Call Back Function
							}//end of setting
					);//end of ajax	

				}//end of ValidationCheck
				
			}
			if($("#menu").val()=="search" ){
				window.parent.frames["leftFrame"].document.location.reload();
				self.location = "/product/getProduct?prodNo="+$(this).children("#prodNo").val()+"&menu="+$("#menu").val();
			}
		});
		
		//==> ����
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			
			$(".ct_list_pop td:nth-child(9)").children("span:contains('����ϱ�')").bind("click",function(){			
				var tranCode = $(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='tranCode']").val()
				var prodNo = $(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='prodNo']").val()
				if(tranCode != null &&tranCode == "1"){
				self.location = "/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode="+tranCode;
				}
			}); 
			$(".ct_list_pop td:nth-child(9)").children("span:contains('īƮ�� �ֱ�')").bind("click",function(){	
				self.location = "/user/insertCart?prodNo="+$(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='prodNo']").val();
			});
			$(".ct_list_pop td:nth-child(9)").children("span:contains('�߰�����!�ٷ� Ȯ��')").bind("click",function(){	
				self.location = "/user/getCartList?prodNo="+$(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='prodNo']").val();
			});
			$(".ct_list_pop td:nth-child(9)").children("span:contains('�ߺ���ǰ!����Ʈ Ȯ��')").bind("click",function(){	
				self.location = "/user/getCartList?prodNo="+$(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='prodNo']").val();
			});
			
			
	});
	
	
	
	</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<div style="width:98%; margin-left:10px;">
<!-- <form name="detailForm" action="/product/listProduct?menu=${menu}" method="post"> -->
<form name="detailForm">
<input type="hidden" id="menu" name="menu" value="${menu}">

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
			<input type="text" name="searchKeyword"  value="${!empty search.searchKeyword && search.searchKeyword != null ? search.searchKeyword : ''}"
										class="ct_input_g" style="width:200px; height:19px" />
		</td>
				
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
			
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!--<a href="javascript:fncGetSearchList();"></a>  -->
						�˻�
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
		<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}">
		<input type="hidden" id="tranNo" name="prodNo" value="${product.tranNo}">
		<input type="hidden" id="flag" name="flag" value="${product.flag}">
		<input type="hidden" id="tranCode" name="tranCode" value="${product.tranCode}">
		<!-- 
		<c:if test="${!empty product.tranCode && menu==\"manage\"}">
			<c:choose>
				<c:when test="${product.flag==\"0\"}">
					<a href="/product/updateProductView?prodNo=${product.prodNo}&menu=${menu}&work=0">${product.prodName}</a>
				</c:when>
				<c:when test="${product.tranCode==1 || product.tranCode==2}">
					<a href="/purchase/getPurchase?tranNo=${product.tranNo}&menu=${menu}">${product.prodName}</a>
				</c:when>
				<c:when test="${product.tranCode==3}">
					<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${menu}&work=0">${product.prodName}</a>
				</c:when>
			</c:choose>
		</c:if>
		<c:if test="${menu==\"search\"}">
			<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${menu}">${product.prodName}</a>
		</c:if>
		-->
		${product.prodName}
		</td>
		<td></td>
		<td align="center">${product.price}
		</td>
		<td></td>
		<td align="center">${product.regDate}
		</td>
		<td></td>
		<td align="center">
									
						
						<c:choose>
							<c:when test="${product.flag==\"0\" && menu==\"search\"}">
										<!-- <a href="/user/insertCart?prodNo=${product.prodNo}"></a> -->
										<span>īƮ�� �ֱ�</span>
										
									<c:if test="${!empty dupl && dupl==\"success\"}">	
										<!-- <a href="/user/getCartList?prodNo=${product.prodNo}"></a> -->
										<span>�߰�����!�ٷ� Ȯ��	</span>
									</c:if>
									<c:if test="${!empty dupl && dupl==\"dupl\"}">
										<!-- <a href="/user/getCartList?prodNo=${product.prodNo}"></a> -->
										<span>�ߺ���ǰ!����Ʈ Ȯ��</span>
									</c:if>							
							</c:when>
							 
							<c:when test="${!empty product.tranCode && menu==\"manage\"}">
								${empty product.tranCode || product.tranCode=="" ? "�Ǹ���" : "" }
								${product.tranCode==1 ? "���ſϷ�" : "" }
								${product.tranCode==2 ? "�����" : "" }
								${product.tranCode==3 ? "��ۿϷ�" : "" }
							</c:when>
						</c:choose>
						
						
						
						<span>
						<c:if test="${!empty product.tranCode && product.tranCode==1}">
									<!-- <a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=${product.tranCode}"></a> -->
									����ϱ�
						</c:if>		
						</span>
		</td>	
	</tr>
		
	<tr>
		<td id="${product.prodName}" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
		</c:forEach>
</table>

<%--  PageNavigation Start... --%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		  <input type="hidden" id="currentPage" name="currentPage" value=""/>
			
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
   