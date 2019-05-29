<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ket qua Listening</title>
</head>
<style>
.fix-top {
	margin-top: -125px;
}
</style>
<body>


	<div id="main" class="web-font">
		<p class="fix-top">
			Đáp án bài thi Listening : <span id="socaudung" style="color: red">Trả
				lời đúng ${socaudung} / 50 </span>
		</p>

		<c:forEach items="${listQuestion}" var="list">
			<input class="hidden" id="id_bai_exam"
				value="${list.getBaithithu().getBaithithuid()}" />
			<input class="hidden" id="correctanswer"
				name="correctanswer${list.number}" value="${list.correctanswer}" />
			<input class="hidden" id="answerUser" name="question${list.number}"
				value="${list.getDapAnUser()}" />

			<!-- 	<p>Đáp án user: </p><br> -->
			<!-- show part1 -->
			<c:if test="${list.number == 1 }">
				<p>
					<b>Part 1: ${list.paragraph}</b>
				</p>
			</c:if>
			<c:if test="${not empty list.image}">
				<div class="container">
					<c:if test="${list.getDapAnUser() != ''}">
						<p>
							<b>Question ${list.number}:</b>
						</p>
					</c:if>
					<c:if test="${list.getDapAnUser() == ''}">
						<p>
							<b>Question ${list.number}:</b> <span style="color: red">
								Chưa chọn câu trả lời</span>
						</p>
					</c:if>


					<img
						src="${pageContext.request.contextPath}/resources/file/images/exam/${list.image}.jpg"
						alt="image not found"
						style="height: 300px; width: 400px; float: left; margin-right: 10px" />
					<audio controls> <source
						src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
						type="audio/wav"></audio>
					<br>
					<c:if test="${list.getDapAnUser() == ''}">
						<c:if test="${list.correctanswer== 'A' }">
							<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.correctanswer== 'B' }">
							<input disabled type="radio" value="A" /> A. ${list.option1} <br>
							<input disabled type="radio" value="B" /> B. ${list.option2}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.correctanswer== 'C' }">
							<input disabled type="radio" value="A" /> A. ${list.option1} <br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3} &nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.correctanswer== 'D' }">
							<input disabled type="radio" value="A" /> A. ${list.option1}<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>


					</c:if>


					<c:if test="${list.correctanswer== 'A' }">
						<c:if test="${list.getDapAnUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.option3}<br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
						</c:if>

					</c:if>

					<c:if test="${list.correctanswer== 'B' }">
						<c:if test="${list.getDapAnUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}<br>
							<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<br>
							<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
						</c:if>
					</c:if>

					<c:if test="${list.correctanswer== 'C' }">
						<c:if test="${list.getDapAnUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}<br>
							<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
						</c:if>

					</c:if>

					<c:if test="${list.correctanswer== 'D' }">
						<c:if test="${list.getDapAnUser() == 'A'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'B'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}<br>
							<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4} &nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'C'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
							<br>
							<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>
						<c:if test="${list.getDapAnUser() == 'D'}">
							<input disabled type="radio" value="A" /> A. ${list.option1}<br>
							<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
							<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
							<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
								alt="img not found"
								src="${pageContext.request.contextPath}/resources/file/images/correct.png">
							<br>
						</c:if>

					</c:if>



				</div>
				<br>
			</c:if>
			<!-- show part 2 -->

			<c:if test="${list.number == 4 }">
				<p>
					<b>Part 2: ${list.paragraph}</b>
				</p>
			</c:if>

			<c:if test="${list.number >=4  && list.number <15}">

				<c:if test="${list.getDapAnUser() != ''}">
					<p>
						<b>Question ${list.number}:</b> ${list.question}
					</p>
				</c:if>
				<c:if test="${list.getDapAnUser() == ''}">
					<span style="color: red"> Chưa chọn câu trả lời</span>
					<p>
						<b>Question ${list.number}:</b> ${list.question}
					</p>

				</c:if>
				<audio controls> <source
					src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
					type="audio/wav"></audio>
				<br>
				<c:if test="${list.getDapAnUser() == ''}">
					<c:if test="${list.correctanswer== 'A' }">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
					</c:if>
					<c:if test="${list.correctanswer== 'B' }">
						<input disabled type="radio" value="A" /> A. ${list.option1} <br>
						<input disabled type="radio" value="B" /> B. ${list.option2}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
					</c:if>
					<c:if test="${list.correctanswer== 'C' }">
						<input disabled type="radio" value="A" /> A. ${list.option1} <br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>

				</c:if>


				<c:if test="${list.correctanswer== 'A' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}<br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
					</c:if>
				</c:if>

				<c:if test="${list.correctanswer== 'B' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
					</c:if>
				</c:if>

				<c:if test="${list.correctanswer== 'C' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>

				</c:if>
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

				<c:if test="${list.getDapAnUser() != ''}">
					<p>
						<b>Question ${list.number}:</b> ${list.question}
					</p>
				</c:if>
				<c:if test="${list.getDapAnUser() == ''}">
					<span style="color: red"> Chưa chọn câu trả lời</span>
					<p>
						<b>Question ${list.number}:</b> ${list.question}
					</p>
				</c:if>
				<audio controls> <source
					src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
					type="audio/wav"></audio>
				<br>
				<c:if test="${list.getDapAnUser() == ''}">
					<c:if test="${list.correctanswer== 'A' }">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.correctanswer== 'B' }">
						<input disabled type="radio" value="A" /> A. ${list.option1} <br>
						<input disabled type="radio" value="B" /> B. ${list.option2}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.correctanswer== 'C' }">
						<input disabled type="radio" value="A" /> A. ${list.option1} <br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.correctanswer== 'D' }">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>


				</c:if>


				<c:if test="${list.correctanswer== 'A' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'D'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
					</c:if>

				</c:if>

				<c:if test="${list.correctanswer== 'B' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'D'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
					</c:if>
				</c:if>

				<c:if test="${list.correctanswer== 'C' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'D'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
					</c:if>

				</c:if>

				<c:if test="${list.correctanswer== 'D' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'D'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>

				</c:if>
				<br>
			</c:if>

			<!-- show part 4 -->
			<c:if test="${list.number == 36 }">
				<br>
				<p>
					<b>Part 4: ${list.paragraph}</b>
				</p>
			</c:if>
			<c:if test="${list.number >= 36 && list.number <51 }">
				<c:if test="${list.getDapAnUser() != ''}">
					<p>
						<b>Question ${list.number}:</b> ${list.question}
					</p>
				</c:if>
				<c:if test="${list.getDapAnUser() == ''}">
					<span style="color: red"> Chưa chọn câu trả lời</span>
					<p>
						<b>Question ${list.number}:</b> ${list.question}
					</p>

				</c:if>
				<audio controls> <source
					src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
					type="audio/wav"></audio>

				<br>
				<c:if test="${list.getDapAnUser() == ''}">
					<c:if test="${list.correctanswer== 'A' }">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.correctanswer== 'B' }">
						<input disabled type="radio" value="A" /> A. ${list.option1} <br>
						<input disabled type="radio" value="B" /> B. ${list.option2}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.correctanswer== 'C' }">
						<input disabled type="radio" value="A" /> A. ${list.option1} <br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.correctanswer== 'D' }">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>


				</c:if>


				<c:if test="${list.correctanswer== 'A' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'D'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
					</c:if>

				</c:if>

				<c:if test="${list.correctanswer== 'B' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'D'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
					</c:if>
				</c:if>

				<c:if test="${list.correctanswer== 'C' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}  <br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'D'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
					</c:if>

				</c:if>

				<c:if test="${list.correctanswer== 'D' }">
					<c:if test="${list.getDapAnUser() == 'A'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'B'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4} &nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'C'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/incorrect.png">
						<br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>
					<c:if test="${list.getDapAnUser() == 'D'}">
						<input disabled type="radio" value="A" /> A. ${list.option1}<br>
						<input disabled type="radio" value="B" /> B. ${list.option2}  <br>
						<input disabled type="radio" value="C" /> C. ${list.option3}  <br>
						<input disabled type="radio" value="D" /> D. ${list.option4}&nbsp;<img
							alt="img not found"
							src="${pageContext.request.contextPath}/resources/file/images/correct.png">
						<br>
					</c:if>

				</c:if>
				<br>
			</c:if>


		</c:forEach>



		<hr>
		<p>Kết thúc bài Listening</p>

	</div>

</body>
</html>