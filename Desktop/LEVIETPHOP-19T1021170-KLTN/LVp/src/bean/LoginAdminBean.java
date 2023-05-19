package bean;

public class LoginAdminBean {
	private String TenDangNhap;
	private String MatKhau;
	private boolean Quyen;

	public String getTenDangNhap() {
		return TenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}

	public String getMatKhau() {
		return MatKhau;
	}

	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}

	public boolean isQuyen() {
		return Quyen;
	}

	public void setQuyen(boolean quyen) {
		Quyen = quyen;
	}

	public LoginAdminBean(String tenDangNhap, String matKhau, boolean quyen) {
		super();
		TenDangNhap = tenDangNhap;
		MatKhau = matKhau;
		Quyen = quyen;
	}
}
