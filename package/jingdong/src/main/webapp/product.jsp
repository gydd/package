<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
    <title>Bigshot Theme by CssTemplateHeaven</title>
    <meta name="keywords" content="create from keywords">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- CSS Files -->

    <link rel="stylesheet" type="text/css" media="screen" href="style.css">
    <link rel="stylesheet" type="text/css" media="screen" href="menu/css/simple_menu.css">


<!--JS FILES -->

	<script src="js/jquery.tools.min.js" type="text/javascript"></script>
        
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
        window.onload = function() {
            document.getElementById("btn2").onclick = function() {
                var a = document.getElementById("ipr").value;
                var c = Number(a) + 1;
                var limit= Number(${product.total });
                if(c == limit + 1 ) {
                	alert("Beyond the stock!");
                	c = limit;
                } else {
                    document.getElementById("ipr").value = c;
                    document.getElementById("productAmount").value = c;
                }
             
            };
            document.getElementById("btn1").onclick = function() {
                var a = document.getElementById("ipr").value;
                var c = Number(a) - 1;
                if(c <= 0) {
                    alert("At least one product!");
                    c = 1;
                } else {
                    document.getElementById("ipr").value = c;
                    document.getElementById("productAmount").value = c;
                }
            }
        }
    </script>
    
    <script type="text/javascript">
	function addCart() {
		document.getElementById("dealWithProduct").submit();
	}
</script>
<script type="text/javascript">
	function addOrder() {
		document.getElementById("dealWithProduct").action="cus_createOrder.do";
		document.getElementById("dealWithProduct").submit();
	}
</script>
    <script type="text/javascript">
	function addFavo() {
		document.getElementById("dealWithProduct").action="cus_addFavorite.do";
		document.getElementById("dealWithProduct").submit();
	}
</script>
</head>

<body>

   <div class="header">
   
    <!-- Logo/Title -->
    	<div id="site_title"><a href="return.do">
        <img src="img/logo.png" alt="My Site Title" /></a>
    		 <div style="margin-left:-150px;font-size:13px; color:red; ">
    	     </div> 
    	</div> 
    	<div style="float:right; margin-top:50px; margin-bottom:-20px; font-size:15px; color:black; ">
			<a href="cus_login.do?telephone=${sessionScope.cusInfo.telephone}&password=${sessionScope.cusInfo.password}">${sessionScope.cusInfo.name} &nbsp;&nbsp;&nbsp;</a> 
			 <br>${msg}
		</div>
    <!-- Main Menu -->
    
    <ol id="menu">
             <li class="active_menu_item"><a href="return.do" style="color:#FFF">Home</a></li>
               <li><a href="contact.jsp">Contact</a></li>
    </ol>
       </div> 
       
    <div id="container">

<!-- tab panes -->

