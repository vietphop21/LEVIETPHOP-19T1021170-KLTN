package bo;

import java.util.ArrayList;

import bean.xacnhanBean;
import dao.xacnhanDao;

public class xacnhanBo {
	xacnhanDao xndao = new xacnhanDao();

	public ArrayList<xacnhanBean> getxacnhan() {
		return xndao.getxacnhan();
	}
}
