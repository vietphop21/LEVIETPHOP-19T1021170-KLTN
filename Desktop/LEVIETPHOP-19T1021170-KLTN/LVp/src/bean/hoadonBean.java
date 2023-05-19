package bean;

import java.sql.Date;

public class hoadonBean {
	private int MaHoaDon;
	private int MaKhachHang;
	private Date NgayMua;
	private boolean damua;

	public int getMaHoaDon() {
		return MaHoaDon;
	}

	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}

	public int getMaKhachHang() {
		return MaKhachHang;
	}

	public void setMaKhachHang(int maKhachHang) {
		MaKhachHang = maKhachHang;
	}

	public Date getNgayMua() {
		return NgayMua;
	}

	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}

	public boolean isDamua() {
		return damua;
	}

	public void setDamua(boolean damua) {
		this.damua = damua;
	}

	public hoadonBean(int maHoaDon, int maKhachHang, Date ngayMua, boolean damua) {
		super();
		MaHoaDon = maHoaDon;
		MaKhachHang = maKhachHang;
		NgayMua = ngayMua;
		this.damua = damua;
	}
}
