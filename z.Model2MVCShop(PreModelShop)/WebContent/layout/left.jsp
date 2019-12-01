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
			
			$.ajax(
					{
						url : "/purchase/json/getPoint/"+$("#userId").val() ,
						method : "GET" ,
						dataType : "json" ,
						success : function(JSONData, status){
							$(".Depth03:contains('����Ʈ')").html("<h4>�� "+JSONData.balance+"��</h4>");
						}//end of Call Back Function
					}//end of setting
			);//end of ajax
			
			$(".Depth03:contains('�����ϱ�')").bind("click",function(){
				
				popWin 
				= window.open("/user/accountTransfer.jsp",
											"popWin", 
											"left=300,top=200,width=300,height=200,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
				
				$.ajax(
						{
							url : "/purchase/json/accountTransfer" ,
							method : "POST" ,
							headers : {
								"Accept" : "application/json" ,
								"Content-Type" : "application/json"
							} ,
							dataType : "json" ,
							data : {
								userId : $("#userId").val() ,
								command : '1' ,
							} ,
							success : function(JSONData, status){
								
							}//end of Call Back Function
						}		
				);//end of ajax
			});
			
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
			$("h3").tooltip();
		});
		
	</script>
	
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >
<input type="hidden" id="userId" value="${user.userId}">
<input type="hidden" id="userName" value="${user.userName}">
<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
		<tr>
		<c:if test="${!empty user}">
		<tr>
		<td class="Depth03">
			����������ȸ
		</td>
		</tr>
		</c:if>	
		<c:if test="${!empty user.role && user.role==\"admin\"}">	
		<tr>
		<td class="Depth03" >
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
				�ǸŻ�ǰ���
			</td>
		</tr>
			<td class="Depth03">
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
				�� ǰ �� ��
			</td>
		</tr>
		<c:if test="${!empty user}">
			<c:if test="${user.role==\"user\"}">
		<tr>
			<td class="Depth03">
				�����̷���ȸ
			</td>
		</tr>
		<tr>
			<td class="Depth03">
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
				�ֱ� �� ��ǰ
			</td>
		</tr>
		<tr>
			<td class="Depth03">
				����Ʈ
			</td>
			<c:if test="${!empty user.userId}">
			<td class="Depth03">
				�����ϱ�
			</td>
			</c:if>
		</tr>
					
		
	</table>
</td>
</tr>

</table>
<br/><br/><br/>
<hr/>
<table> 
		<tr><td class="Depth03"><center><h3 title="��ǰ�˻� Ŭ����">�α��ǰ����</h3></center></td>
	<c:if test="${lankList != null && lankProdNameList != null}">
		<c:set var="i" value="0"/>
		<c:forEach begin="0" step="1" end="4">
		<tr><td class="Depth03" id="name0${i}">${i+1}  ${lankProdNameList[i]}</td></tr>
		<c:set var="i" value="${i+1}"/>
		</c:forEach>
	</c:if>
</table>
<hr/>
</body>
</html>