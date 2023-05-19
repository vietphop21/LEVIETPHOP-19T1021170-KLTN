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
import bo.lichsuBo;
import bo.loaiBo;

/**
 * Servlet implementation class LichSuController
 */
@WebServlet("/LichSuController")
public class LichSuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LichSuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		khachhangBean kh=(khachhangBean)session.getAttribute("dn");
		if(kh==null)//chua dang dang nhap
			response.sendRedirect("ktdnController");
		else {
			lichsuBo lsbo=new lichsuBo();
			request.setAttribute("dslichsu", lsbo.getlichsu(kh.getMakhachhang()));
			loaiBo lbo= new loaiBo();
			request.setAttribute("dsloai", lbo.getloai());
			RequestDispatcher rd= request.getRequestDispatcher("User/lichsu.jsp");
			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
