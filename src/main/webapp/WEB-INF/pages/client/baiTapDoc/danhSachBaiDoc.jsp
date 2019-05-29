<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Danh sách bài tập đọc</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.hidden {
	display: none;
}

.error-message {
	color: red;
}

.anchor {
	display: block;
	height: 115px; /*same height as header*/
	margin-top: -115px; /*same height as header*/
	visibility: hidden;
}
</style>
</head>
<body>
	<jsp:include page="../template/header.jsp"></jsp:include>

	<div class="container">
		<!--PAGE TITLE-->
		<div class="span9" style="text-align: center">
			<div class="page-header">
				<h4 style="font-weight: bold;">DANH SÁCH BÀI TẬP ĐỌC</h4>
			</div>
		</div>

		<!-- /. PAGE TITLE-->
		<div class="row">
			<div class="span9" style="text-align: center">
				<div>
					<div class="span3">
						<select class="form-control" name="partSearch" id="partSearch">
							<option value="5">Part 5</option>
							<option value="6">Part 6</option>
							<option value="7">Part 7</option>
						</select>
					</div>
					<div class="span3" style="margin-left: 0px">
						<select class="form-control" name="doKhoSearch" id="doKhoSearch">
							<option value="1">Mức dễ</option>
							<option value="2">Mức trung bình</option>
							<option value="3">Mức khó</option>
						</select>
					</div>
					<button type="button" class="btn btn-primary" id="btnDuyetBaiDoc">Tìm
						Bài đọc</button>
				</div>
				<hr>
				<!--Blog Post-->
				<ul class="danhSach" style="text-align: left; padding-left: 45px;">
				</ul>
				<p class="hidden" id="pTag">Không có dữ liệu</p>

				<div class="pagination">
					<ul class="ul-pagination"></ul>
				</div>
				</div>

			<!-- /. PAGE TITLE-->
		<%-- <div class="row">
			<div class="span9">
				<c:if test="${fn:length(listBaiDoc) == 0 }">
					<h3>Không tìm thấy dữ liệu</h3>
				</c:if>

				<c:forEach items="${listBaiDoc}" var="baiDoc" varStatus="loop">

					<div class="span9">
						<div class="span3">
							<img class="imageExam"
								src="<c:url value="/file/images/baiDocId=${baiDoc.id }.png"  />" />
						</div>
						<div class="span1"></div>
						<div class="span5">
							<h4 class="content-heading" id="namebaithithu">
								${baiDoc.tenBaiDoc}</h4>
							<button class="btn btn-primary openModalExam"
								value="${baiDoc.id}" id="openModalExam.${loop.index}">
								Chi tiết</button>
						</div>


					</div>

				</c:forEach>

				<br>
			</div> --%>
			<div class="span3">
				<div class="side-bar">

					<h3>DANH MỤC</h3>
					<ul class="nav nav-list">
						<li><a href="/webtoeic/listening">LUYỆN BÀI NGHE</a></li>
						<li><a href="/webtoeic/reading">LUYỆN BÀI ĐỌC</a></li>
						<li><a href="/webtoeic/listExam">THI THỬ</a></li>						
						<li><a href="/webtoeic/listGrammar">HỌC NGỮ PHÁP</a></li>
						<li><a href="/webtoeic/listVocab">HỌC TỪ VỰNG</a></li>
					</ul>

				</div>
			</div>
		</div>
	</div>
<br><br><br><br><br><br><br><br>
	<jsp:include page="../template/footer.jsp"></jsp:include>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
	<script src="<c:url value='/js/client/baiDoc/danhSachBaiDoc.js'/>"></script>

</body>
</html>