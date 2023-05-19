package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.khachhangBean;

public class DangKyDao {
	public int khRegister(khachhangBean khachhang) {
		String dangky_sql = "INSERT INTO KhachHang" + "(hoten,diachi,sodienthoai,email,tendangnhap,matkhau)VALUES"
				+ "(?, ?, ?, ?, ?, ?);";
		int result = 0;
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement ps = kn.cn.prepareStatement(dangky_sql);
			ps.setString(1, khachhang.getHoten());
			ps.setString(2, khachhang.getDiachi());
			ps.setString(3, khachhang.getSodienthoai());
			ps.setString(4, khachhang.getEmail());
			ps.setString(5, khachhang.getTendangnhap());
			ps.setString(6, khachhang.getMatkhau());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
		return result;
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
