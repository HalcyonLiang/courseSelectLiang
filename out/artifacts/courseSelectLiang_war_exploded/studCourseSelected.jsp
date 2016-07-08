<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="bean.Student" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Student student = (Student)request.getSession().getAttribute("student");

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
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,300,300italic,400italic,700,700italic,900" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="CSS/zclc1.css">
    <link rel="stylesheet" href="CSS/table.css" type="text/css">
    <!--[if lt IE 9]-->
    <!--<script src="js/respond.min.js"></script>-->
    <!--[endif]-->
    <script src="js/jquery.min.js"></script>
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
            <span class="sty-name"><%=student.getStudName()%></span>
        </div>
        <ul class="security-list">
            <li>
                <a href="studCourseCenter.jsp" class="">
                    <i class="al-1 current"></i>
                    <span>可选择课程</span>
                </a>
            </li>
            <li>
                <a href="#"  class="bg-blue">
                    <i class="al-2"style="background-position:-39px -31px;"></i>
                    <span>已选择课程</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="security-right" style="width: 1046px">
        <div class="sr-t">
            <span class="tit-b"></span> <span class="acc-sec">已选择课程</span>
        </div>
        <table class="homeworkTable table table-striped">
            <thead>
            <tr>
                <th style="width: 120px;text-align: center">课程名称</th>
                <th style="width: 120px;text-align: center">课程专业</th>
                <th style="width: 120px;text-align: center">课程老师</th>
                <th style="width: 360px;text-align: center">课程描述</th>
                <th style="width: 80px;text-align: center">课程周次</th>
                <th style="width: 80px;text-align: center">课程课节</th>
                <th style="width: 100px;text-align: center">退选</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${courseSelected}" var="he">
            <form method="post" action="studUndoSelected.do">
                <tr  style="height: 70px">
                <td style="vertical-align: middle">${he.courseName}</td>
                <td style="vertical-align: middle">${he.courseDept}</td>
                <td style="vertical-align: middle">${he.teacherName}</td>
                <td style="vertical-align: middle">${he.courseContent}</td>
                <td style="vertical-align: middle">${he.courseWeek}</td>
                <td style="vertical-align: middle">${he.courseLesson}</td>
                <td style="vertical-align: middle"><input type="hidden" name="course_id" value="${he.courseID}">

                    <input type="hidden" name="teacher_name" value="${he.teacherName}"><button class="btn btn-primary btn-sm" onclick="submit()">退选</button></td>
            </tr>
            </form>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
<script type="text/javascript">
    var sign_value = $(".my-sign").val();
    function autoSubmit(){
        var text = $(".my-sign").val();
        if(text !== "" && text !== sign_value) {
            $("#form").submit();
        }
    }
</script>
<script src="js/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="jquery.min.js">\x3C/script>')</script>
</body>
</html>