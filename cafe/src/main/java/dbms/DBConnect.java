package dbms;

import java.sql.*;

public class DBConnect {
	static String url = "jdbc:oracle:thin:@//180.68.32.70:1521/xe";
	static String pid = "system";
	static String pwd = "1234";
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url,pid,pwd);
		return con;
	}
}
