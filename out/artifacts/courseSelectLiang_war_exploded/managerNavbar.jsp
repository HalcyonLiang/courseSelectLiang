<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    int i=1;



%>
<div id="header" class="navbar" style="margin-bottom: 0px;">
    <div class="page-container" id="nav">
        <div class="navbar-header">
            <!-- ======= LOGO ========-->
        <%--    <a href="studHome.jsp" class="navbar-brand" href="#home" style="color: #ffffff;margin-top: 5px;margin-left: -10px;padding: 0 0"><img src="img/logo.png" width="140"></a> --%>
        </div>
        <ul class="nav-item l">
            <li><a href="studUserInfo.jsp" target="_self">个人资料</a></li>
            <li><a href="teacherCourseCenter.jsp" target="_self">管理中心</a></li>
        </ul>
        <div id="login-area">
            <ul class="clearfix logined">
                <li class="set_btn" id="myHead">
                    <a id="header-avator" action-type="my_menu" href="#" target="_self" class=""><img src="/img/jtpo/user/stud/1.jpg" width="40" height="40">
                        <i class="myspace_remind" style="display: none;"></i>
                        <span style="display: none;">动态提醒</span>
                    </a>
                    <ul id="nav_list" style="display: none;">
                        <form id="subform" method="post" action="logoff.do">
                            <li><a id="my_logout" href="javascript:void(0)" onclick="document.getElementById('subform').submit()" target="_self">注销</a></li>
                        </form>
                    </ul>
                    <script type="text/javascript">
                        $(function () {
                            $('#header-avator').mouseenter(function(){
                                $('#nav_list').css('display','block');
                            });
                            $('#myHead').mouseleave(function() {
                                $('#nav_list').css('display','none');
                            });
                        });
                    </script>
                </li>
            </ul>
        </div>
    </div>
</div>