/**
 * 
 * author : wubl
 * 
 * date: 2018/4/23
 * 
 */

package com.demo;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;



import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



@MultipartConfig 
@WebServlet("/PortraitServlet")
public class PortraitServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		int count =0;
		//file upload database
		String tname ="李华";
//		String tname=request.getParameter("tname");
		PrintWriter out = response.getWriter();
		
		final Part filePart = request.getPart("headerImg");  
        if (filePart == null) {  
            response.getWriter().print("未指定文件");  
            return;  
        }  
          
        if (filePart.getSize() > 1024 * 10000) {  
            response.getWriter().print("文件太大");  
            return;  
        }  
        String filename = filePart.getSubmittedFileName();//获取上传文件名  
//			System.out.println(filename);
		String realPath = this.getServletContext().getRealPath("/avatorImg");  
			System.out.println(realPath);
        //获取web目录的真实物理路径，文件将保存在upload文件夹下  
        File dir=new File(realPath);  
        if(!dir.exists()){  
            dir.mkdir();//如果目录不存在，则创建  
        }  
  
        filePart.write(realPath + "/" + filename);//将文件写入磁盘  
        Connection conn = null;
		PreparedStatement pstmt = null;
		InputStream is = null;
        String sql = "update teacher set photo = ? where tname =?";
        
        try{
        	Class.forName("org.mariadb.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01","te01","tsWGvFrD");
        	
                // 2. 预编译 SQL 语句
            pstmt = conn.prepareStatement(sql);
                // 3. 传入参数
                // 3.1 获取图片输入流
            is = filePart.getInputStream();
        
            // 3.2 传参
            pstmt.setBinaryStream(1, is);
            pstmt.setString(2, tname);
            // 4. 执行 SQL 语句
             count = pstmt.executeUpdate();//执行sql语句记录更新的行数
            
            //close
           
//        	pstmt.close();
//        	conn.close();
        } catch (IOException | SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println("已经改了："+count);
        if(count!=0) {

        	out.print("<script>alert('上传成功'); window.location='tea_welcome.jsp' </script>");
        }
        else {
        	out.print("<script>alert('上传失败'); window.location='tea_welcome.jsp' </script>");
//        	response.sendRedirect("error.jsp");//上传失败
        }
        //接受文件,把数据库中的二进制流拿出来并生成图片
        
        
        
        
        
    }
	

    
          
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
