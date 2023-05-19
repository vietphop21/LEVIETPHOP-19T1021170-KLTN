package User.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loaiBean;
import bean.hangBean;
import bo.hangBo;
import bo.loaiBo;
/**
 * Servlet implementation class htgioController
 */
@WebServlet("/htgioController")
public class htgioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htgioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		loaiBo lbo = new loaiBo();
		ArrayList<loaiBean> dsloai = lbo.getloai();
		request.setAttribute("dsloai", dsloai);
		hangBo hbo = new hangBo();
		ArrayList<hangBean> dshang = hbo.gethang();
		String maloai = request.getParameter("ml");
		String key = request.getParameter("txttk");
		if (maloai != null)
			dshang = hbo.timma(maloai);
		else if (key != null)
			dshang = hbo.Tim(key);
		request.setAttribute("dshang", dshang);
		RequestDispatcher rd = request.getRequestDispatcher("User/htgio.jsp");
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
