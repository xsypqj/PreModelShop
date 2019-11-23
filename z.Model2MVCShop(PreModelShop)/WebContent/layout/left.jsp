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
			// 개인정보조회		
			$( ".Depth03:contains('개인정보조회')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
			});
			// 회원정보조회
			$( ".Depth03:contains('회원정보조회')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
			});
			// 판매상품등록
			$( ".Depth03:contains('판매상품등록')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","../product/addProductView.jsp");
			});
			// 판매상품관리
			$( ".Depth03:contains('판매상품관리')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage");
			});
			// 상 품 검 색
			$( ".Depth03:contains('상 품 검 색')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=search");
			}); 
			// 구매이력조회
			$( ".Depth03:contains('구매이력조회')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
			});
			// 장바구니조회
			$( ".Depth03:contains('장바구니조회')" ).bind( 'click', function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getCartList");
			});
			// 최근 본 상품
			$( ".Depth03:contains('최근 본 상품')" ).bind( 'click', function(){
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
			
		});
		
	</script>
	
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
		<tr>
		<c:if test="${!empty user}">
		<tr>
		<td class="Depth03">
			<!-- <a href="/user/getUser?userId=${user.userId}" target="rightFrame"></a> -->
			개인정보조회
		</td>
		</tr>
		</c:if>	
		<c:if test="${!empty user.role && user.role==\"admin\"}">	
		<tr>
		<td class="Depth03" >
			<!-- <a href="/user/listUser" target="rightFrame"></a> -->
			회원정보조회
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
				<!-- <a href="../product/addProductView.jsp" target="rightFrame"></a> -->
				판매상품등록
			</td>
		</tr>
			<td class="Depth03">
				<!-- <a href="/product/listProduct?menu=manage" target="rightFrame"></a> -->
				판매상품관리
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
				<!-- <a href="/product/listProduct?menu=search" target="rightFrame"></a> -->
				상 품 검 색
			</td>
		</tr>
		<c:if test="${!empty user}">
			<c:if test="${user.role==\"user\"}">
		<tr>
			<td class="Depth03">
				<!-- <a href="/purchase/listPurchase" target="rightFrame"></a> -->
				구매이력조회
			</td>
		</tr>
		<tr>
			<td class="Depth03">
				<!-- <a href="/user/getCartList" target="rightFrame"></a> -->
				장바구니조회
			</td>
		</tr>
			</c:if>
		</c:if>
		<tr>
		<td class="DepthEnd">&nbsp;</td>
		</tr>
		<tr>
			<td class="Depth03">
				<!-- <td class="Depth03"><a href="javascript:history()"></a> -->
				최근 본 상품
			</td>
		</tr>
	</table>
</td>
</tr>

</table>
<br/><br/><br/>
<hr/>
<table> 
		<tr><td class="Depth03"><center><h3>인기상품순위</h3></center></td>
	<c:if test="${lankList != null && lankProdNameList != null}">	
		<!-- <a href="/product/getProduct?prodNo=${lankList[0]}&menu=search" target="rightFrame"></a> -->
		<!-- <a href="/product/getProduct?prodNo=${lankList[1]}&menu=search" target="rightFrame"></a> -->
		<!-- <a href="/product/getProduct?prodNo=${lankList[2]}&menu=search" target="rightFrame"></a> -->
		<!-- <a href="/product/getProduct?prodNo=${lankList[3]}&menu=search" target="rightFrame"></a> -->
		<!-- <a href="/product/getProduct?prodNo=${lankList[4]}&menu=search" target="rightFrame"></a> -->
		<tr><td class="Depth03" id="name00">1  ${lankProdNameList[0]}</td></tr>
		<tr><td class="Depth03" id="name01">2  ${lankProdNameList[1]}</td></tr>
		<tr><td class="Depth03" id="name02">3  ${lankProdNameList[2]}</td></tr>
		<tr><td class="Depth03" id="name03">4  ${lankProdNameList[3]}</td></tr>
		<tr><td class="Depth03" id="name04">5  ${lankProdNameList[4]}</td></tr>
	</c:if>
</table>
<hr/>
</body>
</html>