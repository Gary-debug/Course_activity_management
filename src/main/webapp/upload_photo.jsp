<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="layui-v2.6.8/layui/layui.js"></script>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui-v2.6.8/layui/css/layui.css" tppabs="http://res.layui.com/layui/dist/css/layui.css"  media="all">
 
</head>
<body>
<%
request.setCharacterEncoding("utf-8");					
String tid = request.getParameter("tid");		
String tpwd = request.getParameter("tpwd");
%>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">老师</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <!-- 移动端显示 -->
      <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
        <i class="layui-icon layui-icon-spread-left"></i>
      </li>
      
      <li class="layui-nav-item layui-hide-xs"><a href="">nav 1</a></li>
      <li class="layui-nav-item layui-hide-xs"><a href="">nav 2</a></li>
      <li class="layui-nav-item layui-hide-xs"><a href="">nav 3</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">nav groups</a>
        <dl class="layui-nav-child">
          <dd><a href="">menu 11</a></dd>
          <dd><a href="">menu 22</a></dd>
          <dd><a href="">menu 33</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
          <img src="ok.jsp" class="layui-nav-img">
          tester
        </a>
        <dl class="layui-nav-child">
          <dd><a href="MyProfile.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">个人信息</a></dd>
          <dd><a href="EditPwd.jsptid=<%=tid%>&tpwd=<%=tpwd%>">修改密码</a></dd>
          <dd><a href="tea_denglu.jsp">退出登录</a></dd>
        </dl>
        <dl class="layui-nav-child">
          <dd><a href="">Your Profile</a></dd>
          <dd><a href="upload_photo.jsp">修改照片</a></dd>
          <dd><a href="">Sign out</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
        <a href="javascript:;">
          <i class="layui-icon layui-icon-more-vertical"></i>
        </a>
      </li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
      <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">班级管理</a>
          <dl class="layui-nav-child">
            <dd><a href="CreateClass.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">创建班级</a></dd>
            <dd><a href="MyClass.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">我的班级</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="manage_act.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">组织活动</a>
          <dl class="layui-nav-child">
            <dd><a href="Adjust_group.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">调整分组</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="control_state.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">管理活动状态</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="fill_score.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">填写活动成绩</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="random_group.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">随机分组</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">管理账号</a>
          <dl class="layui-nav-child">
            <dd><a href="EditPwd.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">修改密码</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="MyProfile.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">修改个人介绍</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">数据管理</a>
          <dl class="layui-nav-child">
            <dd><a href="demo2.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">导出数据</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div class="content">
		<!-- 用户头像 -->
		<div class="user-info" id="userInfo">
			<h>我的头像</h>
			<p>这个人很懒，什么都没说</p>
		</div>
		<form action="PortraitServlet" method="post" enctype="multipart/form-data">
            上传文件：<input type="file" name="headerImg"><br>
            <input type="submit" value="上传">
        </form>
			
		</div>
		<div><p id="path"></p></div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    底部固定区域
  </div>
</div>
<script src="./layui/layui.js"></script>
<script>
//JS 
layui.use(['element', 'layer', 'util'], function(){
  var element = layui.element
  ,layer = layui.layer
  ,util = layui.util
  ,$ = layui.$;
  
  //头部事件
  util.event('lay-header-event', {
    //左侧菜单事件
    menuLeft: function(othis){
      layer.msg('展开左侧菜单的操作', {icon: 0});
    }
    ,menuRight: function(){
      layer.open({
        type: 1
        ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
        ,area: ['260px', '100%']
        ,offset: 'rt' //右上角
        ,anim: 5
        ,shadeClose: true
      });
    }
  });
  
});
</script>
      
</body>
</html>