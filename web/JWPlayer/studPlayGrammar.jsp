<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="edu.findvideo.bean.*"%>
<%@page import="java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<List<String>> list=(List<List<String>>)request.getSession().getAttribute("list");
    String grammarName = (String)request.getAttribute("grammarName");
    String url = (String)request.getAttribute("grammarUrl");
    int i=1;
%>
<!DOCTYPE html>
<html>
<head>

    <title>playGrammar</title>
   
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
    <script src="../bootstrap/js/jquery-2.1.1.js"></script>
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
</head>
<body>
<jsp:include page="../studNavbar.jsp" flush="true" />
<div class="container">
    <div class="row">
        <div class="col-md-11" style="">
            <div id="title">
                <h2 style="float: left;margin-top: 20px;font-family: 'MS Mincho'" >${grammarName}</h2>
            </div>
            <div id="content">
                <div id="player">
                    <div id="container" style="height: 560px;width: 960px;background-color: #000000">
                        <label style="color: #FFFFFF;line-height: 560px">Loading the player...</label>
                    </div>
                    <script type="text/javascript">
                        function play(url) {
//                            alert(url);
                            var fileUrl = url;
                            var thePlayer = jwplayer("container").setup({
                                flashplayer: "JWPlayer/player.swf",
                                autostart: true,
                                height: 675,
                                width: 1200,
                                file: fileUrl,
                                // plugins: {sharing: { link: false }},
                                image: "",
                                provider: "http",
                                events:{
                                    onComplete:function playerReady (event){
//                                        alert("flash播放结束");
                                        $('#next').css('display','inline');
                                        $('#url').val("<%= url%>");
//                                        alert($('#url').val());
                                        var single = "ok";
                                        $.ajax({
                                            type:"post",
                                            url:"studaddcredit.do",
                                            contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                            dataType:"json",
                                            data:single,
                                            success: function(json){
//                                                alert("积分增加成功！");
                                        },
                                        error:function(err){
//                                            alert("积分增加失败！");
                                            console.log(err.responseText, 'failed' );
                                        }
                                        });
                                    }
                                }
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
                    <script type="text/javascript">window.onload = play("<%= url%>")</script>
                </div>
            </div>
        </div>
        <%--<div class="rank" style="margin-top: 50px;display: none">--%>
            <%--<div class="ranking" style="top: 0">--%>
                <%--<div class="ranking-top">--%>
                    <%--<h2 style="text-align: left;padding-left: 20px;">剧集列表</h2>--%>
                <%--</div>--%>
                <%--<div class="ranking-center">--%>
                    <%--<div class="charts-list">--%>
                        <%--<ul class="list">--%>
                        <%--<c:forEach items="${list}" var="l">--%>
                            <%--<li class="charts" style="height:37px">--%>
                                <%--<div class="charts-order" style="height: 37px">--%>
                                    <%--<span class="charts-info-name user-head" onclick="play('${l.get(0)}')"style="font-size: 20px">${l.get(2)}</span>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                        <%--</c:forEach>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div id="" class="">
            <div class="container" style="width: 1200px">
                <form class="form-group" method="post" action="grammarplaynext.do">
                    <input id="url" type="hidden" name="url" value="">
                    <button id="next" type="submit" class="btn btn-default" style="display: none">播放下一集</button>
                </form>
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
<%
    String info = (String) request.getAttribute("info");
    if(info == "视频已播放到最后一集！"){
%>
<script type="text/javascript">
    window.alert("视频已播放到最后一集！");
</script>
<%
    }
%>
</body>
</html>
