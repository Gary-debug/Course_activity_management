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

String tid = request.getParameter("tid");
String tpwd = request.getParameter("tpwd");
String tname = request.getParameter("tname");
String intro = request.getParameter("intro");

String sql = "update teacher set tname = '"+tname+"', intro = '"+intro+"' where tid = '"+tid+"'";       
System.out.println(sql);

Class.forName("org.mariadb.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt = conn.createStatement();
int ret = stmt.executeUpdate(sql);
System.out.println("ret=" + ret);
stmt.close();
conn.close(); 

response.sendRedirect("MyProfile.jsp?tid="+tid+"&tpwd="+tpwd+"");
%>
</body>
</html>