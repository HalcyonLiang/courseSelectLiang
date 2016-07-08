<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="edu.findvideo.bean.*"%>
<%@page import="java.util.*" %>
<%@ page import="edu.findvideo.factory.DaoFactory" %>
<%@ page import="edu.findvideo.dao.TagDao" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<Tag> tagList=DaoFactory.getInstance().getTagDao().getAll();
    List<Tag> tagList1=new ArrayList<Tag>();
    List<Tag> tagList2=new ArrayList<Tag>();
    List<Tag> tagList3=new ArrayList<Tag>();
    List<Tag> tagList4=new ArrayList<Tag>();
    for(int j=0;j<tagList.size();j++){
        if(tagList.get(j).getTag_type()==1) {
            tagList1.add(tagList.get(j));
        }else if(tagList.get(j).getTag_type()==2){
            tagList2.add(tagList.get(j));
        }else if(tagList.get(j).getTag_type()==3){
            tagList3.add(tagList.get(j));
        }else if(tagList.get(j).getTag_type()==4){
            tagList4.add(tagList.get(j));
        }

    }
    request.setAttribute("categorylist1", tagList1);
    request.setAttribute("categorylist2", tagList2);
    request.setAttribute("categorylist3", tagList3);
    request.setAttribute("categorylist4", tagList4);
    int i=1;
    int z=1;
    String taga = "Tag-function";
    String tagb = "Tag-conversation";
    String tagc = "Tag-scene";
    String tagd = "Tag-relationship";
    MediaGroup mediaGroup = (MediaGroup)request.getAttribute("mediagroup");
    int groupId = mediaGroup.getGroupId();
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
    <link rel="stylesheet" href="../CSS/tagSearch.css">
    <script type="text/javascript" src="../JWPlayer/jwplayer.js"></script>
    <script src="../js/jquery.js"></script>
    <script src="../icheck/icheck.js"></script>
    <link href="../icheck/skins/square/blue.css" rel="stylesheet">
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
<div id="num" style="display:none"></div>
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="teaModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="width:600px;height:auto;margin: auto;margin-top: 25%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">添加标签</h4>
            </div>
            <div class="modal-body">
                <div class="tag-type" style="width: 500px">
                    <ul class="n_num">
                        <li style="padding-left: 20px" class="on"><a href="javascript:void(0)" id="function" onclick="switchover()">功能</a></li>
                        <li style="padding-left: 40px"><a href="javascript:void(0)" id="conversation" onclick="switchover()">会话</a></li>
                        <li style="padding-left: 40px"><a href="javascript:void(0)" id="scene" onclick="switchover()">场景</a></li>
                        <li style="padding-left: 40px"><a href="javascript:void(0)" id="relationship" onclick="switchover()">对话关系</a></li>
                    </ul>
                </div>
                <div class="tag-list" style="height:auto;width: 520px" >
                    <form method="post" class="form-inline" action="tag.do" id="addTagForm">
                        <input type="hidden" name="startTime" id="start2"/>
                        <input type="hidden" name="endTime" id="end2"/>
                        <input type="hidden" name="method" id="method" value="add"/>
                        <input type="hidden" name="url" id="url" value="1234"/>
                        <input type="hidden" name="mediaId" id="mediaId" value=""/>
                        <ul class="function" style="display: block">
                            <c:forEach items="${categorylist1}" var="name">
                                <li style="float: left;display: block" >
                                    <input type="checkbox" name="tag_list" value="${name.tag_id}" class="checkbox" id="<%= taga + i%>" style="">
                                    <label for="<%= taga + i++%>" class="" style="float: none;padding-left: 10px;padding-right: 15px">${name.tag_name}</label>
                                </li>
                            </c:forEach>
                        </ul>
                        <ul class="conversation" style="display: none">
                            <c:forEach items="${categorylist2}" var="name">
                                <li style="float: left;display: block" >
                                    <input type="checkbox" name="tag_list" value="${name.tag_id}" class="checkbox" id="<%= tagb + i%>" style="">
                                    <label for="<%= tagb + i++%>" class="" style="float: none;padding-left: 10px;padding-right: 15px">${name.tag_name}</label>
                                </li>
                            </c:forEach>
                        </ul>
                        <ul class="scene" style="display: none">
                            <c:forEach items="${categorylist3}" var="name">
                                <li style="float: left;display: block" >
                                    <input type="checkbox" name="tag_list" value="${name.tag_id}" class="checkbox" id="<%= tagc + i%>" style="">
                                    <label for="<%= tagc + i++%>" class="" style="float: none;padding-left: 10px;padding-right: 15px">${name.tag_name}</label>
                                </li>
                            </c:forEach>
                        </ul>
                        <ul class="relationship" style="display: none">
                            <c:forEach items="${categorylist4}" var="name">
                                <li style="float: left;display: block" >
                                    <input type="checkbox" name="tag_list" value="${name.tag_id}" class="checkbox" id="<%= tagd + i%>" style="">
                                    <label for="<%= tagd + i++%>" class="" style="float: none;padding-left: 10px;padding-right: 15px">${name.tag_name}</label>
                                </li>
                            </c:forEach>
                        </ul>
                        <textarea placeholder="请输入描述" style="width: 485px;margin-top: 10px" name="description" id="description"></textarea>
                    </form>
                </div>
                <button  type="button" id="stu-signin-btn" value="确定" hidefocus="true" class="btn btn-primary" style="width: 318px;height: 40px;margin-top: 10px" onclick="submitForm()">确定添加</button>
            </div>
        </div>
    </div>
