package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.khachhangBean;
import bean.loaiBean;

public class khachhangDao {
	private PreparedStatement cmd = null;
	private ResultSet rs = null;

	public khachhangBean checkLogin(String TenDangNhap, String MatKhau) {
		try {

			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			String sql = "select * from KhachHang where TenDangNhap = ? and MatKhau = ?";
			cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, TenDangNhap);
			cmd.setString(2, MatKhau);
			rs = cmd.executeQuery();
			while (rs.next()) {
				khachhangBean khbean = new khachhangBean(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
				return khbean;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int xoakhachhang(String TenDangNhap) {
		String query = "delete from KhachHang where TenDangNhap = ?";
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			PreparedStatement cmd = kn.cn.prepareStatement(query);
			cmd.setString(1, TenDangNhap);
			cmd.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public ArrayList<khachhangBean> getkhachhang() {
		try {
			ArrayList<khachhangBean> ds = new ArrayList<khachhangBean>();
			// b1: Ket noi CSDL
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			// b2: lay du lieu ve
			// b2.1: Thiet lap cau lenh sql
			String sql = "select * from KhachHang";
			// b2.2: thuc hien cau lenh
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			// b3: duyet qua tap di lieu trong rs va luu vao mang ds
			while (rs.next()) {
				// lay ve ma loai va ten loai
				int MaKhachHang = rs.getInt("makhachhang");
				String HoTen = rs.getString("hoten");
				String DiaChi = rs.getString("diachi");
				String SoDienThoai = rs.getString("sodienthoai");
				String Email = rs.getString("email");
				String TenDangNhap = rs.getString("tendangnhap");
				String MatKhau = rs.getString("matkhau");
				ds.add(new khachhangBean(MaKhachHang, HoTen, DiaChi, SoDienThoai, Email, TenDangNhap, MatKhau));
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

}
