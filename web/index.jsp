<%--
  Created by IntelliJ IDEA.
  User: liang
  Date: 2016/7/1
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE   html>
<html>
<head>
    <%--<base href="http://jpteachplat.japanesecorpus.com:80/">--%>

    <title>选课系统</title>
    <meta charset="utf-8">
    <meta name="description" content="选课系统主页.">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--<link rel="shortcut icon" href="http://robert-thomas10.com/assets/favicon.ico">-->
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="Font-Awesome/css/font-awesome.css">
    <link href="http://fonts.useso.com/css?family=Lato:400,300,300italic,400italic,700,700italic,900" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="CSS/flexslider.css">
    <link rel="stylesheet" href="CSS/theme.css">
    <%--<link href="CSS/css" rel="stylesheet" type="text/css">--%>
    <!--[if lt IE 9]-->
    <!--<script src="js/respond.min.js"></script>-->
    <!--[endif]-->
    <script src="js/analytics.js"></script>
    <script type="text/javascript" src="js/modernizr.min.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>
<body data-spy="scroll" data-target="#main-nav" data-offset="200">
<!-- ==============================================
MAIN NAV
=============================================== -->
<div id="main-nav" class="navbar navbar-fixed-top">
    <div class="container" style="width:100%">

        <div class="navbar-header">

            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#site-nav">
                <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
            </button>

            <!-- ======= LOGO ========-->

        </div>

        <div id="site-nav" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="sr-only active">
                    <a href="#home" class="scrollto">Home</a>
                </li>
                <%--<li>--%>
                <%--<a href="http://robert-thomas10.com/#services" class="scrollto">What I do</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                <%--<a href="http://robert-thomas10.com/#about" class="scrollto">About Me</a>--%>
                <%--</li>--%>
                <li>
                    <a href="javascript:void(0)" id="stu-signin">学生登录</a>
                </li>
                <li>
                    <a href="javascript:void(0)" id="tea-signin">教师登录</a>
                </li>
                <li>
                    <a href="javascript:void(0)" id="manager-signin">管理员登录</a>
                </li>
            </ul>
        </div><!--End navbar-collapse -->
    </div><!--End container -->
</div><!--End main-nav -->

<header id="home" class="jumbotron">

    <div class="container">

        <div class="message-box clearfix">

            <div class="left-col">
                <p><span>DLUT</span><br/>Software</p>
            </div>

            <div class="right-col flexslider home-slider">

                <ul class="slides">

                    <li style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1;"><p>Course</p></li>



                    <li class="flex-active-slide" style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 2;"><p>选课系统</p></li>

                    <!--<li><p>Online</p></li>-->

                </ul>

            </div><!--End home-slider -->

        </div><!--End message-box -->

    </div><!--End container -->

</header><!--End header -->
<!-- ==============================================
TWITTER FEED
=============================================== -->
<section id="twitter">
    <div class="container">
        <div class="row scrollimation fade-in">
            <div class="col-sm-1 twitter-icon">
                <i class="icon-twitter"></i>
            </div>
            <div class="col-sm-11">
                <div id="twitter-slider" class="flexslider" data-widget-id="453263095339573248" data-tweets-length="5">
                    <p>© Copyright 2015&nbsp;|&nbsp; 大连理工大学软件学院- liang</p>
                </div>
            </div>
        </div><!-- End row -->
    </div><!-- End container -->

</section><!-- End Twitter section -->

<script src="js/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="jquery.min.js">\x3C/script>')</script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollto.js"></script>
<script src="js/jquery.flexslider.min.js"></script>
<script src="js/twitterFetcher_v10_min.js"></script>
<script src="js/jquery.masonry.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/jquery.easypiechart.js"></script>
<script src="js/jquery.backstretch.min.js"></script>
<script src="js/designr.js"></script>
<!--<script>-->
<!--(function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=-->
<!--function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;-->
<!--e=o.createElement(i);r=o.getElementsByTagName(i)[0];-->
<!--e.src='//www.google-analytics.com/analytics.js';-->
<!--r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));-->
<!--ga('create','UA-23517723-4');ga('send','pageview');-->
<!--</script>-->
<div class="backstretch" style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 100%; width: 100%; z-index: -999999; position: fixed;">
    <img src="image/2.jpg" class="img-responsive"style="position: absolute; margin: 0px; padding: 0px; border: none; width:100%; height: 100%; max-width: none; z-index: -999999; top: 0px;">
