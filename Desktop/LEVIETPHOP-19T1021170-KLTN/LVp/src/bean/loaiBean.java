package bean;

public class loaiBean {
	private String MaLoai;
	private String TenLoai;

	public loaiBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public loaiBean(String maLoai, String tenLoai) {
		super();
		MaLoai = maLoai;
		TenLoai = tenLoai;
	}

	public String getMaLoai() {
		return MaLoai;
	}

	public void setMaLoai(String maLoai) {
		MaLoai = maLoai;
	}

	public String getTenLoai() {
		return TenLoai;
	}

	public void setTenLoai(String tenLoai) {
		TenLoai = tenLoai;
	}

}
