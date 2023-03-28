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
String tid=request.getParameter("tid");
String tpwd=request.getParameter("tpwd");
String cname=request.getParameter("cname");
String cno=request.getParameter("cno");
// int cno=Integer.parseInt(cno);

Class.forName("org.mariadb.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();

String sql="insert into tea_class (cno,cname,tid) values('"+cno+"','"+cname+"','"+tid+"')";
System.out.println("CreateClass=>doPost sql:"+sql);
int ret=stmt.executeUpdate(sql);
stmt.close();
conn.close();
response.sendRedirect("MyClass.jsp?tid="+tid+"&tpwd="+tpwd+" ");
%>

</body>
</html>