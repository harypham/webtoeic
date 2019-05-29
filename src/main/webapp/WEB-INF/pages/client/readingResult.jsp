<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ket qua Reading</title>
</head>
<style>
.fix-top {
	margin-top: -125px;
}
</style>
<body>


	<div id="main" class="web-font">
		<p class="fix-top">
			Đáp án bài thi Reading: <span style="color: red">Trả lời đúng
				${socaudung} / 50 </span>
		</p>

		<c:forEach items="${listQuestion}" var="list">
			<input class="hidden" id="id_bai_exam"
				value="${list.getBaithithu().getBaithithuid()}" />
			<input class="hidden" id="answerUser" name="question${list.number}"
				value="${list.getDapAnUser()}" />
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
					<pre class="paragraph">${list.question}</pre>

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

			<!-- show part 6 -->

			<c:if test="${list.number >= 65 && list.number <74}">
				<c:if test="${list.number==65}">
					<p class="web-font">
						<b>Part 6: ${list.question}</b>
					</p>
				</c:if>
				<c:if test="${not empty list.paragraph}">
					<pre class="paragraph">${list.paragraph}</pre>
				</c:if>


				<div class="web-font">
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
				</div>

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


				<div class="web-font">
					<c:if test="${list.getDapAnUser() != ''}">
						<p>
							<b>Question ${list.number}:</b> ${list.question}
						</p>
					</c:if>
					<c:if test="${list.getDapAnUser() == ''}">
						<span style="color: red"> Chưa chọn câu trả lời</span>
						<p>
							<b>Question ${list.number}:</b>${list.question}
						</p>
					</c:if>
				</div>

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
		<p>Kết thúc bài Reading</p>

	</div>

</body>
</html>