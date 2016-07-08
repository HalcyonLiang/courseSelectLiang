<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,edu.findvideo.bean.*,edu.findvideo.util.*,java.math.BigDecimal" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleSub ss = (SimpleSub) request.getAttribute("SimpleSub");

String url = ss.getMediaUrl() ;//+ "?start=" + start + "&end=" + end;
%>

<html>
  <head>

    <title>play</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link href="CSS/play.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="JWPlayer/jwplayer.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
	function download(){ 
		var url = "http://210.30.96.51/jlpt/download.do?f=../";
		var obj = document.getElementById('download'); 
		window.self.location = url; 
	}
	</script>
  </head>
  
  <body>
  <div id="content">
  <div id="player">
  <h1>视频:<span><%=ss.getMediaTitle() %></span></h1>
  <div id="container">
  Loading the player...
  </div> 
	<script type="text/javascript"> 
		jwplayer("container").setup({ 
			flashplayer: "JWPlayer/player.swf", 
			autostart: true,
			height: 360, 
			width: 640, 
			file: "<%=url %>",
			plugins: {sharing: { link: false }},
			image: "", 
			provider: "http", 
			"http.startparam":"starttime",
			events: {
 				onPause: function(event) {
 						
 				}
 			}
		}); 
	//	jwplayer().getPlugin("controlbar").hide();
		</script>
	</div>
	
	<div id="control">
	
	<button onClick="history.go(-1)">返回</button>
	<!-- <button id="download" onclick="download()">下载</button> -->
	<a href="<%=url %>">链接地址</a><span>鼠标右键迅雷下载(临时)</span>
	<!--<input type="text" id="url" /><input type="button" id="down" /> -->
	</div>
	</div>
  </body>
</html>
