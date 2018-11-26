<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<head>

    <title>Bigshot Theme by CssTemplateHeaven</title>
    <meta name="keywords" content="create from keywords">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- CSS Files -->

    <link rel="stylesheet" type="text/css" media="screen" href="style.css">
    <link rel="stylesheet" type="text/css" media="screen" href="menu/css/simple_menu.css">
    <link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.css"/>
    <!-- <script src="//code.jquery.com/jquery-1.9.1.js"></script> -->
    <script src="jquery-1.9.1/jquery.js" ></script>
     <link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="jzoom/jquery-2.2.3.js"></script>
    <script src="bootstrap-3.3.5-dist/js/bootstrap.js"></script>
    
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
        	margin-right:28px;
        }
      
    </style>

<!-- JS Files -->

	<script type="text/javascript" src="js/jquery.min.js"></script>
    
    <script type="text/javascript" src="js/custom.js"></script>
    <script type="text/javascript" src="js/slides/slides.min.jquery.js"></script>
    <script type="text/javascript" src="js/cycle-slider/cycle.js"></script>
    <script type="text/javascript" src="js/nivo-slider/jquery.nivo.slider.js"></script>
    <script type="text/javascript" src="js/tabify/jquery.tabify.js"></script>
    <script type="text/javascript" src="js/prettyPhoto/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="js/twitter/jquery.tweet.js"></script>
    <script type="text/javascript" src="js/scrolltop/scrolltopcontrol.js"></script>
    <script type="text/javascript" src="js/portfolio/filterable.js"></script>
    <script type="text/javascript" src="js/modernizr/modernizr-2.0.3.js"></script>
    <script type="text/javascript" src="js/easing/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="js/kwicks/jquery.kwicks-1.5.1.pack.js"></script>
    <script type="text/javascript" src="js/swfobject/swfobject.js"></script>
    <!-- FancyBox -->
    <link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox.css" media="all">
    <script type="text/javascript" src="js/fancybox/jquery.fancybox-1.2.1.js"></script>

</head>

<body>

   <div class="header">
   
    <!-- Logo/Title -->
    
    <div id="site_title"><a href="return.do">
        <img src="img/logo.png" alt="My Site Title" /></a>
    </div>  
    <div style="float:right; margin-top:50px; margin-bottom:-20px; font-size:15px; color:black; ">
			<a href="cus_login.do?telephone=${sessionScope.cusInfo.telephone}&password=${sessionScope.cusInfo.password}">${sessionScope.cusInfo.name} &nbsp;&nbsp;&nbsp;</a> 
			 <br>${msg}
		</div>
        
    <!-- Main Menu -->
    
    <ol id="menu">
             <li><a href="return.do">Home</a></li><!-- end sub menu -->
               <li><a href="contact.jsp">Contact</a></li>
    </ol>
       </div> 
       
     <!-- END header -->
    <div id="container" >
    	${msg}
    	<div style="font-size:28px">
			${shop.name}
			<a href="cus_addFavorite.do?customerID=${sessionScope.cusInfo.telephone }&favID=${shop.id }&type=1" class="button">Favourite</a>
    	</div>
    <div id="slider3" class="nivoSlider" style="margin-left:-20px;">
        <img title="" src="img/demo/slide_1.jpg" alt="" width="960" height="450" />
        <img title="" src="img/demo/slide_2.jpg" alt="" width="960" height="450" />
        <img title="" src="img/demo/slide_3.jpg" alt="" width="960" height="450" />
    </div>
	       <c:forEach  var="product" items="${products}" varStatus="index"  >
				<div id="one" style="float:left; margin-left:3px;">
					<div class="heading_bg">
						<h2>
							<a href="cus_getProduct.do?id=${product.id}">${product.name}</a>
						</h2>
					</div>
					<a href="cus_getProduct.do?id=${product.id}" ><img  width="300" height="150" src="cus_getProductPicture.do?id=${product.id}" alt="image description"/></a>
					<ul class="post_meta" style="margin:0">
						<li class="post_meta_comments"><a href="cus_getProduct.do?id=${product.id}">HK$: ${product.price}</a></li>
					</ul>
					<p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo
						dicit hoc. Tempore percussus ait est amet consensit cellula rei
						civibus in modo ad nomine.</p>
				</div>

			</c:forEach>

   <!--  <div class="one-half">
        <div class="one-third">
            <div class="heading_bg"><h2>New Magazine</h2></div>
            <img src="img/demo/magazine1.jpg" alt="image description" />
            <ul class="post_meta" style="margin:0">
                <li class="post_meta_admin"><a href="#">Admin</a></li>
                <li class="post_meta_date"><a href="#">2012-02-21</a></li>
                <li class="post_meta_comments"><a href="#">12</a></li>
            </ul>
            <p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo dicit hoc. Tempore percussus ait est amet consensit cellula rei civibus in modo ad nomine.</p>
        </div>

    </div> -->

    <!-- <div class="one-half last">
        <div class="one-third">
            <div class="heading_bg"><h2>New Magazine</h2></div>
            <img src="img/demo/magazine1.jpg" alt="image description" />
            <ul class="post_meta" style="margin:0">
                <li class="post_meta_admin"><a href="#">Admin</a></li>
                <li class="post_meta_date"><a href="#">2012-02-21</a></li>
                <li class="post_meta_comments"><a href="#">12</a></li>
            </ul>
            <p>Perquiramus atque ut casus tui ex quae ad te ad suis caelo dicit hoc. Tempore percussus ait est amet consensit cellula rei civibus in modo ad nomine.</p>
        </div>

    </div> -->

    <div style="clear:both; height: 40px"></div>

    </div><!-- close container -->


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
        Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
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