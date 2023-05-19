package User.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/chiTietHangController")
public class chiTietHangController extends HttpServlet {

    public chiTietHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mh = request.getParameter("mh");
		String th = request.getParameter("th");
		String image = request.getParameter("image");
		String gia = request.getParameter("gia");
		String hang=request.getParameter("hang");
		String baohanh = request.getParameter("baohanh");
		String maloai = request.getParameter("maloai");
		
		HttpSession session = request.getSession();
		session.setAttribute("mh", mh);
		session.setAttribute("th", th);
		session.setAttribute("image", image);
		session.setAttribute("gia", gia);
		session.setAttribute("hang", hang);
		session.setAttribute("baohanh", baohanh);
		session.setAttribute("maloai", maloai);
		request.getRequestDispatcher("User/chiTietHang.jsp").forward(request, response);
	}


}
