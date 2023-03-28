<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="../layui-v2.6.8/layui/layui.js"></script>
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

<body>
<%
//String cno=(String)session.getAttribute("cno");	
request.setCharacterEncoding("utf-8");
String ano=request.getParameter("ano");

Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
String name,Sno=(String)session.getAttribute("Sno");
ResultSet rs=stmt.executeQuery("select * from student where sno='"+Sno+"'");
rs.next();
name=rs.getString("sname");
rs.close();
ResultSet rs0=stmt.executeQuery("select * from grade where ano='"+ano+"' and sno='"+Sno+"'");
String gno;
rs0.next();
gno=rs0.getString("gno");

rs0.close();
ResultSet wrs=stmt.executeQuery("select * from activity where ano='"+ano+"'");
wrs.next();


 String op="";
 op=request.getParameter("op");
 if("0".equals(op)){
 %>
 <script type="text/javascript">alert("保存成功！");</script>
 <%} else if("1".equals(op)){%>
 <script type="text/javascript">alert("提交成功！");</script>
 <%} else if("2".equals(op)){%>
	 <script type="text/javascript">alert("填写内容不完整！");</script>
 <% }else if("3".equals(op)){%>
 <script type="text/javascript">alert("请先保存，保存后再提交！");</script>
 <%}else{} %>
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
	<h1 style="text-align:center;padding:20px;line-height:150%"><%=wrs.getString("aname") %></h1>
<p style="padding-left:5%;padding-right:5%"><%=wrs.getString("notice") %></p><br><br>

		 <%
   ResultSet wwrs=stmt.executeQuery("select * from dataupload where ano='"+ano+"' and gno='"+gno+"'");
   if(wwrs.next()){
	   String s=wwrs.getString("data");
	   //String ss=s.replace("'","''");
	   %>
		 <form action="upload.jsp" method="post" style="padding-left:5%;padding-right:5%;font-size:0.8em">
   <div style="width:100%;margin:0 auto;overflow: hidden">
   <aside style="float:left;width:85%;height:100%">
   <h3 style="margin-bottom:1%;font-weight:bold">正文：</h3>
	   
	   <pre><textarea name="txta" style="font-weight:normal;padding:1%;width:95%" rows="20" ><%=s %></textarea></pre>
	   </aside>
	  
	   <section style="float:left;width:15%;height:100%">
	   <h3 style="margin-bottom:5%;font-weight:bold">小组成员贡献占比（%）</h3>
	   <%
	   ResultSet rs1=stmt.executeQuery("select * from grade where ano='"+ano+"' and gno='"+gno+"'");
	   String str=wwrs.getString("percent");
	   String[] Str=str.split(" ");
	   String[] str1=new String[Str.length];
	   String[] str2=new String[Str.length];
	   for(int i=0;i<Str.length;i++){
		   String[] item=Str[i].split(":");
		   str1[i]=item[0];
		   str2[i]=item[1];
	   }
	   int i=1;
	   while(rs1.next()){
		   int j;
		   for(j=0;j<=Str.length;j++){
		   if(str1[j].equals(rs1.getString("sno"))){
			   break;
		   }
	   }
	   %>
	   <div style="margin:3%">
			<label for="s<%=i %>" class="label"><%=rs1.getString("sname") %></label>
			<input id="s<%=i %>" type="number"  name = "p<%=i %>" style="font-weight:normal;width:60%" value="<%=str2[j]%>"/>
			<input id="s<%=i %>" type="hidden"  name = "s<%=i %>" value="<%=rs1.getString("sno") %>" /><br>
		</div>
	   <%i++;
		} %>
		</section>
		
		</div>
		<div>
		<input  name="ano" value=<%=ano %> type="hidden"/>
	   <input  name="gno" value=<%=gno %> type="hidden"/>
		<input  name="cnt" value=<%=i-1 %> type="hidden"/>
	   <button class="layui-btn" style="margin-top:1%">上传图片</button>
	   <button class="layui-btn" style="margin-top:1%">保存</button>
	   </form><form action="upload2.jsp" style="float:right">
	   <input  name="ano" value=<%=ano %> type="hidden"/>
	   <input  name="gno" value=<%=gno %> type="hidden"/>
	   <button class="layui-btn" style="margin-top:1%" onclick="return confirm('保存过了吗？确定提交吗?')" >提交</button></form>
	   <p style="margin-top:0.6%">（填写完成后先保存，保存成功后可以修改，检查无误再提交，提交之后不能修改）</p>
	   </div>
	   </div>
	   </div>
	  <br><br><br><br>

			<%
			rs1.close();
	   		}
   
   else{
   %>
   <form action="upload.jsp" method="post" style="padding-left:5%;padding-right:5%;font-size:0.8em">
   <div style="width:100%;margin:0 auto;overflow: hidden">
   <aside style="float:left;width:85%;height:100%">
   <h3 style="margin-bottom:1%;font-weight:bold">正文：</h3>
   <textarea name="txta" style="font-weight:normal;padding:1%;width:95%" rows="20"></textarea>
   </aside>
   
   <section style="float:left;width:15%;height:100%">
   <h3 style="margin-bottom:5%;font-weight:bold">小组成员贡献占比（%）</h3>
   <%
   ResultSet rs1=stmt.executeQuery("select * from grade where ano='"+ano+"' and gno='"+gno+"'");
   int i=1;
   while(rs1.next()){
   %>
   <div style="margin:3%">
		<label for="s<%=i %>" class="label"><%=rs1.getString("sname") %></label>
		<input id="s<%=i %>" type="number"  name = "p<%=i %>" style="font-weight:normal;width:60%" />
		<input id="s<%=i %>" type="hidden"  name = "s<%=i %>" value="<%=rs1.getString("sno") %>" />
	</div>
   <%i++;
	} %>
	</section>
	
	</div>
	<div>
	<input  name="ano" value=<%=ano %> type="hidden"/>
   <input  name="gno" value=<%=gno %> type="hidden"/>
	<input  name="cnt" value=<%=i-1 %> type="hidden"/>
   <button class="layui-btn" style="margin-top:1%">上传图片</button>
   <button class="layui-btn" style="margin-top:1%">保存</button>
   </form><form action="upload2.jsp" style="float:right">
	   <input  name="ano" value=<%=ano %> type="hidden"/>
	   <input  name="gno" value=<%=gno %> type="hidden"/>
	   <button class="layui-btn" style="margin-top:1%" onclick="return confirm('你确定提交吗?')" >提交</button></form>
	   <p style="margin-top:0.6%">（填写完成后先保存，保存成功后可以修改，检查无误再提交，提交之后不能修改）</p><br><br><br><br>
   </div>
  </div>
  </div>

		<%
		rs1.close();
   		}
		wrs.close();
		stmt.close();
		conn.close();
		%>


	
  
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
