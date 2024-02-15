<%@page import="utils.JSFunction"%>
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    // form값 받기
    String title = request.getParameter("title");
    String content = request.getParameter("content");	// post 방식으로 넘어온 값을 변수에 저장
    
    // 폼값을 dto 객체에 저장
    BoardDTO dto = new BoardDTO();		// dto 객체 생성 > 지금은 값 x
    dto.setTitle(title);				// dto 객체에 제목 값 입력
    dto.setContent(content);			// dto 객체에 내용 값 입력
    dto.setId(session.getAttribute("UserId").toString());	// 로그인하여 세션(객체)에 있는 id를 저장
    
    // DAO 객체를 통해 DB에 DTO 저장
    BoardDAO dao = new BoardDAO(application);	// jdbc 연결 객체 생성
   int iResult = dao.insertWrite(dto);			// insertWrite 메서드에 dto 값 전달하여 결과를 int로 받는다
    
   /*  int iResult = 0;
    for(int i=1; i <=100 ; i++){
    	dto.setTitle(title + "-" + i);	// 제목 글자에 -1~-100까지 붙음
    	iResult = dao.insertWrite(dto);	// insert 쿼리 실행
    
    } */
    dao.close();	// 종료
    
    // 성공 or 실패
    if(iResult == 1) {									// 값이 1이면
    	response.sendRedirect("List.jsp");				// List.jsp로 돌아감
    }else{												// 아니라면
    	JSFunction.alertBack("글쓰기에 실패하였습니다", out);	// 출력
    }
    
    
    
    
    
    %>
    
    
