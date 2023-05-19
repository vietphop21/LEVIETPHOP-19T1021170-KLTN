package bo;

import java.util.ArrayList;

import bean.xacnhanBean;
import dao.xacnhanchitietDao;

public class xacnhanchitietBo {
	xacnhanchitietDao xnctdao = new xacnhanchitietDao();
	public ArrayList<xacnhanBean> getxacnhanHoaDon(){
		return xnctdao.getxacnhanHoaDon();
	}
	public int xacnhan(String mahoadonchitiet) {
		return xnctdao.xacnhan(mahoadonchitiet);
	}
}
