package admin.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.LoginAdminBean;
import bean.loaiBean;
import bo.loaiBo;

/**
 * Servlet implementation class QLLoaiAdminController
 */
@WebServlet("/QLLoaiAdminController")
public class QLLoaiAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QLLoaiAdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		LoginAdminBean admin = (LoginAdminBean) session.getAttribute("adm");

		if (admin == null) {
			response.sendRedirect("LoginAdminController");
			return;
		}
		loaiBo lbo = new loaiBo();
		ArrayList<loaiBean> dsloai = lbo.getloai();
		String maloaidexoa = request.getParameter("xoa");
		if(maloaidexoa!=null) {
			lbo.xoa(maloaidexoa);
			dsloai = lbo.getloai();
		}
		String key = request.getParameter("txttk");
		if (key != null) {
			dsloai = lbo.Tim(key);
		}
		request.setAttribute("dsloai", dsloai);
		RequestDispatcher rd = request.getRequestDispatcher("Admin/QLLoaiAdmin.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (session.getAttribute("adm") == null) {
			response.sendRedirect("AdminLogin");
			return;
		}

		String MaLoai = request.getParameter("txtmaloai");
		String TenLoai = request.getParameter("txttenloai");
		loaiBo lbo = new loaiBo();
		lbo.ThemLoai(new loaiBean(MaLoai, TenLoai));
		doGet(request, response);
	}

}
