<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bài test Reading</title>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
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
	font-size: 18px;
	font-family: 'Open Sans';
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

#timeReading {
	font-size: 25px;
	margin-left: 100px;
	color: green;
	font-family: 'Open Sans';
}

.web-font {
	font-size: 15px;
	font-family: 'Arial';
}

#backhome {
	margin-left: 25px;
	text-decoration: none;
}

#btnSubmitReading {
	margin-bottom: 15px;
	margin-left: 15px;
}

#btnResultReading {
	margin-bottom: 15px;
	margin-left: 25px;
}

.note {
	text-align: center;
	margin-left: -35px;
	margin-top: 10px;
	display: none;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<body>

	<!--Header
==========================-->
	<div class="navbar navbar-default navbar-fixed-top">

		<br>
		<div style="display: block;">
			<p>
				<a href="/webtoeic" id="backhome" style="display: inline;">&larr;
					Home</a> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
				&nbsp <span>Bài test Reading</span> <input class="hidden"
					id="soCauDungListening" value="${socauListeningCorrect}">

			</p>
		</div>
	</div>
	<!--/End Header-->

	<div id="resutlTest">
		<div id="content" class="container-fluid fill ">
			<form id="submitForm" name="submitForm">
				<div class="row">
					<div id="navigation" class="col-md-3">

						<div class="fix-scrolling">
							<br>
							<div>
								<span id="timeReading">45:00</span>
							</div>
							<hr width="60%">

							<c:forEach begin="51" end="100" varStatus="loop">
								<div class="numberCircle web-font" id="answer${loop.index}">${loop.index}</div>
							</c:forEach>
							<br> <br> <input type="button" class="btn btn-primary"
								id="btnResultReading" value="Chấm điểm"
								onclick="clickResutlReading()" /> <input type="button"
								class="btn btn-danger" id="btnSubmitReading" value="Nộp bài"
								onclick="javascript:clickSubmitReading()" /> <br> <span
								class="note" id="noteReading">Click 'Nộp bài' để xem kết
								quả <br> &nbsp (Listening + Reading)
							</span>
							<hr width="60%">
						</div>


					</div>

					<div class="col-md-3 ">
						<!-- Placeholder - keep empty -->
					</div>

					<!--Nội dung bài test -->
					<div id="main" class="col-md-8 web-font">
						<c:forEach items="${listQuestion}" var="list">
							<input class="hidden" id="id_bai_exam"
								value="${list.getBaithithu().getBaithithuid()}" />
							<input class="hidden" id="correctanswer"
								name="correctanswer${list.number}" value="${list.correctanswer}" />

							<!-- show part5 -->
							<c:if test="${list.number == 51 }">
								<p class="web-font">
									<b>Part 5: ${list.paragraph}</b>
								</p>
							</c:if>
							<c:if test="${list.number >= 51 && list.number < 65}">
								<div class="web-font">
									<p>
										<b>Question ${list.number}:</b>
									</p>
									<pre class="paragraph">${list.question}</pre>

									<input class="part5" type="radio" name="question${list.number}"
										id="question.${list.number}" value="A"
										onclick="markColorReading(this.id)" /> A. ${list.option1} <br>
									<input class="part5" type="radio" name="question${list.number}"
										id="question.${list.number}" value="B"
										onclick="markColorReading(this.id)" /> B. ${list.option2} <br>
									<input class="part5" type="radio" name="question${list.number}"
										id="question.${list.number}" value="C"
										onclick="markColorReading(this.id)" /> C. ${list.option3} <br>
									<input class="part5" type="radio" name="question${list.number}"
										id="question.${list.number}" value="D"
										onclick="markColorReading(this.id)" /> D. ${list.option4} <br>
								</div>
								<br>
							</c:if>

							<!-- show part 6 -->

							<c:if test="${list.number >= 65 && list.number <74}">
								<c:if test="${list.number==65}">
									<p class="web-font">
										<b>Part 6: ${list.question}</b>
									</p>
								</c:if>
								<c:if test="${not empty list.paragraph }">
									<pre class="paragraph">${list.paragraph}</pre>
								</c:if>

								<p class="web-font">
									<b>Question ${list.number}:</b>
								</p>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}"
									onclick="markColorReading(this.id)" value="A" /> A. ${list.option1} <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}"
									onclick="markColorReading(this.id)" value="B" /> B. ${list.option2} <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}"
									onclick="markColorReading(this.id)" value="C" /> C. ${list.option3} <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}"
									onclick="markColorReading(this.id)" value="D" /> D. ${list.option4} <br>
								<br>
							</c:if>

							<!-- show part 7 -->

							<c:if test="${list.number >= 74 && list.number <=100}">

								<c:if test="${list.number==74}">
									<p class="web-font">
										<b>Part 7: Read the passage and choose the correct answer</b>
									</p>
								</c:if>
								<c:if test="${not empty list.paragraph}">
									<pre class="paragraph">${list.paragraph}</pre>
								</c:if>


								<p class="web-font">
									<b>Question ${list.number}:</b> ${list.question}
								</p>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}"
									onclick="markColorReading(this.id)" value="A" /> A. ${list.option1} <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}"
									onclick="markColorReading(this.id)" value="B" /> B. ${list.option2} <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}"
									onclick="markColorReading(this.id)" value="C" /> C. ${list.option3} <br>
								<input type="radio" name="question${list.number}"
									id="question.${list.number}"
									onclick="markColorReading(this.id)" value="D" /> D. ${list.option4} <br>
								<br>
							</c:if>

						</c:forEach>



						<hr>
						<p>Kết thúc bài Reading</p>

					</div>


				</div>
			</form>
		</div>





















		<!--Footer
==========================-->



		<!--/.Footer-->

	</div>

</body>
</html>