<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/stylelogin.css" type="text/css">
</head>
<body>

<form>
	<div style="height:30px;"></div>

	<div class="login-wrap">
		<div class="login-html">
		<h1 align =center style = "margin-top:15px;color:white">教师登录</h1>
		<br>
		<br>
 			<input id="tab-1" type="radio" name="tab" class="sign-in" checked /><label for="tab-1" class="tab">登录</label>
			<input id="tab-2" type="radio" name="tab" class="sign-up" /><label for="tab-2" class="tab"></label>
			<div class="login-form">
				<div class="sign-in-htm">
					<div class="group">
						<label for="user" class="label">教师号</label>
						<input id="user" type="text" name = "Sno" class="input" />
					</div>
					<div class="group">
						<label for="pass" class="label">密码</label>
						<input id="pass" type="password"  name = "Spassword" class="input" data-type="password" />
					</div>
					<div class="group">
						<input id="check" type="checkbox" class="check" checked />
						<label for="check"><span class="icon"></span> 记住密码</label>
					</div>
					<div class="group">
						<input type="submit" class="button" value="登录" />
					</div>
					<div class="hr"></div>
						<h2 align = center>请依据系统操作准则进行操作</h2>
				</div>
				
				</div>
			</div>
		</div>
</form>

<br>
<br>
<br>


 <%
request.setCharacterEncoding("utf-8");
String Sno=request.getParameter("Sno");
String Spassword=request.getParameter("Spassword");
//连接数据库
 try{
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select * from teacher where tid='"+Sno+"'");
	while(rs.next()) {
	  String pwd=rs.getString("tpwd");
	  if(pwd.equals(Spassword)) {
		  session.setAttribute("tid", Sno);
		  session.setAttribute("tpwd", Spassword);
		  response.sendRedirect("tea_welcome.jsp?tid="+Sno+"&tpwd="+Spassword+"");
		
		  
		  out.println("成功登录");
	  }else{
		  out.println("账号或者密码有误");
		  //response.sendRedirect("denglu.jsp");
		 
	  }
					  

				
	}
	rs.close();
	stmt.close();
	conn.close();
}
			
catch (ClassNotFoundException | SQLException e) {
// TODO Auto-generated catch block

e.printStackTrace();
}



%>
</body>
</html>