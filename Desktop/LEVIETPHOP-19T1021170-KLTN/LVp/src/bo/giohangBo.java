package bo;

import java.util.ArrayList;

import bean.giohangBean;

public class giohangBo {
	public ArrayList<giohangBean> ds = new ArrayList<giohangBean>();

	public void Them(String Mahang, String tenhang, long gia, long soluong, String image) {
		for (giohangBean s : ds) {
			if (s.getMahang().equals(Mahang)) {
				s.setSoluong(s.getSoluong() + soluong);
				return;
			}
		}
		ds.add(new giohangBean(Mahang, tenhang, soluong, gia, image));
	}

	public long Tongtien() {
		long ss = 0;
		for (giohangBean s : ds)
			ss = ss + s.getThanhtien();
		return ss;
	}

	public void Sua(String Mahang, String tenhang, long soluong, long gia, String image) {
		for (giohangBean g : ds)
			if (g.getMahang().trim().equals(Mahang.trim())) {
				g.setSoluong(soluong);
				return;
			}
		ds.add(new giohangBean(Mahang, tenhang, soluong, gia, image));
	}

	public ArrayList<giohangBean> Xoa(String ms) {
		int n = ds.size();// lấy số phần tử trong mang
		for (int i = 0; i < n; i++)
			if (ds.get(i).getMahang().equalsIgnoreCase(ms)) {
				ds.remove(i);
				break;
			}
		return ds;
	}

	public void Up(String Mahang, long soluong) {
		if (Mahang != null) {
			for (giohangBean h : ds) {
				if (h.getMahang().equals(Mahang)) {
					h.setSoluong(soluong);
					return;
				}
			}
		}
	}
}
