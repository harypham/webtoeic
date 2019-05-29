<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tài khoản</title>
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<div class="container">
		<h3 class="page-header">Thông tin cá nhân</h3>
		<ul class="nav nav-tabs" id="tabs">
			<li class="active"><a href="#information">Cập nhật thông tin</a></li>
			<li><a href="#changePass">Đổi mật khẩu</a></li>
		</ul>

		<div>
			<div class="tab-content">
				<div class="tab-pane active" id="information">
					<form class="form-profile" action="/webtoeic/profile/update" method="post">
						<div class="form-group">
							<label style="font-weight: bold" for="staticEmail"
								class="col-sm-2 col-form-label">Email đăng ký</label>
							<div class="col-sm-10">
								<input type="text" readonly class="form-control-plaintext"
									value="${user.email }" name="email">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="hidden" class="form-control-plaintext nguoiDungId"
									value="${user.id }" name="id">
							</div>
						</div>
						<div class="form-group">
							<label for="staticEmail" style="font-weight: bold"
								class="col-sm-2 col-form-label">Họ Tên</label>
							<div class="col-sm-10">
								<input type="text" class="form-control-plaintext" value="${user.hoTen }"
									name="hoTen" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="staticEmail" style="font-weight: bold"
								class="col-sm-2 col-form-label">Số điện thoại</label>
							<div class="col-sm-10">
								<input type="text" class="form-control-plaintext"
									value="${user.soDienThoai }" name="soDienThoai" required="required">
							</div>
						</div>

						<div class="form-group">
							<label for="staticEmail" style="font-weight: bold"
								class="col-sm-2 col-form-label">Địa chỉ</label>
							<div class="col-sm-10">
								<input type="text" class="form-control-plaintext"
									value="${user.diaChi }" name="diaChi" required="required">
							</div>
						</div>
						<input class="btn btn-primary" id="btnSubmit" type="submit"
							value="Xác nhận" />
					</form>
				</div>
				<div class="tab-pane" id="changePass">
					<form class="formDoiMatKhau">

						<div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>

						<div class="form-group">
							<label for="name">Mật khẩu cũ</label> <input type="password"
								class="form-control" name="oldPassword" required="required" />
						</div>
						<div class="form-group">
							<label for="name">Mật khẩu mới</label> <input type="password"
								class="form-control" name="newPassword" required="required" />
						</div>
						<div class="form-group">
							<label for="name">Nhắc lại mật khẩu mới</label> <input type="password"
								class="form-control" name="confirmNewPassword" required="required" />
						</div>
						<input class="btn btn-primary" type="button" id="btnXacNhanDoiMK"
							value="Xác nhận" />
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</form>
	</div>
	</div>
	</div>

	<jsp:include page="template/footer.jsp"></jsp:include>
	<script src="<c:url value='/js/client/profileClient.js'/>"></script>
</body>
</html>