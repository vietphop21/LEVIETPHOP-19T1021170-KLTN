<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.xacnhanchitietBean"%>
<%@page import="bean.xacnhanBean"%>
<%@page import="bean.LoginAdminBean"%>
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
<link rel="stylesheet" href="./css/admincss.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/cssNavbar.css">
<style>
body {
	padding-top: 50px;
}
</style>
</head>
<body>
	<%@include file="navbaradminnosearch.jsp"%>
	</nav>
	<div class="container my-3">
		<form style="margin-top: 100px; padding-bottom: 12px;"
			action="viewLichsu" method="post">
			<table border="1" width="800" valign="top"
				class="table table striped">
				<thead>
					<!-- <tr>
						<th scope="col">Mã hoá đơn</th>
						<th scope="col">Ngày mua</th>
						<th scope="col">Họ tên</th>
						<th scope="col">Thành tiền</th>

					</tr> -->
					<tr>
						<th scope="col">Mã chi tiết hoá đơn</th>
						<th scope="col">Mã hoá đơn</th>
						<th scope="col">Họ tên</th>
						<th scope="col">Tên sách</th>
						<th scope="col">Số lượng mua</th>
						<th scope="col">Giá</th>
						<th scope="col">Thành tiền</th>
						<th scope="col">Đã mua</th>
					</tr>
				</thead>

				<tbody>
					<%
					ArrayList<xacnhanBean> list = (ArrayList<xacnhanBean>) request.getAttribute("dsXacNhanCT");
					DecimalFormat df = new DecimalFormat("###,###,###");
					int i = 1;
					for (xacnhanBean xn : list) {
					%>
					<tr style="text-align: center;height: 40px" class="card">
						<td><%=xn.getMaChiTietHD()%></td>
						<td><%=xn.getMaHoaDon()%></td>
						<td><%=xn.getHoTen()%></td>
						<td><%=xn.getTenHang()%></td>
						<td><%=xn.getSoLuongMua()%></td>
						<td><%=df.format(xn.getGia())%>đ</td>
						<td><%=df.format(xn.getThanhTien())%>đ</td>
						<td><%=xn.isDamua()%></td>
						<!-- nó sẽ là true -->
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<hr>
	</div>
</body>
</html>