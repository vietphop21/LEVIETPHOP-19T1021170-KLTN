package bean;

public class xacnhanBean {
	private long MaChiTietHD;
	private long MaHoaDon;
	private String HoTen;
	private String TenHang;
	private String SoLuongMua;
	private long Gia;
	private long ThanhTien;
	private boolean damua;

	public xacnhanBean(long maChiTietHD, long maHoaDon, String hoTen, String tenHang, String soLuongMua, long gia,
			long thanhTien, boolean damua) {
		super();
		MaChiTietHD = maChiTietHD;
		MaHoaDon = maHoaDon;
		HoTen = hoTen;
		TenHang = tenHang;
		SoLuongMua = soLuongMua;
		Gia = gia;
		ThanhTien = thanhTien;
		this.damua = damua;
	}

	public long getMaChiTietHD() {
		return MaChiTietHD;
	}

	public void setMaChiTietHD(long maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}

	public long getMaHoaDon() {
		return MaHoaDon;
	}

	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}

	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}

	public String getTenHang() {
		return TenHang;
	}

	public void setTenHang(String tenHang) {
		TenHang = tenHang;
	}

	public String getSoLuongMua() {
		return SoLuongMua;
	}

	public void setSoLuongMua(String soLuongMua) {
		SoLuongMua = soLuongMua;
	}

	public long getGia() {
		return Gia;
	}

	public void setGia(long gia) {
		Gia = gia;
	}

	public long getThanhTien() {
		return ThanhTien;
	}

	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}

	public boolean isDamua() {
		return damua;
	}

	public void setDamua(boolean damua) {
		this.damua = damua;
	}

}
