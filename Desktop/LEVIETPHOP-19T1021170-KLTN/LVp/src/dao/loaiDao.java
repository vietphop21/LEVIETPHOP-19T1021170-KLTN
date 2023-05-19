package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.loaiBean;

public class loaiDao {
	public ArrayList<loaiBean> getloai() {
		try {
			ArrayList<loaiBean> ds = new ArrayList<loaiBean>();
			// b1: Ket noi CSDL
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			// b2: lay du lieu ve
			// b2.1: Thiet lap cau lenh sql
			String sql = "select * from LoaiHangDienTu";
			// b2.2: thuc hien cau lenh
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			// b3: duyet qua tap di lieu trong rs va luu vao mang ds
			while (rs.next()) {
				// lay ve ma loai va ten loai
				String maloai = rs.getString("maloai");
				String tenloai = rs.getString("tenloai");
				ds.add(new loaiBean(maloai, tenloai));
			}
			// b4:dong ket noi
			rs.close();
			kn.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public int xoaloai(String maloai) {
		String query = "delete from LoaiHangDienTu where maloai = ?";
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement cmd = kn.cn.prepareStatement(query);
			cmd.setString(1, maloai);
			cmd.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int add_loai(loaiBean maloai) {
		String add_loai = "INSERT INTO LoaiHangDienTu(MaLoai,TenLoai)VALUES(?,?)";
		int result = 0;
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement ps = kn.cn.prepareStatement(add_loai);
			ps.setString(1, maloai.getMaLoai());
			ps.setString(2, maloai.getTenLoai());
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
