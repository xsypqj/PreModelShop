<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	function fncList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/user/listUser").submit();
	}
	
	function fncGetSearchList(){
		//document.detailForm.submit();
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/user/listUser").submit();
	}
	
	$(function(){
		
		$(".ct_list_pop td:nth-child(3)").bind("click", function(){	
			self.location = "/product/getProduct?menu=search&prodNo="+$(this).parent().find("#prodNo").val();
		});
		
		$(".ct_list_pop td:nth-child(11)").bind("click", function(){
			self.location = "/user/deleteCart?prodNo="+$(this).parent().find("#prodNo").val();
		});
		
	});
	
	
	
	</script>
</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>��ٱ���</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    
		    <!-- table ���� �˻� Start /////////////////////////////////////-->
		    
	 <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>	 
		    

		 <th align="center">No</th>
		 <th align="left">��ǰ��</th>
		 <th align="left">����</th>
		 <th align="left">��ǰ������</th>
		 <th align="left">��������</th>
		 <th align="left">��������</th>
		 </tr>
        </thead>
        
        
	<tbody>
		
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
	<c:set var="i" value="${i+1}" />
	
	<tr> 
		<td align="center">
			${i}
			
		</td>
		
		<td align="left">${product.prodName}</td>
		<td align="left">${product.price}</td>
		<td align="left">${product.prodDetail}</td>
		<td align="left">${product.manuDate}</td>
		<td align="left"��ٱ��� ����></td>
		
		
			<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
		
		</tr>
	</c:forEach>
</tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	
<c:if test="${!empty noCart}">
<p>
<h5><center>! īƮ�� ��� ��ǰ�� �����ϴ� !</center></h5>
</p><hr/>
</c:if>


</body>
