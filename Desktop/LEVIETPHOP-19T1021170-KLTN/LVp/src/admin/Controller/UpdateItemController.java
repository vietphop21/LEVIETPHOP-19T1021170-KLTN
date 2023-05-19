package admin.Controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bean.hangBean;
import bo.hangBo;

/**
 * Servlet implementation class UpdateItemController
 */
@WebServlet("/UpdateItemController")
@MultipartConfig(fileSizeThreshold = 512 * 512 * 1, // 1 MB
		maxFileSize = 512 * 512 * 10, // 10 MB
		maxRequestSize = 512 * 512 * 100 // 100 MB
)
public class UpdateItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateItemController() {
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
		String mh = request.getParameter("mh");
		hangBo hbo = new hangBo();
		hbo.gethang();
		hangBean hang =  hbo.timhangtheoma(mh);
		request.setAttribute("hang", hang);

		request.getRequestDispatcher("Admin/updateitem.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String mahang = request.getParameter("mh");
		String tenhang = request.getParameter("th");
		String hangsx = request.getParameter("hangsx");
		String baohanh = request.getParameter("baohanh");
		String maloai = request.getParameter("ml");
		String soluong = request.getParameter("sl");
		String gia = request.getParameter("gia");
		String anhcu = request.getParameter("anhcu");
		Part part = request.getPart("file");
		String image_Locations = anhcu;
		if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().equals("")) {
			// Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
			String dirUrl = request.getServletContext().getRealPath("image_gear");
			// D:\HOCTAP\Baitap\JavaNangCao\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JavaNangCaoNhom3\image_sach

			// storePath là cái image_sach ở project
			String storePath = "C:\\Users\\Admin\\eclipse-workspace\\LVp\\WebContent\\image_gear";

			// Lấy tên file
			String filename = part.getSubmittedFileName();
			String randomGuid = UUID.randomUUID().toString().replace("-", "");
			String newfilename = randomGuid + filename;

			// Lưu file
			// Lưu vào database sẽ có dạng "image_sach/"+filename
			part.write(dirUrl + "/" + newfilename);
			part.write(storePath + "/" + newfilename);

			String dirUrl1 = request.getServletContext().getRealPath("");
			String storePath1 = "C:\\Users\\Admin\\eclipse-workspace\\LVp\\WebContent";


			File part1 = new File(dirUrl1 + "/" + anhcu);
			File part2 = new File(storePath1 + "/" + anhcu);
			part1.delete();
			part2.delete();

			// cái này sẽ lưu vào database field ảnh
			image_Locations = "image_gear/" + newfilename;
		}

		hangBo hbo = new hangBo();
		hbo.update(new hangBean(mahang, tenhang, Integer.parseInt(gia),Long.parseLong(soluong), maloai, baohanh, image_Locations, hangsx));
		response.sendRedirect("QLHangADMINController");
	}

}
