package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.lichsuBean;

public class LichSuDao {
	public ArrayList<lichsuBean> getlichsu(long makhachhang) {
		ArrayList<lichsuBean> ds = new ArrayList<lichsuBean>();
		try {
			// b1 Ket noi vao csdl
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			// B2: Lay du lieu ve
			// b2.1: Thiet lap cau lenh sql
			String sql = "select * from Vlichsu where makhachhang=?";
			// b2.2 Thuc hien cau lenh
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setLong(1, makhachhang);
			ResultSet rs = cmd.executeQuery();
			// B3: Duyet qua tap du lieu trong rs va luu vao mang ds
			while (rs.next()) {
				String tenhang = rs.getString("tenhang");
				long SoLuongMua = rs.getLong("SoLuongMua");
				long ThanhTien = rs.getLong("ThanhTien");
				String NgayMua = rs.getString("NgayMua");
				boolean damua = rs.getBoolean("damua");
				String image = rs.getString("image");
				ds.add(new lichsuBean(makhachhang, tenhang, SoLuongMua, ThanhTien,NgayMua, damua, image));
			}
			// b4: dong ket noi
			rs.close();
			kn.cn.close(); 
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
