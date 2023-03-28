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
String Sno=(String)session.getAttribute("Sno");
Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
ResultSet rss=stmt.executeQuery("select max(gno) from grade where ano='"+ano+"'");
rss.next();
String mgno=rss.getString("max(gno)");
rss.close();
ResultSet rsss=stmt.executeQuery("select * from grade where ano='"+ano+"' and sno='"+Sno+"'");
rsss.next();
if("0".equals(rsss.getString("gno"))){
stmt.executeUpdate("update grade set gno='"+String.valueOf(Integer.parseInt(mgno)+1)+"' where ano='"+ano+"' and sno='"+Sno+"'");
response.sendRedirect("group.jsp?ano="+ano+"&op=0");
}else{
	response.sendRedirect("group.jsp?ano="+ano+"&op=1");
}
rsss.close();
stmt.close();
conn.close();
%>
</body>
</html>