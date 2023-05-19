package User.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangBean;
import bo.ChiTietHoaDonBo;
import bo.HoaDonBo;
import bo.giohangBo;

/**
 * Servlet implementation class ThanhToanController
 */
@WebServlet("/ThanhToanController")
public class ThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		khachhangBean kh = (khachhangBean) session.getAttribute("dn");
		giohangBo gh = (giohangBo) session.getAttribute("gio");
		
		if(kh == null) {
			response.sendRedirect("ktdnController");
			return;
		}
		if(gh.ds == null || gh.ds.size() == 0) 
			response.sendRedirect("hthangController");
		
		HoaDonBo hdbo = new HoaDonBo();
		//luu hóa đơn lấy lại mã hóa đơn mới nhất
		int result = hdbo.luuhoadon(kh.getMakhachhang());
		
		//lưu chi tiết hóa đơn
		ChiTietHoaDonBo cthdbo = new ChiTietHoaDonBo();
		cthdbo.luucthd(gh.ds, result);
		session.removeAttribute("gio");
		RequestDispatcher rd = request.getRequestDispatcher("User/thanhtoanthanhcong.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
  
}
