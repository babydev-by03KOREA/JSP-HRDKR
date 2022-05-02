package coffee;

import dbms.DBConnect;
import java.sql.*;


public class coffeeDAO {
	
	public void CoffeeData(coffeeDTO data) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DBConnect.getConncetion();
			sql = "INSERT INTO TBL_SALELIST_01 VALUES(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, data.getSaleno());
			pstmt.setString(2, data.getPcode());
			pstmt.setString(3, data.getSaledate());
			pstmt.setString(4, data.getScode());
			pstmt.setInt(5, data.getAmount());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("You're Insert Commands was denied for "+e);
		}finally {
			try {
			if(con != null) {con.close();}
			if(pstmt != null) {pstmt.close();}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		}
	}
	
}
