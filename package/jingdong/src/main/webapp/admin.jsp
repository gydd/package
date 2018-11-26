<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
    <title>PARKnSHOP-admin</title>
    <meta name="keywords" content="create from keywords">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- CSS Files -->

    <link rel="stylesheet" type="text/css" media="screen" href="style.css">
    <link rel="stylesheet" type="text/css" media="screen" href="menu/css/simple_menu.css">
    <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>-->
    <link rel="stylesheet" href="css/jquery-ui.css">
    <script type="text/javascript" src="jquery-1.9.1/jquery.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
    <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.css" />
    <!--<script src="bootstrap-3.3.5-dist/js/jquery-1.11.1.min.js"></script>-->
    <script src="bootstrap-3.3.5-dist/js/bootstrap.js"></script>
    <script>
        $(function() {
            $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
            $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
            $("#sub").click(function () {
                $('<tr><td>' + $("#btn1").val() + '</td><td>' + $("#btn2").val() + '</td><td>' + $("#btn3").val() + '</td><td>' + $("#btn4").val() +  '</td></tr>').appendTo("#tbo");
            });
            $("#sub1").click(function () {
                $('<tr><td>' + $("#btn5").val() + '</td><td>' + $("#btn6").val() + '</td><td>' + $("#btn7").val() + '</td><td>' + $("#btn8").val() +  '</td></tr>').appendTo("#tbo1");
            });
        });
    </script>
    
    <style type="text/css">
    	#login {
    		float:right;
    	}
    	
    	.ui-tabs-vertical { width: 60em; }
        .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
        .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
        .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
        .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; border-right-width: 1px; }
        .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
        #prod_wrapper {
            display: block;
        }
        #two {
            display: block;
        }
        form {
            font-size: x-large;
            font-weight: bolder;
        }
        .field {
            clear: both;
            overflow: hidden;
            text-align: left;
            vertical-align: middle;
            font-size: x-large;
            font-weight: bolder;
            margin-top: 10px;
        }
        .field label {
            float: left;
            line-height: 32px;
            text-align: right;
            width: 164px;
            font-size: x-large;
            font-weight: bold;
        }
        .input-text {
            border: 1px solid wheat;
            float: left;
            height: 26px;
            line-height: 26px;
            margin-right: 3px;
            padding: 3px;
            vertical-align: middle;
            width: 230px;
        }
        #btnFor {
            margin-left: 250px;
            margin-top: 15px;
            font-size:18px;
            font-weight:small;
        }
        #modifyRate {
            margin-left: 250px;
            margin-top: 15px;
            font-size:18px;
            font-weight:small;
        }
        
        #firstHid {
            display: none;
        }
        #twoHid {
            display: block;
            margin-left: 130px;
        }
         .ipt {
            text-align: center;
        }

        .Ipt {
            width: 100px;
        }
       #sub {
           margin-left: 500px;
           margin-top: 10px;
       }
       #sub1 {
           margin-left: 500px;
           margin-top: 10px;
       }
       #fileIpt {
       		display:none;
       }
       #fileSubmit {
       		display:none;
       		margin-left:240px;
       		margin-top:10px;
       }
         .file-box1{ 
    		position:relative;
    		width:340px;
    		margin-top:-15px;
    		}
        .txtqd{ 
        	height:22px; 
        	border: 1px solid wheat;
        	width:230px;
        	border-right:none;
        	height:26px;
        	margin-top:20px;
        }
        .btnqd{ 
        	background-color:#FFF;
            border:1px solid #CDCDCD;
            height:26px; 
            width:70px;
            margin-left:230px;
            margin-top:-26px;
            font-weight:small;
        }
        .fileqd{ 
			margin-top:-20px;
            right:80px; 
            height:24px; 
            filter:alpha(opacity:0);
            opacity: 0;
            width:260px;
            margin-left:30px;
            
          } 
        #btn0 {
        	font-size:12px;
        	font-weight:small;
        } 
        #btnfir {
			width: 100px;
			height: 33px;
			font-family: "Georgia", "Times New Roman", sans-serif;
			font-weight: bolder;
			font-size:12px;
			margin-left:263px;
			margin-top:-33px;
		}

		#btnsec {
			width: 100px;
			height: 33px;
			font-family: "Georgia", "Times New Roman", sans-serif;
			font-weight: bolder;
			font-size:12px;
			margin-left:365px;
			margin-top:-33px;
		}
		#fir {
			display:none;
			width:900px;
			height:200px;
			
		} 
		#sec {
			display:none;
			width:900px;
			height:200px;
			
			
		}
    </style>

