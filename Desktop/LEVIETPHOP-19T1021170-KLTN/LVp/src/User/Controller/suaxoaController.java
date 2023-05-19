package User.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangBo;

/**
 * Servlet implementation class suaxoaController
 */
@WebServlet("/suaxoaController")
public class suaxoaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public suaxoaController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		giohangBo gh = (giohangBo) session.getAttribute("gio");
		String[] check = request.getParameterValues("check");
		if (check != null)
			for (String ms : check)
				try {
					gh.Xoa(ms);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		session.setAttribute("i", gh.ds.size());
		if (request.getParameter("butxoa") != null) {
			String ms = request.getParameter("butxoa");
			try {
				gh.Xoa(ms);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (request.getParameter("butsua") != null) {
			String ms = request.getParameter("butsua");
			String sl = request.getParameter(ms);
			gh.Sua(ms, "", Long.parseLong(sl), 0,"");
		}
		session.setAttribute("i", gh.ds.size());
		session.setAttribute("gio", gh);
		String butcheck = request.getParameter("butcheck");
		if (butcheck != null) {
			// lấy danh sách mã hóa đơn từ checkbox
			String[] maList = request.getParameterValues("check");
			if (maList != null)
				// duyệt xóa theo mã sách
				for (String ms : maList)
					gh.Xoa(ms);

			// nạp lại vào session
			session.setAttribute("gio", gh);
		}
		if (request.getParameter("xoahet") != null) {
			session.removeAttribute("gio");
		}
		if (gh.ds.size() == 0 || session.getAttribute("gio") == null) {
			session.setAttribute("i", 0);
			response.sendRedirect("hthangController");
		} else
			response.sendRedirect("htgioController");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
