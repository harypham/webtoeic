<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Laptop Shop - Đăng ký</title>
<link rel="stylesheet" href="<c:url value='/css/login.css' />">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>


	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="login-page">
		<div class="form">
			<form:form method="POST" action='register' modelAttribute="newUser">
				<h2 class="form-signin-heading" style="text-align: center">Web Toeic
					- Đăng ký tài khoản</h2>
				<hr />
				<div class="form-group">
					<form:input type="email" path="email" class="form-control"
						placeholder="Email" autofocus="true" required="required"></form:input>
					<form:errors class="error" path="email"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="password" path="password" class="form-control"
						required="required" placeholder="Mật khẩu"></form:input>
					<form:errors class="error" path="password"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="password" path="confirmPassword"
						class="form-control" placeholder="Nhắc lại mật khẩu"
						required="required"></form:input>
					<form:errors class="error" path="confirmPassword"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="text" path="hoTen" class="form-control"
						placeholder="Họ và tên" required="required"></form:input>
					<form:errors class="error" path="hoTen"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="number" path="soDienThoai" class="form-control"
						placeholder="Số điện thoại" required="required"></form:input>
					<form:errors class="error" path="soDienThoai"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="text" path="diaChi" class="form-control"
						placeholder="Địa chỉ" required="required"></form:input>
					<form:errors class="error" path="diaChi"></form:errors>
				</div>
				<input id="submit" type="submit" value="ĐĂNG KÝ">
				<p class="message" style="font-size: 18; padding-top: 10px"> Đã có tài khoản? <a
						href="<c:url value='/login'/> ">Đăng nhập</a></p>
			</form:form>
		</div>
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

</body>
</html>