<!--JS FILES -->
	 <script type="text/javascript">
            $(document).ready(function(){
            $(".pane-list li").click(function(){
            window.location=$(this).find("a").attr("href");return false;
        });
    
    }); //close doc ready
    </script>
    <script type="text/javascript">
        window.onload = function() {
            document.getElementById("clickOne").onmouseover = function () {
                document.getElementById("prod_wrapper").style.display = "block";
                document.getElementById("two").style.display = "none";
        	  };
            document.getElementById("change").onclick = function () {
                document.getElementById("firstHid").style.display = "block";
                document.getElementById("twoHid").style.display = "none";
            };
           /*  document.getElementById("fileBtn").onclick = function() {
            	document.getElementById("fileIpt").style.display = "block";
            	document.getElementById("fileSubmit").style.display = "block";
            }; */
 			/* document.getElementById("btnfir").onclick = function() {
 				document.getElementById("prod_wrapper").style.display = "none";
 			} */
 			/* document.getElementById("btnsec").onclick = function() {
 				
 				document.getElementById("fir").style.display = "none";
 				document.getElementById("sec").style.display = "block";
 			} */
 			document.getElementById("inputGroupSuccess3").onfocus = function() {
 				document.getElementById("fir").style.display = "none";
 				document.getElementById("sec").style.display = "none";
 			};
        };
    </script>
    

	<!--<script src="js/jquery.tools.min.js" type="text/javascript"></script>--> 
        
    <script type="text/javascript">
        $(function() {
        $("#prod_nav ul").tabs("#panes > div", {effect: 'fade', fadeOutSpeed: 400});
    });
    </script>
    
    <script type="text/javascript">
            $(document).ready(function(){
            $(".pane-list li").click(function(){
            window.location=$(this).find("a").attr("href");return false;
        });
    
    }); //close doc ready
    </script>
    
    <script type="text/javascript">
	function searchShop() {
		document.getElementById("prod_wrapper").style.display = "none";
		document.getElementById("iFrom").action="adm_searchShops.do";
		document.getElementById("iFrom").submit();
	}
</script>
  <script type="text/javascript">
	function searchPerson() {
		document.getElementById("iFrom").action="adm_searchPersons.do";
		document.getElementById("iFrom").submit();
	}
</script>
<script type="text/javascript">
	function heheButton() {
	 	document.getElementById("fileIpt").style.display = "block";
      	document.getElementById("fileSubmit").style.display = "block";
	}
