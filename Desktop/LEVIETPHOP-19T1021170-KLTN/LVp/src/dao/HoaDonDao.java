package dao;

import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class HoaDonDao {
	
	//lay ve ma hoa don moi nhat
	public int getLast() {
		String khachhang_sql = "select max(MaHoaDon) as last from HoaDon";
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement ps = kn.cn.prepareStatement(khachhang_sql);
			ResultSet result = ps.executeQuery();
			while (result.next()) {	
				int rs = result.getInt("last");
				return rs;
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return -1;
	}
	
	public int luuhoadon(int makh) {
		String khachhang_sql = "INSERT INTO HoaDon(MaKhachHang,NgayMua,damua) VALUES(?, ?, ?);";
		int result = 0;
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement ps = kn.cn.prepareStatement(khachhang_sql);
			
			Date date = new Date();
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date sqlPackageDate = new java.sql.Date(date.getTime());
			ps.setInt(1, makh);
			ps.setDate(2, sqlPackageDate);
			ps.setBoolean(3, false);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
		return getLast();
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
