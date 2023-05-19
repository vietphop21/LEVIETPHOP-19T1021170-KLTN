package bean;

import java.sql.Date;

public class xacnhanchitietBean {
	private long MaHoaDon;
	private Date NgayMua;
	private long ThanhTien;
	private String HoTen;

	public xacnhanchitietBean(long maHoaDon, Date ngayMua, long thanhTien, String hoTen) {
		super();
		MaHoaDon = maHoaDon;
		NgayMua = ngayMua;
		ThanhTien = thanhTien;
		HoTen = hoTen;
	}

	public long getMaHoaDon() {
		return MaHoaDon;
	}

	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}

	public Date getNgayMua() {
		return NgayMua;
	}

	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}

	public long getThanhTien() {
		return ThanhTien;
	}

	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}

	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
}