</script>
     </head>


   <div class="header">
   
    <!-- Logo/Title -->
   
    <div>
    <div id="site_title"><a href="return.do">
        <img src="img/logo.png" alt="My Site Title" /></a>
    </div> 
      <div style="float:right; margin-top:50px; margin-bottom:-20px; font-size:15px; color:red; ">
    	Administrator
    	&nbsp;&nbsp;&nbsp;
    	<a href="adm_loginOut.do">exit</a>
    	<br>${msg}
    </div> 
    	
    </div>
        
    <!-- Main Menu -->
    
    <ol id="menu">
               <li id="clickOne" ><a href="adm_login.do?username=${sessionScope.admInfo.id}&password=${sessionScope.admInfo.password}" id="login" style="float:right" >Refresh</a>
        </li>
    </ol>
    <form class="form-inline" id="iFrom"  method="get" action="">
        <div class="form-group has-success has-feedback">
            <!--<input type="text" class="form-control" id="inputSuccess4" aria-describedby="inputSuccess4Status">-->
            <div class="input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-search"></span><!--这是加了一个搜素图标-->
                    </span>
                <input type="text" class="form-control" name="keyWord" size="17" 
                id="inputGroupSuccess3" aria-describedby="inputGroupSuccess3Status" placeholder="keyword or telephone">
            </div>
           <input type="button" id="btnfir" value="SearchShop"  onclick="searchShop()"/>
            <input type="button" id="btnsec" value="SearchPerson"  onclick="searchPerson()"/>
        </div>
    </form>
     
       </div> 
     
       
     <!-- END header -->
    <div id="container">
    	<div><c:if test="${not empty searchShops}">
    			 		<div class="well">
        								<table border="1">
                       					 <tr>
				                            <td>name</td>
				                            <td>Description</td>
				                            <td>IDPicture</td>
				                            <td>Operation</td>
				                            <td>Operation</td>
				                         </tr>
                   	
           							 <c:forEach items="${searchShops}" var="shop">
                       					 <tr>
				                            <td> ${shop.name}</td>
				                            <td> ${shop.description }</td>
				                            <td> <a href="adm_Sellerinfo.do?sellerID=${shop.sellerID}" target="_blank">check</a></td>
				                            <td ><a href="adm_disposeShopRequest.do?shopID=${shop.id}&status=1&reason='agree'"><input type="button" value="Agree"></a></td>
				                            <td colspan="2"><a href="adm_disposeShopRequest.do?shopID=${shop.id}&status=-1&reason='reject'"><input type="button" value="Refuse"></a></td>
				                         </tr>
									 </c:forEach>
									 </table>
        						</div>
    			</c:if>
    			<c:if test="${not empty searchCustomers or not empty searchSellers}">
    					<div class="well">
           							  <table border="1">
                       					 <tr>
				                            <td>PersonalId</td>
				                            <td>PersonalName</td>
				                            <td>Type</td>
				                            <td>Operation</td>
				                            <td>Operation</td>
				                         </tr>
           							 <c:forEach items="${searchCustomers}" var="Customer">
                       					 <tr>
				                            <td> ${Customer.telephone}</td>
				                            <td> ${Customer.name }</td>
				                            <td> Customer </td>
				                            <td> <a href="adm_deleteCustomer.do?telePhone=${Customer.telephone}"><input type="button" value="delete" ></a> </td>
				                            <td> <a href="adm_addBlackList.do?blackID=${Customer.telephone}&type=0"><input type="button" value="Black" ></a></td>
				                         </tr>
									 </c:forEach>
									 
									  <c:forEach items="${searchSellers}" var="Seller">
										
                       					 <tr>
				                            <td> ${Seller.telePhone}</td>
				                            <td> ${Seller.nickName}</td>
				                            <td> Seller </td>
				                            <td> <a href="adm_deleteSeller.do?telePhone=${Seller.telePhone}"><input type="button" value="delete" ></a> </td>
				                            <td> <a href="adm_addBlackList.do?blackID=${Seller.telePhone}&type=1"><input type="button" value="Black" ></a></td>
				                         </tr>
									 </c:forEach>
                   					 </table>
        						</div>
        						</c:if>
    	</div>
    	
