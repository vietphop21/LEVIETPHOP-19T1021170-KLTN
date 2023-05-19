package bo;

import bean.LoginAdminBean;
import dao.LoginAdminDao;

public class LoginAdminBo {
	LoginAdminDao admdao = new LoginAdminDao();
	public LoginAdminBean ktdn(String tendn, String matkhau) {
		return admdao.checkLogin(tendn, matkhau);
	}
}
