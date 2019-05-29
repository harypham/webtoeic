<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách bài hướng dẫn học từ vựng</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/paging.css">


<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>

</head>

<style>
.imageVocab {
	float: left;
	height: 150px;
	width: 250px;
	margin-bottom: 25px;
}
</style>

<script type="text/javascript">
	function SearchVocab() {

		var baseUrl = document.getElementById('baseUrl').value;
		var xhttp;
		var search = document.getElementById('searchVocab').value;
		var url;

		//remove special letters
		var convertSearch = search.replace(/[^a-zA-Z0-9 ]/g, "");

		if (!search == ' ') {
			url = baseUrl + "/searchVocab/" + convertSearch;
		} else
			url = baseUrl + "/searchVocab/all";

		if (window.XMLHttpRequest) {
			xhttp = new XMLHttpRequest();
		} else {
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4) {
				var data = xhttp.responseText;
				document.getElementById("resultsearch").innerHTML = data;
			}
		}

		xhttp.open("POST", url, true);
		xhttp.send();

	}
</script>
<body>

	<!--Header
==========================-->

	<jsp:include page="template/header.jsp"></jsp:include>
	<input id="baseUrl" value="${pageContext.request.contextPath}"
		style="display: none;" />
	<!--/End Headter-->

	<!-- Page container -->
	<div class="container">
		<!--PAGE TITLE-->
		<div class="row">
			<div class="span9" style="text-align: center">
				<div class="page-header">
					<h4 style="font-weight: bold;">DANH SÁCH BÀI HƯỚNG DẪN VOCABULARY</h4>
				</div>
			</div>
			<div class="span3">
				<div class="navbar  pull-right">
					<div>
						<input type="text" class="form-control" id="searchVocab"
							placeholder="Tìm kiếm bài vocabulary..."
							style="width: 300px; margin-top: 6px; margin-right: -40px;" name="search"
							onkeyup="SearchVocab()">
					</div>
				</div>
			</div>

		</div>

		<!-- /. PAGE TITLE-->
		<div id="resultsearch">
			<div class="row">
				<div class="span9">
					<c:if test="${fn:length(listData) == 0 }">
						<h3>Không tìm thấy dữ liệu</h3>
					</c:if>

					<c:forEach items="${listData}" var="list">
						<div class="span9">

							<div class="span3">
								<img class="imageVocab"
									src="${pageContext.request.contextPath}/resources/file/images/vocab/${list.anhbaituvung}" />
							</div>
							<div class="span1"></div>

							<div class="span5">
								<div class="content-heading">
									<h4>${list.tenbaituvung}</h4>
								</div>
								<div>
									<a
										href=" <c:url value="/detailVocab?idVocab=${list.baitaptuvungid}"/>  "
										class="btn btn-primary">Chi tiết</a>
								</div>

							</div>
						</div>

					</c:forEach>
				</div>

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


			<!--Pagination-->
			<c:if test="${not empty listData}">

				<div class="paging">
					<c:if test="${currentPage != 1}">
						<a href="/webtoeic/listVocab?page=${currentPage-1}">Back</a>
					</c:if>
					<c:if test="${currentPage == 1}">
						<a class="current">1</a>
					</c:if>

					<c:if test="${currentPage != 1}">
						<a href="/webtoeic/listVocab?page=1">1</a>
					</c:if>

					<c:forEach var="pag" items="${pageList}" varStatus="loop">
						<c:if test="${currentPage == pag}">
							<a class="current">${pag}</a>
						</c:if>
						<c:if test="${currentPage != pag}">
							<a href="/webtoeic/listVocab?page=${pag}">${pag}</a>
						</c:if>
					</c:forEach>

					<c:if test="${currentPage != totalPage}">
						<a href="/webtoeic/listVocab?page=${currentPage+1}">Next</a>
					</c:if>
				</div>
			</c:if>



			<!--/.End Pagination-->

		</div>

		<!-- End Page container -->
	</div>
	<!--Footer
==========================-->
	<br>
	<br>
	<br>
	<br>
	<br>


	<jsp:include page="include/footerHome.jsp"></jsp:include>


	<!--/.Footer-->



</body>
</html>