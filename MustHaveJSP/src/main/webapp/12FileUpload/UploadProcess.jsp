<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
  	String saveDirectory = application.getRealPath("/Uploads");	// 저장할 디렉터리
    int maxPostSize = 1024 * 1024;		// 파일 최대 크기(1mb = 1024 * 1KB)
    String encoding = "UTF-8"; 			// 인코딩 방식
    
    
   	try{
    // 1. MultipartRequest 객체 생성
    MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
    
    // 2. 새로운 파일 생성
    String fileName = mr.getFilesystemName("attachedFile"); 	// 현재 파일 이름
    String ext = fileName.substring(fileName.lastIndexOf("."));	// 파일 확장자
    String now = new SimpleDateFormat("yyyyMMdd_HHss").format(new Date());	// java.util.date
    String newFileName = now + ext;	// 새로운 파일 이름 ("20240208_시분초초.확장자")
    
    // 3. 파일명 변경(c:\\update\\)
    File oldFile = new File(saveDirectory + File.separator + fileName);		// java.io.file
    File newFile = new File(saveDirectory + File.separator + newFileName);	// File.separator
    oldFile.renameTo(newFile);	// 파일명 변경완료
    
    // 4. 다른 폼 값 받기
    String name = mr.getParameter("name"); // post로 넘어온 name 값을 name에 넣는다
    String title = mr.getParameter("title");
    String[] cateArray = mr.getParameterValues("cate");
    StringBuffer cateBuf = new StringBuffer();
    if(cateArray == null){
    	cateBuf.append("선택 없음");
    }else
    for (String s : cateArray){
    	cateBuf.append(s + ", ");	// 영화,음악,문서
    }
    
    // 5. DTO 생성
    MyfileDTO dto = new MyfileDTO();
    dto.setName(name);
    dto.setTitle(title);
    dto.setCate(cateBuf.toString());
    dto.setOfile(fileName);
    dto.setSfile(newFileName);	// 폼으로 입력받은 내용을 변환하여 객체 생성
    
    
    // 6. DAO를 통해 데이터베이스에 반영
    MyfileDAO dao = new MyfileDAO();	// 커넥션 풀로 jdbc 연결
    dao.insertFile(dto);				// insertFile() 메서드에 dto객체를 보내 insert 쿼리 실행
    dao.close();						// 커넥션 풀 종료
    
    // 7. 파일 목록 jsp로 리디렉션
    response.sendRedirect("FileList.jsp");
    
   	} catch (Exception e) {
		request.setAttribute("errorMessage", "메서드 오류 확인");
		request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	}
    %>
    