<div id="prod_wrapper">

    <div id="panes">
    
    <div>
        <img width="300" height="150" src="cus_getProductPicture.do?id=${product.id}" alt="demo" />
        <h5>Name&nbsp;&nbsp;:${product.name }</h5>
         <h4> </h4>
        <h5>Price&nbsp;&nbsp; :HK$&nbsp;${product.price }</h5>
        <h4></h4>
        <h5>Stock&nbsp;&nbsp;:${product.total }</h5>
        <h4> </h4>
        <h5>Sales&nbsp;&nbsp;: ${product.selled }</h5>
        <h4></h4>
        <h5>Amount</h5>
        <button id="btn1">-</button>
        <h5>
            <input type="text" id="ipr" value="1"  style="margin-top: -21px; width:30px; text-align: center " readonly />
        </h5>
        <button id="btn2" >+</button>
         <form action="cus_addCart.do" method="get" id="dealWithProduct">
         	<input type="hidden" name="type" value="0">
         	<input type="hidden" name="createType" value="0">
         	<input type="hidden" name="customerID" value="${sessionScope.cusInfo.telephone }">
         	<input type="hidden" name="productID" value="${product.id }">
         	<input type="hidden" name="favID" value="${product.id }">
         	<input type="hidden" name="productName" value="${product.name }">
         	<input type="hidden" name="productPrice" value="${product.price}">
         	<input type="hidden" name="productTotal" value="${product.total }">
         	<input type="hidden" name="productSelled" value="${product.selled}">
         	<input type="hidden" name="amount" value="1" id="productAmount">
         	<input type="hidden" name="sellerID" value="${product.sellerID}">
    <p style="text-align:right; margin-right: 16px">
    <a href="javascript:addFavo()" class="button">Favourite</a>
    <a href="javascript:addCart()" class="button">ShopCart</a> 
    <a href="javascript:addOrder()" class="button" target="_blank">BuyNow</a></p>
 	</form>
 	
    </div> 
    <div>
    <img src="img/demo/2.jpg" alt="demo" />	
    <h5>Product name</h5>
        &nbsp;&nbsp;<h4>price</h4>
        <h4>total</h4>
        <h4>selled</h4>
        <h4>Amount</h4>
        <button id="btn1">-</button>
        <h5>
            <input type="text" id="ipr" value="1"  style="margin-top: -21px; width:30px; text-align: center " readonly />
        </h5>
        <button id="btn2" >+</button>    <p style="text-align:right; margin-right: 16px"><a href="#" class="button">More Info</a> <a href="#" class="button">Buy Now</a></p>	
    </div>
        
    <div>   
    <img src="img/demo/3.jpg" alt="demo" />
    <h5>Product name</h5>
        &nbsp;&nbsp;<h4>price</h4>
        <h4>total</h4>
        <h4>selled</h4>
        <h4>Amount</h4>
        <button id="btn1">-</button>
        <h5>
            <input type="text" id="ipr" value="1"  style="margin-top: -21px; width:30px; text-align: center " readonly />
        </h5>
        <button id="btn2" >+</button>
    <p style="text-align:right; margin-right: 16px"><a href="#" class="button">More Info</a> <a href="#" class="button">Buy Now</a></p>			
    </div>
    
    <div>   
    <img src="img/demo/4.jpg" alt="demo" />
    <h5>Product name</h5>
        &nbsp;&nbsp;<h4>price</h4>
        <h4>total</h4>
        <h4>selled</h4>
        <h4>Amount</h4>
        <button id="btn1">-</button>
        <h5>
            <input type="text" id="ipr" value="1"  style="margin-top: -21px; width:30px; text-align: center " readonly />
        </h5>
        <button id="btn2" >+</button>
    <p style="text-align:right; margin-right: 16px"><a href="#" class="button">More Info</a> <a href="#" class="button">Buy Now</a></p>			
    </div>
    
    <div>   
    <img src="img/demo/5.jpg" alt="demo" />
    <h5>Product name</h5>
        &nbsp;&nbsp;<h4>price</h4>
        <h4>total</h4>
        <h4>selled</h4>
        <h4>Amount</h4>
        <button id="btn1">-</button>
        <h5>
            <input type="text" id="ipr" value="1"  style="margin-top: -21px; width:30px; text-align: center " readonly />
        </h5>
        <button id="btn2" >+</button>
    <p style="text-align:right; margin-right: 16px"><a href="#" class="button">More Info</a> <a href="#" class="button">Buy Now</a></p>			
    </div>
    	
    	
    </div> 

<!-- navigator -->
<div id="prod_nav">
<ul>
</ul>
</div><!-- close navigator -->


</div><!-- END prod wrapper -->
</div><!-- END prod wrapper -->
</div><!-- END prod wrapper -->

    <!-- END container -->


    <div id="footer">

    <!-- First Column -->

    <div class="one-fourth">
        <h3>Useful Links</h3>
            <ul class="footer_links">
                <li><a href="#">Lorem Ipsum</a></li>
                <li><a href="#">Ellem Ciet</a></li>
                <li><a href="#">Currivitas</a></li>
                <li><a href="#">Salim Aritu</a></li>
            </ul>
    </div>
    
    <!-- Second Column -->
    
    <div class="one-fourth">
        <h3>Terms</h3>
            <ul class="footer_links">
                <li><a href="#">Lorem Ipsum</a></li>
                <li><a href="#">Ellem Ciet</a></li>
                <li><a href="#">Currivitas</a></li>
                <li><a href="#">Salim Aritu</a></li>
            </ul>
    </div>
    
    <!-- Third Column -->
    
    <div class="one-fourth">
        <h3>Information</h3>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sit amet enim id dui tincidunt vestibulum rhoncus a felis.
        
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