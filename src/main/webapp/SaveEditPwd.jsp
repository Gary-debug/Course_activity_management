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
    String Pwd = request.getParameter("Pwd");
    String newpwd = request.getParameter("newpwd");
    String confirm = request.getParameter("confirm");
    String tid = request.getParameter("tid");		
    String tpwd = request.getParameter("tpwd");
    if(!Pwd.equals(tpwd)) {
    %>
    <script type="text/javascript">
    alert("原密码错误，请重新输入");
    window.history.back(-1);
    </script>
    <%
//     response.sendRedirect("EditPwd.jsp?tid="+tid+"&tpwd="+tpwd+" ");
    }
    else if(newpwd.equals("")){
        %>
        <script type="text/javascript">
        alert("新密码不能为空");
        window.history.back(-1);
        </script>
        <%
//         response.sendRedirect("EditPwd.jsp?tid="+tid+"&tpwd="+tpwd+" ");
        }
    else if(newpwd.equals(Pwd)){
    %>
    <script type="text/javascript">
    alert("新密码不能与原密码相同");
    window.history.back(-1);
    </script>
    <%
//     response.sendRedirect("EditPwd.jsp?tid="+tid+"&tpwd="+tpwd+" ");
    }
    else if(!confirm.equals(newpwd)) {
    %>
    <script type="text/javascript">
    alert("两次输入的密码不一致");
    window.history.back(-1);
    </script>
    <%
//     response.sendRedirect("EditPwd.jsp?tid="+tid+"&tpwd="+tpwd+" ");
    }
    else{
    	String sql = "update teacher set tpwd = '"+newpwd+"'where tid = '"+tid+"'";       
    	System.out.println(sql);

    	Class.forName("org.mariadb.jdbc.Driver");
    	Connection conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
    	Statement stmt = conn.createStatement();
    	int ret = stmt.executeUpdate(sql);
    	System.out.println("ret=" + ret);
    	stmt.close();
    	conn.close(); 
    	%>
        <script type="text/javascript">
        alert("密码修改成功，请重新登录");
        location.href="tea_denglu.jsp";
        </script>
        <%
//     	response.sendRedirect("tea_denglu.jsp");
}
    %>
</body>
</html>