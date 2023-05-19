package User.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.hangBean;
import bean.loaiBean;
import bo.hangBo;
import bo.loaiBo;

/**
 * Servlet implementation class hthangController
 */
@WebServlet("/hthangController")
public class hthangController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public hthangController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		loaiBo lbo = new loaiBo();
		ArrayList<loaiBean> dsloai = lbo.getloai();
		request.setAttribute("dsloai", dsloai);
		String page = request.getParameter("page");
		String pageSize = request.getParameter("pageSize");
		int size = 9;
		int pageNum = 0;
		if (pageSize != null)
			size = Integer.parseInt(pageSize);
		if (page != null)
			pageNum = Integer.parseInt(page);
		hangBo sbo = new hangBo();
		ArrayList<hangBean> dshang = new ArrayList<hangBean>();

		dshang = sbo.getHang(pageNum, size);

		int Numpage = sbo.getTotalPage(size);
		request.setAttribute("Numpage", Numpage);
		String maloai = request.getParameter("ml");
		String key = request.getParameter("txttk");
		if (maloai != null)
			dshang = sbo.timma(maloai);
		else if (key != null)
			dshang = sbo.Tim(key);
		request.setAttribute("dshang", dshang);
		RequestDispatcher rd = request.getRequestDispatcher("User/htHang.jsp");
		rd.forward(request, response);
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
