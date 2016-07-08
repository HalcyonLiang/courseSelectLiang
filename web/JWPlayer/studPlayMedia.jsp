<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="edu.findvideo.bean.*"%>
<%@page import="java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Student stud = (Student)request.getSession().getAttribute("userInfo");
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


    <script type="text/javascript" src="/static/jquery-2.1.4.min.js"></script>
    <link rel="stylesheet" href="/static/index.css" >
    <link rel="stylesheet" href="/static/layer.css">
    <link rel="stylesheet" href="http://static.mukewang.com/static/css/??base.css,common/common-less.css,course/inc/course_common-less.css,common/pic-viewer-less.css,course/course_play-less.css,nanoscroller.css?v=1445835132" type="text/css">

    <!--你自己的样式文件 -->
    <!--网页标签icon-->
    <!--<link rel="shortcut icon" href="img/favicon.ico">-->

    <link href="../CSS/jtpo-play.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../CSS/home.css" type="text/css">
    <link rel="stylesheet" href="../CSS/saved_resource.css" type="text/css">
    <script type="text/javascript" src="../JWPlayer/jwplayer.js"></script>
    <script src="../js/jquery.js"></script>
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
<jsp:include page="../studNavbar.jsp" flush="true" />
<div class="container">
    <div class="section-list">
        <div class="operator">
            <div class="op chapter" id="chapter"><em class="icon-menu"></em>剧集</div>
            <div class="op notes" id="notebook"><em class="icon-note"></em>笔记</div>
            <div class="op question" id="question"><em class="icon-addques"></em>提问</div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9">
            <div id="title">
                <h2 style="float: left;margin-top: 20px;font-family: 'MS Mincho'" ><%= mediaGroup.getGroupTitle()%></h2>
            </div>
            <div id="content">
                <div id="player">
                    <div id="container" style="height: 560px;width: 1260px;background-color: #000000">
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
                                provider: "http",
                                events:{
                                    onComplete:function playerReady (event){
//                                        alert("flash播放结束");
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
                    <script type="text/javascript">window.onload = play("<%= medialist.get(0).getUrl()%>")</script>
                </div>
            </div>
        </div>
     <%-- <div class="rank" style="margin-top: 50px">
            <div class="ranking" style="top: 0">
                <div class="ranking-top">
                    <h2 style="text-align: left;padding-left: 20px;">剧集列表</h2>
                </div>
                <div class="ranking-center">
                    <div class="charts-list">
                        <ul class="list" style="overflow: auto">
                        <c:forEach items="${mediaList}" var="ml">
                            <li class="charts">
                                <div class="charts-order">
                                    <i>&nbsp; <%=i++%>.&nbsp;</i>
                                    <span class="charts-info-name user-head" onclick="play('${ml.url}')" style="font-family:'MS Mincho';">${ml.mediaTitle}</span>
                                </div>
                            </li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div> --%>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </div>
</div>
<div id="footer">
    <p>本站所有视频均来自网络，仅限学术研究，请勿用于商业用途</p>
    <p>© Copyright 2014&nbsp;|&nbsp; 大连理工大学软件学院</p>
</div>


<!-- 右侧隐藏章节信息 -->
<div id="chapterContext" style="top: 112px;">
    <c:forEach items="${mediaList}" var="ml">
        <li class="charts">
            <div class="charts-order">
                <i>&nbsp;<%=i++%>.&nbsp;</i>
                <span class="charts-info-name user-head" onclick="play('${ml.url}')" style="font-family:'MS Mincho';">${ml.mediaTitle}</span>
            </div>
        </li>
    </c:forEach>
</div>
<!-- 添加笔记 -->
<div class="center" id = "notebookContext">

    <div style="float: left;font-size: 20px;margin-left: 2%;margin-top: 2%;">笔记</div>
    <div class ="closeDiv" style="float: right;font-size: 20px;cursor: pointer;margin-top: 2%; margin-right: 2%;">×</div>
    <div style="background-color: #ccc;height: 1px;width: 100%;margin-top: 8%;"></div>
 <%--  <form id="saveForm" action = "saveNote.do" method="post" > --%>
    <div style=" position:relative ;width: 94%;height: 50%;margin:3%;">
        <textarea style="width: 100%;height: 100%;resize: none;font-size:16px;"  id ="note" name="noteMy"></textarea>
    </div>
    <input type="button" onclick="form.submit()" value="保存" id="submitBtn" class="course-btn r" >
<%--   </form>--%>

</div>

<script type="text/javascript">
  $(function(){
      $("#submitBtn").click(function() {
          var note = $("#note").val();
          $.ajax({
              type: "POST",
              url: "/saveNote.do",
              data: {noteMy:note},
              dataType: "text",
              success: function () {
                  alert("ok");
                  $("#note").val("");
                  return false;
              },
              error: function () {
                  alert("fail");
                  return false;
              }
          });
      });
      //章节点击事件
      var tag = 0; //显示，隐藏的标记
      $("#chapter").bind("click",function(){
          if(tag == 0){
              $(".youce").animate({right:'20%'},"fast");
              $("#chapterContext").animate({right:'0%'},"fast");
              $(this).addClass("red");
              tag = 1;
          }else{
              $(".youce").animate({right:'0%'},"fast");
              $("#chapterContext").animate({right:'-20%'},"fast");
              $(this).removeClass("red");
              tag = 0;
          }
      });

      //点击笔记
      $("#notebook").bind("click",function(){
          $("#background").fadeIn();
          $("#notebookContext").fadeIn();
      });

      //点击提问
      $("#question").bind("click",function(){
          $("#background").fadeIn();
          $("#questionContext").fadeIn();
      });

      //点击章节内容事件
      $("#chapterContext .icon").bind("click",function(){
          alert($(this).text());
      });

      //关闭笔记或者提问
      $(".closeDiv").bind("click",function(){

          $(this).parent().fadeOut();
          $("#background").fadeOut();
          $("#note").val("");
      });
  });
</script>
<!--
<script type="text/javascript" src="/static/sea.js"></script>
<script type="text/javascript" src="/static/sea_config.js?v=210510271425"></script>
<script type="text/javascript">seajs.use("/static/"+OP_CONFIG.module+"/"+OP_CONFIG.page);</script>


<div style="display: none">
  <script type="text/javascript">
      var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
      document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Ff0cfcccd7b1393990c78efdeebff3968' type='text/javascript'%3E%3C/script%3E"));
  </script><script src=" -tip://hm.baidu.com/h.js?f0cfcccd7b1393990c78efdeebff3968" type="text/javascript"></script><a href="http://tongji.baidu.com/hm-web/welcome/ico?s=f0cfcccd7b1393990c78efdeebff3968" target="_blank"><img border="0" src="http://eiv.baidu.com/hmt/icon/21.gif" width="20" height="20"></a>
</div>
<!--笔记弹出框-->   <!--
<div class="publish clearfix note-pop" id="note-publist" style="display: block;">
  <div class="publish-wrap publish-wrap-note video-publish-note pop-con">
      <div class="pop-title">
          <h3>笔记</h3>
          <span class="icon-close"></span>
      </div>
      <div id="js-note-input-fake" class="textarea-wrap">
          <textarea data-maxlength="1000" id="js-note-textarea" class="js-placeholder" name="" placeholder="请输入笔记内容..."></textarea>
          <p class="note-text-counter"><span id="js-note-limit">5</span>/1000</p>
      </div>
      <div class="publish-note-btns input-btm clearfix pop-footer">
          <div class="verify-code clearfix"></div>
          <div title="截图" class="js-shot-video screen-btn" data-type="note">
              <span>截图</span>
          </div>
          <input type="button" title="发表" value="保存" id="js-note-submit" class="course-btn r">
          <label for="js-isshare" class="label-checked r"><input type="checkbox" checked="checked" id="js-isshare" class="checked"> 公开</label>
          <!-- <div class="integral-info">
              <span>本次提问将花费1个积分</span>
              <a target="_blank" href="/myclub/rule">什么是积分？</a>
          </div> -->
   <!--  </div>
  </div>
</div> -->
</body>
</html>
