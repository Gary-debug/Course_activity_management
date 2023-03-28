package sqldb;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class Demo
 */
@WebServlet("/Demo")
public class Demo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Demo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        java.sql.Connection conn = null;
        java.sql.Statement stmt = null;
        try {
         Class.forName("org.mariadb.jdbc.Driver");
          conn = DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
          stmt=conn.createStatement();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        try {
            List items = upload.parseRequest(request);
            InputStream is = null;
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {
                    is = item.getInputStream();
                }
            }
            Workbook workbook = Workbook.getWorkbook(is);
            Sheet sheet = workbook.getSheet(0);
            // ����
            int rows = sheet.getColumns();
            // ����
            int columns = sheet.getColumns();

            PreparedStatement ps = conn.prepareStatement("insert into class(cno,cname,sno,sname,tid) values(?,?,?,?,?)");

            for (int i = 0; i < rows; i++) {
                if (i == 0) {// ��һ�������ԣ�����ȡ
                    continue;
                }
                Cell ce0 = ((jxl.Sheet) sheet).getCell(0, i);
                Cell ce1 = ((jxl.Sheet) sheet).getCell(1, i);
                Cell ce2 = ((jxl.Sheet) sheet).getCell(2, i);
                Cell ce3 = ((jxl.Sheet) sheet).getCell(3, i);
                Cell ce4 = ((jxl.Sheet) sheet).getCell(4, i);


                String c0 = ce0.getContents();
                String c1 = ce1.getContents();
                String c2 = ce2.getContents();
                String c3 = ce3.getContents();
                String c4 = ce4.getContents();


                ps.setString(1, c0);
                ps.setString(2, c1);
                ps.setString(3, c2);
                ps.setString(4, c3);
                ps.setString(5, c4);

                ps.executeUpdate();
            }
            ps.close();
            conn.close();
         
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            response.sendRedirect("import_student.jsp");
        }
    }

}