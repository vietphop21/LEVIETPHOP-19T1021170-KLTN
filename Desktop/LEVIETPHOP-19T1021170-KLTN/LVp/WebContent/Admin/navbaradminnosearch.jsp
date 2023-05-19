<%@page import="bean.LoginAdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/cssNavbar.css">
</head>
<body>
	<nav style="background-color: #063970">
		<div class="brand">
			<ul>
			<li><a href="hthangController"><i class="fa fa-home"
						aria-hidden="true"></i>GearVN</a></li>
				<li><a href="QLLoaiAdminController"><i class="fa fa-wrench"
						aria-hidden="true"></i>Quản lý loại</a>
						
						</li>
				<li><a href="QLHangADMINController"><i class="fa fa-wrench"
						aria-hidden="true"></i>Quản lý hàng</a></li>
						<li><a href="QLKhachHangController"><i class="fa fa-wrench"
						aria-hidden="true"></i>Quản lý khách hàng</a></li>
				<li><a href="xacnhanController">Xác nhận đặt hàng</a></li>
				
			</ul>
		</div>
		<ul>
			<%
			if (session.getAttribute("adm") != null) {
			%>
			<!-- chinh lai cho no hien thi ten -->
			<li><a  style="padding-top:30px " href="#"><span class="glyphicon"></span>Xin chao, <%=((LoginAdminBean) session.getAttribute("adm")).getTenDangNhap()%></a></li>
			<li><a  style="padding-top:30px " href="LoginAdminController"><i class="fa fa-sign-out"
					aria-hidden="true"></i> Đăng xuất</a></li>
			<%
			} else {
			%>
			<li><a href="LoginAdminController"><span class="glyphicon"></span><i
					class="fa fa-user" aria-hidden="true"></i>Đăng nhập</a></li>
			<%
			}
			%>
		</ul>
	</nav>
</body>
</html>