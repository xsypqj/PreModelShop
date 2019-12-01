<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>������ü</title>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		$(function(){
			document.getElementById("price").value = opener.document.getElementById("price").value;
				$(".ct_ttl02").html("<h4>"+$("#price").val()+"�� �����ϱ�</h4>");
			$("td.ct_btn:contains('�����ϱ�')").bind("click", function(){
				
				if( $("#userName").val() != null && $("#userName").val().length > 0){

					$.ajax(
							{
								url : "/purchase/json/accountTransfer" ,
								method : "POST" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json" ,
									"Content-Type" : "application/json"
								} ,
								data : JSON.stringify({
									userName : $("#userName").val() , 
									command : '2' ,
									money : $("#price").val()
								}) ,
								success : function(JSONData, status){

									if(JSONData.approval == "200"){
									var displayValue = "<h4>"
															+JSONData.money+"�� ������ü�� �Ϸ�Ǿ����ϴ�.<br/>"
															+"'"+JSONData.userName+"' ���� ���� �ܾ��� "
															+JSONData.balance+"�� �Դϴ�."
															+"</h4>";
									}else if(JSONData.approval == "500"){
										var displayValue = "<h4>"
															+"'"+JSONData.userName+"' ȸ������ �ܾ��� �����մϴ�.<br/>"
															+"���� �ܾ��� "+JSONData.balance+"�� �Դϴ�.";
									}else{
										var displayValue = "<h4>"
															+"�̹� ���°� �ֽ��ϴ�. <br/>"
															+"�����ָ� Ȯ���� �ּ���."
									}
									$(".ct_ttl02").html(displayValue);
									
									if(JSONData.approval == "200"){
									var path = '<td width="17" height="23">'
												+'<img src="/images/ct_btnbg01.gif" width="17" height="23"/>'
												+'</td>'
												+'<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">'
												+'Ȯ��'
												+'</td>'
												+'<td width="14" height="23">'
												+'<img src="/images/ct_btnbg03.gif" width="14" height="23"/>'
												+'</td>';
									}else if(JSONData.approval == "500"){
										var path = "";
									}
									$("#check").html(path);
								}//end of Call Back Function
							}//end of setting
					);//end of ajax
					
				}else{
					alert('������/��ü�ݾ��� �ݵ�� �Է��ϼž� �մϴ�.');
				}
				$("#userName").focus();
			});
			
			$("#check").bind("click", function(){
				if(opener){
					opener.$(".ct_btn:contains('�����ϱ�')").text("�����Ϸ�");
					opener.$("input[name='receiverName']").focus();
				}
				window.close();
			});
			
			$(".ct_btn01:contains('�ݱ�')").bind("click", function(){
				window.close();
			});
		});//end of function
	
	</script>
	
</head>

<body bgcolor="#ffffff" text="#000000">

<form>
<input type="hidden" name="name" value=""/>
<input type="hidden" id="price">
<!-- Ÿ��Ʋ ���� -->
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">������ü</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>
<!-- Ÿ��Ʋ �� -->

<!-- �˻���� ���� -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="32" style="padding-left:12px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:3px;">
				<tr>
					<td width="8" style="padding-bottom:3px;">
						<img src="/images/ct_bot_ttl01.gif" width="4" height="7">
					</td>
					<td class="ct_ttl02">
						
						<c:if test="${	! empty result }">
							��ǰ���� �ݾ� ${account.money}�� ������ü�� �Ϸ�Ǿ����ϴ�.
							'${account.userName}'���� ���� �ܾ��� ${account.balance}�� �Դϴ�.
						</c:if>
					
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td background="/images/ct_line_ttl.gif" height="1"></td>
	</tr>
</table>
<!-- �˻���� �� -->

<!-- ��� ���̺���� -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			������ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<!-- ���̺� ���� -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
					<input type="text" name="userName" id="userName"
					class="ct_input_g" style="width:100px; height:19px"  maxLength="20" />
					
					</td>
					
					
					<td>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="4" height="21">
									<img src="/images/ct_btng01.gif" width="4" height="21">
								</td>
								<td 	align="center" background="/images/ct_btng02.gif" class="ct_btn" 
										style="padding-top:3px;">
									�����ϱ�
								</td>
								<td width="4" height="21">
									<img src="/images/ct_btng03.gif" width="4" height="21">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<!-- ���̺� �� -->
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>
<!-- ������̺� �� -->

<!-- ��ư ���� -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td id="check"></td>     
					<c:if test="${ ! empty result && result}"> <%-- boolean���� NullCheck ? --%>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						Ȯ��
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					</c:if>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�ݱ�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- ��ư �� -->

</form>

</body>
</html>