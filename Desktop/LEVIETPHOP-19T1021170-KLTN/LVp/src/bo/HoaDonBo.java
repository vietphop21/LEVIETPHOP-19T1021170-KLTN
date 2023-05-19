package bo;

import dao.HoaDonDao;

public class HoaDonBo {
	HoaDonDao hddao = new HoaDonDao();
	public int luuhoadon(int makhachhang) {
		return hddao.luuhoadon(makhachhang);
	}
}
