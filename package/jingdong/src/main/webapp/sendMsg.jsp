<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<head xmlns:font-size="http://www.w3.org/1999/xhtml">
	<%-- <base href="<%=basePath%>"> --%>
    <title>PARKnSHOP -login</title>
    <meta name="keywords" content="create from keywords">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- CSS Files -->

    <link rel="stylesheet" type="text/css" media="screen" href="style.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="menu/css/simple_menu.css">
    <link rel="stylesheet" href="css/prettyPhoto.css" type="text/css"
          media="screen"/>
    <link rel="stylesheet" href="css/nivo-slider.css" type="text/css"
          media="screen"/>
    <link rel="stylesheet" type="text/css" href="boxes/css/style6.css"/>
    <link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="jzoom/jquery-2.2.3.js"></script>
    <script src="bootstrap-3.3.5-dist/js/bootstrap.js"></script>
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

<div class="header">
    <div id="site_title"><a href="return.do">
        <img src="img/logo.png" alt="My Site Title"/></a>
    </div>
    <ol id="menu">
        <li><a href="return.do">Home</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ol>
</div>         
<div style="margin-left:220px; margin-top:100px; font-size:25px; color:bule;">${msg}</div>

<!-- END footer -->

</body>
</html>