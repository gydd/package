<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
    <!-- Main Menu -->
    
    <ol id="menu">
             <li><a href="return.do">Home</a>
              </li><!-- end sub menu -->
		        <li><a href="#">Pages</a>
               <li><a href="contact.jsp">Contact</a></li>
    </ol>
     
       </div> 
       
     <!-- END header -->

    <div id="container">

    <h1>Full Width Page</h1>
    
    <div class="one-half">

        <div class="heading_bg"><h2>Contact</h2></div>
          <p><strong>Professional Studios</strong><br />
          NORWAY<br /><br />
          Tel: (+47) 99 88 77 66<br />
          mail: mail@studios.com
          </p>
    
    </div>
    
    <div class="one-half last">
   
        <form action="#" id="contact_form" method="post">
    
        <fieldset>
            <label>Name <span class="required">*</span></label>
            <input type="text" name="name" id="Myname" value="" class="text requiredField"/>
        </fieldset>
        
        <fieldset>
            <label>Email <span class="required">*</span></label>
            <input type="text" name="email" id="myemail" value="" class="text requiredField email"/>
        </fieldset>
        <fieldset>
            <label>Subject <span class="required">*</span></label>
            <input type="text" name="subject" id="mySubject" value="" class="text requiredField subject"/>
        
        </fieldset>
        <fieldset>
            <label>Your Message <span class="required">*</span></label>
            <textarea name="message" id="Mymessage" rows="20" cols="30" class="text requiredField"></textarea>
        </fieldset>
        <fieldset>
            <input name="Mysubmitted" id="Mysubmitted" value="Send Message" class="button white" type="submit"/>
        
        </fieldset>
        
    </form>
    <!--END form ID contact_form -->
   
    </div>

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