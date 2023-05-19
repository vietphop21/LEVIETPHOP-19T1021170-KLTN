<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.LoginAdminBean"%>
<%@page import="bean.xacnhanBean"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
body {
	padding-top: 50px;
}

.page-set {
	margin: 0 350px;
}
</style>
</head>
<body>
	<%@include file="navbaradminnosearch.jsp"%>
	<div class="container my-3">
		<form style="margin-top: 100px; padding-bottom: 12px;"
			action="viewLichsu" method="post">
			<table border="1" width="800" valign="top"
				class="table">
				<thead class="thead-dark">
					<tr>
						<th style="
    width: 163px;  scope="col">Mã chi tiết hoá đơn</th>
						<th  style="width:111px" scope="col">Mã hoá đơn</th>
						<th style="width:123px" scope="col">Họ tên</th>
						<th  scope="col">Tên hàng</th>
						<th style="width:126px" scope="col">Số lượng mua</th>
						<th  scope="col">Giá</th>
						<th  scope="col">Thành tiền</th>
						<th style="width:80px" scope="col">Đã mua</th>
						<th style="width:104px" scope="col">Chức năng</th>
					</tr>
				</thead>

				<tbody>
					<%
					ArrayList<xacnhanBean> list = (ArrayList<xacnhanBean>) request.getAttribute("dsxacnhan");
					DecimalFormat df = new DecimalFormat("###,###,###");
					for (xacnhanBean xnbean : list) {
					%>
					<tr>
						<td><%=xnbean.getMaChiTietHD()%></td>
						<td><%=xnbean.getMaHoaDon()%></td>
						<td><%=xnbean.getHoTen()%></td>
						<td><%=xnbean.getTenHang()%></td>
						<td><%=xnbean.getSoLuongMua()%></td>
						<td><%=df.format(xnbean.getGia())%>đ</td>
						<td><%=df.format(xnbean.getThanhTien())%>đ</td>
						<td><%=xnbean.isDamua()%></td>
						<td><a
							href="xacnhanchitietController?mahoadon=<%=xnbean.getMaChiTietHD()%>">Xác
								nhận</a></td>
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
