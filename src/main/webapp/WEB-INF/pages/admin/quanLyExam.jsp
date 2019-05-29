<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Exam</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<script src="<c:url value='/js/admin/quanLyExam.js'/>"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />
</head>


<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>

	<div class="col-md-9 animated bounce">
		<h3 class="page-header">Quản lý bài thi thử Toeic</h3>

		<button class="btn btn-success btnAddExam" data-toggle="modal"
			data-target="#examModal">Thêm mới</button>
		<h4 style="color: red" id="info-success"></h4>

		<c:if test="${errorInfo != null }">
			<h4 style="color: red" id="info-error">${error}</h4>
			<h4>error: ${errorInfo}</h4>
		</c:if>
		<hr />

		<table class="table table-hover nhanHieuTable" id="tableExam">
			<thead>
				<tr>
					<th>ID</th>

					<th>Tên bài thi thử</th>

					<th>Ảnh</th>


					<th></th>

				</tr>
			</thead>

			<tbody>



			</tbody>



		</table>

	</div>

	<!-- Modal -->

	<div class="modal fade" id="examModal" tabindex="-1" role="dialog"
		aria-labelleby="myModalLable">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="titleModal">Thêm mới Exam</h4>
				</div>

				<div class="modal-body">
					<input style="display:none" id="idExam">
					<div class="row">
						<span class="bg-danger" id="vocab_errors"></span>

						<div class="form-group col-md-6">
							<label>Tên bài thi thử</label> <input id="nameBaiThiThu"
								class="form-control">

						</div>

						<div class="form-group col-md-6">
							<label>Ảnh bài thi thử</label> <input type="file" id="file_Image"
								class="form-control" required accept="image/*">

						</div>

						<div class="form-group col-md-12">
							<label for="fileExcel">File nội dung (Excel):</label> <input
								type="file" class="form-control" id="file_Excel"
								name="file_Excel" required accept=".xlsx">
						</div>

						<div class="form-group col-md-12">
							<label for="fileAnhCauHoi">File ảnh câu hỏi:</label> <input
								type="file" class="form-control" id="file_image_question"
								name="file_Image_Question" required accept="image/*" multiple>
						</div>

						<div class="form-group col-md-12">
							<label for="fileNghe">File nghe câu hỏi:</label> <input
								type="file" class="form-control" id="file_listening"
								name="file_Excel" required multiple accept=".mp3,.org">
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="btnAddNewExam" class="btn btn-primary">Xác nhận</button>
					<button type="button" style="display:none;" id="btnUpdateExam" class="btn btn-primary">Cập nhật</button>
					
				</div>
			</div>
		</div>
	</div>


	<!-- End modal -->

	<jsp:include page="template/footer.jsp"></jsp:include>

</body>
</html>