<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="./IsLoggedIn.jsp" %> <!-- 로그인 확인에 대한 코드 삽입 (주의사항 html 태그가 중복될 경우 오류가 뜰 수 있으니 삭제 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

	function validateForm(form) {			/* validateForm을 호출하면 form의 매개값을 받는다  */
		if (form.title.value == "") {		/* form 안의 제목의 값을 확인하면 빈칸이면 */
			alert("제목을 입력하세요"); 			/* 경고창 + 메시지 */
			form.title.focus();				/* 제목 박사에 커서를 이동한다.   */
			return false;					/* 결과로 false 값을 리턴한다.  */
		}
		if (form.content.value == "") {			/* form 안의 내용의 값을 확인하면 빈칸이면 */
			alert("내용을 입력하세요.");				/* 경고창 + 메시지 */
			form.content.focus();				/* 제목 박사에 커서를 이동한다. */
			return false;						/* 결과로 false 값을 리턴한다.*/
		}
	}	// form 내용 검증
</script>


<title>Write.jsp</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>회원제 게시판 - 글쓰기(write)</h2>
	<form name="writeFrm" method="post" action="WriteProcess.jsp"
		onsubmit="return validateForm(this);">
		<table border="1" width="90%">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 90%" /></td>	<!--제목박스-->
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="width: 90%; height: 100px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">다시 입력</button>
					<button type="button" onclick="location.href='list.jsp';">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>