<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> --%>
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
   
    <script type="text/javascript">   <!-- 计时器-->
    	window.onload= function() {
    		document.getElementById("btu1").onclick = function() {
    			var sec = 59;
                var intervalId = setInterval(function() {
                    if(sec > 0) {
                        document.getElementById("btu1").value = '('+ sec +') s send again';
                        sec--;
                    } else {
                        document.getElementById("btu1").value = 'Get again';
                        document.getElementById("btu1").disabled = false;
                        clearInterval(intervalId);
                    }
                },1000);              
    		}
    		
    		document.getElementById("btu2").onclick = function() {
    			var sec = 59;
                var intervalId = setInterval(function() {
                    if(sec > 0) {
                        document.getElementById("btu2").value = '('+ sec +') s send again';
                        sec--;
                    } else {
                        document.getElementById("btu2").value = 'Get again';
                        document.getElementById("btu2").disabled = false;
                        clearInterval(intervalId);
                    }
                },1000);
    		}
    		
			document.getElementById("conFir").onblur = function () {
			    
   				if(document.getElementById("pwd").value == document.getElementById("conFir").value){
			    }else{
			       alert("Please enter the same password");
			    }
   				
   			}
			document.getElementById("conFir2").onblur = function () {
			    
   				if(document.getElementById("pwd2").value == document.getElementById("conFir2").value){
			    }else{
			       alert("Please enter the same password");
			    }
   				
   			}
    	};
  
    </script>
   
    <script type="text/javascript">
    $("#import").click(function(){//点击导入按钮，使files触发点击事件，然后完成读取文件的操作。
        $("#files").click();
    });
    
    
    
    function import(){
        var selectedFile = document.getElementById("files").files[0];//获取读取的File对象
        var name = selectedFile.name;//读取选中文件的文件名
        var size = selectedFile.size;//读取选中文件的大小
        console.log("文件名:"+name+"大小："+size);

        var reader = new FileReader();//这里是核心！！！读取操作就是由它完成的。
        reader.readAsText(selectedFile);//读取文件的内容

        reader.onload = function(){
            console.log(this.result);//当读取完成之后会回调这个函数，然后此时文件的内容存储到了result中。直接操作即可。
        };
    }
    
    </script>
    
 <script type="text/javascript">
	function sendMsg1() {
		document.getElementById("sendMsgTel").value=document.getElementById("tele1").value;
		document.getElementById("sendMsgForm").submit();
	}
</script>
<script type="text/javascript">
	function sendMsg2() {
		document.getElementById("sendMsgTel").value=document.getElementById("tele2").value;
		document.getElementById("sendMsgForm").submit();
	}
</script>   
    
