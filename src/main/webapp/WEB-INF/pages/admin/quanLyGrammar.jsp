<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Grammar</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
<script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="<c:url value='/js/admin/quanLyGrammar.js'/>"></script>
	
	
</head>


<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>

	<div class="col-md-9 animated bounce">
		<h3 class="page-header">Quản lý bài hướng dẫn Grammar</h3>

		<button class="btn btn-success btnAddVocab" data-toggle="modal"
			data-target="#grammarModal">Thêm mới</button>
		<h4 style="color: red" id="info-success"></h4>

		<c:if test="${errorInfo != null }">
			<h4 style="color: red" id="info-error">${error}</h4>
			<h4>error: ${errorInfo}</h4>
		</c:if>
		<hr />

		<table class="table table-hover nhanHieuTable" id="tableGrammar">
			<thead>
				<tr>
					<th>ID</th>

					<th>Tên bài Grammar </th>

					<th>Ảnh</th>

					<th></th>

				</tr>
			</thead>

			<tbody>



			</tbody>



		</table>

	</div>

	<!-- Modal -->

	<div class="modal fade" id="grammarModal" tabindex="-1" role="dialog"
		aria-labelleby="myModalLable">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="titleModal">Thêm mới bài Grammar</h4>
				</div>

				<div class="modal-body">
				<input style="display:none"  id="idGrammarModal">

					<div class="row">
						<span class="bg-danger" id="vocab_errors"></span>

						<div class="form-group col-md-6">
							<label>Tên bài grammar</label> <input id="nameGrammar"
								class="form-control">

						</div>

						<div class="form-group col-md-6">
							<label>Ảnh bài grammar</label> 
							<input type="file" id="file_Image_Grammar" class="form-control"    accept="image/*">

						</div>

						<div class="form-group col-md-12">
							<label for="contenGramar">Chỉnh sửa nội dung bài Grammar:</label> 
							
							<textarea id="markdown-editor"></textarea>
						</div>

						
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="btnAddNewGrammar" class="btn btn-primary">Xác nhận</button>
					<button type="button" style="display:none;" id="btnUpdate" class="btn btn-primary">Cập nhật</button>
					
						
				</div>
			</div>
		</div>
	</div>


	<!-- End modal -->

	<jsp:include page="template/footer.jsp"></jsp:include>



</body>
</html>