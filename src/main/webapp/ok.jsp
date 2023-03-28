<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="javax.swing.ImageIcon" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
// String tname = request.getParameter("tname");
PreparedStatement pstmt = null;
Connection conn = null;
InputStream is = null;
String tname= "李华";
ResultSet rs = null;
String sql = "select photo from teacher where tname=?"; 
//连接数据库
 try{
	 Class.forName("org.mariadb.jdbc.Driver");
 	conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01","te01","tsWGvFrD");
 	
         // 2. 预编译 SQL 语句
     pstmt = conn.prepareStatement(sql);
     pstmt.setString(1, tname);
     rs = pstmt.executeQuery();
	if(rs.next()) {
		byte[] bytearray = new byte[1048576];
		int size=0;
		is = rs.getBinaryStream("photo");
		response.setContentType("image/jpeg");
		

        while((size=is.read(bytearray))!= -1 ){

         	response.getOutputStream().write(bytearray,0,size);
		
		  //response.sendRedirect("denglu.jsp");
		 
	  }		
	}
	
    }catch(Exception ex){
		out.println("error :");
    }
 rs.close();
	pstmt.close();
	conn.close();
%>







</body>
</html>