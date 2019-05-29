<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bài test Toeic</title>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="${pageContext.request.contextPath}/resources/js/client/baiTestListening.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/client/baiTestReading.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
</head>


<style>
.paragraph {
	white-space: pre-wrap;
	word-break: break-word;
	text-align: justify;
	background: #f3f7fa;
	color: #222;
	font-size: 14px;
	font-style: 'Roboto';
}

#main {
	padding-top: 120px;
	overflow: hidden;
}

@media ( min-width : 767px) {
	#navigation {
		margin-top: 50px;
		position: fixed;
	}
}

.fix-scrolling {
	max-height: 450px;
	/*overflow-y: scroll;*/
}

.numberCircle {
	display: inline-block;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	font-size: 15px;
	line-height: 25px;
	text-align: center;
	border: 2px solid #666;
	margin: 5px 5px 5px 15px;
}

#time {
	font-size: 25px;
	margin-left: 100px;
	color: green
}

#backhome {
	margin-left: 25px;
	text-decoration: none;
}

#btnSubmit {
	margin-bottom: 15px;
	margin-left: 15px;
}

#btnResult {
	margin-bottom: 15px;
	margin-left: 25px;
}

#btndoAgain {
	display: none;
	margin-bottom: 15px;
	margin-left: 40px;
}

.web-font {
	font-size: 15px;
	font-family: 'Arial';
}
</style>

<script type="text/javascript">
	
</script>
<body>

	<!--Header
==========================-->
	<div class="testReading" id="testReading">
		<div class="navbar navbar-default navbar-fixed-top">
			<br>
			<div style="display: block;">
				<p>
					<a href="/webtoeic" id="backhome" style="display: inline;">&larr;
						Home</a> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
					&nbsp <span>Bài test Listening</span>
				</p>
			</div>

			<!--  
<div>
		<c:forEach begin="1" end="50" varStatus="loop">
			<div class="numberCircle" id="answer${loop.index}">${loop.index}</div>	  		 
		</c:forEach>
</div>

-->


		</div>


		<!--/End Header-->

		<div id="content" class="container-fluid fill">
			<form id="submitForm" name="submitForm">
				<div class="row">
					<div id="navigation" class="col-md-3">

						<div class="fix-scrolling">
							<br>
							<div>
								<span id="time">30:00</span>
							</div>
							<hr width="60%">

							<c:forEach begin="1" end="50" varStatus="loop">
								<div class="numberCircle" id="answer${loop.index}">${loop.index}</div>
							</c:forEach>
							<br> <br>
							<!-- 	<input type="button" id="btndoAgain" class="btn btn-warning" value="Làm lại"> -->
							<input type="button" class="btn btn-primary" id="btnResult"
								value="Chấm điểm" /> <input type="button"
								class="btn btn-danger" id="btnSubmit" value="Làm bài đọc" /> <br>
							<hr width="60%">
						</div>


					</div>

					<div class="col-md-3 ">
						<!-- Placeholder - keep empty -->
					</div>

					<!--Nội dung bài test -->
					<div id="main" class="col-md-8 web-font">

						<c:forEach items="${listQuestion}" var="list">
							<input class="hidden" id="correctanswer"
								name="correctanswer${list.number}" value="${list.correctanswer}" />


							<!-- show part1 -->
							<c:if test="${list.number == 1 }">
								<p>
									<b>Part 1: ${list.paragraph}</b>
								</p>
								<input class="hidden" id="id_bai_exam"
									value="${list.getBaithithu().getBaithithuid()}" />

							</c:if>
							<c:if test="${not empty list.image}">
								<div class="container">
									<p>
										<b>Question ${list.number}:</b>
									</p>

									<img
										src="${pageContext.request.contextPath}/resources/file/images/exam/${list.image}.jpg"
										alt="image not found"
										style="height: 300px; width: 400px; float: left; margin-right: 10px" />
									<audio controls> <source
										src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
										type="audio/wav"></audio>
									<br> <input class="part1" type="radio"
										name="question${list.number}" id="question.${list.number}"
										value="A" onclick="markColor(this.id)" /> A <br> <input
										class="part1" type="radio" name="question${list.number}"
										id="question.${list.number}" value="B"
										onclick="markColor(this.id)" /> B <br> <input
										class="part1" type="radio" name="question${list.number}"
										id="question.${list.number}" value="C"
										onclick="markColor(this.id)" /> C <br> <input
										class="part1" type="radio" name="question${list.number}"
										id="question.${list.number}" value="D"
										onclick="markColor(this.id)" /> D <br>
								</div>
								<br>
							</c:if>

							<!-- show part 2 -->
							<c:if test="${list.number == 4 }">
								<br>
								<p>
									<b>Part 2: ${list.paragraph}</b>
								</p>
							</c:if>

							<c:if test="${list.number >=4  && list.number <15}">
								<p>
									<b>Question ${list.number}:</b>
								</p>
								<audio controls> <source
									src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
									type="audio/wav"></audio>
								<br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="A" /> A <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="B" /> B <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="C" /> C <br>
								<br>
							</c:if>

							<!-- show part 3 -->

							<c:if test="${list.number == 15 }">
								<br>
								<p>
									<b>Part 3: ${list.paragraph}</b>
								</p>
							</c:if>
							<c:if test="${list.number >= 15 && list.number <=35}">
								<p>
									<b>Question ${list.number}:</b>
								</p>
								<audio controls> <source
									src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
									type="audio/wav"></audio>

								<br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="A" /> A.${list.option1} <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="B" /> B.${list.option2}  <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="C" /> C.${list.option3}  <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="D" /> D.${list.option4}  <br>
								<br>
							</c:if>

							<!-- show part 4 -->
							<c:if test="${list.number == 36 }">
								<p>
									<b>Part 4: ${list.paragraph}</b>
								</p>
							</c:if>
							<c:if test="${list.number >= 36 && list.number <=50 }">
								<p>
									<b>Question ${list.number}:</b>
								</p>
								<audio controls> <source
									src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
									type="audio/wav"></audio>

								<br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="A" /> A.${list.option1} <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="B" /> B.${list.option2}  <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="C" /> C.${list.option3}  <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}" onclick="markColor(this.id)"
									value="D" /> D.${list.option4}  <br>
								<br>
							</c:if>

						</c:forEach>



						<hr>
						<p>Kết thúc bài Listening</p>

					</div>


				</div>
			</form>
		</div>

	</div>

	<!--Footer
==========================-->

	<!--/.Footer-->

</body>
</html>