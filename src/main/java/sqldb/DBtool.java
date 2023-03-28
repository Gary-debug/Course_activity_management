package sqldb;
import java.sql.*;


import javax.sql.rowset.RowSetProvider;
import javax.sql.rowset.WebRowSet;

public class DBtool {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mariadb://10.220.140.102:3366/studb01?user=te01&password=tsWGvFrD");
		return conn; 
	}
	
	public static int update(String sql) throws SQLException, ClassNotFoundException{
		int retVal=0;
		Connection conn=getConnection();
		Statement stmt=conn.createStatement();
		retVal=stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
		return retVal;
	
	}
	
	public static WebRowSet query(String sql) throws SQLException, ClassNotFoundException{
		Connection conn=getConnection();
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		WebRowSet wrs=RowSetProvider.newFactory().createWebRowSet();
		wrs.populate(rs);
		rs.close();
		stmt.close();
		conn.close();
		return wrs;
	}

}
