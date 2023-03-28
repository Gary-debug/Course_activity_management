<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
<%
Class.forName("org.mariadb.jdbc.Driver");
Connection conn = DriverManager
		.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from tea_class where tid='"+tid+"'");
int i=1;
%>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">教师</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <!-- 移动端显示 -->
      <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
        <i class="layui-icon layui-icon-spread-left"></i>
      </li>
      

    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
          <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
          tester
        </a>
        <dl class="layui-nav-child">
          <dd><a href="MyProfile.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">个人信息</a></dd>
          <dd><a href="EditPwd.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">修改密码</a></dd>
          <dd><a href="tea_denglu.jsp">退出登录</a></dd>
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
            <dd><a href="import_student.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">导入数据</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="demo2.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">导出数据</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
  <hr>
                    <table>
                    <tr>
					<%
					while (rs.next()) {
					%>	
					
					<%
					if(i%5!=0){
						
						
					
					%>
					
					<td>
					<a
						href="Class1.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>&cno=<%=rs.getString("cno")%>&cname=<%=rs.getString("cname")%>">
						<div class="col col-lg-3 col-md-4 col-sm-6 mt-3" style="text-align:center">
							<div class="card" style="width: 250px; height: 200px">
								<img alt="..." class="card-img-top" src=images/001.png
									style="width: 85%">
								<div class="card-body">
									<h2 class=card-title>
										<strong><%=rs.getString("cname")%></strong></h2>
									<p class="card-text1">
										<strong>班级号：<%=rs.getString("cno")%>
										</strong>
									</p>
									<p class="card-text2"></p>		
									<p class="card-text3">
					                    <strong>教师姓名：<%=rs.getString("tid")%></strong>
								</div>
							</div>
						</div>
					</a>
					</td>
					<%
					i++;
					}
					else{
					%>
					<td>
					<a
						href="Class1.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>&cno=<%=rs.getString("cno")%>&cname=<%=rs.getString("cname")%>">
						<div class="col col-lg-3 col-md-4 col-sm-6 mt-3" style="text-align:center">
							<div class="card" style="width: 250px; height: 200px">
								<img alt="..." class="card-img-top" src=images/001.png
									style="width: 85%">
								<div class="card-body">
									<h2 class=card-title>
										<strong><%=rs.getString("cname")%></strong></h2>
									<p class="card-text1">
										<strong>班级号：<%=rs.getString("cno")%>
										</strong>
									</p>
									<p class="card-text2"></p>		
									<p class="card-text3">
					                    <strong>教师姓名：<%=rs.getString("tid")%></strong>
								</div>
							</div>
						</div>
					</a>
					</td>
					</tr>
					
					<%
					i++;
					}
					}
					%>
					</table>
					<%
					rs.close();
					stmt.close();
					conn.close();
					
					%>
			
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