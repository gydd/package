<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<head>

<title>PARKnSHOP-user</title>
<meta name="keywords" content="create from keywords">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- CSS Files -->

<link rel="stylesheet" type="text/css" media="screen" href="style.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="menu/css/simple_menu.css">
<!--<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>-->
<link rel="stylesheet" href="css/jquery-ui.css">
<script type="text/javascript" src="jquery-1.9.1/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.css" />
<script src="bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript">
function addDay(dayNumber, date) {
        date = date ? date : new Date();
        var ms = dayNumber * (1000 * 60 * 60 * 24)
        var newDate = new Date(date.getTime() + ms);
        return newDate;
    }
var time_now_server,time_now_client,time_end,time_server_client,timerID;
//结束时间
var date2=addDay(10);
time_end=date2;
time_end=time_end.getTime();
//开始的时间:如果不填入时间日期默认为当前的日期时间
time_now_server=new Date;
time_now_server=time_now_server.getTime();
  
time_now_client=new Date();
time_now_client=time_now_client.getTime();
  
time_server_client=time_now_server-time_now_client;
  
setTimeout("show_time()",1000);
//显示时间函数
function show_time()
{
 var timer = document.getElementById("timer");
 if(!timer){
 return ;
 }
 timer.innerHTML =time_server_client;
  
 var time_now,time_distance,str_time;
 var int_day,int_hour,int_minute,int_second;
 var time_now=new Date();
 time_now=time_now.getTime()+time_server_client;
 time_distance=time_end-time_now;
 if(time_distance>0)
 {
 int_day=Math.floor(time_distance/86400000)
 time_distance-=int_day*86400000;
 int_hour=Math.floor(time_distance/3600000)
 time_distance-=int_hour*3600000;
 int_minute=Math.floor(time_distance/60000)
 time_distance-=int_minute*60000;
 int_second=Math.floor(time_distance/1000)
  
 if(int_hour<10){
  int_hour="0"+int_hour;
 }
 if(int_minute<10){
  int_minute="0"+int_minute;
 }
 if(int_second<10){
  int_second="0"+int_second;
 }
  
 str_time=int_day+"day"+int_hour+"hour"+int_minute+"min"+int_second+"sec";
 timer.innerHTML=str_time;
 setTimeout("show_time()",1000);
  
 }
 else
 {
  
 timer.innerHTML =timer.innerHTML;
 clearTimeout(timerID)
 window.location.href="index.jsp";
 }
}
</script>



<script>
	$(function() {
		$("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
		$("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
		$("#sub").click(
				function() {
					$(
							'<tr><td>' + $("#btn1").val() + '</td><td>'
									+ $("#btn2").val() + '</td><td>'
									+ $("#btn3").val() + '</td><td>'
									+ $("#btn4").val() + '</td></tr>')
							.appendTo("#tbo");
				});
		$("#sub2").click(
				function() {
					$(
							'<tr><td>' + $("#btn5").val() + '</td><td>'
									+ $("#btn6").val() + '</td><td>'
									+ $("#btn7").val() + '</td><td>'
									+ $("#btn8").val() + '</td></tr>')
							.appendTo("#tbo1");
				});
	});
</script>

<style type="text/css">
#login {
	float: right;
}

.ui-tabs-vertical {
	width: 60em;
}

.ui-tabs-vertical .ui-tabs-nav {
	padding: .2em .1em .2em .2em;
	float: left;
	width: 12em;
}

.ui-tabs-vertical .ui-tabs-nav li {
	clear: left;
	width: 100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical .ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
	padding-bottom: 0;
	padding-right: .1em;
	border-right-width: 1px;
	border-right-width: 1px;
}

.ui-tabs-vertical .ui-tabs-panel {
	padding: 1em;
	float: right;
	width: 40em;
}

#prod_wrappera {
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
	margin-left: 150px;
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

.ipt1 {
	text-align: center;
}

.Ipt {
	width: 100px;
}

#sub {
	margin-left: 500px;
	margin-top: 10px;
}

#sub2 {
	margin-left: 500px;
	margin-top: 10px;
}

#numberAdd {
	margin-left: -50px;
}
</style>

