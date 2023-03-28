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
<%request.setCharacterEncoding("utf-8");
String ano=request.getParameter("ano");
String pgno=request.getParameter("pgno");
String Sno=(String)session.getAttribute("Sno");
Class.forName("org.mariadb.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from grade where ano='"+ano+"' and sno='"+Sno+"'");
rs.next();
if(!pgno.equals(rs.getString("gno"))){
	response.sendRedirect("group.jsp?ano="+ano+"&op=2");
}else{
	stmt.executeUpdate("update grade set gno='0' where ano='"+ano+"' and sno='"+Sno+"'");
	response.sendRedirect("group.jsp?ano="+ano+"&op=0");
}
rs.close();
stmt.close();
conn.close();
%>
</body>
</html>