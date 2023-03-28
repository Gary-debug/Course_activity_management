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
}
	
table {
	    border-collapse: collapse;
	    border-spacing: 0;
	    
	}
	 
td,th {
	    padding: 0.5em 1em;
	}
  
  </style>
</head>
<%
String cno=request.getParameter("cno");	
//session.setAttribute("cno", cno);
Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
ResultSet wrs=stmt.executeQuery("select * from activity where cno='"+cno+"'");
String name,Sno=(String)session.getAttribute("Sno");
ResultSet rs=stmt.executeQuery("select * from student where sno='"+Sno+"'");
rs.next();
name=rs.getString("sname");

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
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
	<%
	ResultSet rsr=stmt.executeQuery("select * from class where cno='"+cno+"'");
	rsr.next();
	%>
	<h2 style="text-align:center;padding:20px;line-height:150%;font-weight:bold"><%=rsr.getString("cname") %>教学活动</h2>
<table border="1" width="90%" style="font-size:1em;margin-left:3%">
		<tr>
			<th>活动内容</th>
			<th>我的活动进度</th>
			
			
		</tr>
		<%
		
		
		while(wrs.next()){ 
			String ano=wrs.getString("ano");
			ResultSet rss=stmt.executeQuery("select * from grade where ano='"+ano+"' and sno='"+Sno+"'");
			if(rss.next()){
			String gno=rss.getString("gno");
			ResultSet rsss=stmt.executeQuery("select * from activity where ano='"+ano+"'");
			rsss.next();
			String state=rsss.getString("state");
			String howgrp=rsss.getString("how_group");
			String howscore=rsss.getString("how_score");
			ResultSet wrss=stmt.executeQuery("select * from dataupload where ano="+ano+" and gno='"+gno+"'");
			boolean flag=false;
			while(wrss.next()){
				if("1".equals(wrss.getString("state"))){
					flag=true;
				}
			}
			boolean flag2="0".equals(howgrp);
			boolean flag3="1".equals(howscore);
			
		String[] s=new String [4];
		s[0]=flag2?("group.jsp?ano="+wrs.getString("ano")):("group2.jsp?ano="+wrs.getString("ano"));
		s[1]=flag?("actinfo1.jsp?ano="+wrs.getString("ano")):("actinfo.jsp?ano="+wrs.getString("ano"));
		ResultSet wr=stmt.executeQuery("select * from grade where ano="+ano+" and sno='"+Sno+"'");
		wr.next();
		String ifhu=wr.getString("ifhu");
		s[2]=flag3?("1".equals(ifhu)?("actinfo2.jsp?ano="+wrs.getString("ano")):("huping.jsp?ano="+wrs.getString("ano"))):("actinfo1.jsp?ano="+wrs.getString("ano"));
		s[3]="actinfo3.jsp?ano="+wrs.getString("ano");
		String[] ss=new String [4];
		ss[0]=flag2?("0".equals(gno)?"未分组":"提交未开始（可修改分组）"):"提交未开始（可查看分组）";
		ss[1]=flag?"已提交":"未提交";
		ss[2]=flag3?("1".equals(ifhu)?"已完成所有互评":"未互评"):"已提交";
		ss[3]="已结束";
		%>
		<tr>
			<td><a href="<%=s[Integer.parseInt(state)] %>"><%=wrs.getString("aname")%></a></td>
			<td style="text-align:center"><%=ss[Integer.parseInt(state)] %></td>
		</tr>
		<%
		wr.close();
		rsss.close();
		rss.close();
		wrss.close();
		}}
		rsr.close();
		wrs.close();
		rs.close();
		stmt.close();
		conn.close();
		%>
</table>

	</div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    欢迎使用课程活动管理系统！
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
