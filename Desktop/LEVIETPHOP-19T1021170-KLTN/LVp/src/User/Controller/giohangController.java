package User.Controller;

import java.awt.Image;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangBo;

/**
 * Servlet implementation class giohangController
 */
@WebServlet("/giohangController")
public class giohangController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public giohangController() {
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
		String mahang = request.getParameter("mh");
		String tenhang = request.getParameter("th");
		long gia = 0;
		if (request.getParameter("gia") != null)
			gia = Long.parseLong(request.getParameter("gia"));
		String image = request.getParameter("image");
		giohangBo ghbo = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("gio") == null) {
			ghbo = new giohangBo();
			session.setAttribute("gio", ghbo);
		}
		ghbo = (giohangBo) session.getAttribute("gio");
		ghbo.Them(mahang, tenhang, gia, (long) 1, image);
		System.out.print(ghbo);
		session.setAttribute("gio", ghbo);
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