<div id="prod_wrapper">
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">ModifyPassword</a></li>
            <li><a href="#tabs-2">ShopManage</a></li>
            <li><a href="#tabs-3">PersonManage</a></li>
            <li><a href="#tabs-5">ShopADManage</a></li>
            <li><a href="#tabs-6">ProductADManage</a></li>
            <li><a href="#tabs-8">Order</a> </li>
            <li><a href="#tabs-7">ModifyRate</a></li>
            <li><a href="#tabs-4">DBManage</a> </li>
            
        </ul>
         <div id="tabs-7">
					<form action="modifyRate.do" method="post">
						<div class="field">
							<label>
								<font size=3px;>Interest Rate:</font>
							</label>
							<input type="text" name="rate" value="${sessionScope.rate}" class="input-text" style="font-size:15px"/>
						</div>
					<div id="modifyRate" style="margin-left:120px;">
						<button type="submit" value="">
							Save
						</button>
						&nbsp;&nbsp;
						<button type="button" value="" onclick="location='admin.jsp'">
							Cancel
						</button>
					</div>
				</form>
		</div>
       <div id="tabs-1">
					<form action="adm_modifyPassword.do" method="post" id="frm1">
						<div class="field">
							<label>
								<font size=3px;>OldPassword:</font>
							</label>
							<input type="password" name="oldPassword"  class="input-text"
								id="oldpassword" style="font-size:15px"/>
						</div>
						<div class="field">
							<label>
								<font size=3px;>NewPassword:</font>
							</label>
							<input type="password" name="newPassword"  class="input-text"
								id="newpassword" style="font-size:15px"/>
						</div>
						<div class="field">
							<label>
								<font size=3px;>Confirm:</font>
							</label>
							<input type="password"  class="input-text"
								id="Confirmpassword" style="font-size:15px"/>
						</div>
					<div id="btnFor" style="margin-left:150px;">
						<button type="submit" value="">
							Save
						</button>
						&nbsp;&nbsp;
						<button type="button" value="" onclick="location='admin.jsp'">
							Cancel
						</button>
					</div>
				</form>
				</div>
        <div id="tabs-2">
        <div data-options="region:'center'" style="padding:10px">
                		<div id="numberAdd">
                   				<a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample2" aria-expanded="true" aria-controls="collapseExample">
        							Treated
   								 </a>
    						<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
       							    Untreated
   							 </button>
   							 <div class="collapse" id="collapseExample2">
        						<div class="well">
        								<table border="1">
                       					 <tr>
				                            <td>name</td>
				                            <td>Description</td>
				                            <td>modifyTime</td>
				                            <td>Status</td>
				                            <td>Operation</td>
				                         </tr>
                   	
           							 <c:forEach items="${sessionScope.treatedShops}" var="shop">
										<table border="1">
                       					 <tr>
				                            <td> ${shop.name }</td>
				                            <td> ${shop.description }</td>
				                            <td> ${shop.updateTime }</td>
				                            <c:choose>
                                            <c:when test="${shop.applyStatus== '-1'}">  
             								<td> rejected</td>
                                            </c:when>
                                            <c:otherwise> 
     										<td> passed</td>
          									</c:otherwise>
											</c:choose>
											<td ><a href="adm_deleteShop.do?id=${shop.id}"><input type="button" value="delete"></a></td>
				                         </tr>
                   					   </table>
									 </c:forEach>
									 </table>
        						</div>
    						</div>
    						<div class="collapse" id="collapseExample3">
        						<div class="well">
           							 <table border="1">
                       					 <tr>
				                            <td>name</td>
				                            <td>Description</td>
				                            <td>IDPicture</td>
				                            <td>Operation</td>
				                            <td>Operation</td>
				                         </tr>
                   					  
           							 <c:forEach items="${sessionScope.unTreatedShops}" var="shop">
										
                       					 <tr>
				                            <td> ${shop.name}</td>
				                            <td> ${shop.description }</td>
				                            <td> <a href="adm_Sellerinfo.do?sellerID=${shop.sellerID}">check</a></td>
				                            <td ><a href="adm_disposeShopRequest.do?shopID=${shop.id}&status=1&reason='agree'"><input type="button" value="Agree"></a></td>
				                            <td colspan="2"><a href="adm_disposeShopRequest.do?shopID=${shop.id}&status=-1&reason='reject'"><input type="button" value="Refuse"></a></td>
				                         </tr>
									 </c:forEach>
                   					   </table>
        						</div>
    						</div>
                   		 </div>
       					 </div>
			
				 </div>
		<div id="tabs-5">
					 <div data-options="region:'center'" style="padding:10px">
                		<div id="numberAdd">
                   				<a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample4" aria-expanded="true" aria-controls="collapseExample">
        							Treated
   								 </a>
    						<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
       							    UnTreated
   							 </button>
   							 <div class="collapse" id="collapseExample4" style="margin-left:-70px;">
        						<div class="well">
           							  <table border="1">
                       					 <tr>
				                            <td>ADNumber</td>
				                            <td>ShopID</td>
				                            <td>BidPrice(HK$)</td>
				                            <td>Status</td>
				                            <td>Operation</td>
				                         </tr>
                   					   
           							 <c:forEach items="${sessionScope.treatedShopAds}" var="shopAds">
                       					 <tr>
				                            <td> ${shopAds.id}</td>
				                            <td> ${shopAds.shopID }</td>
				                            <td> ${shopAds.price}</td>
				                            <c:choose>
                                            <c:when test="${shopAds.status== '-1'}">  
             								<td> rejected</td>
                                            </c:when>
                                            <c:when test="${shopAds.status== '1'}">  
             								<td> non-payment</td>
                                            </c:when>
                                            <c:otherwise> 
     										<td>paid</td>
          									</c:otherwise>
											</c:choose>
											<td ><a href="adm_deleteShopAds.do?id=${shopAds.id}"><input type="button" value="delete"></a></td>
				                         </tr>
									 </c:forEach>
									 <tr>
			 							<td colspan="4" ></td>
			 							<td > <a href="adm_deleteRejectedShopAds.do"><input type="button" value="Auto" style="width:70px;"></a></td>
			 						</tr>
                   					 </table>
        						</div>
    						</div>
    						<div class="collapse" id="collapseExample5" style="margin-left:-70px;">
        						<div class="well">
           							 <table border="1">
                       					  <tr>
				                            <td>ADNumber</td>
				                            <td>ShopID</td>
				                            <td>BidPrice(HK$)</td>
				                            <td>Operation</td>
				                            <td>Operation</td>
				                         </tr>
                   					   
           							  <c:forEach items="${sessionScope.unTreatedShopAds}" var="shopAds">
                       					 <tr>
				                            <td> ${shopAds.id}</td>
				                            <td> ${shopAds.shopID }</td>
				                            <td> ${shopAds.price}</td>
				                            <td ><a href="adm_dealShopAdsByHand.do?id=${shopAds.id}&status=1"><input type="button" value="Agree"></a></td>
				                            <td colspan="2"><a href="adm_dealShopAdsByHand.do?id=${shopAds.id}&status=-1"><input type="button" value="Refuse"></a></td>
				                         </tr>
									 </c:forEach>
									  <tr>
			 							<td colspan="4" ></td>
			 							<td > <a href="adm_dealShopAdsAuto.do"><input type="button" value="Auto" style="width:70px;"></a></td>
			 						 </tr>
                   					 </table>
        						</div>
    						</div>
                   				
                   		 </div>
          
       					 </div>
				</div>
				<div id="tabs-6">
					 <div data-options="region:'center'" style="padding:10px">
                		<div id="numberAdd">
                   				<a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample6" aria-expanded="true" aria-controls="collapseExample">
        							Treated
   								 </a>
    						<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample7" aria-expanded="false" aria-controls="collapseExample">
       							    UnTreated
   							 </button>
   							 <div class="collapse" id="collapseExample6" style="margin-left:-70px;">
        						<div class="well">
           							  <table border="1">
                       					 <tr>
				                            <td>ADNumber</td>
				                            <td>ProductID</td>
				                            <td>BidPrice(HK$)</td>
				                            <td>Status</td>
				                            <td>Operation</td>
				                         </tr>
                   					   
           							 <c:forEach items="${sessionScope.treatedProductAds}" var="productAds">
                       					 <tr>
				                            <td> ${productAds.id}</td>
				                            <td> ${productAds.productID }</td>
				                            <td> ${productAds.price}</td>
				                            <c:choose>
                                            <c:when test="${productAds.status== '-1'}">  
             								<td> rejected</td>
                                            </c:when>
                                            <c:when test="${productAds.status== '1'}">  
             								<td> non-payment</td>
                                            </c:when>
                                            <c:otherwise> 
     										<td>paid</td>
          									</c:otherwise>
											</c:choose>
											<td ><a href="adm_deleteProductAds.do?id=${productAds.id}"><input type="button" value="delete"></a></td>
				                         </tr>
									 </c:forEach>
									 <tr>
			 							<td colspan="4" ></td>
			 							<td > <a href="adm_deleteRejectedProductAds.do"><input type="button" value="Auto" style="width:70px;"></a></td>
			 						</tr>
                   					 </table>
        						</div>
    						</div>
    						<div class="collapse" id="collapseExample7" style="margin-left:-70px;">
        						<div class="well">
           							 <table border="1">
                       					  <tr>
				                            <td>ADNumber</td>
				                            <td>ShopID</td>
				                            <td>BidPrice(HK$)</td>
				                            <td>Operation</td>
				                            <td>Operation</td>
				                         </tr>
                   					   
           							  <c:forEach items="${sessionScope.unTreatedProductAds}" var="productAds">
                       					 <tr>
				                            <td> ${productAds.id}</td>
				                            <td> ${productAds.productID }</td>
				                            <td> ${productAds.price}</td>
				                            <td ><a href="adm_dealProductAdsByHand.do?id=${productAds.id}&status=1"><input type="button" value="Agree"></a></td>
				                            <td colspan="2"><a href="adm_dealProductAdsByHand.do?id=${productAds.id}&status=-1"><input type="button" value="Refuse"></a></td>
				                         </tr>
									 </c:forEach>
									  <tr>
			 							<td colspan="4" ></td>
			 							<td > <a href="adm_dealProductAdsAuto.do"><input type="button" value="Auto" style="width:70px;"></a></td>
			 						 </tr>
                   					 </table>
        						</div>
    						</div>
                   				
                   		 </div>
          
       					 </div>
				</div>
				<div id="tabs-3">
					 <div data-options="region:'center'" style="padding:10px">
                		<div id="numberAdd">
                   				<a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample1" aria-expanded="true" aria-controls="collapseExample">
        							Information
   								 </a>
    						<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
       							 Blacklist
   							 </button>
   							 <div class="collapse" id="collapseExample1" style="margin-left:-70px;">
        						<div class="well">
           							  <table border="1">
                       					 <tr>
				                            <td>PersonalId</td>
				                            <td>PersonalName</td>
				                            <td>Type</td>
				                            <td>Operation</td>
				                            <td>Operation</td>
				                         </tr>
           							 <c:forEach items="${customers}" var="Customer">
                       					 <tr>
				                            <td> ${Customer.telephone}</td>
				                            <td> ${Customer.name }</td>
				                            <td> Customer </td>
				                            <td> <a href="adm_deleteCustomer.do?telePhone=${Customer.telephone}"><input type="button" value="delete" ></a> </td>
				                            <td> <a href="adm_addBlackList.do?blackID=${Customer.telephone}&type=0"><input type="button" value="Black" ></a></td>
				                         </tr>
									 </c:forEach>
									 
									  <c:forEach items="${sellers}" var="Seller">
										
                       					 <tr>
				                            <td> ${Seller.telePhone}</td>
				                            <td> ${Seller.nickName}</td>
				                            <td> Seller </td>
				                            <td> <a href="adm_deleteSeller.do?telePhone=${Seller.telePhone}"><input type="button" value="delete" ></a> </td>
				                            <td> <a href="adm_addBlackList.do?blackID=${Seller.telePhone}&type=1"><input type="button" value="Black" ></a></td>
				                         </tr>
									 </c:forEach>
                   					 </table>
        						</div>
    						</div>
    						<div class="collapse" id="collapseExample" style="margin-left:-70px;">
        						<div class="well">
           							 <table border="1">
                       					 <tr>
				                            <td>BlackListId</td>
				                            <td>PersonalId</td>
				                            <td>PersonalName</td>
				                            <td>Type</td>
				                            <td>Operation</td>
				                         </tr>
                   					   
           							 <c:forEach items="${customersOnBlack}" var="CustomerBlack">
										
                       					 <tr>
				                            <td> ${CustomerBlack.id}</td>
				                            <td> ${CustomerBlack.telephone}</td>
				                            <td> ${CustomerBlack.name }</td>
				                            <td> Customer </td>
				                            <td> <a href="adm_removeBlackList.do?blackId=${CustomerBlack.telephone}&type=0"><input type="button" value="Remove" ></a></td>
				                         </tr>
									 </c:forEach>
                       				 <c:forEach items="${sellersOnBlack}" var="SellerBlack">
                       					 <tr>
				                            <td> ${SellerBlack.id}</td>
				                            <td> ${SellerBlack.telePhone}</td>
				                            <td> ${SellerBlack.nickName}</td>
				                            <td> Seller </td>
				                            <td> <a href="adm_removeBlackList.do?blackId=${SellerBlack.telePhone}&type=1"><input type="button" value="Remove" ></a></td>
				                         </tr>
									 </c:forEach>
                   					 </table>
        						</div>
    						</div>
                   				
                   		 </div>
          
       					 </div>
				</div>
				<div id="tabs-4">
					<form action="adm_restoreDB.do" method="post" enctype="multipart/form-data">
					<!-- 数据保存-->
					<a href="adm_backupDB.do"><button type="button" value="BackUp" name="BackUp" class="btn btn-primary" style="font-size:9px;">BackUp</button></a>
					&nbsp;&nbsp;
					<button type="button" value="" id="fileBtn" class="btn btn-primary" style="font-size:9px;" onclick="heheButton()">
						Restore
					</button>
					<div id="fileIpt">
     						 <input type='text' name='textfield' id='textfield' class='txtqd'  style="font-size:9px;"/>
       						 <input type='button' class='btnqd' value='choose' id="btnO" class="btn btn-primary" style="font-size:9px;"/>
    						 <input type="file" name="databaseFile" class="fileqd" id="fileField" size="28" onchange="document.getElementById('textfield').value=this.value"  accept="application/sql"/>
					</div>
					<input type="submit" id="fileSubmit" name="submit" value="submit" class="btn btn-primary" style="font-size:9px;"/>
					</form>
				</div>
				<div id="tabs-8">
						<div class="well" style="margin-left:-100px;margin-top:30px;width:680px;">
        				<table border="1">
								<tr style="color:black">
			                           <td>ID</td>
			                           <td>Name</td>
			                           <td>Amount</td>
			                           <td>TotalPrice</td>
			                            <td>Status</td>
			                           <td>Trading 	Profits</td>
			                    </tr>
			              					   
			      			<c:forEach items="${sessionScope.adminOrders}" var="product">
			                  		<tr>
			                           <td> ${product.id}</td>
			                           <td>  ${product.productName}</td>
			                           <td> ${product.productCount}</td>
			                           <td> ${product.totalPrice }</td>
			                           <c:choose>
                                            <c:when test="${product.status== '0'}">  
             								<td> non-payment</td>
             								 <td> --</td>
                                            </c:when>
                                            <c:when test="${product.status== '1'}">  
             								<td> Paid</td>
             								 <td> ${product.adminPrice }</td>
                                            </c:when>
                                              <c:when test="${product.status== '2'}">  
             								<td> Delivered</td>
             								 <td> ${product.adminPrice }</td>
                                            </c:when>
                                            <c:otherwise> 
     										<td>Received</td>
     										 <td> ${product.adminPrice }</td>
          									</c:otherwise>
										</c:choose>
			                        </tr>
							</c:forEach>
						</table>
					</div>
				</div>
				
			</div>
