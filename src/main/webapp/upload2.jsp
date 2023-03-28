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
String Sno=(String)session.getAttribute("Sno");
String ano=request.getParameter("ano");
String gno=request.getParameter("gno");
Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
ResultSet rss=stmt.executeQuery("select * from dataupload where ano='"+ano+"' and gno='"+gno+"'");
if(!rss.next()){
	response.sendRedirect("actinfo.jsp?ano="+ano+"&op=3");
}else{
stmt.executeUpdate("update dataupload set state=1 where ano='"+ano+"' and gno='"+gno+"'");
response.sendRedirect("actinfo1.jsp?ano="+ano+"&op=0");
}
rss.close();
stmt.close();
conn.close();
%>
</body>
</html>