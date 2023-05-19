package bean;

public class khachhangBean {
	private int makhachhang;
	private String hoten;
	private String diachi;
	private String sodienthoai;
	private String email;
	private String tendangnhap;
	private String matkhau;

	public int getMakhachhang() {
		return makhachhang;
	}

	public void setMakhachhang(int makhachhang) {
		this.makhachhang = makhachhang;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getSodienthoai() {
		return sodienthoai;
	}

	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTendangnhap() {
		return tendangnhap;
	}

	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public khachhangBean(int makhachhang, String hoten, String diachi, String sodienthoai, String email,
			String tendangnhap, String matkhau) {
		super();
		this.makhachhang = makhachhang;
		this.hoten = hoten;
		this.diachi = diachi;
		this.sodienthoai = sodienthoai;
		this.email = email;
		this.tendangnhap = tendangnhap;
		this.matkhau = matkhau;
	}

	public khachhangBean() {
		super();
		// TODO Auto-generated constructor stub
	}
}
