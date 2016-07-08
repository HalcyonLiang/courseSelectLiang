<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Student" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    Student student = (Student)session.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
    <!--<base href="http://jpteachplat.japanesecorpus.com:80/">-->

    <title>SS DUT | J T P O</title>
    <meta charset="utf-8">
    <meta name="description" content="修改密码页.">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="Font-Awesome/css/font-awesome.css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,300,300italic,400italic,700,700italic,900" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="CSS/flexslider.css">
    <!--<link rel="stylesheet" href="CSS/theme.css">-->
    <link rel="stylesheet" href="CSS/zclc2.css">
    <link href="CSS/css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]-->
    <!--<script src="js/respond.min.js"></script>-->
    <!--[endif]-->
    <!--<script type="text/javascript" src="js/sea.js" id="seajsnode"></script>-->
    <!--<script type="text/javascript" src="js/sea.config.js"> </script>-->
    <script src="js/jquery.min.js"></script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="CSS/home.css" type="text/css">
    <link rel="stylesheet" href="CSS/saved_resource.css" type="text/css">
</head>
<body>
    <jsp:include page="studNavbar.jsp" flush="true" />
<div class="security_content" style="width: 1200px">
    <div class="security-left">
        <div class="sty-head">
            <div class="pic head-set" style="padding: 0;">
                <img  src="/img/jtpo/user/stud/1.jpg">
            </div>
            <span class="sty-name"><%= student.getStudName()%></span>
        </div>
        <ul class="security-list">
            <li>
                <a href="#" class="bg-blue">
                    <i class="al-1 current" style="background-position:-39px -31px;"></i>
                    <span>账号安全</span>
                </a>
            </li>
            <li>
                <a href="studUserInfo.jsp" class="">
                    <i class="al-2"></i>
                    <span>我的信息</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="security-right" style="width: 1045px">
        <div class="sr-t">
            <span class="tit-b"></span> <span class="acc-sec">账号安全</span>
        </div>
        <div class="sr-b">
            <ul>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">我的账号：</p>
                        <div class="sbi-m">
                            <span id="userEmail"><%= student.getStudAccount()%></span>
                        </div>

                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">密码：</p>
                        <div class="sbi-m">
                            <span class="password">******</span>
                        </div>
                        <p class="sbi-r">
                            <span class="changes" id="pswd">修改密码</span>
                        </p>
                    </div>
                    <div class="e-drop c-drop" id="p-drop">
                        <ul>
                            <div class="arrow-wrap">
                                <em></em> <i></i>
                            </div>
                            <form method="post" action="studentupdatepassword.do">
                                <li>
                                    <div class="sb-info">
                                        <p class="sbi-l">当前密码：</p>
                                        <div class="sbi-m">
                                            <input name="old_password" class="mob" id="oldpwd" type="password">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="sb-info">
                                        <p class="sbi-l">新的密码：</p>
                                        <div class="sbi-m">
                                            <input name="new_password" class="mob" id="userpwd" type="password">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="sb-info">
                                        <p class="sbi-l">再次确认：</p>
                                        <div class="sbi-m">
                                            <input name="new_password2" class="mob" id="userpwdok" type="password">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="sb-info">
                                        <input class="sure" id="btn_changePassword" type="submit" value="确认">
                                    </div>
                                </li>
                            </form>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $(".changes").click(function () {
            $('#p-drop').slideDown(300,function(){
                $(this).css('overflow','visible');
            })
        })
    });
</script>
<script src="js/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="jquery.min.js">\x3C/script>')</script>
</body>
</html>