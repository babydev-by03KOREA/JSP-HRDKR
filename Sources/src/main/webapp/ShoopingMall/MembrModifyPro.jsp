<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정값 넘어가유~</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int CUSTNO = Integer.parseInt(request.getParameter("CUSTNO"));
		String CUSTNAME = request.getParameter("CUSTNAME");
	
	%>
</body>
</html>