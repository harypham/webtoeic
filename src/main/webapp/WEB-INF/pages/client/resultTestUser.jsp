<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ket qua Reading</title>
</head>
<body>
	<h3 style="text-decoration: underline;">Kết quả bài test:</h3>
	<br>
	<h4>Tổng số câu đúng: ${total}/100</h4>
	<h4>Số câu đúng phần Listening: ${correctListening}/50</h4>
	<h4>Số câu đúng phần Reading: ${correctReading}/50</h4>

	<br>
	<a style="text-decoration: none;"
		href="<%=request.getContextPath()%>/listExam"> &larr; Làm cách bài
		test khác</a>
	<br>
	<br>
	<a style="text-decoration: none;"
		href="<%=request.getContextPath()%>/listVocab"> &larr; Bài tập từ
		vựng</a>
	<br>
	<br>
	<a style="text-decoration: none;" href="#"> &larr; Bài tập ngữ pháp</a>
	<br>
	<br>

</body>
</html>