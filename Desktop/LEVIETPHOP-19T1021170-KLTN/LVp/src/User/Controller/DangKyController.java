package User.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.khachhangBean;
import dao.DangKyDao;

/**
 * Servlet implementation class DangKyController
 */
@WebServlet("/DangKyController")
public class DangKyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DangKyDao dkDAO = new DangKyDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangKyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd = request.getRequestDispatcher("User/dangky.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String hoten = request.getParameter("hoten");
		String diachi = request.getParameter("diachi");
		String sodienthoai = request.getParameter("sodt");
		String email = request.getParameter("email");
		String tendangnhap = request.getParameter("tendn");
		String matkhau = request.getParameter("pass");
		khachhangBean khBean = new khachhangBean();
		khBean.setHoten(hoten);
		khBean.setDiachi(diachi);
		khBean.setSodienthoai(sodienthoai);
		khBean.setEmail(email);
		khBean.setTendangnhap(tendangnhap);
		khBean.setMatkhau(matkhau);
		try {
			dkDAO.khRegister(khBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("ktdnController");
		
		rd.forward(request, response);
	}

}
