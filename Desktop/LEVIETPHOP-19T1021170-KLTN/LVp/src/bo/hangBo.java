package bo;

import java.util.ArrayList;

import bean.hangBean;
import dao.hangDao;

public class hangBo {
	hangDao hdao = new hangDao();
	ArrayList<hangBean> ds;

	public ArrayList<hangBean> gethang() {
		ds = hdao.gethang();
		return ds;
	}

	public ArrayList<hangBean> getHang(int page, int size) {
		return hdao.getHangDienTu(page, size);
	}

	public int getTotalhang() {
		return hdao.demSoLuongHangDienTu();
	}

	public int getTotalPage(int size) {
		int total = hdao.demSoLuongHangDienTu();
		int Numpage = total / size;

		return total % size == 0 ? Numpage : Numpage + 1;
	}

	public hangBean timhangtheoma(String ma) {
		for (hangBean s : ds)
			if (s.getMaHang().equals(ma))
				return s;
		return null;
	}

	public ArrayList<hangBean> timma(String ma) {
		ArrayList<hangBean> tam = new ArrayList<hangBean>();
		ArrayList<hangBean> ds = gethang();
		for (hangBean s : ds)
			if (s.getMaLoai().equals(ma))
				tam.add(s);
		return tam;
	}

	public ArrayList<hangBean> Tim(String key) {
		ArrayList<hangBean> tam = new ArrayList<hangBean>();
		ArrayList<hangBean> ds = gethang();
		for (hangBean s : ds)
			if (s.getTenHang().toLowerCase().trim().contains(key.toLowerCase().trim())
					|| s.getHangSX().toLowerCase().trim().contains(key.toLowerCase().trim())
					|| s.getMaLoai().toLowerCase().trim().contains(key.toLowerCase().trim()))
				tam.add(s);
		return tam;
	}

	public int luuhang(hangBean hangBean) {
		return hdao.themhang(hangBean);
	}

	public void xoa(String mahangdexoa) {
		hdao.xoahang(mahangdexoa);
	}
	public void update(hangBean h) {
		hdao.update(h);
	}
}