</div>
<div class="modal fade" id="teaModal">
    <div class="modal-dialog">
        <div class="modal-content"style="width:400px;height: 345px;margin: auto;margin-top: 25%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">教师登录</h4>
            </div>
            <div class="modal-body" style="padding: 40px 40px 0;">
                <div class="clearfix">
                    <div class="l-left-wrap l">
                        <form id="tea-signup-form" method="post" action="teacherLogin.do">
                            <div class="rlf-group">
                                <input  type="text" id="tea_account" name="account" class="ipt ipt-email" placeholder="请输入用户名" style=""/>
                                <p class="rlf-tip-wrap"></p>
                                <input style="display:none;">
                            </div>
                            <div class="rlf-group">
                                <input  type="password" id="tea_password" name="password" class="ipt ipt-pwd" placeholder="请输入密码"/>
                                <p class="rlf-tip-wrap"></p>
                            </div>
                            <div class="rlf-group clearfix">
                                <p class="rlf-tip-wrap "></p>
                                <input  type="submit" id="tea-signin-btn" value="登录" hidefocus="true" class="btn btn-primary"style="width: 318px" onclick="return checkTea(form)"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade" id="stuModal">
    <div class="modal-dialog">
        <div class="modal-content"style="width:400px;height: 345px;margin: auto;margin-top: 25%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">学生登录</h4>
            </div>
            <div class="modal-body" style="padding: 40px 40px 0;">
                <div class="clearfix">
                    <div class="l-left-wrap l">
                        <form id="stu-signup-form" method="post" action="studentLogin.do">
                            <div class="rlf-group" id="studLoginUserNameDiv">
                                <input  type="text" id="stu_account" name="account"class="ipt ipt-email" placeholder="请输入账号" style=""/>
                                <p class="rlf-tip-wrap"></p>
                                <input style="display:none;">
                            </div>
                            <div class="rlf-group" id="studLoginPasswordDiv">
                                <input  type="password" id="stu_password" name="password"class="ipt ipt-pwd" placeholder="请输入密码"/>
                            </div>
                            <div id="signinBtn">
                                <p class="rlf-tip-wrap"></p>
                                <input  type="button" id="stu-signin-btn" value="登录" hidefocus="true" class="btn btn-primary"style="width: 318px" onclick="return checkStuLogin(form)" />
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" id="managerModal">
    <div class="modal-dialog">
        <div class="modal-content"style="width:400px;height: 345px;margin: auto;margin-top: 25%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">管理员登录</h4>
            </div>
            <div class="modal-body" style="padding: 40px 40px 0;">
                <div class="clearfix">
                    <div class="l-left-wrap l">
                        <form id="manager-signup-form" method="post" action="managerLogin.do">
                            <div class="rlf-group" id="ManagerLoginUserNameDiv">
                                <input  type="text" id="manager_account" name="account"class="ipt ipt-email" placeholder="请输入账号" style=""/>
                                <p class="rlf-tip-wrap"></p>
                                <input style="display:none;">
                            </div>
                            <div class="rlf-group" id="ManagerLoginPasswordDiv">
                                <input  type="password" id="manager_password" name="password"class="ipt ipt-pwd" placeholder="请输入密码"/>
                            </div>
                            <div id="signinManagerBtn">
                                <p class="rlf-tip-wrap"></p>
                                <input  type="button" id="manager-signin-btn" value="登录" hidefocus="true" class="btn btn-primary"style="width: 318px" onclick="submit()" />
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<%----%>
<%
    String info = (String) request.getAttribute("info");
    if(info == "请输入正确的账号和密码"){
%>
<script type="text/javascript">
    window.alert("您输入的用户名或密码错误！");
</script>
<%
}
else if(info == "您所需要的信息已经发送到您的邮箱"){
%>
<script type="text/javascript">
    window.alert("您所需要的信息已经发送到您的邮箱！");
</script>
<%
}
else if(info == "输入的邮箱地址不正确！"){
%>
<script type="text/javascript">
    window.alert("输入的邮箱地址不正确！");
</script>
<%
}
else if(info == "修改密码成功！"){
%>
<script type="text/javascript">
    window.alert("修改密码成功！");
</script>
<%
}
else if(info == "您的用户名格式不正确！"){

%>
<script type="text/javascript">
    window.alert("您的用户名格式不正确！");
</script>
<%
    }
%>
<script type="text/javascript">
    function checkTea(form){
        if (form.tea_account.value==""){
            window.alert("请输入用户名！");
            return false;
        }
        else if (form.tea_password.value==""){
            window.alert("请输入密码！");
            return false;
        }
    }
</script>
<script type="text/javascript">
    function studForgot(){
        if($("#magicButton").val() == "忘记密码"){
            $("#studLoginUserNameDiv").slideUp(300);
            $("#studLoginPasswordDiv").slideUp(300);
            $("#studUserNameDiv").slideDown(300);
            $("#studEmailDiv").slideDown(300);
            $("#signinBtn").css("display","none");
            $("#emailBtn").css("display","block");
            $("#magicButton").val("返回登录");
            return;
        }
        if($("#magicButton").val() == "返回登录"){
            $("#studLoginUserNameDiv").slideDown(300);
            $("#studLoginPasswordDiv").slideDown(300);
            $("#studUserNameDiv").slideUp(300);
            $("#studEmailDiv").slideUp(300);
            $("#signinBtn").css("display","block");
            $("#emailBtn").css("display","none");
            $("#magicButton").val("忘记密码");
            return;
        }


    }
</script>
<script type="text/javascript">
    function checkStuLogin(form){
        if (form.stu_account.value==""){
            window.alert("请输入学号！");
            return false;
        }
        else if (form.stu_password.value==""){
            window.alert("请输入密码！");
            return false;
        }
        else{form.submit()}
    }
    function checkStuForgetPassword(form){
        if (form.studAccount.value==""){
            window.alert("请输入学号！");
            return false;
        }
        else if (form.studEmail.value==""){
            window.alert("请输入绑定邮箱！");
            return false;
        }
        else{form.submit()}
    }
</script>
<script>
    $(function(){
        $("#tea-signin").click(function(){
            $("#teaModal").modal("toggle");
        });
    });
</script>
<script>
    $(function(){
        $("#stu-signin").click(function(){
            $("#stuModal").modal("toggle");
        });
    });
</script>
<script>
    $(function(){
        $("#manager-signin").click(function(){
            $("#managerModal").modal("toggle");
        });
    });
</script>
</body>
</html>


