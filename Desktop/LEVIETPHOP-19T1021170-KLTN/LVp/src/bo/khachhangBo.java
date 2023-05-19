package bo;

import java.util.ArrayList;

import bean.khachhangBean;
import bean.loaiBean;
import dao.khachhangDao;

public class khachhangBo {
	khachhangDao khdao = new khachhangDao();
	ArrayList<khachhangBean> ds;
	public khachhangBean ktdn(String tendn, String pass) {
		return khdao.checkLogin(tendn, pass);
	}
	public ArrayList<khachhangBean> getKhachHang() {
		ds = khdao.getkhachhang();// dao lay ve
		return ds;
	}
	public void xoa(String tendn) {
		khdao.xoakhachhang(tendn);
	}
}