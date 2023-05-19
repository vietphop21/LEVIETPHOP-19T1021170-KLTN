package bo;

import java.util.ArrayList;

import bean.lichsuBean;
import dao.LichSuDao;

public class lichsuBo {
	LichSuDao lsdao = new LichSuDao();
	public ArrayList<lichsuBean> getlichsu(long makhachhang){
		return lsdao.getlichsu(makhachhang);
	}
}
