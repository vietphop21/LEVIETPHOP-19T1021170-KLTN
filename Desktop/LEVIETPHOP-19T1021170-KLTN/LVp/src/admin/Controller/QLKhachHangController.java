package admin.Controller;

import java.io.File;
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
import bean.khachhangBean;
import bo.khachhangBo;

/**
 * Servlet implementation class QLKhachHang
 */
@WebServlet("/QLKhachHangController")
public class QLKhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QLKhachHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		LoginAdminBean admin = (LoginAdminBean) session.getAttribute("adm");

		if (admin == null) {
			response.sendRedirect("LoginAdminController");
			return;
		}
		khachhangBo khbo = new khachhangBo();
		String tendangnhap = request.getParameter("tendangnhap");
		if (tendangnhap != null) {
			
			khbo.xoa(tendangnhap);
			// xóa ảnh
			
		
		}
		ArrayList<khachhangBean> dskh = khbo.getKhachHang();
		request.setAttribute("dskh", dskh);
		RequestDispatcher rd = request.getRequestDispatcher("Admin/QLKHAdmin.jsp");
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
