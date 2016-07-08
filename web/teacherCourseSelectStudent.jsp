<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<%@ page import="bean.Student" %>
<%@ page import="bean.Teacher" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Teacher teacher = (Teacher)request.getSession().getAttribute("teacher");
%>
<!DOCTYPE html>
<html>
<head>
    <!--<base href="http://jpteachplat.japanesecorpus.com:80/">-->

    <title>SS DUT | J T P O</title>
    <meta charset="utf-8">
    <meta name="description" content="学生课程中心.">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="icheck/skins/square/red.css" charset="utf-8"/>
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="icheck/icheck.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="icheck/skins/square/red.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="CSS/bootstrap.min.css">--%>
    <link rel="stylesheet" href="CSS/zclc1.css">
    <link rel="stylesheet" href="CSS/table.css" type="text/css">
    <!--[if lt IE 9]-->
    <!--<script src="js/respond.min.js"></script>-->
    <!--[endif]-->
    <link href="bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
            <span class="sty-name"><%= teacher.getTeacherName() %></span>
        </div>
        <ul class="security-list">
            <li>
                <a href="teacherCourseCenter.jsp" class="">
                <i class="al-1 current"></i>
                    <span>我的课程</span>
                </a>
            </li>
            <li>
                <a href="#" class="bg-blue">
                    <i class="al-2"style="background-position:-39px -31px;"></i>
                    <span>课程详细</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="security-right" style="width: 1046px">
        <div class="sr-t">
            <span class="tit-b"></span> <span class="acc-sec">课程详细</span>
        </div>
        <div style="overflow-y: auto;height: 560px;margin-right: 58px">
        <table class="homeworkTable table table-striped">
            <thead>
            <tr>
                <th style="width: 120px;text-align: center">学生姓名</th>
                <th style="width: 120px;text-align: center">学生性别</th>
                <th style="width: 360px;text-align: center">课程名字</th>
                <th style="width: 80px;text-align: center">学生班级</th>
                <th style="width: 100px;text-align: center">成绩</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${studentList}" var="hne">
                <form method="post" action="studSelectCourse.do">
                <tr  style="height: 70px">
                        <td style="vertical-align: middle">${hne.studName}</td>
                        <td style="vertical-align: middle">${hne.studSex}</td>
                        <td style="vertical-align: middle"><%=request.getSession().getAttribute("course_name")%></td>
                        <td style="vertical-align: middle">${hne.studClassName}</td>
                        <td style="vertical-align: middle">${hne.grade}</td>

                  </tr>
                </form>
            </c:forEach>
            <%--<tr style="height: 70px">--%>
            <%--<td>2015.3.15</td>--%>
            <%--<td>2015.3.19</td>--%>
            <%--<td>时春惠</td>--%>
            <%--<td>作业描述作业描述作业描述作业描述作业描述作业描述作业描述</td>--%>
            <%--<td><button class="btn btn-primary btn-xs">详情</button></td>--%>
            <%--</tr>--%>
            </tbody>
        </table>
        </div>
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
<script>
    $(document).ready(function() {
        $('input.radio , input.checkbox').iCheck({
            checkboxClass: 'icheckbox_square-red',
            radioClass: 'iradio_square-red',
            increaseArea: '20%' // optional
        });
    });
    $('#homeworkType1').on('ifChecked', function(event){
        $('.录音作业').css('display','');
        $('.语法预习').css('display','none');
        $('.片段搜索').css('display','none');
        $('.其他作业').css('display','none');
    });
    $('#homeworkType2').on('ifChecked', function(event){
        $('.录音作业').css('display','none');
        $('.语法预习').css('display','');
        $('.片段搜索').css('display','none');
        $('.其他作业').css('display','none');
    });
    $('#homeworkType3').on('ifChecked', function(event){
        $('.录音作业').css('display','none');
        $('.语法预习').css('display','none');
        $('.片段搜索').css('display','');
        $('.其他作业').css('display','none');
    });
    $('#homeworkType4').on('ifChecked', function(event){
        $('.录音作业').css('display','none');
        $('.语法预习').css('display','none');
        $('.片段搜索').css('display','none');
        $('.其他作业').css('display','');
    });
</script>

<%
    String info = (String) request.getAttribute("info");
    if(info == "选课成功"){
%>
<script type="text/javascript">
    window.alert("选课成功");
</script>
<%
    }else if(info == "退选成功")
    {
%>
<script type="text/javascript">
    window.alert("退选成功");
</script>
<%
    }else if(info == "您选的课程时间冲突")
    {
%>
<script type="text/javascript">
    window.alert("您选的课程时间冲突");
</script>
<%
    }
%>
<%--<script src="js/jquery.min.js"></script>--%>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.ja.js" charset="UTF-8"></script>
<script>window.jQuery || document.write('<script src="jquery.min.js">\x3C/script>')</script>
</body>
</html>