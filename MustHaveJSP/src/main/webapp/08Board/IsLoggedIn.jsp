<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    if (session.getAttribute("UserId") == null){	// 세션에서 /속성중에 /userid를 가져와서/ 비었다면
    	JSFunction.alertLocation("로그인 후 이용해주세요", "../06Session/LoginForm.jsp", out); // 출력 // webapp 아래에 있는 loginform으로 / jspwriter로 출력
    	return;	// 다시 리턴
    }
    
    
    %>
