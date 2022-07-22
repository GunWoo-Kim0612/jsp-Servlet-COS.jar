package com.my.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.print.attribute.HashAttributeSet;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.javafx.collections.MappingChange.Map;

@WebServlet("/upload2.do")
public class MultiUploagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MultiUploagServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String savePath = "upload";
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "UTF-8";
		
//		실제 경로를 찾는 메소드 getRealPath(경로)
		ServletContext context = getServletContext();
		
		String uploadFilePath = context.getRealPath(savePath);
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit,encType, new DefaultFileRenamePolicy());
			
//			getFileNames()반환타입 Enumeration
			Enumeration files = multi.getFileNames();
			
			HashMap<String,String> map =  new HashMap<String,String>(); 
			ArrayList<String> arrayList = new ArrayList<String>();
			
			
			while( files.hasMoreElements()) {
				String file = (String) files.nextElement();
				String file_name = multi.getFilesystemName(file);
				
				//중복된 파일 업로드시 i
				String ori_file_name = multi.getOriginalFileName(file);
				
//				out.println("<br> 업로드된 파일명 : " + file_name);
//				out.println("<br> 원본 파일명 : " + ori_file_name);
//				out.println("<hr>");
				
				
			
				
				map.put(file_name, ori_file_name);
				request.setAttribute("map", map);
				
				
			
			}
			} catch (Exception e) {
				
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("fileList.jsp");
		dispatcher.forward(request, response);
	}
	


}