<style type="text/css">
    	td {
    	font-size:15px;
    	}
    	.file-box1{ 
    		position:relative;
    		width:340px;
    		}
        .txtqd{ 
        	height:22px; 
        	border:1px solid #cdcdcd; 
        	width:200px;
        	border-right:none;
        	height:26px;
        	margin-top:20px;
        }
        .btnqd{ 
        	background-color:#FFF;
            border:1px solid #CDCDCD;
            height:26px; 
            width:70px;
            margin-left:210px;
            margin-top:-25px;
        }
        .fileqd{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
    	
    </style>
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
<!-- END header -->

<div id="container">
    <div class="two-third">
        <div id="slider3" class="nivoSlider" style="width: 630px; height: 280px">
            <a href="shop.jsp"><img title="Heading Here" src="img/demo/slide_11.jpg" alt="" width="630" height="280"/></a>
            <img title="" src="img/demo/slide_21.jpg" alt="" width="630" height="280"/>
            <img title="" src="img/demo/slide_31.jpg" alt="" width="630" height="280"/>
        </div>
        <div style="clear:both"></div>
    </div>
         
    <div class="sidebar_right" style="margin-right:-30px; margin-top:-310px;">
        <ul id="tabify_menu" class="menu_tab" style="margin: 0;">
            <li class="active"><a href="#fane1">Customer</a></li>
            <li><a href="#fane2">Seller</a></li>
        </ul>
        
        <div id="fane1" class="tab_content">
        <form action="cus_login.do" method="post">
            <div class="tab_article">
                <input type="text" name="telephone" placeholder="Your telephone" style="width:250px; height:30px;"/><br>
                <input type="password" name="password" placeholder="Your password" style="width:250px; height:30px;"/><br>
                    <button type="submit" id="btn1" value="login"
                            style="margin-top:18px; width:90px;height:30px;font-size:18px;font-weight:large; color:white; border-radius:5px; background-color:green;">
                        login
                    </button>
                </a>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"
                        style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px;" id="firstBtn" >
                    register
                </button>
            </div>
           </form>
           <div style="color:red;">
           	 ${msg }
           </div>
             <!-- Modal1 -->
    		<form action="cus_register.do" enctype="multipart/form-data" method="post" id="cusForm">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                                    class="sr-only">Close</span></button>
                                     <h4 class="modal-title" id="myModalLabel">Customer Register</h4>
                        </div>
                        <div class="modal-body">
                            <table >
                                <tr>
                                    <td>Username</td>
                                    <td colspan="2"><input type="text" name="name" placeholder="Only English"/></td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                    <td colspan="2"><input type="password" name="password" placeholder="4-8 character" id="pwd" /></td>
                                </tr>
                                <tr>
                                    <td>Confirm-Password</td>
                                    <td colspan="2"><input type="password" placeholder="please input again" id="conFir" ></td>
                                </tr>
                                <tr>
                                    <td>Telephone</td>
                                    <td><input type="text" id="tele1" name="telephone" placeholder="xxx-xxxx-xxxx"></td>
                                    <td> <a href="javascript:sendMsg1()" target="_blank"><input type = "button" name = "code1" value = "Get Code" id = "btu1"/></a></td>
                                </tr>
                                <tr>
                                	<td></td>
                                	<td><input type="text" name="telCode"  placeholder="Please input the code"/> </td>
                                	<td></td>
                                </tr>
                                 <tr>
                                    <td>Address</td>
                                    <td colspan="2"><input type="text" name="address" placeholder="xxxx"/></td>
                                </tr>
                                 <tr>
                                    <td>Email</td>
                                    <td colspan="2"><input type="text" name="e_mail" placeholder="xxxxx@xxx.com"/></td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="reset" class="btn btn-default" data-dismiss="modal" id="region">Close</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            <!-- model1-->
    		<form id="sendMsgForm" action="sendMsg.do" method="get" target="_bland">
    			<input type="hidden" name="telePhone" id="sendMsgTel">
    		</form>
            </div>
            <div style="clear:both"></div>
        
       
        <div id="fane2" class="tab_content">
        	<form action="sel_login.do" method="post">
            <div class="tab_article">
                <input type="text" name="telePhone" placeholder="Your telephone" style="width:250px; height:30px;"/><br>
                <input type="password" name="password" placeholder="Your password"
                       style="width:250px; height:30px;"/><br>
                    <button type="submit" id="btn1" value="login"
                            style="margin-top:18px; width:90px;height:30px;font-size:18px;font-weight:large; color:white; border-radius:5px; background-color:green;">
                        login
                    </button>
                </a>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2"
                        style="height:30px; text-align:center ;vertical-align:middle;line-height:50%; margin-top:-8px; " id="secendBtn" >
                    register
                </button>
            </div>
            </form>
           <div style="color:red;">
           	 ${msg }
           </div>
           <!-- Modal2 -->
           <form action="sel_register.do" enctype="multipart/form-data" method="post">
			<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			        <h4 class="modal-title" id="myModalLabel">Seller Register</h4>
			      </div>
			      <div class="modal-body">
			        	 <table>
                                <tr>
                                    <td>Nickname</td>
                                    <td colspan="2"><input type="text" name="nickName" placeholder="Only English"/></td>
                                </tr>
                                <tr>
                                    <td>Realname</td>
                                    <td colspan="2"><input type="text" name="realName" placeholder="Only English"/></td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                    <td colspan="2"><input type="password" name="password" placeholder="4-8 character" id="pwd2"/></td>
                                </tr>
                                <tr>
                                    <td>Confirm-Password</td>
                                    <td colspan="2"><input type="password" placeholder="please input again" id="conFir2"></td>
                                </tr>
                                <tr>
                                    <td>Telephone</td>
                                    <td><input type="text" id="tele2" name="telePhone" placeholder="xxx-xxxx-xxxx"></td>
                                    <td> <a href="javascript:sendMsg2()" target="_blank"><input type = "button" name = "code2" value = "Get Code" id = "btu2"/></a></td>
                                </tr>
                                <tr>
                                	<td></td>
                                	<td><input type="text" name="telCode" placeholder="Please input the code"/> </td>
                                	<td></td>
                                </tr>
                                <tr>
                                    <td>ID-Card</td>
                                    <td colspan="2"><input type="text" name="id_card" placeholder="Only Numbers"/></td>
                                </tr>
                                <tr id="hid" >  
                                	<td>IDPicture</td>
                                	<td colspan="2">
                                	<div class="file-box1">
       										 <input type='text' name='textfield' id='textfield' class='txtqd' />
       										 <input type='button' class='btnqd' value='choose' />
        									 <input type="file" name="IDPicture" class="fileqd" id="fileField" accept="image/*"  size="28"  onchange="document.getElementById('textfield').value=this.value" />
									</div>
									</td>
                                </tr>
                            </table>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="submit" class="btn btn-primary">Submit</button>
			      </div>
			    </div>
			  </div>
			</div>
			</form>
			<!-- Modal2 -->
           
        </div>
    </div>

    <div style="clear:both; height: 40px; "></div>
    <h2>This is what we do best</h2>
    <div><p style="font-size:15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our price is more affordable, more activities,
        faster delivery, support a variety of payment methods,
        payment more convenient, oh, many activities, a large discount,
        buy things cost.</p>
    </div>
    <br/><br/>
    
    <div style="clear:both; height: 40px"></div>
</div>
<!-- end container -->


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

</div>
<!-- END footer -->

</body>
</html>