</div><!-- END prod wrapper -->
</div><!--End two-->
</div>
</div>
    <div id="footer">

    <!-- First Column -->

    <div class="one-fourth">
        <h3>Useful Links</h3>
            <ul class="footer_links">
                <li><a href="#">Baidu</a></li>
                <li><a href="#">Taobao</a></li>
                <li><a href="#">Jingdong</a></li>
                <li><a href="#">Xidian</a></li>
            </ul>
    </div>
    
    <!-- Second Column -->
    
    <div class="one-fourth">
       <h3>Our Partners</h3>
            <ul class="footer_links">
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Alibaba</a></li>
                <li><a href="#">IBM</a></li>
                <li><a href="#">Google</a></li>
            </ul>
    </div>
    
    <!-- Third Column -->
    
    <div class="one-fourth">
        <h3>Information</h3>
        If you have some question with us,you can call 8888-8888 or send an email to xidian@163.com.Thank you.
        <div id="social_icons">
        </div>
        
    </div>
    
    <!-- Fourth Column -->
    
    <div class="one-fourth last">
        <h3>Socialize</h3>
            <img src="img/icon_fb.png" alt="Facebook">
            <img src="img/icon_twitter.png" alt="Facebook">
            <img src="img/icon_in.png" alt="Facebook">
    </div>

    <div style="clear:both"></div>
    
    </div> <!-- END footer -->

</body>
</html>

</body>
</html>