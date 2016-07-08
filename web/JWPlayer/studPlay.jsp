<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*,edu.findvideo.bean.*,edu.findvideo.util.*,java.math.BigDecimal,java.lang.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    SimpleSub ss = (SimpleSub) request.getAttribute("SimpleSub");
    double start = ss.getStartTime();
    double end = ss.getEndTime();
    String url = ss.getMediaUrl() + "?start=" + start + "&end=" + end;

    session.setAttribute("SimSub",ss);
    HomeWork homework = (HomeWork) request.getSession().getAttribute("homework");
%>
<!doctype html>
<html>
<head>

    <title>play</title>
   
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--你自己的样式文件 -->

    <link rel="shortcut icon" href="img/favicon.ico">
    <link href="CSS/play.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="CSS/jquery-ui-1.8.4.css" media="all" />
    <script type="text/javascript" src="JWPlayer/jwplayer.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.4.min.js"></script>
    <%--<script src="bootstrap/js/jquery-2.1.1.js"></script>--%>
    <script type="text/javascript" src="js/studPlay.js"></script>
    <%--<script type="text/javascript">--%>
    <%--$(document).ready(function(){--%>
        <%--$("#showbar").click(function(){--%>

            <%--jwplayer().getPlugin("controlbar").show();--%>
        <%--});--%>
        <%--$("#hidebar").click(function(){--%>

            <%--jwplayer().getPlugin("controlbar").hide();--%>
        <%--});--%>

        <%--$("#fullscreen").click(function(){--%>
            <%--alert(jwplayer().getFullscreen());--%>
            <%--jwplayer().setFullscreen(true);--%>
            <%--alert(jwplayer().getFullscreen());--%>
            <%--jwplayer(0).setFullscreen(true);--%>
        <%--});--%>
    <%--});--%>

    <%--</script>--%>
    <%--<script type="text/javascript">--%>
        <%--function download(){--%>
            <%--var url = "http://210.30.96.51/jlpt/download.do?f=../";--%>
            <%--var obj = document.getElementById('download');--%>
            <%--window.self.location.href = url;--%>
        <%--}--%>
    <%--</script>--%>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <h3 class="text-left" style="margin-left: 92px;font-family: 'MS Mincho'"><%=ss.getMediaTitle() %></h3>
        </div>

        <ul class="nav nav-tabs navbar-right">
            <%
                if(Boolean.parseBoolean(session.getAttribute("isInstructor").toString()))
                {
            %>
            <li><a href="instHome.jsp">主页</a></li>
            <%
            }else{
            %>
            <li><a href="studHome.jsp">主页</a></li>
            <%
                }
            %>
            <li><a href="findvideo.jsp">搜索首页</a></li>
            <li><a href="exit.do">退出</a></li>
            <li><a href="##">${username}</a></li>
        </ul>

    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
<%--<div id="content">--%>
    <%--<div id="player">--%>
        <div id="container" style="height: 560px;width: 960px;background-color: #000000">
            <label style="color: #FFFFFF;line-height: 560px">Loading the player...</label>
        </div>
        <script type="text/javascript">
            jwplayer("container").setup({
                flashplayer: "JWPlayer/player.swf",
                autostart: true,
                height: 560,
                width: 960,
                file: "<%=url %>",
               // plugins: {sharing: { link: false }},
                image: "",
                provider: "http",
                "http.startparam":"starttime",
                events: {
                    onPause: function(event) {
                    }
                }
            });
//            	jwplayer().getPlugin("controlbar").hide();
        </script>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="btn-group">
                <button type="button" class="btn btn-default"><a href="#" id="add">收藏</a></button>
                <%
                    if(Boolean.parseBoolean(request.getSession().getAttribute("set").toString()))
                    {
                %>
                <button type="button" class="btn btn-default"><a href="#" id="answer">添加作业</a></button>
                <%
                    }
                %>
                <button type="button" class="btn btn-default" onclick="history.go(-1)">返回</button>
                <button type="button" class="btn btn-default"><a href="<%=url%>">下载（右键另存为）</a></button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div id="control" style="margin-right: -15px;">
                <h3 id="subToggle">字幕</h3>
                <%
                    if(Boolean.parseBoolean(request.getAttribute("notMark").toString()))
                    {
                %>
                <%
                    }else{
                %>
                    <p id="sub" class="text-center text-info"><%=ss.getContentMark() %></p>
                <%
                    }
                %>
            </div>
        </div>

        <%--<div class="col-md-4">--%>
        <%--<!--<a href="playall.do" style="text-decoration:none;">播放全部内容</a>-->--%>
            <%--<div class="btn-group">--%>
                <%--&lt;%&ndash;<button type="button" class="btn btn-default" id="fullscreen">FullScreen</button>&ndash;%&gt;--%>
                <%--<button type="button" class="btn btn-default" id="hidebar">Hide</button>--%>
                <%--<button type="button" class="btn btn-default" id="showbar">Show</button>--%>
                <%--<button type="button" class="btn btn-default" onclick="history.go(-1)">返回</button>--%>
                <%--<button type="button" class="btn btn-default"><a href="<%=url%>">下载视频片段</a></button>--%>
            <%--</div>--%>

        <%--<!-- <button id="download" onclick="download()">下载</button> -->--%>

        <%--<!--<input type="text" id="url" /><input type="button" id="down" /> -->--%>

        <%--</div>--%>
    </div>
</div>
<div id="footer">
    <p>本站所有视频均来自网络，仅限学术研究，请勿用于商业用途</p>
    <p>© Copyright 2014&nbsp;|&nbsp; 大连理工大学软件学院</p>
</div>

<div id="addcol">
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <div class="col-sm-4">
                <input type="hidden" class="form-control" id="col_url" name="col_url" value="<%=url%>"/>
            </div>
        </div>
        <div class="form-group">
            <label for="col_name" class="col-sm-3 control-label">标题</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="col_name" id="col_name"/>
            </div>
        </div>
        <div class="form-group">
            <label for="col_name" class="col-sm-3 control-label">类别</label>
            <div class="col-sm-5">
                <select class="form-control" name="group_class" id="col_type">
                    <option value="1">日剧</option>
                    <option value="2">动漫</option>
                    <option value="3">电影</option>
                    <option value="4">其他</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <input type="button" class="btn btn-default" value="确定" class="loginbutton" id="btn">
            </div>
        </div>
    </form>
</div>
<%
    if(Boolean.parseBoolean(request.getSession().getAttribute("set").toString()))
    {
%>
<div id="answercheck">
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <p style="margin: 15px 10px 0px;font-size: 16px;">作业描述：<%= homework.getContent()%></p>
        </div>
        <div class="form-group">
            <div class="col-sm-4">
                <input type="hidden" class="form-control" id="ans_url" name="ans_url" value="<%=url%>"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <input type="button" class="btn btn-default" value="确定" class="loginbutton" id="btn2">
            </div>
        </div>
    </form>
</div>
<%
    }
%>
<div id="info">
    <br/>
    <label class="text-center">添加成功!</label>
</div>

<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
