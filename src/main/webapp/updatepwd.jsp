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
String opwd=request.getParameter("opwd");
String npwd=request.getParameter("npwd");
String rpwd=request.getParameter("rpwd");
Class.forName("org.mariadb.jdbc.Driver");
	
Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
ResultSet wrs=stmt.executeQuery("select * from student where sno='"+Sno+"'");
wrs.next();
if(npwd==""||rpwd==""){
	response.sendRedirect("mdfpwd.jsp?op=1");
}
else if(wrs.getString("spwd").equals(opwd)&&npwd.equals(rpwd)){
	stmt.executeUpdate("update student set spwd='"+npwd+"' where sno='"+Sno+"'");
	response.sendRedirect("mdfpwd.jsp?op=0");
}
else if(!wrs.getString("spwd").equals(opwd)){
	response.sendRedirect("mdfpwd.jsp?op=2");
}
else if(!npwd.equals(rpwd)){
	response.sendRedirect("mdfpwd.jsp?op=3");
}else{}
wrs.close();
stmt.close();
conn.close();
%>
</body>
</html>