<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
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
  
  </style>
</head>
<%
request.setCharacterEncoding("utf-8");
String ano=request.getParameter("ano");
String name,Sno=(String)session.getAttribute("Sno");
Class.forName("org.mariadb.jdbc.Driver");
	
Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from student where sno='"+Sno+"'");
rs.next();
name=rs.getString("sname");

ResultSet wwrs=stmt.executeQuery("select * from activity where ano='"+ano+"'");
wwrs.next();

ResultSet wrs0=stmt.executeQuery("select gno from grade where ano='"+ano+"' and sno='"+Sno+"'");
wrs0.next();
String gno0=wrs0.getString("gno");
wrs0.close();

ResultSet wrs=stmt.executeQuery("select gno from grade where ano='"+ano+"' group by gno having gno!='"+gno0+"'");
//WebRowSet wrs0=RowSetProvider.newFactory().createWebRowSet();
//wrs0.populate(wrs);

String op="";
 op=request.getParameter("op");
 if("0".equals(op)){
 %>
 <script type="text/javascript">alert("提交成功！");</script>
 <%}else if("1".equals(op)){%>
 <script type="text/javascript">alert("提交内容不能为空！");</script>
 <%} else{}
int pg=1,i=1;
String p=request.getParameter("p");

if(p!=null&&p.length()>0){
	pg=Integer.parseInt(p);
}
int start,limit;
wrs.last();
int count=wrs.getRow();
start=(pg-1)*i;
limit=pg*i<count?pg*i:count;
if(start>0){
	wrs.absolute(start);
}
else{
	wrs.beforeFirst();
}
boolean flag=pg*i<count;
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
	<h1 style="text-align:center;padding:20px;line-height:150%"><%=wwrs.getString("aname") %>小组互评</h1>
	<%
	
	
	while(wrs.next()&&wrs.getRow()<=limit){
	String gno=wrs.getString("gno");
	
	%>
	<p style="padding-left:5%;padding-right:5%"><%=wwrs.getString("notice") %></p>
	<% String s="";
	ResultSet rss=stmt.executeQuery("select * from dataupload where ano='"+ano+"' and gno='"+gno+"'");
   if(rss.next()){
	   s=rss.getString("data");
   }
   rss.close();
	   %>
	   
	   <div style="margin-top:1%"></div>
	  <form name="f" action="updatehu.jsp" method="post" style="padding-left:5%;padding-right:5%;font-size:0.8em">
   <div style="width:100%;margin:0 auto;overflow: hidden">
   <aside style="float:left;width:85%;height:100%">
   <h3 style="margin-bottom:1%;font-weight:bold">正文：</h3>
	   
	   <pre><textarea name="txta" style="font-weight:normal;padding:1%;width:95%" rows="20" readonly><%=s %></textarea></pre>
	   </aside>
	  
	   <section style="float:left;width:15%;height:100%">
	   <h3 style="margin-bottom:5%;font-weight:bold">评分（0-100）</h3>
	<div style="margin:3%">
			<label for="z1" class="label" >指标1</label>
			<input id="z1" type="number"  name = "v1" style="font-weight:normal;width:60%"/><br>
			<label for="z2" class="label" style="margin-top:3%">指标2</label>
			<input id="z2" type="number"  name = "v2" style="font-weight:normal;width:60%;margin-top:3%"/><br>
			<label for="z3" class="label" style="margin-top:3%">指标3</label>
			<input id="z3" type="number"  name = "v3" style="font-weight:normal;width:60%;margin-top:3%"/><br>
			<input type="hidden" name = "p" value="<%=pg %>" />
			<input type="hidden" name = "ano" value="<%=ano %>" />
			<input type="hidden" name = "gno" value="<%=gno %>" />
			<input type="hidden" name = "option" value="<%=flag?0:1 %>" />
		</div>
	   
		</section>
		
		</div>
		<div style="margin-top:1%">
		
		<button class="layui-btn" >提交</button>
		<label class="label" style="font-size:1.25em">&nbsp&nbsp<%=pg %>/<%=count %>组</label>
		</div>
	</form>
	<div style="padding-left:5%;padding-right:5%;margin-top:1%">
	<%
   }
	

	//wrs0.close();
	wwrs.close();
	wrs.close();
	rs.close();
stmt.close();
conn.close();

%>
	</div>


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
