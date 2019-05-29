<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Page container -->
<div class="row">
	<div class="span9">
		<c:if test="${fn:length(listData) == 0 }">
			<h3>Không tìm thấy kết quả tìm kiếm "${search}"</h3>
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
						<a href=" <c:url value="/detailVocab?idVocab=${list.baitaptuvungid}"/>  "
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
<c:if test="${search == 'all'}">
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
</c:if>


<!--/.End Pagination-->
<!-- End Page container -->