<!--JS FILES -->
<script type="text/javascript">
	$(document).ready(function() {
		$(".pane-list li").click(function() {
			window.location = $(this).find("a").attr("href");
			return false;
		});

	}); //close doc ready
</script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById("clickOne").onmouseover = function() {
			document.getElementById("prod_wrappera").style.display = "block";
			document.getElementById("two").style.display = "none";
		};
		document.getElementById("change").onclick = function() {
			document.getElementById("firstHid").style.display = "block";
			document.getElementById("twoHid").style.display = "none";
		}
	}
</script>


<!--<script src="js/jquery.tools.min.js" type="text/javascript"></script>-->

<script type="text/javascript">
	$(function() {
		$("#prod_nav ul").tabs("#panes > div", {
			effect : 'fade',
			fadeOutSpeed : 400
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".pane-list li").click(function() {
			window.location = $(this).find("a").attr("href");
			return false;
		});

	}) //close doc ready
</script>

 <script type="text/javascript">
	function payOrder(id) {
		document.getElementById("payOrderID").value=id;
	}
</script>
<script type="text/javascript">
	function payOrder2(id,amount) {
		document.getElementById("payOrderID2").value=id;
		document.getElementById("modifyAmount").value=amount;
	}
</script>
</head>


<div class="header">

	<!-- Logo/Title -->

	<div>
		<div id="site_title">
			<a href="return.do"> <img src="img/logo.png" alt="My Site Title" /></a>
		</div>
		<div
			style="float:right; margin-top:50px; margin-bottom:-20px; font-size:15px; color:red; ">
			${sessionScope.cusInfo.name} &nbsp;&nbsp;&nbsp;
			<a href="cus_logOut.do">exit</a> <br>${msg}
		</div>


	</div>

	<!-- Main Menu -->

	<ol id="menu">
		<li class="active_menu_item"><a href="return.do"
			style="color:#FFF">Home</a></li>


		<li><a href="contact.jsp">Contact</a></li>

		<li id="clickOne"><a href="cus_login.do?telephone=${sessionScope.cusInfo.telephone}&password=${sessionScope.cusInfo.password}" id="login"
			style="float:right">Refresh</a></li>
	</ol>
</div>


<!-- END header -->

<div id="container">
	<div id="prod_wrappera">
		<div id="tabs">
			<ul>
				<li><a href="#tabs-5">ModifyPassword</a></li>
				<li><a href="#tabs-1">Information</a></li>
				<li><a href="#tabs-3">Address</a></li>
				<li><a href="#tabs-2">ShoppingCart</a></li>
				<li><a href="#tabs-4">Favorite</a></li>
				<li><a href="#tabs-Order">Order</a></li>
			</ul>
			<div id="tabs-5">
				<form action="cus_modifyPassword.do" method="post">
					<div class="field">
						<input type="hidden" name="telephone"
							value="${sessionScope.cusInfo.telephone}" />
							 <label><font size=3px;>OldPassword: </font></label> 
							 <input type="password" name="oldPassword"
							class="input-text" id="oldpassword"  style="font-size:15px"/>
					</div>
					<div class="field">
						<label><font size=3px;>NewPassword:</font></label> <input type="password"
							name="newPassword" class="input-text" id="newpassword"  style="font-size:15px"/>
					</div>
					<div class="field">
						<label> <font size=3px;>Confirm: </font></label> <input type="password" class="input-text"
							id="Confirmpassword" style="font-size:15px"/>
					</div>
					<div id="btnFor" >
						<button type="submit" value="">Save</button>
						&nbsp;&nbsp;
						<button type="button" value="" onclick="location='user.jsp'">
							Cancel</button>
					</div>
				</form>
			</div>
			<div id="tabs-1">
				<form action="cus_modifyInformation.do" method="post" id="frm">
					<div id="firstHid">
						<div class="field">
							<label><font size=3px;>Name:</font></label> <input type="text" name="name"
								value="${sessionScope.cusInfo.name}" class="input-text"
								id="txt1" style="font-size:15px" /> <input type="hidden" name="telephone"
								value="${sessionScope.cusInfo.telephone}" style="font-size:15px" />
						</div>
						<div class="field">
							<label><font size=3px;>Address</font></label> <input type="text" name="address"
								value="${sessionScope.cusInfo.address}" class="input-text"
								id="txt3" style="font-size:15px"/>
						</div>
						<div class="field">
							<label><font size=3px;>Email</font></label> <input type="text" name="e_mail"
								value="${sessionScope.cusInfo.e_mail}" class="input-text" id="" style="font-size:15px" />
						</div>
						<div id="btnFor">
							<button type="submit" value="">Save</button>
							&nbsp;&nbsp;
							<button type="button" value="" onclick="location='user.jsp'">Cancel</button>
							&nbsp;&nbsp;
						</div>

					</div>
					<div id="twoHid">
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name:&nbsp;${sessionScope.cusInfo.name}</label><br>
						<!--后端传-->
						<label>Telephone:&nbsp;${sessionScope.cusInfo.telephone}</label><br>
						<label>&nbsp;&nbsp;&nbsp;Address:&nbsp;${sessionScope.cusInfo.address}</label><br>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email&nbsp;:${sessionScope.cusInfo.e_mail}</label>
						<div id="btnFor">
							<button type="button" value="" id="change">Modify</button>
						</div>
					</div>
				</form>

			</div>
			<div id="tabs-2">
				<div data-options="region:'center'" style="padding:10px">
					<div id="numberAdd">
					<table border="1">
							<tr>
								<td>Name</td>
								<td>Price</td>
								<td>Amount</td>
								<td>Stock</td>
								<td>Operation</td>
								<td>Operation</td>
							</tr>
							<c:forEach items="${carts}" var="cart" varStatus="index">
								<tr>
									<td>${cart.productName}</td>
									<td>${cart.productPrice}</td>
									<td>${cart.amount}</td>
									<td>${cart.productTotal}</td>
									<td><a href="cus_createOrder.do?createType=1&customerID=${sessionScope.cusInfo.telephone }&productID=${cart.productID}&productName=${cart.productName}&amount=${cart.amount}">
									<button type="button" class="btn btn-primary btn-lg" 
                           	style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; " >
                   			         Buy
                		             </button>
									</a></td>
									<td><a href="cus_deleteCart.do?id=${cart.id}">
									<button type="button" class="btn btn-primary btn-lg"
                           	      style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; " >
                   			         Delete
                		             </button>
									</a></td>
								</tr>
								
							</c:forEach>
						</table>
						
						
					</div>
				</div>

			</div>
			 <!-- Modal1 -->
    		<form action="cus_payOrder.do"  method="post">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                                    class="sr-only">Close</span></button>
                                     <h4 class="modal-title" id="myModalLabel">Pay</h4>
                        </div>
                        <div class="modal-body" >
                            <div>
                            	<img src="images/weixin.png" />
                            </div>
                            <div style="margin-left:275px; margin-top:-280px;" >
                            	<img src="images/zhifubao.png" />
                             </div>
                        </div>
                        <div class="modal-footer">
                             <input type="hidden" id="payOrderID" name="id" value="">
                            <button type="reset" class="btn btn-default" data-dismiss="modal" id="motel">Cancel</button>
                            <button type="submit" class="btn btn-primary">Done</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            <!-- Modal2 -->
            <form action="cus_modifyOrderAmount.do"  method="post">
            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                                    class="sr-only">Close</span></button>
                                     <h4 class="modal-title" id="myModalLabel">Modify  Amount</h4>
                        </div>
                       
                        <div class="modal-footer">
                            <input type="hidden" id="payOrderID2" name="id" value="">
                             <input type="text" id="modifyAmount" name="number" onkeyup="this.value=this.value.replace(/\D/g, '')">
                            <button type="reset" class="btn btn-default" data-dismiss="modal" id="motel">Cancel</button>
                            <button type="submit" class="btn btn-primary">Done</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
			<div id="tabs-Order">
				<div data-options="region:'center'" style="padding:10px">
					<div>
						<a class="btn btn-primary" role="button" data-toggle="collapse"
							href="#collapseExample1" aria-expanded="true"
							aria-controls="collapseExample"> unpaid </a>
						<button class="btn btn-primary" type="button"
							data-toggle="collapse" data-target="#collapseExample"
							aria-expanded="false" aria-controls="collapseExample">
							paid</button>
					</div>

					<div class="collapse" id="collapseExample"
							style="width:680px; margin-left:-40px; ">
						<div class="well" style="margin-left:-70px;width:680px;">
        				<table border="1">
								<tr style="color:black">
			                           <td>Name</td>
			                           <td>Amount</td>
			                           <td>totalPrice</td>
			                           <td>status</td>
			                           <td>Remaining Time</td>
			                           <td>Operation</td>
			                    </tr>
			              					   
			      			<c:forEach items="${sessionScope.cusPaidOrders}" var="product">
			                  		<tr>
			                           <td> ${product.productName}</td>
			                           <td> ${product.productCount}</td>
			                           <td> ${product.totalPrice}</td>
			                            <c:choose>
                                            <c:when test="${product.status== '1'}">  
             								<td> paid</td>
             								<td>-- </td>
             								<td> --</td>
                                            </c:when>
                                            <c:when test="${product.status== '2'}">  
             								<td> Delivered</td>
             								<td><div id="timer"> </div> </td>
             								<td><a href="cus_changeOrderReceived.do?id=${product.id}"> 
			                             <button type="button" class="btn btn-primary btn-lg" 
                        	                  style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; ">
                   			              Confirm
                		                   </button></a></td>
                                            </c:when>
                                            <c:otherwise> 
     										<td>Received</td>
             								<td>--</td>
             								<td>--</td>
          									</c:otherwise>
											</c:choose>
			                        </tr>
							</c:forEach>
						</table>
					</div>
					</div>

					<div class="collapse" id="collapseExample1"
						style="width:680px; margin-left:-40px; ">
						<div class="well" style="margin-left:-70px;width:680px;">
        				<table border="1">
							<tr style="color:black">
			                           <td>id</td>
			                           <td>ProductName</td>
			                           <td>Amount</td>
			                           <td>TotalPrice</td>
			                           <td>Operation</td>
			                           <td>Operation</td>
			                    </tr>
			      			<c:forEach items="${sessionScope.cusUnpaidOrders}" var="product">
			                  		<tr>
			                           <td> ${product.id}</td>
			                           <td> ${product.productName}</td>
			                           <td><a href="javascript:payOrder2(${product.id},${product.productCount})"> 
			                           <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2"
                        	              style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; " id="firstBtn1"  >
                   			           ${product.productCount}
                		                   </button></a></td>
			                           <td> ${product.totalPrice }</td>
			                           <td><a href="javascript:payOrder(${product.id})"> 
			                           <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"
                        	              style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; " id="firstBtn1"  >
                   			           Pay
                		                   </button></a></td>
			                           <td> <a href="cus_deleteOrder.do?id=${product.id}">
			                           	 <button type="button" class="btn btn-primary btn-lg"
                        	              style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; ">
                   			          Delete
                		                   </button></a>
                		                   </td>
			                           </td>
			                        </tr>
							</c:forEach>
						</table>
					</div>
					</div>
				</div>
				</div>
			<div id="tabs-3">
				<form action="cus_addAddress.do" method="post">
						<div class="well" style="margin-left:-110px;margin-top:30px;width:700px;">
        				<table border="1" style="margin-left:0px;margin-top:30px;font-size:15px">
								<tr style="color:black">
								<tr>
									<td>Address</td>
									<td>Receiver</td>
									<td>Telephone</td>
									<td>isDefault</td>
									<td>Operation</td>
								</tr>
								<c:forEach items="${sessionScope.addresses}" var="li"
									varStatus="index">
									<tr>
										<td>${li.addressName}</td>
										<td>${li.customerName}</td>
										<td>${li.customerTelephone}</td>
										
										  <c:choose>
                                            <c:when test="${li.isDefault== '1'}">  
             								<td> YES</td>
             								<td> --</td>
                                            </c:when>
                                            <c:otherwise> 
     										<td><a href="cus_setDefaultAddress.do?addresssId=${li.id}&customerId=${sessionScope.cusInfo.telephone}">NO</a></td>
          									<td><a href="cus_deleteAddress.do?id=${li.id}&customerID=${sessionScope.cusInfo.telephone}">
										<button type="button" class="btn btn-primary btn-lg" 
                        	                    style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; " >
                   			                  Delete
                		                        </button>
										    </a></td>
          									</c:otherwise>
											</c:choose>
									</tr>
								</c:forEach>
								<tr>
									<td><input type="text" id="addname" name="addressName" placeholder="English" style="width:150px;">
									</td>
									<td><input type="text" id="recename" name="customerName" placeholder="English" style="width:60px;">
									</td>
									<td><input type="text" id="recetele" name="customerTelephone" placeholder="Numbers" style="width:100px;">
										<input type="hidden" name="customerId" value="${sessionScope.cusInfo.telephone}" />
									</td>
									<td> --</td>
									<td > <input type="submit" value="add"  class="btn btn-primary btn-lg"  style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; " ></td>
								</tr>
							</table>
						</div>
				</form>
			</div>
			<div id="tabs-4">

				<div data-options="region:'center'" style="padding:10px">
					<div>
						<a class="btn btn-primary" role="button" data-toggle="collapse"
							href="#collapseExample2" aria-expanded="true"
							aria-controls="collapseExample"> shop </a>
						<button class="btn btn-primary" type="button"
							data-toggle="collapse" data-target="#collapseExample3"
							aria-expanded="false" aria-controls="collapseExample">
							product</button>
					</div>

					<div class="collapse" id="collapseExample2"
						style="width:680px; margin-left:-100px; ">
						<div class="well">
							<div data-options="region:'center'" style="padding:10px">
								<div id="numberAdd" style="margin-left:-10px;">
									<table border="1">
										<tr>
											<td>Name</td>
											<td>Description</td>
											<td>Telephone</td>
											<td>Operation</td>
											<td>Operation</td>
										</tr>
										<c:forEach items="${shopFavs}" var="li" varStatus="index">
											<tr>
												<td>${li.name }</td>
												<td>${li.description}</td>
												<td>${li.sellerID}</td>
												<td><a href="cus_goShop.do?shopID=${li.sellerID}" target="_blank">
													<button type="button" class="btn btn-primary btn-lg"
                        	              style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; " >
                   			           Go
                		                   </button>
												</a></td>
												<td><a href="cus_removeFavorite.do?customerID=${sessionScope.cusInfo.telephone}&favID=${li.id}&type=1">
												<button type="button" class="btn btn-primary btn-lg" 
                        	              style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; " >
                   			           Delete
                		                   </button>
												</a></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="collapse" id="collapseExample3"
						style="width:680px; margin-left:-100px; ">
						<div class="well">
							<div id="numberAdd" style="margin-left:-10px;">
								<table border="1">
							<tr>
								<td>Name</td>
								<td>Price</td>
								<td>Stock</td>
								<td>Sales</td>
								<td>Operation</td>
							</tr>
							<c:forEach items="${productFavs}" var="cart" varStatus="index">
								<tr>
									<td><a href="cus_getProduct.do?id=${cart.id}">${cart.name}</a></td>
									<td>${cart.price}</td>
									<td>${cart.total}</td>
									<td>${cart.selled}</td>
									<td><a href="cus_removeFavorite.do?customerID=${sessionScope.cusInfo.telephone}&favID=${cart.id}&type=0">
									<button type="button" class="btn btn-primary btn-lg" 
                        	              style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; background-color:white; color:black; ">
                   			           Delete
                		                   </button>
									</a></td>
								</tr>
							</c:forEach>
								</table>

							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- END container -->
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
		If you have some question with us,you can call 8888-8888 or send an
		email to xidian@163.com.Thank you.
		<div id="social_icons"></div>

	</div>

	<!-- Fourth Column -->

	<div class="one-fourth last">
		<h3>Socialize</h3>
		<img src="img/icon_fb.png" alt="Facebook"> <img
			src="img/icon_twitter.png" alt="Facebook"> <img
			src="img/icon_in.png" alt="Facebook">
	</div>

	<div style="clear:both"></div>

</div>
<!-- END footer -->

</body>
</html>

</body>
</html>