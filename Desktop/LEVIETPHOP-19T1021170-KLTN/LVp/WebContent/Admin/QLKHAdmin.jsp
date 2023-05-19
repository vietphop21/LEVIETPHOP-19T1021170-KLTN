<%@page import="java.util.ArrayList"%>
<%@page import="bean.khachhangBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lí khách hàng</title>
<link rel="apple-touch-icon" sizes="180x180"
	href="favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon_io/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>

<%@include file="navbaradminnosearch.jsp"%>
<div  style="
    display: flex;
    justify-content: center;
">

		<div class="container my-3">
			<form style=";margin-top: 80px;padding-bottom: 12px;"
				action="QLKhachHangAdminController" method="post">
				<div style="
		padding-top: 52px;
    color: green;
    font-size: 30px;
    text-align: center;
    font-weight: 700;
		" > Danh sách khách hàng </div>
				<table border="1" width="800" valign="top"
					class="table">
					<thead class = "thead-dark">
						<tr>
							<th  style=" width: 213px;" scope="col">Mã khách hàng</th>
							<th style=" width: 150px;" scope="col">Họ tên</th>
							<th style=" width: 150px;"  scope="col">Địa chỉ</th>
							<th style=" width: 150px;" scope="col">SĐT</th>
							<th scope="col">Email</th>
							<th style=" width: 189px;" style=" width: 150px;" scope="col">Tên Đăng Nhập</th>
							<th style=" width: 150px;" scope="col">Mật khẩu</th>
							<th style=" width: 150px;" scope="col">Xóa</th>
							
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<khachhangBean> dskh = (ArrayList<khachhangBean>) request.getAttribute("dskh");
						int n = dskh.size();
						for (int i = 0; i < n; i++) {
							khachhangBean kh = dskh.get(i);
						%>
						<tr >

							<td><%=kh.getMakhachhang()%></td>
							<td><%=kh.getHoten()%></td>
							<td><%=kh.getDiachi()%></td>
							<td><%=kh.getSodienthoai()%></td>
							<td><%=kh.getEmail()%></td>
							<td><%=kh.getTendangnhap()%></td>
							<td> <%=kh.getMatkhau() %></td>
							<td ><a style="color: #111010"
								class="btn btn-danger"
								href="QLKhachHangController?tendangnhap=<%=kh.getTendangnhap()%>"><i
									class="fa fa-trash-o" aria-hidden="true"></i></a>
							</td>
							
						<%
						}
						%>
					</tbody>
				</table>
				<hr>
		</div>
	</div>
	<script>
</body>
</html>