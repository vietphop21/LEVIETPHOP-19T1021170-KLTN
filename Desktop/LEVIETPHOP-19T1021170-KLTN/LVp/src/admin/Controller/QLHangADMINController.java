package admin.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import bean.LoginAdminBean;
import bean.hangBean;
import bean.loaiBean;
import bo.hangBo;
import bo.loaiBo;

/**
 * Servlet implementation class QLHangADMINController
 */
@WebServlet("/QLHangADMINController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class QLHangADMINController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QLHangADMINController() {
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
		hangBo hbo = new hangBo();

		String masachdexoa = request.getParameter("xoa");
		if (masachdexoa != null) {
			String anh_ = request.getParameter("anh");
			hbo.xoa(masachdexoa);
			// xóa ảnh
			String dirUrl = request.getServletContext().getRealPath("");
			String storePath = "C:\\Users\\Admin\\eclipse-workspace\\LVp\\WebContent\\image_gear";
			File part = new File(dirUrl + "/" + anh_);
			File part2 = new File(storePath + "/" + anh_);
			part.delete();
			part2.delete();
		}

		loaiBo lbo = new loaiBo();
		ArrayList<loaiBean> dsloai = lbo.getloai();
		request.setAttribute("dsloai", dsloai);

		String page = request.getParameter("page");
		String pageSize = request.getParameter("pageSize");
		int size = 10;
		int pageNum = 0;
		if (pageSize != null)
			size = Integer.parseInt(pageSize);
		if (page != null)
			pageNum = Integer.parseInt(page);
		ArrayList<hangBean> dssach = new ArrayList<hangBean>();

		dssach = hbo.getHang(pageNum, size);

		int Numpage = hbo.getTotalPage(size);

		request.setAttribute("Numpage", Numpage);
		String maloai = request.getParameter("ml");
		String key = request.getParameter("txttk");
		if (maloai != null)
			dssach = hbo.timma(maloai);
		else if (key != null)
			dssach = hbo.Tim(key);
		request.setAttribute("dssach", dssach);

		RequestDispatcher rd = request.getRequestDispatcher("Admin/QLHangAdmin.jsp");
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

		String mahang = request.getParameter("txtmahang");
		String tenhang = request.getParameter("txttenhang");
		String maloai = request.getParameter("txtmaloai");
		String hangsx = request.getParameter("txthangsx");
		String soluong = request.getParameter("txtsl");
		String gia = request.getParameter("txtgia");
		String baohanh = request.getParameter("txtbaohanh");
		Part part = request.getPart("txtfile");

		// Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
		String dirUrl = request.getServletContext().getRealPath("image_gear");

		// storePath là cái image_sach ở project
		String storePath = "C:\\Users\\Admin\\eclipse-workspace\\LVp\\WebContent\\image_gear";

		// Lấy tên file
		String filename = part.getSubmittedFileName();
		String randomGuid = UUID.randomUUID().toString().replace("-", "");
		String newfilename = randomGuid + filename;

		part.write(dirUrl + "/" + newfilename);
		part.write(storePath + "/" + newfilename);

		// cái này sẽ lưu vào database field ảnh
		String image_Locations = "image_gear/" + newfilename;
		// Lưu sách

		hangBo hb = new hangBo();
		hb.luuhang(new hangBean(mahang, tenhang, Integer.parseInt(gia),Long.parseLong(soluong), maloai, baohanh, image_Locations, hangsx));
		doGet(request, response);
	}
}
