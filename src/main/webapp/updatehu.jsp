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
String ano=request.getParameter("ano");
String p=request.getParameter("p");
String Sno=(String)session.getAttribute("Sno");
String gno=request.getParameter("gno");
String option=request.getParameter("option");
boolean flag=request.getParameter("v1")==""||request.getParameter("v2")==""||request.getParameter("v3")=="";
if(flag){
	response.sendRedirect("huping.jsp?ano="+ano+"&op=1&p="+p);
}else{
int v1=Integer.parseInt(request.getParameter("v1"));
int v2=Integer.parseInt(request.getParameter("v2"));
int v3=Integer.parseInt(request.getParameter("v3"));

Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from grade where ano='"+ano+"' and gno='"+gno+"'");
int cnt;
int vb1;
int vb2;
int vb3;
rs.next();
cnt=Integer.parseInt(rs.getString("cnt"));
vb1=Integer.parseInt(rs.getString("v1"));
vb2=Integer.parseInt(rs.getString("v2"));
vb3=Integer.parseInt(rs.getString("v3"));
v1=(cnt*vb1+v1)/(cnt+1);
v2=(cnt*vb2+v2)/(cnt+1);
v3=(cnt*vb3+v3)/(cnt+1);
cnt++;
rs.close();
stmt.executeUpdate("update grade set v1="+v1+" where ano='"+ano+"' and gno='"+gno+"'");
stmt.executeUpdate("update grade set v2="+v2+" where ano='"+ano+"' and gno='"+gno+"'");
stmt.executeUpdate("update grade set v3="+v3+" where ano='"+ano+"' and gno='"+gno+"'");
stmt.executeUpdate("update grade set cnt="+cnt+" where ano='"+ano+"' and gno='"+gno+"'");
if("1".equals(option)){
	stmt.executeUpdate("update grade set ifhu="+1+" where ano='"+ano+"' and sno='"+Sno+"'");
	response.sendRedirect("actinfo2.jsp?ano="+ano+"&op=0");
}
else{response.sendRedirect("huping.jsp?ano="+ano+"&op=0&p="+String.valueOf(Integer.parseInt(p)+1));	}
}
	

%>
</body>
</html>