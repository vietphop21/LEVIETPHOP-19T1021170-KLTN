package bo;

import java.util.ArrayList;

import bean.giohangBean;
import dao.ChiTietHoaDonDao;

public class ChiTietHoaDonBo {
	ChiTietHoaDonDao cthddao = new ChiTietHoaDonDao();

	// lưu theo giỏ hàng và mã hoá đơn
	public void luucthd(ArrayList<giohangBean> gh, int mahd) {
		for (giohangBean g : gh)
			cthddao.luuchitiethoadon(g.getMahang(), g.getSoluong(), mahd);
	}
}
