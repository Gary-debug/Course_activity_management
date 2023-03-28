<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");					
String name,Sno=(String)session.getAttribute("Sno");
String cno=request.getParameter("cno");
Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
ResultSet wrs=stmt.executeQuery("select * from student where sno='"+Sno+"'");
wrs.next();
name=wrs.getString("sname");
wrs.close();
ResultSet rs=stmt.executeQuery("select * from tea_class where cno='"+cno+"'");
rs.next();
stmt.executeUpdate("insert into class values('"+cno+"','"+rs.getString("cname")+"','"+Sno+"','"+name+"','"+rs.getString("tid")+"')");
rs.close();
response.sendRedirect("moreclass.jsp?op=0");
stmt.close();
conn.close();
%>
</body>
</html>