</div>
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
                        function play(url,id) {
                            var fileUrl = url;
                            var mediaId = id;
                            $("#num").val(1);
                            $("#url").val(fileUrl);
                            $("#mediaId").val(mediaId);
                            var thePlayer = jwplayer("container").setup({
                                flashplayer: "JWPlayer/player.swf",
                                autostart: true,
                                height: 560,
                                width: 960,
                                file: fileUrl,
                                // plugins: {sharing: { link: false }},
                                image: "",
                                provider: "http",
                                "http.startparam":"starttime",
                                events: {
                                    onPause: function(event) {
                                        var i = $("#num").val();
                                        if(i==1){
                                            $("#start").val(this.getPosition());
                                            $("#start2").val(this.getPosition());
                                            i++;
                                            $("#num").val(i);
                                        }
                                        else if(i==2){
                                            $("#end").val(this.getPosition());
                                            $("#end2").val(this.getPosition());
                                            i=1;
                                            $("#num").val(i);
                                        }
                                    }
                                }
                            });
                        }
                    </script>
                    <script type="text/javascript">window.onload = play("<%= medialist.get(0).getUrl()%>",'<%= medialist.get(0).getMediaId()%>')</script>
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
                        <ul class="list">
                            <c:forEach items="${mediaList}" var="ml">
                                <li class="charts">
                                    <div class="charts-order">
                                        <i>&nbsp;<%=z++%>.&nbsp;</i>
                                        <span class="charts-info-name user-head" onclick="play('${ml.url}','${ml.mediaId}')" style="font-family:'MS Mincho';">${ml.mediaTitle}</span>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="" class="">
            <div class="col-md-9">
                <form class="form-group">
                    <button type="button" class="btn btn-default">开始时间</button>
                    <input class="input-sm" type="text" name="start" size="10" id="start"/>
                    <button type="button" class="btn btn-default">结束时间</button>
                    <input class="input-sm" type="text" name="end" size="10" id="end"/>
                    <button type="button" class="btn btn-default" id="add">添加</button>
                    <button type="button" class="btn btn-default" onclick="resetTime()">重置</button>
                    <button type="button" class="btn btn-default" onclick="history.go(-1)">返回</button>
                    <%--<button type="button" class="btn btn-default"><a href="<%=url%>">下载(右键另存为)</a></button>--%>
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
<script>
    $(function(){
        $("#add").click(function(){
            $("#teaModal").modal("toggle");
        });
    });
</script>
<script type="text/javascript">
    function submitForm() {
//        $('#addTagForm').submit();
        var groupId = <%= groupId%>;
        var method = $("#method").val();
        var mediaid = $("#mediaId").val();
        var url = $("#url").val();
//        var medianame = $("#medianame").val();
        var starttime = $("#start2").val();
        var endtime = $("#end2").val();
        var list=document.getElementsByName("tag_list");
        var objarray=list.length;
        var tag_list="";
        for (var i=0;i<objarray;i++)
        {
            if(list[i].checked == true)
            {
                tag_list+=list[i].value+",";
            }
        }
        var description = $("#description").val();
        var data="groupId="+groupId+"&method="+method+"&mediaId="+mediaid+"&url="+url+"&startTime="+starttime+"&endTime="+endtime+"&tag_list="+tag_list+"&description="+description;
        $.ajax({
            type:"post",
            url:"tag.do",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType:"json",
            data:data,
            success: function(json){
                $("#teaModal").modal("hide");
                alert("标签添加成功");
            },
            error:function(err){
                alert("标签时间不全！请修正");
                console.log(err.responseText, 'failed' );
            }
        });
    }
</script>
<script>
    function switchover(){
        var temp = window.event.srcElement;
        var id = $(temp).attr("id");
        $(temp).parent().siblings().removeClass("on");
        $(temp).parent().addClass("on");
        $("."+id).siblings().css("display","none");
        $("."+id).css("display","block");
        $("#description").css("display","block");
    }
</script>
<script>
    $(document).ready(function(){
        $('input.radio , input.checkbox').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
<script type="text/javascript">
    function resetTime(){
        $("#num").val(1);
        $("#start").val("");
        $("#start2").val("");
        $("#end").val("");
        $("#end2").val("");
    }
</script>
</body>
</html>
