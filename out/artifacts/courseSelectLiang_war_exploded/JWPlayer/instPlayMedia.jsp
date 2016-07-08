<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="edu.findvideo.bean.*"%>
<%@page import="java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    int i=1;

    MediaGroup mediaGroup = (MediaGroup)request.getAttribute("mediagroup");
    List<Media> medialist = (List<Media>)request.getAttribute("mediaList");
%>
<!DOCTYPE html>
<html>
<head>

    <title>play</title>
   
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="../CSS/bootstrap.min.css" rel="stylesheet">
    <!--你自己的样式文件 -->
    <!--网页标签icon-->
    <!--<link rel="shortcut icon" href="img/favicon.ico">-->
    <link href="../CSS/jtpo-play.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../CSS/home.css" type="text/css">
    <link rel="stylesheet" href="../CSS/saved_resource.css" type="text/css">
    <script type="text/javascript" src="../JWPlayer/jwplayer.js"></script>
    <script src="../js/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#showbar").click(function(){

            jwplayer().getPlugin("controlbar").show();
        });
        $("#hidebar").click(function(){

            jwplayer().getPlugin("controlbar").hide();
        });

        $("#fullscreen").click(function(){
            alert(jwplayer().getFullscreen());
            jwplayer().setFullscreen(true);
            alert(jwplayer().getFullscreen());
            jwplayer(0).setFullscreen(true);
        });
    });
    </script>
    <script type="text/javascript">
        function download(){
            var url = "http://210.30.96.51/jlpt/download.do?f=../";
            var obj = document.getElementById('download');
            window.self.location.href = url;
        }
    </script>
</head>
<body>
<jsp:include page="../instNavbar.jsp" flush="true" />
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div id="title">
                <h2 style="float: left;margin-top: 20px;font-family: 'MS Mincho'" ><%= mediaGroup.getGroupTitle()%></h2>
            </div>
            <div id="content">
                <div id="player">
                    <div id="container" style="height: 560px;width: 960px;background-color: #000000">
                        <label style="color: #FFFFFF;line-height: 560px">Loading the player...</label>
                    </div>
                    <script type="text/javascript">
                        function play(url) {
                            var fileUrl = url;
                            var thePlayer = jwplayer("container").setup({
                                flashplayer: "JWPlayer/player.swf",
                                autostart: true,
                                height: 560,
                                width: 960,
                                file: fileUrl,
                                // plugins: {sharing: { link: false }},
                                image: "",
                                provider: "http"
                            });
                        };
//                        $(document).keydown(function(e){
//                            if(!e) var e = window.event;
//                            if(e.keyCode == 32){
//                                if(thePlayer.getState() != 'PLAYING'){
//                                    thePlayer.play(true);
//                                }
//                                else{
//                                    thePlayer.play(false);
//                                }
//                            }
//                        })
//                        jwplayer().getPlugin("controlbar").hide();
                    </script>
                    <script type="text/javascript">window.onload = play("<%= medialist.get(0).getUrl()%>")</script>
                </div>
            </div>
        </div>
        <div class="rank" style="margin-top: 50px">
            <div class="ranking" style="top: 0">
                <div class="ranking-top">
                    <h2 style="text-align: left;padding-left: 20px;">剧集列表</h2>
                </div>
                <div class="ranking-center">
                    <div class="charts-list">
                        <ul class="list"style="overflow: auto">
                        <c:forEach items="${mediaList}" var="ml">
                            <li class="charts">
                                <div class="charts-order">
                                    <i>&nbsp;<%=i++%>.&nbsp;</i>
                                    <span class="charts-info-name user-head" onclick="play('${ml.url}')" style="font-family:'MS Mincho';">${ml.mediaTitle}</span>
                                </div>
                            </li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </div>
</div>
<div id="footer">
    <p>本站所有视频均来自网络，仅限学术研究，请勿用于商业用途</p>
    <p>© Copyright 2014&nbsp;|&nbsp; 大连理工大学软件学院</p>
</div>
</body>
</html>
