package admin.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.LoginAdminBean;
import bean.xacnhanBean;
import bo.xacnhanchitietBo;

/**
 * Servlet implementation class xacnhanchitietController
 */
@WebServlet("/xacnhanchitietController")
public class xacnhanchitietController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public xacnhanchitietController() {
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

		// phải lấy để biết chuyển cái nào
		String mahoadonchitiet = request.getParameter("mahoadon");

		xacnhanchitietBo xnctbo = new xacnhanchitietBo();

		int rs = xnctbo.xacnhan(mahoadonchitiet);
		System.out.println(rs);
		if (rs > 0) {
			// lấy danh sách đã mua rồi
			ArrayList<xacnhanBean> list = xnctbo.getxacnhanHoaDon();
			request.setAttribute("dsXacNhanCT", list);
			request.getRequestDispatcher("Admin/xacnhanchitiet.jsp").forward(request, response);
		}
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
