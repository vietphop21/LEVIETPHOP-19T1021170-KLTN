package bean;

public class lichsuBean {
	private long makhachhang;
	private String tenhang;
	private long SoLuongMua;
	private long ThanhTien;
	private String NgayMua;
	private boolean damua;
	private String Image;

	public lichsuBean(long makhachhang, String tenhang, long soLuongMua, long thanhTien, String ngayMua, boolean damua,
			String image) {
		super();
		this.makhachhang = makhachhang;
		this.tenhang = tenhang;
		SoLuongMua = soLuongMua;
		ThanhTien = thanhTien;
		NgayMua = ngayMua;
		this.damua = damua;
		Image = image;
	}

	public long getMakhachhang() {
		return makhachhang;
	}

	public void setMakhachhang(long makhachhang) {
		this.makhachhang = makhachhang;
	}

	public String getTenhang() {
		return tenhang;
	}

	public void setTenhang(String tenhang) {
		this.tenhang = tenhang;
	}

	public long getSoLuongMua() {
		return SoLuongMua;
	}

	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}

	public long getThanhTien() {
		return ThanhTien;
	}

	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}

	public String getNgayMua() {
		return NgayMua;
	}

	public void setNgayMua(String ngayMua) {
		NgayMua = ngayMua;
	}

	public boolean isDamua() {
		return damua;
	}

	public void setDamua(boolean damua) {
		this.damua = damua;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

}
