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
String Sno=(String)session.getAttribute("Sno");
String nphone=request.getParameter("nphone");
Class.forName("org.mariadb.jdbc.Driver");
	
Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
ResultSet wrs=stmt.executeQuery("select * from student where sno='"+Sno+"'");
wrs.next();
if(nphone==""){
	response.sendRedirect("mdfphone.jsp?op=1");
}
else{
	stmt.executeUpdate("update student set message='"+nphone+"' where sno='"+Sno+"'");
	response.sendRedirect("mdfphone.jsp?op=0");
}
wrs.close();
stmt.close();
conn.close();
%>
</body>
</html>