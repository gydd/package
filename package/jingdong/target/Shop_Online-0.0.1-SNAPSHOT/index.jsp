<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
<%-- <base href="<%=basePath%>"> --%>
<title>PARKnSHOP -index</title>
<meta name="keywords" content="create from keywords">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- CSS Files -->

<link rel="stylesheet" type="text/css" media="screen" href="style.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="menu/css/simple_menu.css">
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.css" />
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="jzoom/jquery-2.2.3.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.js"></script>

<!-- JS Files -->

<!--<script type="text/javascript" src="js/jquery.min.js"></script>
-->
<script type="text/javascript" src="js/custom.js"></script>
<script type="text/javascript" src="js/slides/slides.min.jquery.js"></script>
<script type="text/javascript" src="js/cycle-slider/cycle.js"></script>
<script type="text/javascript"
	src="js/nivo-slider/jquery.nivo.slider.js"></script>
<script type="text/javascript" src="js/tabify/jquery.tabify.js"></script>
<script type="text/javascript"
	src="js/prettyPhoto/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="js/twitter/jquery.tweet.js"></script>
<script type="text/javascript" src="js/scrolltop/scrolltopcontrol.js"></script>
<script type="text/javascript" src="js/portfolio/filterable.js"></script>
<script type="text/javascript" src="js/modernizr/modernizr-2.0.3.js"></script>
<script type="text/javascript" src="js/easing/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="js/kwicks/jquery.kwicks-1.5.1.pack.js"></script>
<script type="text/javascript" src="js/swfobject/swfobject.js"></script>
<!-- FancyBox -->
<link rel="stylesheet" type="text/css"
	href="js/fancybox/jquery.fancybox.css" media="all">
<script type="text/javascript"
	src="js/fancybox/jquery.fancybox-1.2.1.js"></script>

<script type="text/javascript">
	function checkData() {
		var userId=f.username.value.toLowerCase();
		var password=f.password.value;
		if(!checkId(userId))
			return false;
		if(!checkPassword(password))
			return false;
		return true;
	}
</script>

<script type="text/javascript">
	function checkId(userId) {
		var nameError = document.getElementById("nameError");
		if (userId == "") {
			nameError.innerHTML = "<font color='red'>Not NULL！</fort>";
			f.userId.focus();
			return false;
		}
		nameError.innerHTML = "";
		return true;
	}
</script>

<script type="text/javascript">
	function checkPassword(password) {
		var passwordError = document.getElementById("passwordError");
		if (password == "") {
			passwordError.innerHTML = "<font color='red'>Not NULL！</fort>";
			f.password.focus();
			return false;
		}
		passwordError.innerHTML = "";
		return true;
	}
</script>

<script type="text/javascript">
	function searchByKeyword() {
		document.getElementById("iForm").submit();
	}
</script>
<script type="text/javascript">
	function sortByPrice() {
		document.getElementById("iFrom").action="cus_searchByPrice.do";
		document.getElementById("iForm").submit();
	}
</script>
<script type="text/javascript">
	function sortBySold() {
		document.getElementById("iFrom").action="cus_searchBySold.do";
		document.getElementById("iForm").submit();
	}
</script>


<style type="text/css">
#oneFir {
	display: inline;
	margin: 0 auto;
}

#one {
	width: 300px;
}

#two {
	width: 300px;
	margin-left: 312px;
	margin-top: -343px;
}

#three {
	width: 300px;
	margin-left: 625px;
	margin-top: -343px;
}

#twoSec {
	display: inline;
	margin: 0 auto;
}

#four {
	width: 300px;
}

#five {
	width: 300px;
	margin-left: 312px;
	margin-top: -343px;
}

#six {
	width: 300px;
	margin-left: 625px;
	margin-top: -376px;
}

#iFrom {
	margin-left: 30px;
	margin-top: 20px;
}

#btn {
	width: 65px;
	height: 33px;
	font-family: "Georgia", "Times New Roman", sans-serif;
	font-weight: bolder;
}

#btn1 {
	width: 100px;
	height: 33px;
	font-family: "Georgia", "Times New Roman", sans-serif;
	font-weight: bolder;
}

#btn2 {
	width: 100px;
	height: 33px;
	font-family: "Georgia", "Times New Roman", sans-serif;
	font-weight: bolder;
}

#site_title {
	margin-right: 28px;
}
</style>
</head>

