<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Danh sách bài Grammar</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/html5shiv.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/paging.css">


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

.imageGrammar {
	float: left;
	height: 150px;
	width: 250px;
	margin-bottom: 25px;
}
</style>
<script type="text/javascript">
	function Search(){

		var baseUrl = document.getElementById('baseUrl').value;
		var xhttp;
		var search = document.getElementById('searchGrammar').value;

		//remove special letters
		var convertSearch = search.replace(/[^a-zA-Z0-9 ]/g, "");
		
		var url;
		if(!search == ' ')	
		{	url= baseUrl+"/searchGrammar/"+convertSearch;
		}
		else url = baseUrl+"/searchGrammar/all";

		
			if(window.XMLHttpRequest){
				xhttp = new XMLHttpRequest();
			}
			else{
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			xhttp.onreadystatechange = function(){
				if(xhttp.readyState == 4){
					var data = xhttp.responseText;
					document.getElementById("resultsearchGrammar").innerHTML = data;
				}
			}
			
			xhttp.open("POST",url,true);
			xhttp.send();

		}
</script>


</head>
<body>

	<jsp:include page="template/header.jsp"></jsp:include>
	<input style="display:none;" id="baseUrl" value="${pageContext.request.contextPath}"/>

	<div class="container">
		<!--PAGE TITLE-->
		<div class="row">
		<div class="span9" style="text-align: center">
			<div class="page-header">
				<h4 style="font-weight: bold;">DANH SÁCH BÀI GRAMMAR</h4>
			</div>
		</div>
		<div class="span3">
			<div class="navbar  pull-right">
					<div>
							<input type="text" class="form-control" id="searchGrammar"
								placeholder="Tìm kiếm bài grammar..." 
								style="width: 300px; margin-top:6px;margin-right:-40px;"
								name="search"
								onkeyup="Search()">
					</div>
				</div>
		</div>
		</div>
		<!-- /. PAGE TITLE-->
	<div id="resultsearchGrammar">
		<div class="row">

			<div class="span9">
				<c:if test="${fn:length(listData) == 0 }">
					<h3>Không tìm thấy dữ liệu</h3>
				</c:if>

				<c:forEach items="${listData}" var="list" varStatus="loop">
					<div class="span9">
						<div class="span3">
							<img class="imageGrammar"
								src="${pageContext.request.contextPath}/resources/file/images/grammar/${list.anhbaigrammar}" />

						</div>
						<div class="span1"></div>

						<div class="span5">
							<div class="content-heading">
								<h4>${list.tenbaigrammar}</h4>
							</div>
							<div>	
									<a
									href=" <c:url value="/detailGram?idGram=${list.baigrammarid}"/>  "
									class="btn btn-primary">Chi tiết</a>
							</div>

						</div>
					</div>

				</c:forEach>
				<br>
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
	<c:if test="${listData.size() != 0}">

		<div class="paging">
			<c:if test="${currentPage != 1}">
				<a href="/webtoeic/listGrammar?page=${currentPage-1}">Back</a>
			</c:if>
			<c:if test="${currentPage == 1}">
				<a class="current">1</a>
			</c:if>

			<c:if test="${currentPage != 1}">
				<a href="/webtoeic/listGrammar?page=1">1</a>
			</c:if>

			<c:forEach var="pag" items="${pageList}" varStatus="loop">
				<c:if test="${currentPage == pag}">
					<a class="current">${pag}</a>
				</c:if>
				<c:if test="${currentPage != pag}">
					<a href="/webtoeic/listGrammar?page=${pag}">${pag}</a>
				</c:if>
			</c:forEach>

			<c:if test="${currentPage != totalPage}">
				<a href="/webtoeic/listGrammar?page=${currentPage+1} "
					class="pageNext">Next</a>
			</c:if>
		</div>
	</c:if>

</div>

	<!--/.End Pagination-->
</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="include/footerHome.jsp"></jsp:include>


</body>

</html>