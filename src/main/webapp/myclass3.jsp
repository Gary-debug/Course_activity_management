<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="./layui-v2.6.8/layui/layui.js"></script>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="./layui-v2.6.8/layui/css/layui.css" tppabs="http://res.layui.com/layui/dist/css/layui.css"  media="all">
 <style type="text/css">
  body{
	margin:0;
	color:#6a6f8c;
/* 	background:#c8c8c8; */
	background:#C1EBFF;
	font:600 16px/18px 'Open Sans',sans-serif;
	/*line-height:1.2em;*/
}
  
  </style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");					
String name,Sno=(String)session.getAttribute("Sno");
Class.forName("org.mariadb.jdbc.Driver");
	
Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
ResultSet wrs=stmt.executeQuery("select * from student where sno='"+Sno+"'");
wrs.next();
name=wrs.getString("sname");
wrs.close();
ResultSet rs=stmt.executeQuery("select * from class where sno='"+Sno+"'");
int i=1;
%>
<body>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">学生</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <!-- 移动端显示 -->
      <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
        <i class="layui-icon layui-icon-spread-left"></i>
      </li>
      
      
      <li class="layui-nav-item">
        
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
          <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
          <%=name %>
        </a>
        <dl class="layui-nav-child">
          <dd><a href="stu_denglu.jsp">退出登录</a></dd>
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
          <a class="" href="javascript:;">课程管理</a>
          <dl class="layui-nav-child">
            <dd><a href="myclass3.jsp">我的课程</a></dd>
            <dd><a href="moreclass.jsp">更多课程</a></dd>
          </dl>
        </li>
        
        <li class="layui-nav-item">
          <a href="javascript:;">账号管理</a>
          <dl class="layui-nav-child">
            <dd><a href="mdfpwd.jsp">修改密码</a></dd>
            <dd><a href="mdfphone.jsp">修改联系方式</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
  <div style="padding: 15px;">
  <h1 style="text-align:center;padding:20px;line-height:150%">我的课程</h1>

                    <table style="margin:5%;margin-top:3%">
                    <tr>
					<%
					
					while (rs.next()) {
					%>	
					
					<%
					ResultSet wwrs=stmt.executeQuery("select * from teacher where tid='"+rs.getString("tid")+"'");
					wwrs.next();
					if(i%5!=0){
						
						
					
					%>
					
					<td>
					<a
						href="class.jsp?cno=<%=rs.getString("cno")%>">
						<div class="col col-lg-3 col-md-4 col-sm-6 mt-3" style="text-align:center">
							<div class="card" style="width: 250px; height: 200px">
								<img alt="..." class="card-img-top" src="p1.png"
									style="width: 85%">
								<div class="card-body" style="margin:1%">
									<h2  style="line-height:1.5em">
										<strong><%=rs.getString("cname")%></strong></h2>		
									<p style="line-height:1.8em;font-size:1.2em">
					                    <strong><%=wwrs.getString("tname")%></strong></p>
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
						href="class.jsp?cno=<%=rs.getString("cno")%>">
						<div class="col col-lg-3 col-md-4 col-sm-6 mt-3" style="text-align:center">
							<div class="card" style="width: 250px; height: 200px">
								<img alt="..." class="card-img-top" src="p1.png"
									style="width: 85%">
								<div class="card-body" style="margin:1%">
									<h2  style="line-height:1.5em">
										<strong><%=rs.getString("cname")%></strong></h2>	
									<p style="line-height:1.8em;font-size:1.2em">
					                    <strong><%=wwrs.getString("tname")%></strong></p>
								</div>
							</div>
						</div>
					</a>
					</td>
					</tr>
					
					<%
					i++;
					}
					wwrs.close();
					}
					%>
					</table>
					<%
					rs.close();
					
					stmt.close();
					conn.close();
					
					%>
			
  </div></div>
 
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