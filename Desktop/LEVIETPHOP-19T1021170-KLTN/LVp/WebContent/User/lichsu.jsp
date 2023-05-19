<%@page import="bean.khachhangBean"%>
<%@page import="bean.lichsuBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.LichSuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Lịch sử mua hàng</title>
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
<link rel="stylesheet" href="./css/csslichsu.css">
</head>
<body>
	<%@include file="navbarUser.jsp"%>
	<div class="container my-3">
		<form style="margin-top: 100px; margin-left: auto; margin-right: auto;"
			action="viewLichsu" method="post">
			<table>
				<thead>
					<tr>
						<th scope="col">Số thứ tự</th>
						<th scope="col">Ngày mua</th>
						<th scope="col">Tên hàng</th>
						<th scope="col">Số lượng</th>
						<th scope="col">Tổng tiền</th>
						<th scope="col">Trạng thái</th>
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<lichsuBean> list = (ArrayList<lichsuBean>) request.getAttribute("dslichsu");
					int i = 1;
					for (lichsuBean rs : list) {
					%>
					<tr class="card"
						style="min-width: 350px; text-align: center; padding: 3px">
						<td><%=i++%></td>
						<td><%=rs.getNgayMua()%></td>
						<td><%=rs.getTenhang()%><br> <img
							style="width: 100px; height: 120px" src="<%=rs.getImage()%>"></td>
						<td><%=rs.getSoLuongMua()%></td>
						<td><%=rs.getThanhTien()%></td>
						<%
						String status = "";
						if (rs.isDamua())
							status = "Đã mua";
						else
							status = "Đang chờ";
						%>
						<td><%=status%></td>
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