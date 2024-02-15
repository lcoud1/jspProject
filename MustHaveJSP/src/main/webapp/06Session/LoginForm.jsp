<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm.jsp</title>
</head>

<body>
	<!-- LoginForm은 input 박스에 값을 LoginProcess로 보냄(req, res) -->
	
	<jsp:include page="../Common/Link.jsp" /> <!-- 외부에서 만든 메뉴 삽입  -->

	<h2>로그인 페이지</h2>
	<span style="color: red; font-size: 1.2em;"> <%= request.getAttribute("LoginErrMsg") == null ? // 요청영역/속성값을가져옴/""명을/값이 비어있다면	// 로그인 에러메시지
			"" : request.getAttribute("LoginErrMsg")%> <!-- 참값 출력  -->
	</span>

	<%
	if (session.getAttribute("UserId") == null ) { %>

	<script>
		function validateForm(form) {
			if (!form.user_id.value) { // user_id 값 출력 // 아이디 입력이 안됐으면
				alert("아이디를 입력하세요.");	// 출력
				return false;
			}
			if (form.user_pw.value == "") {	// pw값이 비어있다면
				alert("패스워드를 입력하세요."); // 출력
				return false;
			}
		}
	</script>
	<!-- 출력 : LoginProcess.jsp / 출력 형식 : post 방식 / 출력명 : LoginFrm  -->
	<form action="LoginProcess.jsp" method="post" name="LoginFrm"
		onsubmit="return validateForm(this);">	<!-- onsubmit = submit을 눌렀을 때 발동 / 참 값일 경우 윗 줄 실행  -->
		아이디 : <input type="text" name="User_id" /><br />  <!-- 아이디 입력 칸  -->
		패스워드 : <input type="password" name="User_pw" /><br /> 	<!-- 비밀번호 입력 칸 -->
		<input type="submit" value="로그인하기" />	
	</form>

	<%
	} else{
		%>
			<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다. <br />	<!-- 로그인 출력  -->
			<%= session.getAttribute("UserId") %> 회원님, 반갑습니다. <br />
			<a href="logout.jsp">[로그아웃]</a>	<<!-- 로그아웃 출력문 + 위치  -->
			
			<% } %>

</body>
</html>