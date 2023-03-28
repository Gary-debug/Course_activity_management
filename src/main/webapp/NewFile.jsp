<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
/* HTML,BODY{ */
/* /*   HEIGHT:100%; */ */
/*   BACKGROUND:#F0F8FF; */
/* } */
/* BODY{ */
/*   TEXT-ALIGN:CENTER; */
/* } */
.bj{
  position:fixed;
  opacity:0.5;
  height:150%;
  width:150%;
  z-index:-1;
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
<body background="images/002.jpg" style="background-size:100% 500%">
<div class="bj">
	<h1 align = center>欢迎进入课程活动管理系统！</h1>
  

<hr>
<center>
<button style = "margin-left:0px;vertical-align:middle" onclick = "window.location.href = 'tea_denglu.jsp'">教师登录</button>
<!-- </center> -->
<!-- <center> -->
<button style = "margin-left:0px;vertical-align:middle" onclick = "window.location.href = 'stu_denglu.jsp'">学生登录</button>
</center>
<br>
<br>
</body>
</html>