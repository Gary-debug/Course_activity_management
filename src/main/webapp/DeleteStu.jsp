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
String tid= request.getParameter("tid");
String tpwd = request.getParameter("tpwd");		
String cno = request.getParameter("cno");
String cname = request.getParameter("cname");
String sno = request.getParameter("sno");
String sname = request.getParameter("sname");
String sql="delete from class where cno="+cno+" and sno="+sno+"";
System.out.println("DeleteStu=>doGet sql:"+sql);


Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt = conn.createStatement();
int ret = stmt.executeUpdate(sql);
System.out.println("tid=" + tid);
stmt.close();
conn.close();

response.sendRedirect("DeleteStudent.jsp?tid="+tid+"&tpwd="+tpwd+"&cno="+cno+"");
%>
</body>
</html>