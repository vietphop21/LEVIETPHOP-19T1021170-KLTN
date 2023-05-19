package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.LoginAdminBean;

public class LoginAdminDao {
	private PreparedStatement cmd = null;
	private ResultSet rs = null;

	public LoginAdminBean checkLogin(String tendn, String Password) {
		try {
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			String sql = "select * from AdminLogin where TenDangNhap = ? and MatKhau = ?";
			cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, tendn);
			cmd.setString(2, Password);
			rs = cmd.executeQuery();
			while (rs.next()) {
				LoginAdminBean admbean = new LoginAdminBean(rs.getString(1), rs.getString(2), rs.getBoolean(3));
				return admbean;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
