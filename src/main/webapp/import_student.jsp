<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班级添加学生</title>
 <script src="layui-v2.6.8/layui/layui.js"></script>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui-v2.6.8/layui/css/layui.css" tppabs="http://res.layui.com/layui/dist/css/layui.css"  media="all">
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.1.2/echarts.min.js"></script>
   

 <style>
* {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
 
        body {

            background: #344a72;
            color: #fff;
            line-height: 1.65;  /**设置行高**/
 
        }
 
        a {
            text-decoration: none;   /**去掉a标签下划线**/
        }
 
        #container {
            max-width: 600px; /**设置最大宽度**/
            margin: 0px  0px; /**设置margin 30px上下，auto居中**/
            padding:  0px 0px 0px;
 
        }
 
 
        .form-wrap {
            background: rgba(255,255,255,0.5);
            color: #333;
            padding: 10px 25px;
 
        }
 
        .form-wrap h1, .form-wrap p {
            text-align: center; /**设置文本居中**/
        }
        
        .form-wrap  .form-group {
            margin-top: 10px;
            width:500px;
        }
 
        .form-wrap .form-group label {
            display: block; /**快标签变成行标签**/
            color: #666;
        }
 
        .form-wrap .form-group input {
            width: 100%;
            padding: 10px;
            border: #ddd 1px solid;
            border-radius: 5px;
 
        }
 
 
        .form-wrap button {
            display: block; /**行标签变为块标签**/
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background: #49c1a2;
            color: #fff;
            cursor: pointer;
 
 
        }
 
        .form-wrap button:hover {
            background: #37a08e;
        }
 
 
        .form-wrap .bottom-text {
            font-size: 13px ;
            margin-top: 10px;
        }
 
 
        footer {
            text-align: center;
            margin-top: 10px;
 
        }
 
        footer a {
            font-weight: bold;
            color: #FFFFFF;
        }

        
 
 
        
 
        
  .back{
  width: 100%;
  height:100%;
  position: absolute;
  z-index: -1;
  opacity: 0.3;
}


	
 
    </style>
 
</head>
<body>

<%
boolean bo=true;

request.setCharacterEncoding("utf-8");					
String tid =(String) session.getAttribute("tid");		
String tpwd =(String) session.getAttribute("tpwd");


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
            <dd><a href="import_student.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">导入数据</a></dd>
            <dd><a href="demo2.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">导出数据</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  <script>
function f(){
	alert('上传成功');
}


</script>
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <image class='back' src='bg.jpg'></image>
     <div style="margin-left:30%">
<div id="container">
    <div class="form-wrap">

        <h1>向班级添加学生</h1>
        <p>欢迎使用活动管理系统</p>
            
     <form action="Importmsg" method="post" enctype="multipart/form-data">


批量操作：<input id="file" name="filename" type="file" />
  		<input type="submit" class="layui-btn" value="上传" onclick="f()"  />
 
</form>

       <form action="" method="post" >
            <div class="form-group">

                       <select name="cno" style="width:500px; height:35px" >
           <option selected>请选择课程</option>
              
           <%
           HashMap<String,String> hm=new HashMap<>();
           HashMap<String,String> hm2=new HashMap<>();
           javax.sql.rowset.WebRowSet rs_cno_name=sqldb.DBtool.query("select distinct cno,cname from class where tid='"+tid+"'");
            while(rs_cno_name.next()){
            	String t_cno=rs_cno_name.getString(1);
            	String t_cname=rs_cno_name.getString(2);
            	out.print("<option value="+t_cno+">"+t_cno+"  "+t_cname+"</option>");
            	hm.put(t_cno,t_cname);
            }
            %>
            </select>
            
            
            
            
                               <select name="sno"  style="width:500px; height:35px" >
           <option selected>请选择学生</option>
              
           <%

           javax.sql.rowset.WebRowSet rs_sno_name=sqldb.DBtool.query("select distinct sno,sname from student ");
            while(rs_sno_name.next()){
            	String t_sno=rs_sno_name.getString(1);
            	String t_sname=rs_sno_name.getString(2);
            	out.print("<option value="+t_sno+">"+t_sno+"  "+t_sname+"</option>");
            	hm2.put(t_sno,t_sname);
            }
            
            
        
            %>
            </select>
            
            

  
            <div class="form-group">
                <label for="tid">教师工号</label>
                <input type="text" name="tid" value="<%=tid %>" readonly />
            </div>
  
            <button type="submit" class="btn">添加</button>
   
        </form>
    </div>
<%


String cno="", sno="",sname="",cname="";
 cno=request.getParameter("cno");
cname=hm.get(cno);
sno=request.getParameter("sno");
sname=hm2.get(sno);
System.out.println(cno+cname+"  "+sno+sname);
//tid=request.getParameter("tid");
javax.sql.rowset.WebRowSet rs=sqldb.DBtool.query("select * from class where sno='"+sno+"' and cno="+cno+" ");
int cnt=0;
while(rs.next()){
	cnt++;
}
if(cnt!=0) bo=false;
if(cno==null && cname==null &&sno==null && sname==null ){}
else if(cno.length()>=1&&bo==true){
	sqldb.DBtool.update("insert into class values("+cno+",'"+cname+"','"+sno+"','"+sname+"','"+tid+"')");

%>
<script type="text/javascript">
alert("添加成功！")
</script>
<%
}
else if(bo==false){%>

<script type="text/javascript">
alert("添加失败,该学生已在该课程中！")
</script>

<%} %>

</div>
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