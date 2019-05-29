<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý bài tập nghe</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
   .hidden {
      display: none;
   }
   .error-message {
     color: red;
   }

</style>
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>

	<div class="col-md-9 animated bounce">
      <h3 class="page-header">Quản lý Bài Nghe</h3>

      <button class="btn btn-success btnThemBaiNghe">Thêm mới bài nghe</button>
      <hr/>
      
      <form class="form-inline" id="searchForm" name="searchObject">
      
			<div class="form-group">
				<select class="form-control" name="partSearch" id="partSearch">
				    <option value="">Tất cả</option>
					<option value="1">Part 1</option>
					<option value="2">Part 2</option>
					<option value="3">Part 3</option>
					<option value="4">Part 4</option>
				</select>
			</div>&nbsp;&nbsp;
			<div class="form-group">
				<select class="form-control" name="doKhoSearch" id="doKhoSearch">
				    <option value="">Tất cả</option>
					<option value="1">Mức dễ</option>
					<option value="2">Mức trung bình</option>
					<option value="3">Mức khó</option>
				</select>
			</div>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-primary" id="btnDuyetBaiNghe">Duyệt Bài nghe</button>
		</form>

		<div class="form-group form-inline"
			style="float: right; margin-right: 10px; top: -33px; position: relative;"">
			<input class="form-control" type="text" id="searchById"
				placeholder="Nhập mã để tìm nhanh"> <span
				class="glyphicon glyphicon-search" aria-hidden="true"
				style="left: -30px; top: 4px;"></span>
		</div>

		<hr />

      <table class="table table-hover baiNgheTable">
        <thead>
        <tr>
          <th>ID</th>
          <th>Tên bài nghe</th>
          <th>Part LC</th>
          <th>Độ khó</th>
         </tr>
        </thead>
        <tbody>
        </tbody>

      </table>
      
      <ul class="pagination">
	  </ul>
    </div>
    <div class="row col-md-6">
		<form class="baiNgheForm" id="formBaiNghe" enctype="multipart/form-data">

			<div>
				<div class="modal fade" id="baiNgheModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Tạo mới/Cập nhật bài nghe</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<input type="hidden" class="form-control" id="id" name="id"/>
								</div>
								<div class="form-group">
									<label for="name">Tên bài nghe:</label> 
									<input type="text"
										class="form-control" id="tenBaiNghe" name="tenBaiNghe" placeholder="Nhập vào tên bài nghe" required >
								</div>
								
								<div class="form-group">
									<label for="name">Phần thi (Part)</label> 
									<select id="phanThi" class="form-control" name="part">
                                        <option value="1">Part 1-Photographs</option>
                                        <option value="2">Part 2-Question response</option>
                                        <option value="3">Part 3-Short Conversations</option>
                                        <option value="4">Part 4-Short talks</option>
									</select>
								</div>
								
								<div class="form-group">
									<label for="name">Phần thi (Part)</label> 
									<select name="doKho" id="doKho" class="form-control">
                                        <option value="1">Mức dễ</option>
                                        <option value="2">Mức trung bình</option>
                                        <option value="3">Mức khó</option>
									</select>
								</div>
								
								<div class="form-group">
									<label for="name">File Ảnh</label> 
									<input type="file" class="form-control" id="photoBaiNghe" name="photoBaiNghe" required >
								    <img alt="" src="" class="hidden" id="previewImage" style="height: 100px; width: 165px">
								
								</div>
								
								<div class="form-group">
									<label for="name">File Audio:</label> 
									<input type="file"
										class="form-control" id="audioBaiNghe" name="audio" required >
								    <audio id="previewAudio" controls class="hidden" style="width: 300px;padding-top: 10px">
                                         <source src="" id="previewAudioSrc" />
                                    </audio>
								</div>
								
								<div class="form-group">
									<label for="name">Danh sách câu hỏi (Excel):</label> 
									<input type="file"
										class="form-control" id="fileCauHoi" name="fileExcelCauHoi" required >
								    <a id="linkExcel" class="hidden" href="">Link file câu hỏi cũ </a>
								</div>
								
<!-- 								<div class="form-group">
									<label for="name">Mô tả phần nghe (Script): </label> 
									<textarea class="form-control" id="script" name="script"></textarea>
								</div> -->
								
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Hủy</button>
									<input class="btn btn-primary" id="btnSubmit" type="button"
										value="Xác nhận"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
  </div>


	<jsp:include page="template/footer.jsp"></jsp:include>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
	<script src="<c:url value='/js/admin/quanLyBaiNghe.js'/>" ></script>
	
</body>
</html>