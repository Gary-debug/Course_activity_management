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
 <style>
*{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}
body{
    font-family: Helvetica;
    -webkit-font-smoothing: antialiased;
/*     background: #C1EBFF; */
}
h2{
    text-align: center;
    font-size: 18px;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: bule;
    padding: 30px 0;
}

/* Table Styles */

.table-wrapper{
    margin: 10px 70px 70px;
    box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
}

.fl-table {
    border-radius: 5px;
    font-size: 12px;
    font-weight: normal;
    border: none;
    border-collapse: collapse;
    width: 100%;
    max-width: 100%;
    white-space: nowrap;
    background-color: white;
}

.fl-table td, .fl-table th {
    text-align: center;
    padding: 8px;
}

.fl-table td {
    border-right: 1px solid #f8f8f8;
    font-size: 14px;
}

.fl-table thead th {
    color: #ffffff;
    background: #4FC3A1;
}


.fl-table thead th:nth-child(odd) {
    color: #ffffff;
    background: #324960;
}

.fl-table tr:nth-child(even) {
    background: #F8F8F8;
}

/* Responsive */

@media (max-width: 767px) {
    .fl-table {
        display: block;
        width: 100%;
    }
    .table-wrapper:before{
        content: "Scroll horizontally >";
        display: block;
        text-align: right;
        font-size: 11px;
        color: white;
        padding: 0 0 10px;
    }
    .fl-table thead, .fl-table tbody, .fl-table thead th {
        display: block;
    }
    .fl-table thead th:last-child{
        border-bottom: none;
    }
    .fl-table thead {
        float: left;
    }
    .fl-table tbody {
        width: auto;
        position: relative;
        overflow-x: auto;
    }
    .fl-table td, .fl-table th {
        padding: 20px .625em .625em .625em;
        height: 60px;
        vertical-align: middle;
        box-sizing: border-box;
        overflow-x: hidden;
        overflow-y: auto;
        width: 120px;
        font-size: 13px;
        text-overflow: ellipsis;
    }
    .fl-table thead th {
        text-align: left;
        border-bottom: 1px solid #f7f7f9;
    }
    .fl-table tbody tr {
        display: table-cell;
    }
    .fl-table tbody tr:nth-child(odd) {
        background: none;
    }
    .fl-table tr:nth-child(even) {
        background: transparent;
    }
    .fl-table tr td:nth-child(odd) {
        background: #F8F8F8;
        border-right: 1px solid #E6E4E4;
    }
    .fl-table tr td:nth-child(even) {
        border-right: 1px solid #E6E4E4;
    }
    .fl-table tbody td {
        display: block;
        text-align: center;
    }
}
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:60%;
  transition:800ms ease all;
}
</style>
 
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
    <!-- 头部区域（可配合layui已有的水平导航） -->
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
          <dd><a href="">Your Profile</a></dd>
          <dd><a href="">Settings</a></dd>
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
            <dd><a href="import_student.jsp">导入数据</a></dd>
            <dd><a href="demo2.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">导出数据</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <form  action="inherit_group.jsp" method="post">
    <div class="table-wrapper">
    <table class="fl-table" border="1" width="95%" align="center">
	<tr>
 <td>沿用之前分组</td>
 <td> <select name="select_ano">
    <option selected>请选择活动号</option>
           <%
           javax.sql.rowset.WebRowSet rs=sqldb.DBtool.query("select distinct ano from activity ");
            while(rs.next()){
            	out.print("<option value="+rs.getString(1)+">"+rs.getString(1)+"</option>");
            }
                
          
    %>    </select> 
 </td>
 
 </tr>

<tr>
 <td>新的活动号</td>
 <td> <input type="text" name="new_ano"></td>
 
 </tr>



 <tr >
 <td><button style = "margin-left" type="submit">提交</button></td>
<td><button style = "margin-left" type="button" onclick="window.location.href='demo2.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>'">退出</button>
</td>
 </tr>    
    </table>
    </div>
    </form>
  
    <form>
    <div class="table-wrapper">
<table class="fl-table" border="1" width="95%" align="center">



<%
 	
 	
    Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
	Statement stmt=conn.createStatement();
	ResultSet rs1=stmt.executeQuery("SELECT * FROM `studb01`.`grade` ORDER BY `ano` ASC LIMIT 1000");
	
 %>
 
 <tr>
	 <th>活动号</th>
	 <th>学号</th>
	 <th>姓名</th>
	 <th>小组号</th>

	 </tr>

	 <% while(rs1.next()){%>
 <tr>
 <td><%=rs1.getString("ano") %>  </td>
 <td><%=rs1.getString("sno") %>   </td>
 <td><%=rs1.getString("sname") %>   </td>
 <td><%=rs1.getString("gno") %>   </td>

 </tr>
 <%} %>
 <%
 rs1.close();
	stmt.close();
	conn.close();
 %>
 
</table>


</div>

</form>
   

    
    <form>
    <div class="table-wrapper">
	<table class="fl-table" border="1" width="95%" align="center">


		
	
</table>
</form>
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