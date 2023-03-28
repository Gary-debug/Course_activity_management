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
int cnt=Integer.parseInt(request.getParameter("cnt"));
int i;
String s="";
boolean flag=true;
for(i=1;i<=cnt;i++){
	String s1=request.getParameter("s"+String.valueOf(i));
	String s2=request.getParameter("p"+String.valueOf(i));
	if(s2==""){
		flag=false;
	}
	s=s+s1+":"+s2;
	if(i<cnt) s+=" ";
}
String txta=request.getParameter("txta");
String txta1=txta.replace("'","''");
txta1=txta1.replace("</textarea>","");
//txta1=txta1.replace("<","&lt;");
//txta1=txta1.replace(">","&gt;");
//txta1=txta1.replace("&","&amp;");
String ano=request.getParameter("ano");
String gno=request.getParameter("gno");
String Sno=(String)session.getAttribute("Sno");
if(!flag){
	response.sendRedirect("actinfo.jsp?ano="+ano+"&op=2");
}
else{Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
Statement stmt=conn.createStatement();

ResultSet rss=stmt.executeQuery("select * from dataupload where ano='"+ano+"' and gno='"+gno+"'");
if(!rss.next()){
	stmt.executeUpdate("insert into dataupload values('"+txta1+"',0,'"+s+"','"+ano+"','"+gno+"')");
}
else{
	stmt.executeUpdate("update dataupload set data='"+txta1+"' where ano='"+ano+"' and gno='"+gno+"'");
	stmt.executeUpdate("update dataupload set percent='"+s+"' where ano='"+ano+"' and gno='"+gno+"'");
}
rss.close();
stmt.close();
conn.close();

response.sendRedirect("actinfo.jsp?ano="+ano+"&op=0");}
%>
</body>
</html>