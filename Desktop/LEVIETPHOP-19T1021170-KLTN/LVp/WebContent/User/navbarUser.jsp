<%@page import="bean.khachhangBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
	<nav style="z-index:1">
		<div class="brand">
			<ul>
				<li><a href="hthangController"><i class="fa fa-home"
						aria-hidden="true"></i>GearVN</a></li>
				<li><a href="htgioController"><i
						class="fa fa-shopping-cart" aria-hidden="true"></i> Giỏ hàng</a></li>
				<li><a href="LichSuController"><i class="fa fa-history"
						aria-hidden="true"></i> Lịch sử mua hàng</a></li>
						<li><a href="User/gg.jsp"><i class="fa fa-history"
						aria-hidden="true" ></i> Liên hệ</a></li>
						<li><a href="LichSuController"><i class="fa fa-history"
						aria-hidden="true"></i> Thông tin về chúng tôi</a></li>
			</ul>
		</div>
		<ul>
			<%
			if (session.getAttribute("dn") != null) {
			%>
			<li><a href="#" style="padding-top:30px" ><span class="glyphicon" style="padding-top:30px" ></span>Xin chao, <%=((khachhangBean) session.getAttribute("dn")).getHoten()%></a></li>
			<li><a href="LogoutUserController" style="padding-top:30px" ><i class="fa fa-sign-out"
					aria-hidden="true"></i>Đăng xuất</a></li>
			<%
			} else {
			%>
			<li><a href="DangKyController"><i class="fa fa-user-plus"
					aria-hidden="true"></i>Đăng ký</a></li>
			<li><a href="ktdnController"><i class="fa fa-user"
					aria-hidden="true"></i>Đăng nhập</a></li>
			<%
			}
			%>
		</ul>
	</nav>
</body>
</html>