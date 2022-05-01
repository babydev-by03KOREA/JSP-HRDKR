package coffee;

import dbms.DBConnect;
import java.sql.*;
import java.util.ArrayList;

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
	
	public ArrayList<coffeeDTO> coffeeList(){
		ArrayList<coffeeDTO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = DBConnect.getConncetion();
			sql = "SELECT  *";
			sql += " FROM TBL_SALELIST_01";
			sql += " INNER JOIN TBL_PRODUCT_01";
			sql += " ON TBL_SALELIST_01.PCODE = TBL_PRODUCT_";
			sql += " FROM TBL_SHOP_01";
			sql += " INNER JOIN TBL_SALELIST_01";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				coffeeDTO cdto = new coffeeDTO();
				cdto.setSaleno(rs.getInt(1));
				cdto.setPcode(rs.getString(2));
				cdto.setSaledate(rs.getString(3));
				cdto.setScode(rs.getString(4));
				cdto.setAmount(rs.getInt(5));
				list.add(cdto);
			}
		}catch(Exception e){
			System.out.println("You're List Commands was denied for "+e);
		}finally {
			try {
				if(con != null) {con.close();}
				if(pstmt != null) {pstmt.close();}
				if(rs != null) {rs.close();}
			} catch (SQLException e){
				System.out.println("SQLException "+e);
			}
		}
		return list;
	}
}
