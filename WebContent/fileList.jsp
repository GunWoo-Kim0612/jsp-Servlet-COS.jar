
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.nio.file.Files"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>업로드 파일 리스트</h1>

<p>hashmap 방식</p>
<%

	HashMap<String, String> map = (HashMap<String, String>)request.getAttribute("map");
	Iterator<String> keys = map.keySet().iterator();
	while(keys.hasNext()){
		String key = keys.next();
		String value = map.get(key);
	
%>

<%= key %>
<br>
<%= value %>
<%
	}
%>


</body>
</html>