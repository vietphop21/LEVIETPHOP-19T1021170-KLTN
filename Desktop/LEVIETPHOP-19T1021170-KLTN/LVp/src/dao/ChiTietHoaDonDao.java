package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//import bean.lichsubean;

public class ChiTietHoaDonDao {
	public void luuchitiethoadon(String mahang, long i, int mahd) {
		String khachhang_sql = "INSERT INTO ChiTietHoaDon(MaHang,SoLuongMua,MaHoaDon, damua) VALUES(?, ?, ?, ?);";
		int result = 0;
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement ps = kn.cn.prepareStatement(khachhang_sql);
			ps.setString(1, mahang);
			ps.setLong(2, i);
			ps.setInt(3, mahd);
			ps.setBoolean(4, false);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}