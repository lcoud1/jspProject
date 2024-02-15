<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 로그인 폼으로 부터 받은 아이디와 패스워드
	String userId = request.getParameter("User_id");
	String userPw = request.getParameter("User_pw");
	
	// web.xml 에서 가져온 데이터베이스 연결 정보
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePw = application.getInitParameter("OraclePw");
	
	// jdbc 연결 (dto(테이블 객체), dao(crud 용) 세팅 후에 작업 진행)
		MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePw);  // jdbc 연결
		MemberDTO dto = dao.getMemberDTO(userId, userPw); // form 으로 받은 값을 getMemberDTO 매개값으로 전달
		dao.close(); // jdbc 연결 해제
		
		// 결론 : id,pw를 넣어서 찾은 값을 dto에 가지고 있도록 함
		
		// 로그인 성공 여부에 따른 처리
		if(dto.getId() != null){ // dto객체에 getid가 빈 값이 아니라면
			// 로그인 성공
			session.setAttribute("UserId", dto.getId());	// session 영역에 dto id 값을 넣는다
			session.setAttribute("UserName", dto.getName()); 	// session 영역에 dto name 값을 넣는다
			response.sendRedirect("LoginForm.jsp");	// LoginForm.jsp 응답
		}
		else{
			// 로그인 실패
			request.setAttribute("LoginErrMsg", "로그인 오류입니다.");	
			// 요청영역에 LoginErrMsg를 만듬 //  LoginErrMsg에 요청, 오류 출력
			request.getRequestDispatcher("LoginForm.jsp").forward(request, response); 
			// LoginForm으로 request,response를 가지고 돌아감 //  LoginForm.jsp에 재요청
		}
%>

















<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginProcess.jsp</title>
</head>
<body>	<!-- jdbc를 활용하여 memberDTO를 가져와서 세션에 저장 -->

</body>
</html>