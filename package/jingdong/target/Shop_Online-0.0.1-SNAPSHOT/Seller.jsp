<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<head>

    <title>PARKnSHOP-ShopOwner</title>
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
        #firstHid {
            display: none;
        }
        #applyPrice {
            display: none;
        }
        #applySubmit {
            display: none;
        }
        #twoHid {
            display: block;
            margin-left: 130px;
        }#modifyPassword {
            margin-left: 150px;
            margin-top: 15px;
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
       .file-box1{ 
    		position:relative;
    		width:340px;
    		margin-left:160px;
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
    	#btnFo {
    		font-size:18px;
    		font-weight:small;
    	}
    	#btnFo1 {
    		font-size:18px;
    		font-weight:small;
    	}
    	#btnTwo {
    		font-size:18px;
    		font-weight:small;
    		margin-left:180px;
    		margin-top:15px;
    	}
    	#btnForMove {
    		font-size:18px;
    		font-weight:small;
    		margin-left:180px;
    		margin-top:15px;
    	}
    	#modifyPassword {
    		font-size:18px;
    		font-weight:small;
    	}
    	#textfield {
    		font-size:18px;
    		font-weight:small;
    	}
    	#textfield1 {
    		font-size:18px;
    		font-weight:small;
    		
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
            }
            document.getElementById("applyShopAds").onclick = function () {
                document.getElementById("applyPrice").style.display = "block";
                document.getElementById("applySubmit").style.display = "block";
            }
        };
    </script>
    
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
	function payOrder(id) {
		document.getElementById("payOrderID").value=id;
	}
</script>
</head>

<body>
   <div class="header">
   
    <!-- Logo/Title -->
   
    <div>
    <div id="site_title"><a href="return.do">
        <img src="img/logo.png" alt="My Site Title" /></a>
    </div> 
      <div style="float:right; margin-top:50px; margin-bottom:-20px; font-size:15px; color:red; ">
      	
    	${sessionScope.selInfo.nickName}
    	&nbsp;&nbsp;&nbsp;
    	<a href="sel_loginOut.do">exit</a>
    	<br>${msg}
    </div> 
    </div>
        
    <!-- Main Menu -->
    
    <ol id="menu">
             <li class="active_menu_item"><a href="return.do" style="color:#FFF">Home</a> </li>
               <li><a href="contact.jsp">Contact</a></li>
               <li id="clickOne" ><a href="sel_login.do?telePhone=${sessionScope.selInfo.telePhone}&password=${sessionScope.selInfo.password}" id="login" style="float:right" >Refresh</a>
        </li>
    </ol>
    
     
       </div> 
     
     <!-- END header -->

    <div id="container">



