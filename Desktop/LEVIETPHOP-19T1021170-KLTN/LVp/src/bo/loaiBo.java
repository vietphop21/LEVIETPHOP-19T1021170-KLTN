package bo;

import java.util.ArrayList;

import bean.loaiBean;
import dao.loaiDao;

public class loaiBo {
	loaiDao ldao = new loaiDao();
	ArrayList<loaiBean> ds;

	public ArrayList<loaiBean> getloai() {
		ds = ldao.getloai();// dao lay ve
		return ds;
	}

	public int ThemLoai(loaiBean l) {
		return ldao.add_loai(l);
	}

	public ArrayList<loaiBean> Tim(String key) {
		ArrayList<loaiBean> tam = new ArrayList<loaiBean>();
		ArrayList<loaiBean> ds = getloai();
		for (loaiBean s : ds)
			if (s.getTenLoai().toLowerCase().trim().contains(key.toLowerCase().trim())
					|| s.getMaLoai().toLowerCase().trim().contains(key.toLowerCase().trim()))
				tam.add(s);
		return tam;
	}
	public void xoa(String maloaidexoa) {
		ldao.xoaloai(maloaidexoa);
	}
}
