<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="bean.Teacher" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    Teacher instructor = (Teacher)session.getAttribute("teacher");
%>
<!DOCTYPE html>
<html>
<head>
    <!--<base href="http://jpteachplat.japanesecorpus.com:80/">-->

    <title>SS DUT | J T P O</title>
    <meta charset="utf-8">
    <meta name="description" content="用户信息页面.">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/zclc2.css">
    <!--[if lt IE 9]-->
    <!--<script src="js/respond.min.js"></script>-->
    <!--[endif]-->
    <script src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="CSS/home.css" type="text/css">
    <link rel="stylesheet" href="CSS/saved_resource.css" type="text/css">
</head>
<body>
<jsp:include page="teacherNavbar.jsp" flush="true" />
<div class="security_content" style="width: 1200px">
<div class="security-left">
    <div class="sty-head">
        <div class="pic head-set" style="padding: 0;">
            <img  src="/img/jtpo/user/stud/1.jpg">
        </div>
        <span class="sty-name"><%= instructor.getTeacherName()%></span>
    </div>
    <ul class="security-list">
        <li>
            <a href="instAccountSecure.jsp">
                <i class="al-1 current"></i>
                <span>账号安全</span>
            </a>
        </li>
        <li>
            <a href="#"  class="bg-blue">
                <i class="al-2"style="background-position:-39px -31px;"></i>
                <span>我的信息</span>
            </a>
        </li>
    </ul>
</div>
<form id="form" method="post" action="instupdatesignature.do">
    <div class="security-right" style="width: 1046px">
        <div class="sr-t">
    <span class="tit-b"></span> <span class="acc-sec">我的信息</span>
</div>
        <div class="sr-b">
            <ul>
                <%--<li>--%>
                    <%--<div class="sb-info">--%>
                        <%--<p class="sbi-l">学号：</p>--%>
                        <%--<div class="sbi-m">--%>
                            <%--<span id="userNub"><%= student.getStudId()%></span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</li>--%>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">姓名：</p>
                        <div class="sbi-m">
                            <span id="userName"><%= instructor.getTeacherName()%></span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                    <p class="sbi-l">性别：</p>
                        <div class="sbi-m">
                            <span id="sex">男</span>
                        </div>
                    </div>
                </li>
                <%--<li>--%>
                    <%--<div class="sb-info">--%>
                            <%--<p class="sbi-l">班级：</p>--%>
                        <%--<div class="sbi-m">--%>
                            <%--<span id="userClass"><%= instructor.getClassName()%></span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</li>--%>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">我的签名：</p>
                        <div class="sbi-m">
                            <textarea name="sign" id="sign" cols="30" rows="10" class="my-sign" onblur="autoSubmit()"><%= instructor.getSignature()%></textarea>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</form>
</div>
<script type="text/javascript">
    function autoSubmit(){
        var text = $(".my-sign").val();
        if(text !== "") {
            $("#form").submit();
        }
    }
</script>
<script src="js/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="jquery.min.js">\x3C/script>')</script>
</body>
</html>