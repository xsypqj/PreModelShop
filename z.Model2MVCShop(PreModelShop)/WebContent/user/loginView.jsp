<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>�α���</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

		$(function(){
			
			$("#userId").focus();
			$("img[src='/images/btn_login.gif']").bind("click", function(){
				
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1 ){
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("input:text").focus();
					return;
				}

				if(pw == null || pw.length <1 ){
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("input:password").focus();
					return;
				}
				// 10�� �����丵�� ���� �ּ�
				//$("form").attr("method", "POST").attr("action", "/user/login").attr("target","_parent").submit();
				
				$.ajax(
					{
						url : "/user/json/login" ,
						method : "POST" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json" ,
							"Content-Type" : "application/json"
						} ,
						data : JSON.stringify({
							userId : id,
							password : pw
						}) ,
						success : function(JSONData, status){
							
							if( JSONData != null ){
								//[ ���1 ]
								//$(window.parent.document.location).atrr("href","/index.jsp");
								
								//[ ���2 ]
								window.parent.document.location.reload();
								
								//[ ���3 ]
								//$(window.parent.frames["topFrame"].document.location).attr("href","/layout/top.jsp");
								//$(window.parent.frames["leftFrame"].document.location).attr("href","/layout/left.jsp");
								//$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId="+JSONData.userId);
								
							}else{
								alert("���̵�, �н����带 Ȯ���Ͻð� �ٽ� �α��� ���ּ���.");
							}
						}//end of Call Back Function	
			});//end of ajax
		});//end of Login Click
			$("img[src='/images/btn_add.gif']").bind("click",function(){
				self.location = "./addUserView.jsp";
			});//end of Add User Click
		
	});//end of function
	</script>
	
</head>

<body bgcolor="#ffffff" text="#000000" >

<form>

<div align="center">

<TABLE WITH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD ALIGN="CENTER" VALIGN="MIDDLE">

<table width="650" height="390" border="5" cellpadding="0" cellspacing="0" bordercolor="#D6CDB7">
  <tr> 
    <td width="10" height="5" align="left" valign="top" bordercolor="#D6CDB7">
    	<table width="650" height="390" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="305">
            <img src="/images/logo-spring.png" width="305" height="390">
          </td>
          <td width="345" align="left" valign="top" background="/images/login02.gif">
          	<table width="100%" height="220" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="30" height="100">&nbsp;</td>
                <td width="100" height="100">&nbsp;</td>
                <td height="100">&nbsp;</td>
                <td width="20" height="100">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="50">&nbsp;</td>
                <td width="100" height="50">
                	<img src="/images/text_login.gif" width="91" height="32">
                </td>
                <td height="50">&nbsp;</td>
                <td width="20" height="50">&nbsp;</td>
              </tr>
              <tr> 
                <td width="200" height="50" colspan="4">
                </td>
              </tr>              
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30">
                	<img src="/images/text_id.gif" width="100" height="30">
                </td>
                <td height="30">
                  <input 	type="text" name="userId" id="userId"  class="ct_input_g" 
                  				style="width:180px; height:19px"  maxLength='50'/>          
          		</td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30">
                	<img src="/images/text_pas.gif" width="100" height="30">
                </td>
                <td height="30">                    
                    <input 	type="password" name="password" id="password" class="ct_input_g" 
                    				style="width:180px; height:19px"  maxLength="50" >
                </td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="20">&nbsp;</td>
                <td width="100" height="20">&nbsp;</td>
                <td height="20" align="center">
      				<table width="136" height="20" border="0" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td width="56">
                            	 
                            		<img src="/images/btn_login.gif" width="56" height="20" border="0">
                            	</a>
                            </td>
                            <td width="10">&nbsp;</td>
                            <td width="70">
 
                            		<img src="/images/btn_add.gif" width="70" height="20" border="0">
                            	</a>
                            </td>
                          </tr>
                    </table>
                  </td>
                  <td width="20" height="20">&nbsp;</td>
                </tr>
            </table>
         </td>
       </tr>                            
      </table>
      </td>
  </tr>
</table>
</TD>
</TR>
</TABLE>
</div>

</form>

</body>
</html>

<script type="text/javascript">
	document.loginForm.userId.focus();
</script>
