package bean;

public class hangBean {
	private String MaHang;
	private String TenHang;
	private int SoLuong;
	private Long Gia;
	private String MaLoai;
	private String BaoHanh;
	private String Image;
	private String HangSX;

	public hangBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public hangBean(String maHang, String tenHang, int soLuong, Long gia, String maLoai, String baoHanh, String image,
			String hangSX) {
		super();
		MaHang = maHang;
		TenHang = tenHang;
		SoLuong = soLuong;
		Gia = gia;
		MaLoai = maLoai;
		BaoHanh = baoHanh;
		Image = image;
		HangSX = hangSX;
	}

	public String getMaHang() {
		return MaHang;
	}

	public void setMaHang(String maHang) {
		MaHang = maHang;
	}

	public String getTenHang() {
		return TenHang;
	}

	public void setTenHang(String tenHang) {
		TenHang = tenHang;
	}

	public int getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

	public Long getGia() {
		return Gia;
	}

	public void setGia(Long gia) {
		Gia = gia;
	}

	public String getMaLoai() {
		return MaLoai;
	}

	public void setMaLoai(String maLoai) {
		MaLoai = maLoai;
	}

	public String getBaoHanh() {
		return BaoHanh;
	}

	public void setBaoHanh(String baoHanh) {
		BaoHanh = baoHanh;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public String getHangSX() {
		return HangSX;
	}

	public void setHangSX(String hangSX) {
		HangSX = hangSX;
	}
}
