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
        <img width="300" height="150" src="adm_getIDPicture.do?id=${product.telePhone}" alt="demo" />
        <h5>NickName&nbsp;&nbsp;:${product.nickName }</h5>
        <h4> </h4>
        <h5>RealName&nbsp;&nbsp;:${product.realName}</h5>
        <h4> </h4>
        <h5>Telephone&nbsp;&nbsp;:${product.telePhone }</h5>
        <h4> </h4>
        <h5>IDNumber&nbsp;&nbsp;: ${product.id_card}</h5>
        <h4></h4>
    <a href="adm_login.do?username=${sessionScope.admInfo.id}&password=${sessionScope.admInfo.password}" class="button"
    style="float:right;">Go Back</a></p>
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
    

<!-- END tab panes -->


<br clear="all" />


<!-- navigator -->
<div id="prod_nav">
<ul>
</ul>

</div><!-- close navigator -->



</div><!-- END prod wrapper -->
    
    <div style="clear:both"></div>
    <!-- First Column -->

    

    <div style="clear:both; height: 40px"></div>
    </div>

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