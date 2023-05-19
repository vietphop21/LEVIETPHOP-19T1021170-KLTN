package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class KetNoiDao {

	public Connection cn;

	public void KetNoi() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("xong b111211");

			cn = DriverManager
					.getConnection("jdbc:sqlserver://DESKTOP-GN3V8MM\\SQLEXPRESS:1433;databaseName=LeVietPhop_DoAn;user=sa;password=123");
            System.out.println("Ok");
		} catch (Exception tt) {
			tt.printStackTrace();
		}
	}

	public static void main(String[] args) {
		KetNoiDao kn = new KetNoiDao();
		kn.KetNoi();
	}
}