<body>

	<div class="header">

		<!-- Logo/Title -->

		<div id="site_title">

			<img style="margin-right:100px;" class="btn btn-primary"
				data-toggle="modal" data-target=".bs-example-modal-sm"
				src="img/logo.png" alt="My Site Title" />
			<div class="modal fade bs-example-modal-sm" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div style="margin-left:25px;margin-top:15px;">
							<form action="adm_login.do" id="adminLogin" method="post">
								<input type="text" name="username" placeholder="Your IDnumber" style="width:250px; height:30px;"/><br>
								<input type="password" name="password" placeholder="Your password"
									style="width:250px; height:30px;" /><br> 
									<input type="submit" id="btn1" value="login"
										style="margin-top:5px; margin-left:80px; width:90px;height:30px;font-size:18px;font-weight:large; color:white; border-radius:5px; background-color:green;"/>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div style="float:right; margin-top:50px; margin-bottom:-20px; font-size:15px; color:black; ">
		<a href="cus_login.do?telephone=${sessionScope.cusInfo.telephone}&password=${sessionScope.cusInfo.password}">${sessionScope.cusInfo.name} &nbsp;&nbsp;&nbsp;</a> 
			 <br>
		</div>
		

		<!-- Main Menu -->

		<ol id="menu">
			<li><a href="return.do">Home</a></li>
			<li><a href="contact.jsp">Contact</a></li>
			<li><a href="login.jsp" id="login" style="float:right">login</a>
		</ol>
		<form class="form-inline" id="iFrom" method="post"
			action="cus_searchProduct.do">
			<div class="form-group has-success has-feedback">
				<div class="input-group">
					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-search"></span>
					<!--这是加了一个搜素图标-->
					</span> <input type="text" name="keyWord" value="${keyword}" class="form-control" id="inputGroupSuccess3"
						aria-describedby="inputGroupSuccess3Status" />
				</div>
				<button id="btn"  onclick = "searchByKeyword()">Search</button>
				<button id="btn1" onclick = "sortByPrice()">SortByPrice</button>
				<button id="btn2" onclick = "sortBySold()">SortBySold</button>
			</div>
		</form>
		
		
	</div>

	<!-- END header -->

	<div id="container">
		
		<div id="oneFir">
			
			<c:forEach  var="product" items="${products}" varStatus="index">
				<div id="one" style="float:left; margin-left:3px;">
					<div class="heading_bg">
						<h2>
							<a href="cus_getProduct.do?id=${product.id}">${product.name}</a>
						</h2>
					</div>
					<a href="cus_getProduct.do?id=${product.id}" ><img  width="300" height="150" src="cus_getProductPicture.do?id=${product.id}" alt="image description"/></a>
					<ul class="post_meta" style="margin:0">
						<li class="post_meta_comments"><a href="cus_getProduct.do?id=${product.id}">HK$: ${product.price}</a></li>
						<li class="post_meta_date"><a href="cus_goShop.do?shopID=${product.sellerID}">go to shop</a></li>
					</ul>
					<p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo
						dicit hoc. Tempore percussus ait est amet consensit cellula rei
						civibus in modo ad nomine.</p>
				</div>

			</c:forEach>

			<div id="one">
				<div class="heading_bg">
					<h2>
						<a href="cus_searchProductByClassID.do?classID=1">TV& Home Theater</a>
					</h2>
				</div>
				<a href="cus_searchProductByClassID.do?classID=1"><img src="img/demo/magazine1.jpg" alt="image description" /></a>
				<ul class="post_meta" style="margin:0">
					<li class="post_meta_Sold"><a href="#">Sold<%-- <%
						String num1 = (String) request.getAttribute("login-msg");
					%> --%></a></li>
					<li class="post_meta_date"><a href="#">Repertory<%--
						String num2 = (String) request.getAttribute("login-msg2");
					--%></a></li>
					<li class="post_meta_comments"><a href="#">HK$ 12</a></li>
				</ul>
				<p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo
					dicit hoc. Tempore percussus ait est amet consensit cellula rei
					civibus in modo ad nomine.</p>
			</div>

			<div id="two">
				<div class="heading_bg">
					<h2>
						<a href="cus_searchProductByClassID.do?classID=2">Computers & Tablets</a>
					</h2>
				</div>
				<a href="cus_searchProductByClassID.do?classID=2"><img src="img/demo/magazine2.jpg" alt="image description" /></a>
				<ul class="post_meta" style="margin:0">
					<li class="post_meta_Sold"><a href="#">Sold</a></li>
					<li class="post_meta_date"><a href="#">Repertory</a></li>
					<li class="post_meta_comments"><a href="#">HK$ 12</a></li>
				</ul>
				<p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo
					dicit hoc. Tempore percussus ait est amet consensit cellula rei
					civibus in modo ad nomine.</p>
			</div>

			<div id="three">
				<div class="heading_bg">
					<h2>
						<a href="cus_searchProductByClassID.do?classID=3">Cell Phones</a>
					</h2>
				</div>
				<a href="cus_searchProductByClassID.do?classID=3"><img src="img/demo/magazine3.jpg" alt="image description" /></a>
				<ul class="post_meta" style="margin:0">
					<li class="post_meta_Sold"><a href="#">Sold</a></li>
					<li class="post_meta_date"><a href="#">Repertory</a></li>
					<li class="post_meta_comments"><a href="#">HK$ 12</a></li>
				</ul>
				<p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo
					dicit hoc. Tempore percussus ait est amet consensit cellula rei
					civibus in modo ad nomine.</p>
			</div>

		</div>
		<!-- ######################## new line ######################## -->
		<div id="twoSec">
			<div id="four">
				<div class="heading_bg">
					<h2>
						<a href="cus_searchProductByClassID.do?classID=4">Cameras & Camcorders</a>
					</h2>
				</div>
				<a href="cus_searchProductByClassID.do?classID=4"><img src="img/demo/magazine4.jpg" alt="image description" /></a>
				<ul class="post_meta" style="margin:0">
					<li class="post_meta_Sold"><a href="#">Sold</a></li>
					<li class="post_meta_date"><a href="#">Repertory</a></li>
					<li class="post_meta_comments"><a href="#">HK$ 12</a></li>
				</ul>
				<p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo
					dicit hoc. Tempore percussus ait est amet consensit cellula rei
					civibus in modo ad nomine.</p>
			</div>

			<div id="five">
				<div class="heading_bg">
					<h2>
						<a href="cus_searchProductByClassID.do?classID=5">Audio</a>
					</h2>
				</div>
					<a href="cus_searchProductByClassID.do?classID=5"><img src="img/demo/magazine5.jpg" alt="image description" /></a>
				<ul class="post_meta" style="margin:0">
					<li class="post_meta_Sold"><a href="#">Sold</a></li>
					<li class="post_meta_date"><a href="#">Repertory</a></li>
					<li class="post_meta_comments"><a href="#">HK$ 12</a></li>
				</ul>
				<p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo
					dicit hoc. Tempore percussus ait est amet consensit cellula rei
					civibus in modo ad nomine.</p>
			</div>

			<div id="six">
				<div class="heading_bg">
					<h2>
						<a href="cus_searchProductByClassID.do?classID=6">Car Electronics & GPS</a>
					</h2>
				</div>
				<a href="cus_searchProductByClassID.do?classID=6"><img src="img/demo/magazine6.jpg" alt="image description" /></a>
				<ul class="post_meta" style="margin:0">
					<li class="post_meta_Sold"><a href="#">Sold</a></li>
					<li class="post_meta_date"><a href="#">Repertory</a></li>
					<li class="post_meta_comments"><a href="#">HK$ 12</a></li>
				</ul>
				<p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo
					dicit hoc. Tempore percussus ait est amet consensit cellula rei
					civibus in modo ad nomine.</p>
			</div>
		</div>
		<!-- shopAds -->
			<c:forEach  var="shop" items="${shopAdses}" varStatus="index">
				<div id="one" style="float:left; margin-left:3px;">
					<div class="heading_bg">
						<h2>
							<a href="cus_goShop.do?shopID=${shop.sellerID}">${shop.name}</a>
						</h2>
					</div>
					<a href="cus_goShop.do?shopID=${shop.sellerID}" ><img  width="300" height="150" src="getShopAdsPicture.do?id=${shop.id}" alt="image description"/></a>
					<p>Description:&nbsp;${shop.description}</p>
				</div>
			</c:forEach>
		<div style="clear:both; "></div>
		<c:forEach  var="product" items="${productAdses}" varStatus="index">
				<div id="one" style="float:left; margin-left:3px;">
					<div class="heading_bg">
						<h2>
							<a href="cus_getProduct.do?id=${product.id}">${product.name}</a>
						</h2>
					</div>
					<a href="cus_getProduct.do?id=${product.id}" ><img  width="300" height="150" src="cus_getProductPicture.do?id=${product.id}" alt="image description"/></a>
					<ul class="post_meta" style="margin:0">
						<li class="post_meta_comments"><a href="cus_getProduct.do?id=${product.id}">HK$: ${product.price}</a></li>
						<li class="post_meta_date"><a href="cus_goShop.do?shopID=${product.sellerID}">go to shop</a></li>
					</ul>
					<p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo
						dicit hoc. Tempore percussus ait est amet consensit cellula rei
						civibus in modo ad nomine.</p>
				</div>

			</c:forEach>
		
		<div style="clear:both; height: 40px"></div>
		<!-- close navigator -->

		<div style="clear:both; height: 40px"></div>

	</div>
	<!-- close container -->


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