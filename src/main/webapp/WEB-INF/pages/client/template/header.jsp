
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'  />" />

<link rel="stylesheet"
	href="<c:url value='/css/bootstrap-responsive.min.css'  />" />
<link rel="stylesheet" href="<c:url value='/css/style.css'  />" />
<script src="http://code.jquery.com/jquery.js"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>

<style>
.radio-inline {
	display: inline-flex;
	padding-left: 35px;
}

input[type=radio] {
	margin-right: 5px;
}

h3 {
	margin: 0;
}
</style>
</head>

<body>
	<!--HEADER ROW-->
	<div id="header-row">
		<div class="container">
			<div class="row">
				<!--LOGO-->
				<div class="span3">
					<a class="brand" href="/webtoeic"><img
						src="/webtoeic/resources/file/images/logotest.png" /></a>
				</div>
				<!-- /LOGO -->

				<!-- MAIN NAVIGATION -->
				<div class="span9">
					<div class="navbar  pull-right">
						<div class="navbar-inner">
							<a data-target=".navbar-responsive-collapse" data-toggle="collapse"
								class="btn btn-navbar"><span class="icon-bar"></span><span
								class="icon-bar"></span><span class="icon-bar"></span></a>
							<div class="nav-collapse collapse navbar-responsive-collapse">
								<ul class="nav">
									<c:if test="${pageContext.request.userPrincipal.name == null}">
										<li class="active"><a href="/webtoeic">Trang chủ</a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown">Luyện Tập <b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="/webtoeic/listening/">Luyện bài nghe</a></li>
												<li><a href="/webtoeic/reading/">Luyện bài đọc</a></li>
												<li><a href="/webtoeic/listGrammar">Ngữ pháp</a></li>
												<li><a href="<%=request.getContextPath()%>/listVocab">Từ
														vựng</a></li>
											</ul></li>
										<li><a href="<%=request.getContextPath()%>/signin">Đăng nhập</a></li>
										<li><a href="<%=request.getContextPath()%>/register">Đăng ký</a></li>

									</c:if>


									<c:if test="${pageContext.request.userPrincipal.name != null}">
										<li class="active"><a href="/webtoeic">Trang chủ</a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown">Luyện Tập <b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="/webtoeic/listening/">Luyện bài nghe</a></li>
												<li><a href="/webtoeic/reading/">Luyện bài đọc</a></li>
												<li><a href="/webtoeic/listGrammar">Ngữ pháp</a></li>
												<li><a href="<%=request.getContextPath()%>/listVocab">Từ
														vựng</a></li>
												<li><a href="<%=request.getContextPath()%>/listExam">Thi
														thử</a></li>
											</ul></li>
										<!-- 
										<li><a href="#">Services</a></li>
										<li><a href="#">Blog</a></li>
										<li><a href="#">Contact</a></li> -->

										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown">${nguoiDung.hoTen}<b class="caret"></b></a>
											<ul class="dropdown-menu">
												<c:if test="${!nguoiDung.loginOauth2 }">
													<li><a href="<%=request.getContextPath()%>/profile">Tài
															khoản</a></li>
												</c:if>
												<li><a href="<%=request.getContextPath()%>/signout">Thoát</a></li>
											</ul></li>
									</c:if>
								</ul>
							</div>

						</div>
					</div>
				</div>
				<!-- MAIN NAVIGATION -->
			</div>
		</div>
	</div>