<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    int i=1;


%>

<!DOCTYPE html>
<html>
<head>
    <!--<base href="http://jpteachplat.japanesecorpus.com:80/">-->

    <title>SSDUT | J T P O</title>
    <meta charset="utf-8">
    <meta name="description" content="软件学院日语在线学习系统home页.">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--<link rel="shortcut icon" href="http://robert-thomas10.com/assets/favicon.ico">-->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="Font-Awesome/css/font-awesome.css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,300,300italic,400italic,700,700italic,900" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="CSS/flexslider.css">
    <link rel="stylesheet" href="CSS/theme.css">
    <link href="CSS/css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]-->
    <!--<script src="js/respond.min.js"></script>-->
    <!--[endif]-->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/analytics.js"></script>
    <script type="text/javascript" src="js/modernizr.min.js"></script>
    <%--<script type="text/javascript" src="js/register.js"></script>--%>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="CSS/home.css" type="text/css">
    <link rel="stylesheet" href="CSS/saved_resource.css" type="text/css">
    <script type="text/javascript">
        function typeChange(){
            var temp = window.event.srcElement;
            var val = temp.id;
            if(val == "all"){
                $('.1').css('display','inline');
                $('.2').css('display','inline');
                $('.3').css('display','inline');
                $('.dot-tool-curr').css('left','80px')
            }
            if(val == "drama"){
                $('.1').css('display','inline');
                $('.2').css('display','none');
                $('.3').css('display','none');
                $('.dot-tool-curr').css('left','180px')
            }if(val == "anime"){
                $('.1').css('display','none');
                $('.2').css('display','inline');
                $('.3').css('display','none');
                $('.dot-tool-curr').css('left','280px')
            }if(val == "other"){
                $('.1').css('display','none');
                $('.2').css('display','none');
                $('.3').css('display','inline');
                $('.dot-tool-curr').css('left','380px')
            }
        }
    </script>
</head>
<body>
    <jsp:include page="studNavbar.jsp" flush="true" />
    <!--欢迎div-->
    <div class="welcome" >
        <div class="flow">
            <div class="hc">
                <div class="pic f-fl setbtn">
                    <img src="/img/jtpo/user/stud/1.jpg" width="90" height="90">
                </div>
                <div class="f-fl con">
                    <h2 class="name">
                        <span class="username">梁昊</span>
                    </h2>

                </div>
            </div>
        </div>
    </div>
<div id="main">

</div>
<script type="text/javascript">
    $(function(){
//获取要定位元素距离浏览器顶部的距离
        var navH = $(".course-tools").offset().top;

//滚动条事件
        $(window).scroll(function(){
//获取滚动条的滑动距离
            var scroH = $(this).scrollTop();
//滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
            if(scroH>=navH){
                $(".course-tools").css({"position":"fixed","top":0});
                $(".ranking").css({"position":"fixed","top":0});
                $(".course-list").css("margin-top","50px");
            }
            else if(scroH < navH){
                $(".course-tools").css({"position":"static"});
                $(".ranking").css({"position":"static"});
                $(".course-list").css("margin-top","0px");
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $(".img").mouseenter(function () {
            $(this).slideUp(300)
            $(this).parent().find('.intro-table').slideDown(300)
        })
        $(".boxes-scroll").mouseleave(function () {
            $(this).find('.img').slideDown(300)
            $(this).find('.intro-table').slideUp(300)
        })
    });
</script>
<script type="text/javascript">
    $(document).ready(function(){
//限制字符个数
        $(".zxx_text_overflow").each(function(){
            var maxwidth = 80;
            if($(this).text().length>maxwidth){
                $(this).text($(this).text().substring(0,maxwidth));
                $(this).html($(this).html()+'…');
            }
        });
    });

</script>
<script src="js/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="jquery.min.js">\x3C/script>')</script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/jquery.scrollto.js"></script>
<script src="js/jquery.flexslider.min.js"></script>
<script src="js/twitterFetcher_v10_min.js"></script>
<script src="js/jquery.masonry.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/jquery.easypiechart.js"></script>
<script src="js/jquery.backstretch.min.js"></script>
<script src="js/contact.js"></script>
<script src="js/designr.js"></script>
<script src="js/login.js"></script>
</body>
</html>