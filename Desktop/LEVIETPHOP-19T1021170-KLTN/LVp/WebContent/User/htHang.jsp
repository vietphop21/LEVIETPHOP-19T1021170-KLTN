<%@page import="java.io.Console"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.khachhangBean"%>
<%@page import="bo.hangBo"%>
<%@page import="bo.loaiBo"%>
<%@page import="dao.hangDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.hangBean"%>
<%@page import="bean.loaiBean"%>
<%@page import="dao.loaiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GEAR Việt Nam</title>
<link rel="apple-touch-icon" sizes="180x180"
	href="favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon_io/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/htHang.css">
</head>
<style>
</style>
<body>
<div>
	<%@include file="navbarUserHome.jsp"%>
	<div>
		<div class="fhs_block" style="padding-top: 80px;">
			<div class="fhs_block_head fhs_center_left">
				<span class="fa fa-list-alt" style="margin-right: 8px;"></span><span
					class="fhs_block_head_title">Danh mục sản phẩm</span>
			</div>
			<div class="fhs_block_line">
				<div></div>
			</div>
			<div class="fhs_block_head">
				<div class="list-group"
					style="display: grid; grid-template-columns: repeat(10, 1fr);">
					<%
					ArrayList<loaiBean> dsloai = (ArrayList<loaiBean>) request.getAttribute("dsloai");
					for (loaiBean loai : dsloai) {
					%>
					<a class="text-design card"
						href="hthangController?ml=<%=loai.getMaLoai()%>"> <%=loai.getTenLoai()%>
					</a>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<table style="width: 85%; height: 100%; margin: 0 auto;"
			class="table table-striped">
			<%
			ArrayList<hangBean> dshang = (ArrayList<hangBean>) request.getAttribute("dshang");
			DecimalFormat formatter = new DecimalFormat("###,###,###");
			int n = dshang.size();
			for (int i = 0; i < n; i++) {
				hangBean s = dshang.get(i);
			%>
			<tr>
			
				<td class="card" style="width: 232px; height: 246px"><img
					style="width: 209px; height: 245px" src="<%=s.getImage()%>"><br>
					<b>Tên:</b><%=s.getTenHang()%><br> <b>Bảo hành:</b> <%=s.getBaoHanh()%>
					<br> <b>Giá:</b> <%=formatter.format(s.getGia())%>đ <br>
					<b>Hãng:</b><%=s.getHangSX()%><a
					href="giohangController?mh=<%=s.getMaHang()%>&th=<%=s.getTenHang()%>&image=<%=s.getImage()%>&gia=<%=s.getGia()%>">
						<img style="width: 115px" src=buynow.png>
				</a>
				<button style="margin:5px" type="button" class="btn btn-primary">
				<a href="chiTietHangController?mh=<%=s.getMaHang()%>&th=<%=s.getTenHang()%>&image=<%=s.getImage()%>&gia=<%=s.getGia()%>&hang=<%=s.getHangSX()%>&baohanh=<%=s.getBaoHanh() %>&maloai=<%=s.getMaLoai() %>" style="
    color: black;font-weight:bold;
">
						Xem chi tiết </a>
						
</button>
				</td>
				<%
				i++;
				if (i < n) {
					s = dshang.get(i);
				%>
				<td class="card" style="width: 232px; height: 246px"><img
					style="width: 209px; height: 245px" src="<%=s.getImage()%>"><br>
					<b>Tên:</b><%=s.getTenHang()%><br> <b>Bảo hành:</b> <%=s.getBaoHanh()%>
					<br> <b>Giá:</b> <%=formatter.format(s.getGia())%>đ <br>
					<b>Hãng:</b><%=s.getHangSX()%>
					<a
					href="giohangController?mh=<%=s.getMaHang()%>&th=<%=s.getTenHang()%>&image=<%=s.getImage()%>&gia=<%=s.getGia()%>&hang=<%=s.getHangSX()%>">
						<img style="width: 115px" src=buynow.png>
						
				</a>
				<button style="margin:5px" type="button" class="btn btn-primary">
				<a href="chiTietHangController?mh=<%=s.getMaHang()%>&th=<%=s.getTenHang()%>&image=<%=s.getImage()%>&gia=<%=s.getGia()%>&hang=<%=s.getHangSX()%>&baohanh=<%=s.getBaoHanh() %>&maloai=<%=s.getMaLoai() %>" style="
    color: black;font-weight:bold;
">
						Xem chi tiết </a>
						
</button>
			
				
				</td>
				<%
				}
				%>
				<%
				i++;
				if (i < n) {
					s = dshang.get(i);
				%>
	
				<td class="card" style="width: 232px; height: 246px"><img
					style="width: 209px; height: 245px" src="<%=s.getImage()%>"><br>
					<b>Tên:</b><%=s.getTenHang()%><br> <b>Bảo hành:</b> <%=s.getBaoHanh()%>
					<br> <b>Giá:</b> <%=formatter.format(s.getGia())%>đ <br>
					<b>Hãng:</b><%=s.getHangSX()%><a
					href="giohangController?mh=<%=s.getMaHang()%>&th=<%=s.getTenHang()%>&image=<%=s.getImage()%>&gia=<%=s.getGia()%>">
						<img style="width: 115px" src=buynow.png>
						
						
				</a>
				<button style="margin:5px" type="button" class="btn btn-primary">
				<a href="chiTietHangController?mh=<%=s.getMaHang()%>&th=<%=s.getTenHang()%>&image=<%=s.getImage()%>&gia=<%=s.getGia()%>&hang=<%=s.getHangSX()%>&baohanh=<%=s.getBaoHanh() %>&maloai=<%=s.getMaLoai() %>" style="
    color: black;font-weight:bold;
">
						Xem chi tiết </a>
						
</button>
						
</button>
				
			
						
				</a>
				</td>
				
				
				<%
				}
				%>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<div class="pagination" style="
    padding-left: 500px;
">
		<%
		int Numpage = (int) request.getAttribute("Numpage");
		for (int t = 0; t < Numpage; t++) {
		%><a class="card" href="hthangController?page=<%=t%>"><%=t + 1%></a>
		<%
		}
		%>
	</div>
	<div/>
	<script>

	</script>
	<div>
	<%@include file="footer.jsp"%>
	</div>
	
</body>
</html>