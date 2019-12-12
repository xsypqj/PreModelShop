<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="css/animate.min.css" rel="stylesheet">
    <link href="css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="javascript/bootstrap-dropdownhover.min.js"></script>
    
    <!-- jQuery UI toolTip 사용 CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip 사용 JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
    
    	.thumbnail-wrappper { 
			width: 25%; 
		} 
		.thumbnail {
			position: relative; padding-top: 100%; /* 1:1 ratio */ overflow: hidden; 
		} 
		.thumbnail .centered { 
			position: absolute; 
			top: 0; 
			left: 0; 
			right: 0; 
			bottom: 0; 
			-webkit-transform: translate(50%,50%); 
			-ms-transform: translate(50%,50%); 
			transform: translate(50%,50%); 
		} 
		.thumbnail .centered img { 
			position: absolute; 
			top: 0; 
			left: 0; 
			max-width: 100%; 
			height: auto; 
			-webkit-transform: translate(-50%,-50%); 
			-ms-transform: translate(-50%,-50%); 
			transform: translate(-50%,-50%); 
		}

    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	////////////////////////////////////////////////////////////////// 무한스크롤 기능 //////////////////////////////////////////////////////////////////
	$(function(){
		var bool = true;
		var currentPage = 2;
		$(window).scroll(function(){
			var window = $(this);
            var scrollTop = $(window).scrollTop();
            var windowHeight = $(window).height();
            var documentHeight = $(document).height();            
            
            if(bool){          	
	            if( scrollTop + windowHeight + 300 > documentHeight ){
	            	bool = false;
	            	//쓰로틀링 설정
	            	var timeout = setTimeout(function(){
	            		bool = true;
	            		
	            	},1000);//end of setTimeout

	            	//쓰로틀링 종료
	            	if( $("#maxPage").val() == currentPage ){
	            		clearTimeout(timeout);
	            	}//end of clearTimeout
	            	
	            		$.ajax(
	            				{
	            					url : "/product/json/listProduct" ,
	            					method : "POST" ,
	            					data : JSON.stringify({
	            						currentPage : currentPage
	            					}) ,
	            					dataType : "json" ,
	            					headers : {
	            						"Accept" : "application/json" ,
	            						"Content-Type" : "application/json"
	            					} ,
	            					success : function(JSONData , status){
										var displayValue = "";
										for(var i=0; i<JSONData.list.length; i++){											
											var displayHtml = '<div class="col-xs-6 col-sm-4 col-md-2 ">'
																+'<div class="thumbnail-wrapper">'
																+'<div class="thumbnail">'
																+'<div class="centered">'
																+'<img src="/images/uploadFiles/'+JSONData.list[i].fileName[0]+'" alt="'+JSONData.list[i].fileName[0]+'" >'
																+'</div>'
																+'</div>'
																+'<div class="caption">'
																+'<h3>Product &nbsp;&nbsp; <i class="glyphicon glyphicon-shopping-cart"></i></h3>'
																+'<p>상품번호'+JSONData.list[i].prodNo+'<br/>'
																+'상 품 명'+JSONData.list[i].prodName+'<br/>'
																+'제조일자'+JSONData.list[i].manuDate+'<br/>'
																+'상품가격'+JSONData.list[i].price+'<br/>'
																+'등록일자'+JSONData.list[i].regDate
																+'</div>'
																+'</div>'
																+'</div>'
											displayValue += displayHtml;
										}										
										$(".row").append(displayValue);
										currentPage ++;
	            					}//end of Call Back Function
	            				})//end of ajax
	            	
	            } 
            }
            
        });//end of scroll
	});//end of function
	//////////////////////////////////////////////////////////////////무한스크롤 기능 //////////////////////////////////////////////////////////////////
	
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
		
		$(".ct_btn01:contains('검색')").bind("click",function(){
			fncGetSearchList();
		});
		$("input[name='searchKeyword']").keydown(function(key){
			
			if(key.keyCode == 13){
				fncGetSearchList();
			}
		});
			
		$("img:nth-child(1)").bind("click",function(){		
			var prodNo = $(this).parent().parent().parent().find("span").text().trim();
			var menu = $("#menu").val();
			if(menu == "" || menu == null){
				menu = "search";
			}
			
			if(menu != null && menu=="manage" ){
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
														+"상품번호 : "+JSONData.product.prodNo+"<br/>"
														+"상 품 명 : "+JSONData.product.prodName+"<br/>"
														+"상품이미지 : <br/>"
														+imageFile
														+"<br/>상품상세정보 : "+JSONData.product.prodDetail+"<br/>"
														+"제조일자 : "+JSONData.product.manuDate+"<br/>"
														+"가    격 : "+JSONData.product.price+"<br/>"
														+"등록일자 : "+JSONData.product.regDate;
									$("h4").remove();
									$("#"+JSONData.product.prodName+"").html(displayValue);
								}//end of Call Back Function
							}//end of setting
					);//end of ajax	

				}//end of ValidationCheck
				
			}
			if(menu=="search" ){
				self.location = "/product/getProduct?prodNo="+prodNo+"&menu="+menu;
			}
		});
		
		//==> 여기
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			
			$(".ct_list_pop td:nth-child(9)").children("span:contains('배송하기')").bind("click",function(){			
				var tranCode = $(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='tranCode']").val()
				var prodNo = $(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='prodNo']").val()
				if(tranCode != null &&tranCode == "1"){
				self.location = "/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode="+tranCode;
				}
			}); 
			$("i:nth-child(1)").bind("click",function(){	
				self.location = "/user/insertCart?prodNo="+$(this).parent().parent().find("span").text().trim();
			});
			$(".ct_list_pop td:nth-child(9)").children("span:contains('추가성공!바로 확인')").bind("click",function(){	
				self.location = "/user/getCartList?prodNo="+$(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='prodNo']").val();
			});
			$(".ct_list_pop td:nth-child(9)").children("span:contains('중복상품!리스트 확인')").bind("click",function(){	
				self.location = "/user/getCartList?prodNo="+$(this).closest(".ct_list_pop").children("td:nth-child(3)").find("input[name='prodNo']").val();
			});
			
			
	});
	
	
	
	</script>
</head>
<body>
	<input type="hidden" id="maxPage" value="${resultPage.maxPage}">
	<input type="hidden" id="menu" value="${menu}">
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	<br/><br/><br/><br/>
   	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div class="row">
		<c:set var="i" value="0" />
		<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}" />
		
			<div class="col-xs-6 col-sm-4 col-md-2 ">
				<div class="thumbnail-wrapper"> 
					<div class="thumbnail"> 
						<div class="centered"> 
							<img src="/images/uploadFiles/${ product.fileName[0] }" alt="${ product.fileName[0] }" >
							
						</div>
						
					</div>
						<div class="caption">
					        <h3>Product &nbsp;&nbsp; <i class="glyphicon glyphicon-shopping-cart"></i></h3>
					         <p>상품번호<span>${product.prodNo}</span><br/>
					        	상 품 명${product.prodName}<br/>
					        	제조일자${product.manuDate}<br/>
					        	상품가격${product.price}<br/>
					        	등록일자${product.regDate}
					        	
				        </div>
				</div>			
			</div>
			
		</c:forEach>
			
		
		</div>
	
	</div> 
</body>
</html>


