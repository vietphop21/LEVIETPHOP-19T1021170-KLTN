package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.hangBean;

public class hangDao {
	public ArrayList<hangBean> gethang() {
		try {
			ArrayList<hangBean> ds = new ArrayList<hangBean>();
			// b1: Ket noi CSDL
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			// b2: lay du lieu ve
			// b2.1: Thiet lap cau lenh sql
			String sql = "Select * from HangDienTU";
			// b2.2: thuc hien cau lenh
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			// b3: duyet qua tap di lieu trong rs va luu vao mang ds
			while (rs.next()) {
				// String maHang, String tenHang, int soLuong, Long gia, String maLoai, String
				// baoHanh, String image,String hangSX
				// lay ve ma loai va ten loai
				String maHang = rs.getString("MaHang");
				String tenHang = rs.getString("tenHang");
				int soLuong = rs.getInt("soluong");
				Long gia = rs.getLong("gia");
				String maLoai = rs.getString("maloai");
				String baoHanh = rs.getString("baohanh");
				String image = rs.getString("image");
				String hangSX = rs.getString("hangSX");
				ds.add(new hangBean(maHang, tenHang, soLuong, gia, maLoai, baoHanh, image, hangSX));
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

	public void update(hangBean h) {
		String str = "update HangDienTu set tenhang=?, soluong=?, gia=?, BaoHanh=?, Image=?, HangSX=? where mahang =?";
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement ps = kn.cn.prepareStatement(str);

			ps.setString(1, h.getTenHang());
			ps.setLong(2, h.getSoLuong());
			ps.setLong(3, h.getGia());
			ps.setString(4, h.getBaoHanh());
			ps.setString(5, h.getImage());
			ps.setString(6, h.getHangSX());
			ps.setString(7, h.getMaHang());
			ps.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}

	}

	public int demSoLuongHangDienTu() {
		String query = "select count(*) from HangDienTu";
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement cmd = kn.cn.prepareStatement(query);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int xoahang(String mahang) {
		String query = "delete from HangDienTu where mahang = ?";
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement cmd = kn.cn.prepareStatement(query);
			cmd.setString(1, mahang);
			cmd.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int themhang(hangBean h) {
		String add_hang = "INSERT INTO HangDienTu(mahang,tenhang,soluong,gia,maloai,BaoHanh,Image,HangSX)VALUES(?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement ps = kn.cn.prepareStatement(add_hang);
			ps.setString(1, h.getMaHang());
			ps.setString(2, h.getTenHang());
			ps.setLong(3, h.getSoLuong());
			ps.setLong(4, h.getGia());
			ps.setString(5, h.getMaLoai());
			ps.setString(6, h.getBaoHanh());
			ps.setString(7, h.getImage());
			ps.setString(8, h.getHangSX());
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

	public ArrayList<hangBean> getHangDienTu(int page, int pageSize) {
		try {
			ArrayList<hangBean> ds = new ArrayList<hangBean>();
			// b1: Ket noi CSDL
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			// b2: lay du lieu ve
			// b2.1: Thiet lap cau lenh sql
			String sql = "select * from HangDienTu ORDER BY mahang OFFSET ? * ? ROWS FETCH NEXT ? ROWS ONLY";
			// b2.2: thuc hien cau lenh

			PreparedStatement cmd = kn.cn.prepareStatement(sql);

			cmd.setInt(1, page);
			cmd.setInt(2, pageSize);
			cmd.setInt(3, pageSize);

			ResultSet rs = cmd.executeQuery();
			// b3: duyet qua tap di lieu trong rs va luu vao mang ds
			while (rs.next()) {
				// lay ve ma loai va ten loai
				String maHang = rs.getString("mahang");
				String tenHang = rs.getString("tenHang");
				int soLuong = rs.getInt("soluong");
				Long gia = rs.getLong("gia");
				String maLoai = rs.getString("maloai");
				String baoHanh = rs.getString("baohanh");
				String image = rs.getString("image");
				String hangSX = rs.getString("hangSX");
				ds.add(new hangBean(maHang, tenHang, soLuong, gia, maLoai, baoHanh, image, hangSX));
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

	public static hangBean get1Hang(String mahang) {
		hangBean row = null;
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			String sql = "select * from products where mahang=? ";

			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();

			while (rs.next()) {
				row = new hangBean();
				row.setMaHang(rs.getString("mahang"));
				row.setTenHang(rs.getString("tenhang"));
				row.setSoLuong(rs.getInt("soluong"));
				row.setGia(rs.getLong("gia"));
				row.setMaLoai(rs.getString("maloai"));
				row.setBaoHanh(rs.getString("baohanh"));
				row.setImage(rs.getString("image"));
				row.setHangSX(rs.getString("hangsx"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return row;
	}
}
