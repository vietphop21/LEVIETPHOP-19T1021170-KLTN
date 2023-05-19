package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.xacnhanBean;

public class xacnhanDao {
	public ArrayList<xacnhanBean> getxacnhan() {
		try {
			ArrayList<xacnhanBean> ds = new ArrayList<xacnhanBean>();
			// b1: Ket noi CSDL
			KetNoiDao kn = new KetNoiDao();
			kn.KetNoi();
			// b2: lay du lieu ve
			// b2.1: Thiet lap cau lenh sql
			String sql = "select * from Vxacnhan where damua = 0";
			// b2.2: thuc hien cau lenh
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			// b3: duyet qua tap di lieu trong rs va luu vao mang ds
			while (rs.next()) {
				// lay ve ma loai va ten loai
				ds.add(new xacnhanBean(rs.getLong(1), rs.getLong(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getLong(6), rs.getLong(7), rs.getBoolean(8)));
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