<div id="prod_wrapper">
    <div id="tabs">
        <ul>
            <li><a href="#tabs-4">ModifyPassword</a></li>
            <li><a href="#tabs-2">ApplyShop</a></li>
             <li><a href="#tabs-1">ShopInformation</a></li>
            <li><a href="#tabs-3">ManageProducts</a></li>
            <li><a href="#tabs-5">Advertisement</a></li>
             <li><a href="#tabs-order">Order</a></li>
        </ul>
        <div id="tabs-5">
        <div data-options="region:'center'" style="padding:10px">
                		<div id="numberAdd">
                   				<a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample2" aria-expanded="true" aria-controls="collapseExample">
        							Shop
   								 </a>
    						<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
       							    Product
   							 </button>
   							 <div class="collapse" id="collapseExample2">
        						<div class="well">
        								<table border="1">
                       					<tr>
				                            <td>ADNumber</td>
				                            <td>ShopID</td>
				                            <td>BidPrice</td>
				                            <td>Status</td>
				                            <td>Operation</td>
				                         </tr>
                       					 <tr>
				                            <td> ${sessionScope.shopAds.id}</td>
				                            <td> ${sessionScope.shopAds.shopID}</td>
				                            <td> ${sessionScope.shopAds.price}</td>
				                            <c:choose>
                                            <c:when test="${sessionScope.shopAds.status== '-1'}">  
             								<td> rejected</td>
             								<td></td>
                                            </c:when>
                                            <c:when test="${sessionScope.shopAds.status== '1'}">  
             								<td> non-payment</td>
             								<td ><a href="sel_payForShopAds.do?id=${sessionScope.shopAds.id}"><input type="button" value="Pay"></a></td>
                                            </c:when>
                                            <c:when test="${sessionScope.shopAds.status== '0'}">  
             								<td>applying</td>
             								<td></td>
                                            </c:when>
                                            <c:when test="${sessionScope.shopAds.status== '2'}">  
             								<td>paid</td>
             								<td></td>
                                            </c:when>
                                            <c:otherwise> 
     										<td></td>
     										<td></td>
          									</c:otherwise>
											</c:choose>
				                         </tr>
									 </table>
        						</div>
    						</div>
    						<div class="collapse" id="collapseExample3">
        						<div class="well">
           							 <table border="1">
                       					 <tr>
				                            <td>id</td>
				                            <td>name</td>
				                            <td>status</td>
				                            <td>BidPrice</td>
				                            <td>Operation</td>
				                         </tr>
                   					  
           							 <c:forEach items="${sessionScope.productAds}" var="productAds">
										
                       					 <tr>
				                            <td> ${productAds.id}</td>
				                            <td> ${productAds.productName}</td>
				                            <c:choose>
                                            <c:when test="${productAds.status== '-1'}">  
             								<td> rejected</td>
             								<td><input type="text" name="price" value="${productAds.price}" size=6 readonly></td>
                                            <td></td>
                                            </c:when>
                                            <c:when test="${productAds.status== '1'}">  
             								<td> non-payment</td>
             								<td><input type="text" name="price" value="${productAds.price}" size=6 readonly></td>
				                            <td ><a href="sel_payForProductAds.do?id=${productAds.id}"><input type="button" value="Pay"></a></td>
                                            </c:when>
                                            <c:when test="${productAds.status== '0'}">  
             								<td>applying</td>
             								<td><input type="text" name="price" value="${productAds.price}" size=6 readonly></td>
             								<td></td>
                                            </c:when>
                                            <c:when test="${productAds.status== '2'}">  
             								<td>paid</td>
             								<td><input type="text" name="price" value="${productAds.price}" size=6 readonly></td>
             								<td></td>
                                            </c:when>
											</c:choose>
				                         </tr>
									 </c:forEach>
									 
									 <c:forEach items="${sessionScope.productNotAds}" var="product">
									  <form action="applyProductAds.do" method="get">
                       					 <tr>
                       					 	
				                            <td> ${product.id} <input type="hidden" name="sellerID" value="${product.sellerID}"></td>
				                            <td> ${product.name}<input type="hidden" name="productID" value="${product.id}"></td>
				                            <td> Not yet applied<input type="hidden" name="productName" value="${product.name}"></td>
				                            <td><input type="text" name="price" placeholder="Decimal" size=6></td>
				                            <td><input type="submit" name="submit" value="Apply"></td>
				                         </tr>
				                      </form>
									 </c:forEach>
                   				</table>
        						</div>
    						</div>
                   		 </div>
       					 </div>
			
				 </div>       
        <div id="tabs-4">
					<form action="sel_modifyPassword.do" method="post">
						<div class="field">
							<input type="hidden" name="telePhone" value="${sessionScope.selInfo.telePhone}"/>
							<label>
								<font size=3px;>OldPassword:</font>
							</label>
							<input type="password" name="oldPassword"  class="input-text"
								id="oldpassword"  style="font-size:12px;"/>
						</div>
						<div class="field">
							<label>
								<font size=3px;>NewPassword:</font>
							</label>
							<input type="password" name="newPassword"  class="input-text"
								id="newpassword" style="font-size:12px;"/>
						</div>
						<div class="field">
							<label>
								<font size=3px;>Confirm:</font>
							</label>
							<input type="password"  class="input-text"
								id="Confirmpassword" style="font-size:12px;"/>
						</div>
					<div id="modifyPassword">
						<button type="submit" value="">
							Save
						</button>
						&nbsp;&nbsp;
						<button type="button" value="" onclick="location='Seller.jsp'">
							Cancel
						</button>
					</div>
				</form>
				</div>
        <div id="tabs-1">
            <form action="sel_modifyShop.do" method="post" id="frm" enctype="multipart/form-data">
                <div id="firstHid">
                        <input type="hidden" name="id" value="${sessionScope.shopInfo.id}" class="input-text"/>
                  <div class="field">
                        <label style="font-size:18px;">ShopName:</label>
                        <input type="text" name="name" value="${sessionScope.shopInfo.name}" class="input-text"  style="font-size:12px;"/>
                    </div>
                    <div class="field">
                        <label style="font-size:18px;">Description:</label>
                        <input type="text" name="description" value="${sessionScope.shopInfo.description}" class="input-text"  style="font-size:12px;"/>
                    </div>
                	<div class="field">
                        <label style="font-size:18px;">ShopPicture:</label>
                        <div class="file-box1">
       							 <input type='text' name='textfield' id='textfield1' class='txtqd' style="font-size:12px;"/>
       							 <input type='button' class='btnqd' value='choose' id="btnFo1"  style="font-size:12px;"/>
     							 <input type="file" name="shopPicture" class="fileqd" id="fileField1" accept="image/*" size="20" onchange="document.getElementById('textfield1').value=this.value" />
						</div>
                      </div>
      				
                    <div id="btnTwo">
                        <button type="submit" value="">Save</button>&nbsp;&nbsp;
                        <button type="button" value="" onclick="location='Seller.jsp'">Cancel</button>&nbsp;&nbsp;
                    </div>
                </div>
                </form>
                <div id="twoHid" style="margin-left:-10px;">
                	<div id="btnFor" style="text-align:left;">
                        <label style="font-size:24px; color:gray;">ShopDetails&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <button type="button" value="" id="change" style="text-align:right;">Modify</button>
                    </div>
                    <label style="font-size:19px; color:gray;">shopName&nbsp;&nbsp;&nbsp;:&nbsp;${sessionScope.shopInfo.name}</label><br><!--后端传-->
                    <label style="font-size:18px; color:gray;">Description&nbsp;&nbsp;&nbsp;:&nbsp;${sessionScope.shopInfo.description}</label><br>
                    <c:choose>
                    <c:when test="${sessionScope.shopInfo.applyStatus== '-1'}">  
             		<label style="font-size:18px; color:gray;">ApplyStatus&nbsp;&nbsp;:&nbsp;Rejected</label>
                    </c:when>
                    <c:when test="${sessionScope.shopInfo.applyStatus== '1'}">  
             		<label style="font-size:18px; color:gray;">ApplyStatus&nbsp;&nbsp;:&nbsp;Passed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
             		<form action="sel_applyShopAds.do" method="post">
             		<table>
             		    <tr>
             		    <td><button type="button" id="applyShopAds" style="font-size:14px;color:gray;">Apply Ads</button></td>
             			<td><input type="hidden" name="shopID" value="${sessionScope.shopInfo.id}"></td>
             			<td><input type="text" name="price" placeholder="Your bidding(HK$)" id="applyPrice" size=14 style="font-size:14px; color:gray;"></td>
             			<td><input type="submit" name="submit" value="submit" id="applySubmit" style="font-size:14px; color:gray;"></td>
             			</tr>
             		</table>
             		</form>
                    </c:when>
                    <c:when test="${sessionScope.shopInfo.applyStatus== '0'}">  
             		<label style="font-size:18px; color:gray;">ApplyStatus&nbsp;&nbsp;:&nbsp;Applying</label>
                    </c:when>
                    <c:otherwise> 
     			    <label style="font-size:18px; color:gray;">ApplyStatus&nbsp;&nbsp;:&nbsp;You haven't applied yet</label>
          		    </c:otherwise>
				    </c:choose>
                </div>
        </div>
         <!-- Modal1 -->
    		<form action="sel_addProductTotal.do"  method="post">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                                    class="sr-only">Close</span></button>
                                     <h4 class="modal-title" id="myModalLabel">Add Stock</h4>
                        </div>
                       
                        <div class="modal-footer">
                             <input type="hidden" id="payOrderID" name="id" value="">
                             <input type="text" id="addStockValue" name="number" onkeyup="this.value=this.value.replace(/\D/g, '')">
                            <button type="reset" class="btn btn-default" data-dismiss="modal" id="motel">Cancel</button>
                            <button type="submit" class="btn btn-primary">Done</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        <div id="tabs-2">
          <form action="sel_applyShop.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="sellerID" value="${sessionScope.selInfo.telePhone}" class="input-text"/>
            <div class="field">
                <label><font size=3px;>name: </font></label>
                <input type="text" name="name" class="input-text"  style="font-size:12px;"/>
            </div>
            <div class="field">
                <label><font size=3px;>Description: </font></label>
                <input type="text" name="description" class="input-text"  style="font-size:12px;"/>
            </div>
            <div class="field">
                <label><font size=3px;>shopPicture:</font></label>
                <div class="file-box1">
        				<input type='text' name='textfield' id='textfield' class='txtqd'  style="font-size:12px;"/>
        				<input type='button' class='btnqd' value='choose' id="btnFo" style="font-size:12px;"/>
        				<input type="file" name="IDPicture" class="fileqd" id="fileField" accept="image/*" size="12dddxcsex" onchange="document.getElementById('textfield').value=this.value" />
				</div>
            </div>
            <div id="btnForMove">
                        <button type="submit" value="">Apply</button>&nbsp;&nbsp;
                        <button type="button" value="" onclick="location='Seller.jsp'">Cancel</button>&nbsp;&nbsp;
            </div>
            </form>
        </div>
        <div id="tabs-3">
        <form action="sel_addProduct.do" method="post" enctype="multipart/form-data">
               <div data-options="region:'center'" style="padding:10px">
                <div id="Address" style="margin-left:-100px; font-size:15px;">
                    <table border="1">
                        <tr>
                            <td>Name</td>
                            <td>Price</td>
                            <td>Stock</td>
                            <td>Sales</td> 
                            <td>ClassID</td> 
                            <td>Operation</td>     
                        </tr>
			    		<c:forEach items="${sessionScope.selProducts}" var="product" varStatus="index">
						<tr>
							<td> ${product.name} </td>
	                        <td> ${product.price } </td>
	                       <td><a href="javascript:payOrder(${product.id})"> 
			                           <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"
                        	              style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; " id="firstBtn1"  >
                   			          ${product.total } 
                		         </button></a></td>
							<td> ${product.selled }</td>
							<td> ${product.class_id }</td>
							<td><a href="sel_deleteProduct.do?id=${product.id}&sellerID=${product.sellerID}" >Delete</a></td>
	 					</tr>
						</c:forEach>
						<tr>
								<td> <input type="text" id="proname" name="name" placeholder="English" style="width:100px;">  </td>
                                <td> <input type="text" id="price" name="price" placeholder="Decimal" style="width:60px;" ><input type="hidden" name="sellerID" value="${sessionScope.selInfo.telePhone}"  style="width:60px;" > </td>
								<td> <input type="text" id="total" name="total" placeholder="Numbers" style="width:60px;" > </td>
								<td>-- <input type="hidden" id="selid" name="selled" value="0"  style="width:60px;" ></td>
								
								<td> <select name='class_id' style="width:60px;">
        							<option value='1'>TV& Home Theater</option>
       								<option value='2'>Computers & Tablets</option>
        							<option value='3'>Cell Phones</option>
        							<option value='4'>Cameras & Camcorders</option>
        							<option value='5'>Audio</option>
        							<option value='6'>Car Electronics & GPS</option>
								</select> 
								</td>
								<td> <input type="file" id="productPicture" name="productPicture" accept="image/*" value="picture" style="width:60px;" > </td>
			 			</tr>
			 			<tr>
			 				<td colspan="5" ></td>
			 				<td > <input type="submit" value="add" style="width:80px;"></td>
			 			</tr>
					</table>     
                </div>
        </div></form> 
    </div>
    
    <div id="tabs-order">
					<div class="well" style="margin-left:-110px;">
        				<table border="1">
							<tr style="color:black">
			                           <td>ID</td>
			                           <td>Name</td>
			                           <td>Amount</td>
			                           <td>TotalPrice</td>
			                           <td>status</td>
			                           <td>Operation</td>
			                    </tr>
			              					   
			      			<c:forEach items="${sessionScope.selOrders}" var="product">
			                  		<tr>
			                           <td> ${product.id}</td>
			                           <td> ${product.productName}</td>
			                           <td> ${product.productCount}</td>
			                           <td> ${product.totalPrice}</td>
			                            <c:choose>
                                            <c:when test="${product.status== '1'}">  
             								<td> paid</td>
             								<td><a href="sel_changeOrderDelivered.do?id=${product.id}"> 
			                             <button type="button" class="btn btn-primary btn-lg" 
                        	                  style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; ">
                   			             Send the goods
                		                   </button></a></td>
                                            </c:when>
                                            <c:when test="${product.status== '2'}">  
             								<td> Delivered</td>
             								<td> --</td>
                                            </c:when>
                                            <c:otherwise> 
     										<td>Received</td>
             								<td>--</td>
          									</c:otherwise>
											</c:choose>
			                        </tr>
							</c:forEach>
						</table>
					</div>
	</div>
<</div><!-- END prod wrapper -->
<!-- navigator -->
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
