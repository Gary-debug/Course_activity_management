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

        
 
 
        
       .layui-body{ 
        background-image: url(bg2.jpg);    
        background-size:cover;  
       }
 
    </style>
</head>
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
          <dd><a href="">Your Profile</a></dd>
          <dd><a href="upload_photo.jsp">修改头像</a></dd>
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
          <a class="" href="javascript:;">比赛类型</a>
          <dl class="layui-nav-child">
            <dd><a href="indivual_test.jsp">个人赛（初赛）</a></dd>
            <dd><a href="team_test.jsp">团队赛（初赛）</a></dd>
            <dd><a href="indivual_test2.jsp">个人赛（决赛）</a></dd>
            <dd><a href="team_test2.jsp">团队赛（决赛）</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">修改密码</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">修改密码</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">查询成绩</a>
          <dl class="layui-nav-child">
            <dd><a href="individualsc.jsp">个人赛</a></dd>
            <dd><a href="teamsc.jsp">团队赛</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
     <div style="margin-left:30%">
<div id="container">
    <div class="form-wrap">

        <h1>向班级添加学生</h1>
        <p>欢迎使用活动管理系统</p>
            
     <form action="../c_stu_info" method="post" enctype="multipart/form-data">


批量操作：<input id="file" name="filename" type="file" />
  		<input type="submit" class="layui-btn" value="上传"  />
 
</form>

       <form action="" method="post" >
            <div class="form-group">
                      <div class="form-group">
                <label for="cno">课程编号</label>
                <input type="text" name="cno" />
            </div>
            <div class="form-group">
                <label for="cname">课程名称</label>
                <input type="text" name="cname" />
            </div>
                <label for="sno">学生学号</label>
                <input type="text" name="sno" />
            </div>
            <div class="form-group">
                <label for="sname">姓名姓名</label>
                <input type="text" name="sname" />
            </div>
  
            <div class="form-group">
                <label for="tid">教师工号</label>
                <input type="text" name="tid" />
            </div>
  
            <button type="submit" class="btn">添加</button>
   
        </form>
    </div>
<%

String cno="", sno="",sname="",cname="",tid="";
 cno=request.getParameter("cno");
cname=request.getParameter("cname");
sno=request.getParameter("sno");
sname=request.getParameter("sname");
tid=request.getParameter("tid");

if(cno==null && cname==null &&sno==null && sname==null && tid==null){}
else if(cno.length()>1){
	sqldb.DBtool.update("insert into class values("+cno+",'"+cname+"','"+sno+"','"+sname+"','"+tid+"')");

%>
<script type="text/javascript">
alert("添加成功！")
</script>
<%
}
else{%>
<script type="text/javascript">
alert("信息有误，请重新填写！")
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