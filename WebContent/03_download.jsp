<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.ServletUtils" %>

<%

	
	String fileName = request.getParameter("file_name");									// 링크를 통해 전달받은 영역객체에서  file_name가져옴   03_download.jsp?file_name=<%= systemfilename

	
	//getRealPath (ServletContext)
	String savePath = "upload";
	ServletContext context = getServletContext();
	String sDownloadPath = context.getRealPath(savePath);
	String sFilePath = sDownloadPath + "\\" + fileName;										//받아야하는 파일이 저장된 위치의  전체경로    :  upload실제경로 + /upload/filename
	
	
	
	//InputStream,  file type check
	byte b[] = new byte[4096];   															//어떤 문서를 읽을지 모르니 기본적으로 byte단위로 
	
	File fFile = new File(sFilePath);
	
	FileInputStream s_in = new FileInputStream(sFilePath);									
	String sMimeType = getServletContext().getMimeType(sFilePath);							//파일 타입체크  미미타입.  이미지인지..기타등등..
	System.out.println("sMimeType>>" + sMimeType);							
	
	if(sMimeType == null){						
		sMimeType = "application/octet-stream";												//8비트 형식으로 처리하겠다.	
	}
	//file type check End
	
	
	response.setContentType(sMimeType);														//MimeType정보를 전달
	
	
	String sEncoding = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");				//파일이름 한글 깨짐 방지
	
	
	response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding);		//다운로드 진행상황에 대한창을 띄우는 역할, 마지막 sEncoding은 한글깨짐 방지
	
	ServletOutputStream s_out = response.getOutputStream();
	
	int numRead;
	while( (numRead = s_in.read(b,0,b.length)) !=-1 ){
		s_out.write(b, 0, numRead);
	}
	
	s_out.flush();
	s_out.close();
	s_in.close();
	
%>